unit Tools;

{$MODE Delphi}

interface

uses SysUtils, Math, StrUtils, DateUtils, Classes, Types, {Windows,} Dialogs, Grids, CheckLst, StdCtrls;

type
  TAirport = record
    AirportName: String;
    ICAO: String;
    Lat: String;
    Lon: String;
  end;

  TAirportList = class(TObject)
  private
    Airports: Array of TAirport;
    function Get(Index: Integer): TAirport;
    procedure Put(Index: Integer; const Airport: TAirport);
    function GetCount: Integer;
  public
    property Airport[Index: Integer]: TAirport read Get write Put; default;
    function Add(const Airport: TAirport): Integer;
    property Count: Integer read GetCount;
    function Find(AirportName: String; var Airport: TAirport): Boolean;
    function Distance(AirportName1: String; AirportName2: String; DistUnit: String): Real;
  end;

var
  WorkingDir : string = '';


function CalcSGesZeit(CTime: String; Time: String): String;
function AddTime(Time1: String; Time2: String): String;
function CalcSGesStart(CStarts: Integer; GesStarts: Integer): String;
function TimeToExact(Time: String): Real;
function avgTime(Time: String; Flights: Integer): String;
function avgSpeed(Distance: Integer; Time: String): Word;
function avgPassengers(Passengers, Flights: Word): Real;
function RoundTime(Time: String): String;
function ExtractYear(Date: String): Word;
function PosToDeg(Pos: String): Real;
function TimeToMinute(Time: String): Integer;
function TimeToHour(Time: String): Real;
function MinuteToTime(Minute: Integer): String;
function ConvertDistUnits(Value: Real; Unit1, Unit2: String): Real;
function GetSpeedUnit(aUnit: String): String;
function CalcDist(BreitTotStO, LaengTotStO, BreitTotLaO, LaengTotLaO: Real; DistUnit: String): Real;
function IsInteger(Value: String): Boolean;
function IsTime(Time: String): Boolean;
function IsDate(Date: String): Boolean;
function IsBool(Bool: String): Boolean;
function NormalCase(S: String): String;
function PipeToCR(S: String): String;
function StrToHTML(S: String): String;
procedure ReadTStrings(S: String; var Strings: TStrings);
function readValueTStrings(S: String; var Strings: TStrings): Integer;
procedure AssignValues(StringsFrom: TStrings; StringsTo: TStrings);
procedure AssignNames(StringsFrom: TStrings; StringsTo: TStrings);
function WriteTStrings(Strings: TStrings): String;
function ReplaceString(S: String; replaceString, withString: Char): String;
function InList(Value, ValueType: String): Boolean;
function GetStringObject(StringList: TStrings; Name, ObjName: String): String;
procedure SetStringObject(StringList: TStrings; Name, ObjName, ObjValue: String);
procedure DeleteStringObject(StringList: TStrings; Index: Integer);
procedure FreeObjStringList(StringList: TStrings);
function GetActualDir(Extract : boolean) : String;
procedure StringsToCLB(var Cat: TStrings; Data: String; Grid: TStringGrid; CLB: TCheckListBox);  overload;
procedure StringsToCLB(var Cat: TStrings; Data:String; CLB: TCheckListBox); overload;
procedure GrayCLB(var Cat: TStrings; Data: String; CLB: TCheckListBox);
procedure StringToStringList(var List: TStrings; Data: String);
function _(Text: String): String;

implementation

{--\/-- TAirportList --\/--}

procedure TAirportList.Put(Index: Integer; const Airport: TAirport);
begin
  Airports[Index] := Airport;
end;

function TAirportList.Get(Index: Integer): TAirport;
begin
  Result := Airports[Index];
end;

function TAirportList.Add(const Airport: TAirport): Integer;
begin
  SetLength(Airports, length(Airports)+ 1);
  Airports[high(Airports)] := Airport;
  Result := length(Airports);
end;

function TAirportList.GetCount: Integer;
begin
  Result := length(Airports);
end;

