{-----------------------------------------------------------------------------
 Unit Name: Debug 2.0
 Author:    DSA
 Date:      22-Mrz-2006
-----------------------------------------------------------------------------}

unit Debug;

{$MODE Delphi}

interface

uses
  Contnrs, {Windows,} Classes, SysUtils, Dialogs, DateUtils;

// Map-file analysis and evaluation
  function LoadAndParseMapFile: Boolean;
  procedure CleanUpMapFile;
  function GetMapAddressFromAddress(const Address: DWORD): DWORD;
  function GetMapFileName: string;
  function GetModuleNameFromAddress(const Address: DWORD): string;
  function GetProcNameFromAddress(const Address: DWORD): string;
  function GetLineNumberFromAddress(const Address: DWORD): string;
// Logs file production
  procedure SetFilePath(Path: string);
  function GetFilePath: string;
  procedure SetLogFileExtension(ext: string);
  function GetLogFileExtension: string;
  procedure SetLogFileNameStructure(Structure: string);
  function GetLogFileNameStructure: string;
  procedure SetLogEntryStructure(Structure: string);
  function GetLogEntryStructure: string;
  procedure SetLogCommentStructure(Structure: string);
  function GetLogCommentStructure: string;
  procedure SetLogAlertStructure(Structure: string);
  function GetLogAlertStructure: string;
  procedure AddLogEntry(Text: string);overload;
  procedure AddLogEntry(Text: string; Time: TDateTime);overload;
  procedure AddLogComment(Text: string);overload;
  procedure AddLogComment(Text: string; Time: TDateTime);overload;
  procedure AddLogAlert(Text: string);overload;
  procedure AddLogAlert(Text: string; Time: TDateTime);overload;
  function GetCurrentLogFileName: string;
  function WildcardToText(Wildcard: string): string;

var
  Units,
  Procedures,
  LineNumbers: TList;

  FilePath: string = '';
  LogFileExt: string = 'log';
  FileNameStructure: string = 'Debug';
  LogEntryStructure: string = '$t';
  CommentStructure: string = '$t';
  AlertStructure: string = '### $Y-$M-$D $h:$m:$s ### $t ###';
  ProgDir: string = '';
  InputText: string = '';

implementation


const
  { Sections in .map file }
  NAME_CLASS           = 'StartLengthNameClass';
  SEGMENT_MAP          = 'Detailedmapofsegments';
  PUBLICS_BY_NAME      = 'AddressPublicsbyName';
  PUBLICS_BY_VAL       = 'AddressPublicsbyValue';
  LINE_NUMBERS         = 'Linenumbersfor';
  RESOURCE_FILES       = 'Boundresourcefiles';

type
  { Sections as enum }
  THeaderType = (htNameClass, htSegmentMap, htPublicsByName, htPublicsByValue,
    htLineNumbers, htResourceFiles);

  { unitname / pointeraddress pair -> olUnits }
  PUnitItem = ^TUnitItem;
  TUnitItem = record
    UnitName: string;
    UnitStart,
    UnitEnd: DWORD;
  end;

  { procedurename / pointeraddress pair -> olProcedures }
  PProcedureItem = ^TProcedureItem;
  TProcedureItem = record
    ProcName: string;
    ProcStart: DWORD;
  end;

  { linenumber / pointeraddress pair -> olLineNumbers }
  PLineNumberItem = ^TLineNumberItem;
  TLineNumberItem = record
    UnitName,
    LineNo: string;
    LineStart: DWORD;
  end;

function StripFromString(const Strip: char; var AString: string): string;
var
  Pos: Cardinal;
begin
  Pos := Length(AString);
  while Pos > 0 do
  begin
    if AString[Pos] = Strip then
      Delete(AString, Pos, Length(Strip))
    else
      Dec(Pos);
  end;
  Result := AString;
end;