// ----------------------------------------------------------------
// Search aiport in database
// ----------------------------------------------------------------
function TAirportList.Find(AirportName: String; var Airport: TAirport): Boolean;
var
  i: integer;
begin
  Result := False;
  if AirportName = '' then Exit;
  for i := 0 to length(Airports)-1 do
  begin
    if (Uppercase(Airports[i].ICAO) = Uppercase(AirportName)) or
     (Uppercase(Airports[i].AirportName) = Uppercase(AirportName)) then
    begin
      Result := True;
      Airport := Airports[i];
      Break;
    end;
  end;
end;

// ----------------------------------------------------------------
// Calc distance between airports
// ----------------------------------------------------------------
function TAirportList.Distance(AirportName1: String; AirportName2: String; DistUnit: String): Real;
var
  BreitTotStO, LaengTotStO, BreitTotLaO, LaengTotLaO: Real;
  Airport1, Airport2: TAirport;
begin
  if (AirportName1 = '') or (AirportName2 = '') then
  begin
    Result := 0;
    Exit;
  end;
  if Find(AirportName1, Airport1) and Find(AirportName2, Airport2) then
  begin
    BreitTotStO := PosToDeg(Airport1.Lat);
    LaengTotStO := PosToDeg(Airport1.Lon);
    BreitTotLaO := PosToDeg(Airport2.Lat);
    LaengTotLaO := PosToDeg(Airport2.Lon);
    Result := CalcDist(BreitTotStO, LaengTotStO, BreitTotLaO, LaengTotLaO, DistUnit);
  end
  else Result := 0;
end;

{--/\-- TAirportList --/\--}

function _(Text: String): String;
begin
  Result := Text;
end;

// ----------------------------------------------------------------
// Calc % of ctime
// ----------------------------------------------------------------
function CalcSGesZeit(CTime: String; Time: String):String;
var
  i, GesMinuten, GesCMinuten: Integer;
  Minuten, CMinuten, Stunden, CStunden: String;
begin
  i := 1;
  Stunden :=''; CStunden := ''; Minuten := ''; CMinuten := '';
  while (CTime[i] <> ':') do
  begin
    CStunden := CStunden + CTime[i];
    inc(i);
  end;
  CMinuten := copy(CTime,i+1,2);

  i :=1;
  while (Time[i] <> ':') do
  begin
    Stunden := Stunden + Time[i];
    inc(i);
  end;
  Minuten := copy(Time,i+1,2);

  GesMinuten := StrtoInt(Minuten) + (StrtoInt(Stunden)*60);
  GesCMinuten := StrtoInt(CMinuten) + (StrtoInt(CStunden)*60);
  if GesMinuten = 0 then Result := '0 %'
  else Result := format('%0.1f',[GesCMinuten/GesMinuten*100])+' %';
end;

// ----------------------------------------------------------------
// Add two times
// ----------------------------------------------------------------
function AddTime(Time1: String; Time2: String):String;
var
  stunden1, stunden2, GesStrMinuten, GesStrStunden: String;
  i,minuten1, minuten2, Gesstunden, Gesminuten: Integer;
begin

  {  Time1 }
  if Time1 = '' then Time1 := '00:00';
  i := 1; stunden1 := '';
  while (Time1[i] <> ':') and (i <= length(Time1)) do
  begin
    stunden1 := stunden1 + Time1[i];
    inc(i);
  end;
  if length(Time1) >= i+2 then minuten1 := StrtoInt(copy(Time1,i+1,2))
  else minuten1 := 0;

  { Time2 }
  if Time2 = '' then Time2 := '00:00';
  i := 1; stunden2 := '';
  while (Time2[i] <> ':') and (i <= length(Time2)) do
  begin
    stunden2 := stunden2 + Time2[i];
    inc(i);
  end;
  if length(Time2) >= i+2 then minuten2 := StrtoInt(copy(Time2,i+1,2))
  else minuten2 := 0;

  GesStunden := StrtoInt(stunden1) + StrtoInt(stunden2) + ((minuten1 + minuten2) div 60);
  if StrtoInt(stunden1) < 0 then GesMinuten := (minuten1 - minuten2) mod 60
  else GesMinuten := (minuten1 + minuten2) mod 60;
  if GesMinuten < 0 then
  begin
    inc(GesStunden);
    GesMinuten := 60-abs(GesMinuten);
  end;
  GesStrMinuten := Inttostr(GesMinuten);
  GesStrStunden := Inttostr(abs(GesStunden));
  if length(GesStrMinuten) = 1 then insert('0',GesStrMinuten,1);
  Result := GesStrStunden+':'+ GesStrMinuten;
end;

// ----------------------------------------------------------------
//
// ----------------------------------------------------------------
function CalcSGesStart(CStarts: Integer; GesStarts: Integer):String;
begin
  if GesStarts = 0 then Result := '0 %'
  else Result := format('%0.1f',[CStarts/GesStarts*100])+' %';
end;

// ----------------------------------------------------------------
//
// ----------------------------------------------------------------
function TimeToExact(Time: String): Real;
var
  j: Integer;
  Minuten, Stunden: String;
begin
  if Time = '' then
  begin
    Result := 0;
    Exit;
  end;
  Minuten := ''; Stunden := ''; j:= 1;
  while (Time[j] <> ':') do
    begin
      Stunden := Stunden + Time[j];
      inc(j);
    end;
    Minuten := copy(Time,j+1,2);
    Result := Strtoint(Stunden) + Strtoint(Minuten)/60;
end;

// ----------------------------------------------------------------
// Calcualate average flight time
// ----------------------------------------------------------------
function avgTime(Time: String; Flights: Integer): String;
var
  j, z: Integer;
  Minuten, DMinuten, Stunden: String;
begin
  if Flights = 0 then
  begin
    Result := '0:00';
    exit;
  end;
  Minuten := ''; Stunden := ''; j:= 1;
  while (Time[j] <> ':') do
  begin
    Stunden := Stunden + Time[j];
    inc(j);
  end;
  Minuten := copy(Time,j+1,2);
  z := (Strtoint(Stunden)*60 + Strtoint(Minuten))div Flights;
  DMinuten := InttoStr(z mod 60);
  if length(DMinuten) = 1 then insert('0',DMinuten,1);
  Result := Inttostr(z div 60) + ':' + DMinuten;
end;

// ----------------------------------------------------------------
// Calcualate average speed
// ----------------------------------------------------------------
function avgSpeed(Distance: Integer; Time: String): Word;
var
  j: Integer;
  Minuten, Stunden: String;
begin
  if (Distance = 0) or (Time = '0:00') or (Time = '') then
  begin
    Result := 0;
    exit;
  end;
  Minuten := ''; Stunden := ''; j:= 1;
  while (Time[j] <> ':') do
  begin
    Stunden := Stunden + Time[j];
    inc(j);
  end;
  Minuten := copy(Time,j+1,2);
  Result := Round(Distance / (Strtoint(Stunden) + Strtoint(Minuten)/60));
end;

// ----------------------------------------------------------------
// Average Passengers
// ----------------------------------------------------------------
function avgPassengers(Passengers, Flights: Word): Real;
begin
  if Flights = 0 then
    Result := 0
  else
    Result := Passengers / Flights;
end;

// ----------------------------------------------------------------
// Round Time [xx:xx:xx] to [xx:xx]
// ----------------------------------------------------------------
function RoundTime(Time: String): String;
var ATime: TDateTime;
begin
  ATime := StrToTime(Time);
  if SecondOf(ATime) > 29 then
    incMinute(ATime,1);
  Result := FormatDateTime(ShortTimeFormat, ATime);
end;

// ----------------------------------------------------------------
// Extract hours from a date
// ----------------------------------------------------------------
function ExtractYear(Date: String): Word;
begin
   Result := YearOf(StrToDate(Date));
end;

// ----------------------------------------------------------------
// convert position [Nxxx°xx'xx''] to degree
// ----------------------------------------------------------------
function PosToDeg(Pos: String): Real;
var
  i,n: Word;
  zelle: String;