function LoadAndParseMapFile: Boolean;
var
  F: TextFile;
  CurrentLine,
  CurrentUnit: string;
  CurrentHeader: THeaderType;

  { helper func of SyncHeaders }
  function CompareHeaders(AHeader, ALine: string): Boolean;
  begin
    Result := Copy(ALine, 1, Length(AHeader)) = AHeader;
  end;

  { Keeps track of section in .map file }
  procedure SyncHeaders(var Header: THeaderType; Line: string);
  const
    Pfx = Length('Line numbers for ');
  begin
    Line := StripFromString(' ', Line);

    if CompareHeaders(NAME_CLASS, Line)      then Header := htNameClass;
    if CompareHeaders(SEGMENT_MAP, Line)     then Header := htSegmentMap;
    if CompareHeaders(PUBLICS_BY_NAME, Line) then Header := htPublicsByName;
    if CompareHeaders(PUBLICS_BY_VAL, Line)  then Header := htPublicsByValue;
    if CompareHeaders(LINE_NUMBERS, Line)    then
    begin
      Header := htLineNumbers;
      CurrentUnit := Copy(Line, Pfx -2, Pos('(', Line) - Pfx + 2);
    end;
    if CompareHeaders(RESOURCE_FILES, Line)  then Header := htResourceFiles;
  end;

  { Adds a segment from .map to segment-list }
  procedure AddUnit(ALine: string);
  var
    SStart: string;
    SLength: string;
    AUnitItem: PUnitItem;
  begin
    if StrToInt(Trim(Copy(ALine, 1, Pos(':', ALine) -1))) = 1 then
    begin
      SStart  := Copy(ALine, Pos(':', ALine) + 1, 8);
      SLength := Copy(ALine, Pos(':', ALine) + 10, 8);
      New(AUnitItem);
      with AUnitItem^ do
      begin
        UnitStart := StrToInt('$' + SStart);
        UnitEnd   := UnitStart + DWORD(StrToInt('$' + SLength));
        Delete(ALine, 1, Pos('M', ALine) + 1);
        UnitName := Copy(ALine, 1, Pos(' ', ALine) -1);
      end;
      Units.Add(AUnitItem);
    end;
  end;

  { Adds a public procedure from .map to procedure-list }
  procedure AddProcedure(ALine: string);
  var
    SStart: string;
    AProcedureItem: PProcedureItem;
  begin
    if StrToInt(Trim(Copy(ALine, 1, Pos(':', ALine) -1))) = 1 then
    begin
      SStart  := Copy(ALine, Pos(':', ALine) + 1, 8);
      New(AProcedureItem);
      with AProcedureItem^ do
      begin
        ProcStart := StrToInt('$' + SStart);
        Delete(ALine, 1, Pos(':', ALine) + 1);
        ProcName  := Trim(Copy(ALine, Pos(' ', ALine), Length(ALine) - Pos(' ', ALine) + 1));
      end;
      Procedures.Add(AProcedureItem);
    end;
  end;

  { Adds a lineno from .map to lineno-list }
  procedure AddLineNo(ALine: string);
  var
    ALineNumberItem: PLineNumberItem;
  begin
    while Length(Trim(ALine)) > 0 do
    begin
      New(ALineNumberItem);
      with ALineNumberItem^ do
      begin
        Aline     := Trim(ALine);
        UnitName  := CurrentUnit;
        LineNo    := Copy(ALine, 1, Pos(' ', ALine)-1);
        Delete(ALine, 1, Pos(' ', ALine) + 5);
        LineStart := StrToInt('$' + Copy(ALine, 1, 8));
        Delete(ALine, 1, 8);
      end;
      LineNumbers.Add(ALineNumberItem);
    end;
  end;

{ procedure TExtExceptionInfo.LoadAndParseMapFile }
begin
  Units       := TList.Create;
  Procedures  := TList.Create;
  LineNumbers := TList.Create;

  if FileExists(GetMapFileName) then
  begin
    AssignFile(F, GetMapFileName);
    Reset(F);
    while not EOF(F) do
    begin
      ReadLn(F, CurrentLine);
      SyncHeaders(CurrentHeader, CurrentLine);
      if Length(CurrentLine) > 0 then
        if (Pos(':', CurrentLine) > 0) and (CurrentLine[1] = ' ') then
          case CurrentHeader of
            htSegmentMap:     AddUnit(CurrentLine);
            htPublicsByValue: AddProcedure(CurrentLine);
            htLineNumbers:    AddLineNo(CurrentLine);
          end;
    end;
    CloseFile(F);
    Result :=
      (Units.Count > 0) and
      (Procedures.Count > 0) and
      (LineNumbers.Count > 0);
  end
  else
    Result := False;