begin
  i := 2;
  n := 0;
  Result := 0;
  while i < length(Pos) do
  begin
    while (Pos[i] <> '°') and (Pos[i] <> '''') and (Pos[i] <> '"') and (i < length(Pos)) do
    begin
      zelle := zelle + Pos[i];
      inc(i);
    end;
    if n = 0 then Result := StrtoInt(zelle);
    if n = 1 then Result := Result + StrtoInt(zelle)/60;
    if n = 2 then Result := Result + StrtoInt(zelle)/3600;
    inc(n);
    inc(i);
    zelle := '';
  end;
  if (copy(Pos,1,1) = 'S') or (copy(Pos,1,1) = 'W') then Result := 0-Result;
end;

// ----------------------------------------------------------------
// hh:mm to [m]
// ----------------------------------------------------------------
function TimeToMinute(Time: String): Integer;
var
  j: Integer;
  Stunden: String;
  GesStunden, GesMinuten: Integer;
begin
  Stunden := ''; j:= 1;
  if Time = '' then Time := '0:00'  ;
  while (Time[j] <> ':') do
    begin
      Stunden := Stunden + Time[j];
      inc(j);
    end;
  GesStunden := StrToInt(Stunden);
  GesMinuten := StrToInt(copy(Time,j+1,2));

  Result := GesStunden*60+GesMinuten;
end;

// ----------------------------------------------------------------
// hh:mm to [h]
// ----------------------------------------------------------------
function TimeToHour(Time: String): Real;
var
  j: Integer;
  Stunden: String;
  GesStunden, GesMinuten: Integer;
begin
  Stunden := ''; j:= 1;
  if Time = '' then Time := '0:00'  ;
  while (Time[j] <> ':') do
    begin
      Stunden := Stunden + Time[j];
      inc(j);
    end;
  GesStunden := StrToInt(Stunden);
  GesMinuten := StrToInt(copy(Time,j+1,2));

  Result := GesStunden+GesMinuten/60;
end;

// ----------------------------------------------------------------
// [m] to hh:mm
// ----------------------------------------------------------------
function MinuteToTime(Minute: Integer): String;
begin
  Result := format('%d:%0.2d',[Minute div 60, Minute mod 60]);
end;

// ----------------------------------------------------------------
// Convert distance units
// ----------------------------------------------------------------
function ConvertDistUnits(Value: Real; Unit1, Unit2: String): Real;
var
  temp: Real;
begin
  temp := 0;
  if (Value = 0) or (Unit1 = Unit2) then
  begin
    Result := Value;
    Exit;
  end;
  if LowerCase(Unit1) = 'nm' then temp := Value
  else if LowerCase(Unit1) = 'km' then temp := Value/1.853178
  else if LowerCase(Unit1) = 'miles' then temp := Value/1.609341;

  if LowerCase(Unit2) = 'km' then temp := temp*1.853178
  else if LowerCase(Unit2) = 'miles' then temp := temp*1.609341;

  Result := temp;
end;

// ----------------------------------------------------------------
// Speed units
// ----------------------------------------------------------------
function GetSpeedUnit(aUnit: String): String;
begin
  if LowerCase(aUnit) = 'km' then Result := 'km/h'
  else if LowerCase(aUnit) = 'nm' then Result := 'kn'
  else if LowerCase(aUnit) = 'miles' then Result := 'mph';
end;

// ----------------------------------------------------------------
// Calc distance (lat, lon)
// ----------------------------------------------------------------
function CalcDist(BreitTotStO, LaengTotStO, BreitTotLaO, LaengTotLaO: Real; DistUnit: String): Real;
var
  dtr, dist: Real;
begin
  Result := 0;
  if (BreitTotStO = BreitTotLaO) or (BreitTotStO = 0) or (BreitTotLaO = 0)
    then Result := 0
    else begin
      dtr := pi/180;
      dist := Round(60/dtr*ArcCos((sin(BreitTotStO*dtr)*sin(BreitTotLaO*dtr))+
       (cos(BreitTotStO*dtr)*cos(BreitTotLaO*dtr)* cos((LaengTotLaO-LaengTotStO)*dtr))));
      if LowerCase(DistUnit) = 'nm' then Result := dist;
      if LowerCase(DistUnit) = 'km' then Result := dist*1.853178;
      if LowerCase(DistUnit) = 'miles' then Result := dist*1.609341;
    end;
end;

// ----------------------------------------------------------------
// Checks if value is a valid integer
// ----------------------------------------------------------------
function IsInteger(Value: String): Boolean;
begin
  Result := True;
  try
    StrToInt(Value);
  except
     on E: Exception do Result := False;
  end;
end;

// ----------------------------------------------------------------
// Checks if value is a valid time
// ----------------------------------------------------------------
function IsTime(Time: String): Boolean;
var hIdx: Word;
begin
  hIdx := pos(':',Time);
  if hIdx = 0 then
    Result := False
  else begin
    if IsInteger(copy(Time,1,hIdx-1)) and
      (IsInteger(copy(Time,hIdx+1,length(Time)-hIdx)) and (StrToINt(copy(Time,hIdx+1,length(Time)-hIdx)) in [0..59]) )
        then
      Result := True
    else
      Result := False;
  end;
end;

// ----------------------------------------------------------------
// Checks if value is a valid date
// ----------------------------------------------------------------
function IsDate(Date: String): Boolean;
begin
  Result := True;
  try
    StrtoDate(Date);
  except
    Result := False;
  end;
end;


// ----------------------------------------------------------------
// Checks if value is a valid date
// ----------------------------------------------------------------
function isBool(Bool: String): Boolean;
begin
  Result := StrToBool(Bool);
end;

// ----------------------------------------------------------------
// First letter uppercase
// ----------------------------------------------------------------
function NormalCase(S: String): String;
var
  i: Word;
begin
  Result := AnsiLowercase(S);
  Result[1] := AnsiUppercase(s)[1];
  for i:= 1 to length(Result) do
    if Result[i] = ' ' then Result[i+1] := AnsiUppercase(s)[i+1];
end;

// ----------------------------------------------------------------
// Converts '|' to '#13'
// ----------------------------------------------------------------
function PipeToCR(S: String): String;
begin
  Result := StringReplace(S,'|',#13,[rfReplaceAll])
end;

// ----------------------------------------------------------------
// Escape string for html
// ----------------------------------------------------------------
function StrToHTML(S: String): String;
begin
  S := StringReplace(S,'ä','&auml;',[rfReplaceAll]);
  S := StringReplace(S,'ü','&uuml;',[rfReplaceAll]);
  S := StringReplace(S,'ö','&ouml;',[rfReplaceAll]);
  S := StringReplace(S,'Ä','&Auml;',[rfReplaceAll]);
  S := StringReplace(S,'Ü','&Uuml;',[rfReplaceAll]);
  S := StringReplace(S,'Ö','&Ouml;',[rfReplaceAll]);
  Result := S;
end;

// ----------------------------------------------------------------
// Read the content of a TStringList from a String
// ----------------------------------------------------------------
procedure readTStrings(S: String; var Strings: TStrings);
type TString = String;
var
  i: Integer;
  TempStr: String;
begin
  if not Assigned(Strings) then
    Exit;
  TempStr := '';
  Strings.Clear;
  if length(S) = 0 then exit;
  i := 0;
  repeat
    inc(i);
    if S[i] <> ';' then
      TempStr := TempStr + S[i];
    if (S[i] = ';') or (i = length(S)) then
    begin
      if TempStr <> '' then
        Strings.Add(TempStr);
      TempStr := '';
    end;
  until i >= length(S);
end;

// ----------------------------------------------------------------
// Read the values of a TStringList from a String
// don't allow duplicate names
// ----------------------------------------------------------------
function readValueTStrings(S: String; var Strings: TStrings): Integer;
type TString = String;
var
  i: Integer;
  TempStr: String;
  TempStrList: TSTrings;
begin
  TempStr := '';
  Result := 0;
  TempStrList := TSTringList.Create;
  if length(S) = 0 then exit;
  i := 0;
  repeat
    inc(i);
    if S[i] <> ';' then
      TempStr := TempStr + S[i];
    if (S[i] = ';') or (i = length(S)) then
    begin
      if TempStr <> '' then
        TempStrList.Add(TempStr);
      TempStr := '';
    end;
  until i >= length(S);

  Result := TempStrList.Count;
  for i := 0 to TempStrList.Count-1 do
    if pos('=', TempStrList.Text) = 0 then
    begin
      Result := -1;
      Exit;
    end;
  for i := 0 to TempStrList.Count-1 do
    Strings.Values[TempStrList.Names[i]] := TempStrList.Values[TempStrList.Names[i]];
end;

// ----------------------------------------------------------------
// Assign only values
// ----------------------------------------------------------------
procedure AssignValues(StringsFrom: TStrings; StringsTo: TStrings);
var
  i: Word;
begin
  StringsTo.Clear;
  for i := 0 to StringsFrom.Count-1 do
    StringsTo.Add(StringsFrom.ValueFromIndex[i]);
end;

// ----------------------------------------------------------------
// Assign only names
// ----------------------------------------------------------------
procedure AssignNames(StringsFrom: TStrings; StringsTo: TStrings);
var
  i: Word;
begin
  StringsTo.Clear;
  if StringsFrom.Count > 0 then
    for i := 0 to StringsFrom.Count-1 do
      StringsTo.Add(StringsFrom.Names[i]);
end;

// ----------------------------------------------------------------
// Write the content of a TStringList into a String
// ----------------------------------------------------------------
function writeTStrings(Strings: TStrings): String;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Strings.Count-1 do
    Result := Result + Strings[i]+';';
end;

// ----------------------------------------------------------------
// Replace string
// ----------------------------------------------------------------
function replaceString(S: String; replaceString, withString: Char): String;
begin
  while Pos(replaceString, S) > 0 do
  S[Pos(replaceString, S)] := withString;
  Result := S;
end;

// ----------------------------------------------------------------
// Value is in ValueType
// ----------------------------------------------------------------
function InList(Value, ValueType: String): Boolean;
begin
  if Pos(','+Value+',',ValueType) > 0 then
    Result := True
  else
    Result := False;
end;

// ----------------------------------------------------------------
// Read string object
// ----------------------------------------------------------------
function GetStringObject(StringList: TStrings; Name, ObjName: String): String;
var
  StringIndex: Integer;
begin
  StringIndex := -1;
  if (StringList.IndexOf(Name) <> -1) then
    StringIndex := StringList.IndexOf(Name)
  else if (StringList.IndexOfName(Name) <> -1) then
    StringIndex := StringList.IndexOfName(Name);
  if StringIndex = -1 then
    Exit;

  Result := '';
  if Assigned(StringList.Objects[StringIndex]) then
    Result := TStringList(StringList.Objects[StringIndex]).Values[ObjName];
end;

// ----------------------------------------------------------------
// Write string object
// ----------------------------------------------------------------
procedure SetStringObject(StringList: TStrings; Name, ObjName, ObjValue: String);
var
  StringIndex: Integer;
begin
  StringIndex := -1;
  if (StringList.IndexOf(Name) <> -1) then
    StringIndex := StringList.IndexOf(Name)
  else if (StringList.IndexOfName(Name) <> -1) then
    StringIndex := StringList.IndexOfName(Name);
  if StringIndex = -1 then
    Exit;

  if not Assigned(StringList.Objects[StringIndex]) then
    StringList.Objects[StringIndex] := TStringList.Create;

  TStringList(StringList.Objects[StringIndex]).Values[ObjName] := ObjValue;
end;

// ----------------------------------------------------------------
// Delete String  in StringListwith objects
// ----------------------------------------------------------------
procedure DeleteStringObject(StringList: TStrings; Index: Integer);
begin
  if Assigned(StringList.Objects[Index]) then
    StringList.Objects[Index].Free;
  StringList.Delete(Index);
end;

// ----------------------------------------------------------------
// Free StringList with objects
// ----------------------------------------------------------------
procedure FreeObjStringList(StringList: TStrings);
var i: Word;
begin
  if StringList.Count > 0 then
    for i := 0 to StringList.Count -1 do
      if Assigned(StringList.Objects[i]) then
        StringList.Objects[i].Free;
  StringList.Free;
end;



function GetActualDir(Extract : boolean) : String;
begin
   if Extract then Result := ExtractFilePath(Paramstr(0))
   else begin
     if WorkingDir = '' then GetDir(0, WorkingDir); {0 = Current drive / dir}
     Result := WorkingDir;
   end;
end;

// ----------------------------------------------------------------
//  Fill & Check CheckListBox and StringList with TSrings
// ----------------------------------------------------------------
procedure StringsToCLB(var Cat: TStrings; Data: String; Grid: TStringGrid; CLB: TCheckListBox);  overload;
var
  i, pos: Word;
  TempStr: String;
begin
  Pos := 0;
  if Data = '' then exit;

  for i := 1 to length(Data) do
  begin
    if (Data[i] = '|') then
    begin
      if Pos = 0 then
      begin
        if Cat.IndexOf(TempStr) = -1 then
        begin
          Cat.Add(TempStr);
          CLB.Items.Add(TempStr);
        end;
        CLB.Checked[CLB.Items.IndexOf(TempStr)] := True;
        if Grid.Cells[1,1] <> '' then Grid.RowCount := Grid.RowCount +1;
        Grid.Cells[0,Grid.RowCount-1] := InttoStr(CLB.Items.IndexOf(TempStr));
      end;
      Grid.Cells[Pos+1,Grid.RowCount-1] := TempStr;
      TempStr := '';
      inc(Pos);
    end
    else if (Data[i] = '/') then
    begin
      Grid.Cells[Pos+1,Grid.RowCount-1] := TempStr;
      TempStr := '';
      Pos := 0;
    end
    else TempStr := TempStr + Data[i];
  end;
end;

// ----------------------------------------------------------------
// Fill & Check CheckListBox with TSrings
// ----------------------------------------------------------------
procedure StringsToCLB(var Cat: TStrings; Data: String; CLB: TCheckListBox); overload;
var
  i: Word;
  TempStr: String;
begin
  CLB.Items := Cat;
  if Data = '' then
    Exit;

  for i := 1 to length(Data) do
  begin
    if (Data[i] = '/') then
      begin
      if CLB.Items.IndexOf(TempStr) = -1 then
      begin
        Cat.Add(TempStr);
        CLB.Items.Add(TempStr);
      end;
      CLB.Checked[CLB.Items.IndexOf(TempStr)] := True;
      TempStr := '';
    end
    else TempStr := TempStr + Data[i];
  end;
end;

// ----------------------------------------------------------------
//
// ----------------------------------------------------------------
procedure GrayCLB(var Cat: TStrings; Data: String; CLB: TCheckListBox);
var
  i: Word;
  TempStr: String;
begin
  if Data = '' then
    Exit;

  for i := 1 to length(Data) do
  begin
    if (Data[i] = '/') then
    begin
      if CLB.Items.IndexOf(TempStr) = -1 then
      begin
        Cat.Add(TempStr);
        CLB.Items.Add(TempStr);
      end;
//      CLB.State[CLB.Items.IndexOf(TempStr)] := cbGrayed;
//      CLB.Items[CLB.Items.IndexOf(TempStr)].Enabled := False;
      TempStr := '';
    end
    else TempStr := TempStr + Data[i];
  end;
end;

// ----------------------------------------------------------------
// convert "/"-seperated string list in TStringList
// ----------------------------------------------------------------
procedure StringToStringList(var List: TStrings; Data: String);
var
  i: Word;
  TempStr: String;
begin
  if Data = '' then
    Exit;

  for i := 1 to length(Data) do
  begin
    if (Data[i] = '/') then
    begin
      List.Add(TempStr);
      TempStr := '';
    end
    else TempStr := TempStr + Data[i];
  end;
end;



end.