end;

procedure CleanUpMapFile;
begin
  if Units.Count > 0 then
    while Units.Count > 0 do
    begin
      Dispose(PUnitItem(Units.Items[0]));
      Units.Delete(0);
    end;
  if Procedures.Count > 0 then
    while Procedures.Count > 0 do
    begin
      Dispose(PProcedureItem(Procedures.Items[0]));
      Procedures.Delete(0)
    end;
  if LineNumbers.Count > 0 then
    while LineNumbers.Count > 0 do
    begin
      Dispose(PLineNumberItem(LineNumbers.Items[0]));
      LineNumbers.Delete(0);
    end;

  FreeAndNil(Units);
  FreeAndNil(Procedures);
  FreeAndNil(LineNumbers);
end;

function GetModuleNameFromAddress(const Address: DWORD): string;
var
  i: Integer;
begin
  for i := Units.Count -1 downto 0 do
    if ((PUnitItem(Units.Items[i])^.UnitStart <= Address) and
       (PUnitItem(Units.Items[i])^.UnitEnd >= Address)) then
    begin
      Result := PUnitItem(Units.Items[i])^.UnitName;
      Break;
    end;
end;

function GetProcNameFromAddress(const Address: DWORD): string;
var
  i: Integer;
begin
  for i := Procedures.Count -1 downto 0 do
    if (PProcedureItem(Procedures.Items[i])^.ProcStart <= Address) then
    begin
      Result := PProcedureItem(Procedures.Items[i])^.ProcName;
      Break;
    end;
end;

function GetLineNumberFromAddress(const Address: DWORD): string;
var
  i: Cardinal;
  LastLineNo: string;
  UnitName: string;
begin
  Result     := '';
  LastLineNo := '';
  UnitName   := GetModuleNameFromAddress(Address);

  for i := 0 to LineNumbers.Count -1 do
    if PLineNumberItem(LineNumbers.Items[i])^.UnitName = UnitName then
      if (PLineNumberItem(LineNumbers.Items[i])^.LineStart >= Address) then
      begin
        Result := LastLineNo;
        Break;
      end
      else
        LastLineNo := PLineNumberItem(LineNumbers.Items[i])^.LineNo;
end;

function GetMapFileName: string;
begin
  Result := ChangeFileExt(ParamStr(0), '.map');
end;

function GetMapAddressFromAddress(const Address: DWORD): DWORD;
const
  CodeBase = $1000;
var
  OffSet: DWORD;
  ImageBase: DWORD; //$400000: hInstance or GetModuleHandle(0)
begin
  ImageBase := hInstance;
  OffSet := ImageBase + CodeBase;

  // Map file address = Access violation address - Offset
  Result := Address - OffSet;
end;

procedure GetProgPath;
begin
  if ProgDir = '' then
    ProgDir := ExtractFilePath(ParamStr(0));
end;

procedure SendToInputText(Text: string);
begin
  InputText := Text;
end;

procedure WriteToFile(Text, RelativePath, FileName: string);
var
  f:Textfile;
  s: string;
begin
  s := '';
  GetProgPath;
  If not DirectoryExists(ProgDir + relativePath) then
    ForceDirectories(ProgDir + relativePath);
  {$I-}
  assignfile(f, ProgDir + relativePath + FileName);    
  Append(f);
  if ioresult<>0 then
    rewrite(f);

  writeln(f,Text);    
  closeFile(f);
  {$I+}
end;

function replaceText(Text: string; Time: TDateTime): string;
var
  EndResult: string;
begin
  Result := '';
  EndResult := StringReplace(Text, '$Y', FormatDateTime('yyyy', Time),
    [rfReplaceAll]);
  EndResult := StringReplace(EndResult, '$M', FormatDateTime('mm', Time),
    [rfReplaceAll]);
  EndResult := StringReplace(EndResult, '$D', FormatDateTime('dd', Time),
    [rfReplaceAll]);
  EndResult := StringReplace(EndResult, '$h', FormatDateTime('hh', Time),
    [rfReplaceAll]);
  EndResult := StringReplace(EndResult, '$m', FormatDateTime('nn', Time),
    [rfReplaceAll]);
  EndResult := StringReplace(EndResult, '$s', FormatDateTime('ss', Time),
    [rfReplaceAll]);
  EndResult := StringReplace(EndResult, '$k', FormatDateTime('zzz', Time),
    [rfReplaceAll]);
  EndResult := StringReplace(EndResult, '$t', InputText, [rfReplaceAll]);
  
  Result := EndResult;
end;

procedure SetFilePath(Path: string);
  function CheckBackSlash(const AFilename: String): String;
  begin
  if Length(AFilename)=0 then
    begin
      Result:=AFilename;
      Exit;
    end;

  if AFilename[Length(AFilename)]<>'\' then
    Result:=AFilename+'\'
  else
    Result:=AFilename;
  end;
begin

  FilePath := CheckBackslash(Path);
end;

// ------------------------------- Get 'n Set -------------------------------
function GetFilePath: string;
begin
  Result := FilePath;
end;

procedure SetLogFileExtension(ext: string);
begin
  If Ext[1] = '.' then
    Delete(Ext, 1, 1);
  SetLength(Ext, 3);
  LogFileExt := ext;
end;

function GetLogFileExtension: string;
begin
  Result := LogFileExt;
end;

procedure SetLogFileNameStructure(Structure: string);
begin
  FileNameStructure := Structure;
end;

function GetLogFileNameStructure: string;
begin
  Result := FileNameStructure;
end;

procedure SetLogEntryStructure(Structure: string);
begin
  LogEntryStructure := Structure;
end;

function GetLogEntryStructure: string;
begin
  Result := LogEntryStructure;
end;

procedure SetLogCommentStructure(Structure: string);
begin
  CommentStructure := Structure;
end;

function GetLogCommentStructure: string;
begin
  Result := CommentStructure;
end;

procedure SetLogAlertStructure(Structure: string);
begin
  AlertStructure := Structure;
end;

function GetLogAlertStructure: string;
begin
  Result := AlertStructure;
end;

// ------------------------------- Get 'n Set ----------------------------END
// -------------------------------- Log Add's --------------------------------
procedure AddLogEntry(Text: string);
begin
  AddLogEntry(Text, now);
end;

procedure AddLogEntry(Text: string; Time: TDateTime);
var
  Filename, EntryText: string;
  Zeit: TDateTime;
begin
  SendToInputText(Text);
  Zeit := Time;
  FileName := ReplaceText(FileNameStructure, Zeit) + '.' + LogFileExt;
  EntryText := ReplaceText(LogEntryStructure, Zeit);
  WriteToFile(EntryText, FilePath, FileName);
end;

procedure AddLogComment(Text: string);
begin
  AddLogComment(Text, now);
end;

procedure AddLogComment(Text: string; Time: TDateTime);
var
  Filename, EntryText: string;
  Zeit: TDateTime;
begin
  SendToInputText(Text);
  Zeit := Time;
  FileName := ReplaceText(FileNameStructure, Zeit) + '.' + LogFileExt;
  EntryText := ReplaceText(CommentStructure, Zeit);
  WriteToFile(EntryText, FilePath, FileName);
end;

procedure AddLogAlert(Text: string);
begin
  AddLogAlert(Text, now);
end;

procedure AddLogAlert(Text: string; Time: TDateTime);
var
  Filename, EntryText: string;
  Zeit: TDateTime;
begin
  SendToInputText(Text);
  Zeit := Time;
  FileName := ReplaceText(FileNameStructure, Zeit) + '.' + LogFileExt;
  EntryText := ReplaceText(AlertStructure, Zeit);
  WriteToFile(EntryText, FilePath, FileName);
end;

function GetCurrentLogFileName: string;
begin
  GetProgPath;
  Result := ProgDir + FilePath + replaceText(FileNameStructure, now) + '.' +
    LogFileExt;
end;

function WildcardToText(Wildcard: string): string;
begin
  Result := Replacetext(Wildcard, now);
end;

end.
