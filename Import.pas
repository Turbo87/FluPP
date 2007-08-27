unit Import;

interface

uses Classes, StrUtils, SysUtils, Dialogs, gnugettext, Forms, JvSimpleXml;

procedure OpenFlpFile7(XML : TJvSimpleXML); // ZIP, XML-File (FliPS & FileVersion = 7)
procedure OpenFluFile1(XML : TJvSimpleXML); // ZIP, XML-File (FluPP | FileVersion = 1)

procedure OpenOldFile5; //     ZIP, TEXT-File (DataFormat > 4)
procedure OpenOldFile4; // non ZIP, TEXT-File (DataFormat = 4)
procedure OpenOldFile0; // non ZIP, TEXT-File (DataFormat < 4)

procedure ImportCSV(FileName: String);

implementation

uses Grid, Main, Tools, ToolsGrid, ToolsShell, Debug;

//*******************************************************
// Standard XML procedures
//*******************************************************

procedure readValStrings(XMLElem: TJvSimpleXMLElem; StringList: TStrings);
var i: Word;
begin
  if XMLElem.Properties.Count > 0 then
    for i := 0 to XMLElem.Properties.Count - 1 do
      StringList.Values[XMLElem.Properties.Item[i].Name] := XMLElem.Properties.Item[i].Value;
end;

procedure readObjStrings(XMLElem: TJvSimpleXMLElem; var StringList: TStrings);
var i: Word;
begin
  if XMLElem.Properties.Count > 0 then begin
    if XMLElem.Properties.Value('Value') = '' then
      StringList.Add(XMLElem.Properties.Value('Name'))
    else
      StringList.Values[XMLElem.Properties.Value('Name')] := XMLElem.Properties.Value('Value');
    for i := 0 to XMLElem.Properties.Count - 1 do
    begin
      AddLogEntry('Name: '+XMLElem.Properties.Value('Name')+' - ObjName: '+XMLElem.Properties[i].Name+' - ObjValue: '+XMLElem.Properties[i].Value);
      if (XMLElem.Properties[i].Name <> 'Name') and (XMLElem.Properties[i].Name <> 'Value') then
        SetStringObject(StringList, XMLElem.Properties.Value('Name'), XMLElem.Properties[i].Name, XMLElem.Properties[i].Value);
      end;
  end;
end;

procedure readFlight(XMLElem: TJvSimpleXMLElem);
var i, Col: Word;
begin
  if GridActiveChild.Grid.Cells[1,1] = '' then
    GridActiveChild.CheckCols;
  if XMLElem.Properties.Count > 0 then begin
    if GridActiveChild.Grid.Cells[1,1] <> '' then
      GridActiveChild.Grid.RowCount := GridActiveChild.Grid.RowCount +1;

    for i := 0 to XMLElem.Properties.Count -1 do begin
      Col := GridActiveChild.GridCols.IndexOf(XMLElem.Properties.Item[i].Name);
      GridActiveChild.Grid.Cells[Col ,GridActiveChild.Grid.RowCount-1] := XMLElem.Properties.Item[i].Value;
    end;
  end;
end;

procedure readColumns(XMLElem: TJvSimpleXMLElem);
var i, Col: Word;
begin
  GridActiveChild.GridCols.Clear;
  GridActiveChild.GridCols.Add('Num');
  GridActiveChild.Grid.ColWidths[0] := 40;
  if XMLElem.Properties.Count > 0 then
    for i := 0 to XMLElem.Properties.Count -1 do
      if GridActiveChild.GridCols.IndexOf(XMLElem.Properties.Item[i].Name) = -1 then begin
        Col := GridActiveChild.GridCols.Add(XMLElem.Properties.Item[i].Name);
        GridActiveChild.Grid.ColWidths[Col] := StrToInt(XMLElem.Properties.Item[i].Value);
      end;
end;

//*******************************************************
// FliPS FileVersion = 7
//*******************************************************

procedure OpenFlpFile7(XML : TJvSimpleXML);
var XMLRootIdx, XMLIdx: Word;
    FLElem: TJvSimpleXMLElem;
    FlightLogName : String;
begin
  with XML do begin
      if Root.Items.Count > 0 then
      begin
        for XMLRootIdx := 0 to Root.Items.Count-1 do
        begin
          { General Settings }
          if Root.Items[XMLRootIdx].Name = 'GenSettings' then readValStrings(Root.Items[XMLRootIdx], GenSettings);
          if Root.Items[XMLRootIdx].Name = 'Medicals' then readObjStrings(Root.Items[XMLRootIdx], Medicals);
          if Root.Items[XMLRootIdx].Name = 'Schedules' then readObjStrings(Root.Items[XMLRootIdx], Schedules);

          { Flightlog }
          if Root.Items[XMLRootIdx].Name = 'FlightLog' then
          begin
            if Root.Items[XMLRootIdx].Properties.Value('Name') <> '' then
              FlightLogName := Root.Items[XMLRootIdx].Properties.Value('Name')
            else FlightLogName := 'Fligtlog'+IntToStr(XMLRootIdx);

            FMain.CreateNewWindow(FlightLogName);

            for XMLIdx := 0 to Root.Items[XMLRootIdx].Items.Count -1 do
            begin
              FLElem := Root.Items[XMLRootIdx].Items[XMLIdx];

              { Settings }
              if FLElem.Name = 'Settings' then readValStrings(FLElem, GridActiveChild.Settings);

              { AutoComplete }
              if FLElem.Name = 'Aircraft' then readObjStrings(FLElem, GridActiveChild.ACAircrafts);
              if FLElem.Name = 'Pilot' then readObjStrings(FLElem, GridActiveChild.ACPilots);
              if FLElem.Name = 'Airport' then readObjStrings(FLElem, GridActiveChild.ACAirports);

              { Categories }
              if FLElem.Name = 'TimeCat' then readObjStrings(FLElem, GridActiveChild.ACTimeCat);
              if FLElem.Name = 'Category' then readObjStrings(FLElem, GridActiveChild.ACCategories);
              if FLElem.Name = 'EventCat' then readObjStrings(FLElem, GridActiveChild.ACEventCat);
              if FLElem.Name = 'ContestCat' then readObjStrings(FLElem, GridActiveChild.ACContestCat);

              { License Data }
              if FLElem.Name = 'LicenseCat' then readObjStrings(FLElem, GridActiveChild.LicenseCategories);
              if FLElem.Name = 'LicenseTimeCat' then readObjStrings(FLElem, GridActiveChild.LicenseTimeCat);
              if FLElem.Name = 'LicenseDates' then readObjStrings(FLElem, GridActiveChild.LicenseDates);
              if FLElem.Name = 'AccLicenses' then readObjStrings(FLElem, GridActiveChild.AccLicenses);
              if FLElem.Name = 'OptConditions' then readObjStrings(FLElem, GridActiveChild.OptConditions);
              if FLElem.Name = 'Events' then readObjStrings(FLElem, GridActiveChild.Events);

              { Columns }
              if FLElem.Name = 'Columns' then readColumns(FLElem);

              { Flights }
              if FLElem.Name = 'Flight' then readFlight(FLElem);
            end;
          end;
        end;
      end;
  end;
end;


//*******************************************************
// FluPP-Files  FileVersion 1
//*******************************************************

procedure OpenFluFile1(XML : TJvSimpleXML);
var XMLRootIdx, XMLIdx: Word;
    FLElem: TJvSimpleXMLElem;
    FlightLogName : String;    
begin
  with XML do begin
      if Root.Items.Count > 0 then
      begin
        for XMLRootIdx := 0 to Root.Items.Count-1 do
        begin
          { General Settings }
          if Root.Items[XMLRootIdx].Name = 'GenSettings' then readValStrings(Root.Items[XMLRootIdx], GenSettings);
          if Root.Items[XMLRootIdx].Name = 'Medicals' then readObjStrings(Root.Items[XMLRootIdx], Medicals);
          if Root.Items[XMLRootIdx].Name = 'Schedules' then readObjStrings(Root.Items[XMLRootIdx], Schedules);

          { Flightlog }
          if Root.Items[XMLRootIdx].Name = 'FlightLog' then
          begin
            if Root.Items[XMLRootIdx].Properties.Value('Name') <> '' then
              FlightLogName := Root.Items[XMLRootIdx].Properties.Value('Name')
            else FlightLogName := 'Fligtlog'+IntToStr(XMLRootIdx);

            FMain.CreateNewWindow(FlightLogName);

            for XMLIdx := 0 to Root.Items[XMLRootIdx].Items.Count -1 do
            begin
              FLElem := Root.Items[XMLRootIdx].Items[XMLIdx];

              { Settings }
              if FLElem.Name = 'Settings' then readValStrings(FLElem, GridActiveChild.Settings);

              { AutoComplete }
              if FLElem.Name = 'Aircraft' then readObjStrings(FLElem, GridActiveChild.ACAircrafts);
              if FLElem.Name = 'Pilot' then readObjStrings(FLElem, GridActiveChild.ACPilots);
              if FLElem.Name = 'Airport' then readObjStrings(FLElem, GridActiveChild.ACAirports);

              { Categories }
              if FLElem.Name = 'CatTime' then readObjStrings(FLElem, GridActiveChild.ACTimeCat);
              if FLElem.Name = 'Category' then readObjStrings(FLElem, GridActiveChild.ACCategories);
              if FLElem.Name = 'EventCat' then readObjStrings(FLElem, GridActiveChild.ACEventCat);
              if FLElem.Name = 'Contest' then readObjStrings(FLElem, GridActiveChild.ACContestCat);

              { License Data }
              if FLElem.Name = 'LicenseCat' then readObjStrings(FLElem, GridActiveChild.LicenseCategories);
              if FLElem.Name = 'LicenseTimeCat' then readObjStrings(FLElem, GridActiveChild.LicenseTimeCat);
              if FLElem.Name = 'LicenseDates' then readObjStrings(FLElem, GridActiveChild.LicenseDates);
              if FLElem.Name = 'AccLicenses' then readObjStrings(FLElem, GridActiveChild.AccLicenses);
              if FLElem.Name = 'OptConditions' then readObjStrings(FLElem, GridActiveChild.OptConditions);
              if FLElem.Name = 'Events' then readObjStrings(FLElem, GridActiveChild.Events);

              { Columns }
              if FLElem.Name = 'Columns' then readColumns(FLElem);

              { Flights }
              if FLElem.Name = 'Flight' then readFlight(FLElem);
            end;
          end;
        end;
      end;
  end;
end;


//*******************************************************
// Older FluPP-Versions
//*******************************************************

procedure OpenOldFile5;
var
  DataFormat, Row: Word;
  aFile: TextFile;
  ColWidth: String;
{----------}
  procedure GetSettLine(RowData: String; var TmpCat, Data: String);
  begin
    TmpCat := copy(RowData,2,Pos(']',RowData)-2);
    Data := RightStr(RowData,length(RowData)-pos(']',RowData));
  end;
{----------}
var
  Data, RowData, Cell, TmpCat, TempFileName: String;
  Column, i : Word;
  AircraftID, AircraftType: TStrings;
begin
  if not fileexists(FluFileName) then
  begin
    MessageDlg(format(_('File ''%s'' does not exist'),[FluFileName]),mtWarning,[mbOK],0);
    Exit;
  end;
  DataChanged := False;
  FMain.StatusBar1.Panels[2].Text := '';
  FMain.Statusbar1.Panels[3].Text := FluFileName;

  TempFileName := FlpTempDir+'\'+'flightlog.xml';
  ShellcopyFile(FlpTempDir+'\'+ExtractFileName(FluFileName), TempFileName);

  try
    AircraftID := TStringList.Create;
    AircraftType := TStringList.Create;

    AssignFile(aFile,TempFileName);
    Reset(aFile);

    { Data format (1st line) }
    Readln(aFile,RowData);
    if not isInteger(RowData) then Exit;
    DataFormat := StrtoInt(RowData);

    { Old file format }
    if DataFormat = 4 then
    begin
      OpenOldFile4;
      Exit;
    end;

    if DataFormat < 4 then
    begin
      OpenOldFile0;
      Exit;
    end;

    { General Settings }
    repeat
      Readln(aFile,RowData);
      getSettLine(RowData,TmpCat,Data);
      if TmpCat = 'GenSettings' then  readValueTStrings(Data,GenSettings);
      if TmpCat = 'Medicals' then readValueTStrings(Data,Medicals);
      if TmpCat = 'Schedules' then readValueTStrings(Data,Schedules);

    until (RowData[1] = ':') or (Eof(aFile));
    if (Eof(aFile)) then Exit;

    { Flight logs }
    repeat
      FMain.CreateNewWindow(copy(RowData,2,length(RowData)-2));
      repeat
        Readln(aFile,RowData);
        getSettLine(RowData,TmpCat,Data);
        { License data }
        if TmpCat = 'Settings' then readValueTStrings(Data,GridActiveChild.Settings);
        { AutoComplete }
        if TmpCat = 'AId' then readTStrings(Data,AircraftID);
        if TmpCat = 'AType' then readTStrings(Data,AircraftType);
        if TmpCat = 'CoPilot' then readTStrings(Data,GridActiveChild.ACPilots);
        if TmpCat = 'Loc' then readTStrings(Data,GridActiveChild.ACAirports);
        { ColWidth }
        if TmpCat = 'ColWidth' then ColWidth := Data;
        { Categories }
        if TmpCat = 'CatTime' then readTStrings(Data,GridActiveChild.ACTimeCat);
        if TmpCat = 'Category' then readTStrings(Data,GridActiveChild.ACCategories);
        if TmpCat = 'Contest' then readTStrings(Data,GridActiveChild.ACContestCat);
        { TableCols }
        if TmpCat = 'TableCols' then
        begin
          readTStrings(Data,GridActiveChild.GridCols);
          ConvertColNames(GridActiveChild.GridCols);
        end;
        { Licenses }
        if TmpCat = 'LicenseCat' then readValueTStrings(Data,GridActiveChild.LicenseCategories);
        if TmpCat = 'LicenseTimeCat' then readValueTStrings(Data,GridActiveChild.LicenseTimeCat);
        if TmpCat = 'LicenseDates' then readValueTStrings(Data,GridActiveChild.LicenseDates);
        if TmpCat = 'AccLicenses' then readValueTStrings(Data,GridActiveChild.AccLicenses);
        if TmpCat = 'OptConditions' then readTStrings(Data,GridActiveChild.OptConditions);
      until (TmpCat = 'TableCols') or (Eof(aFile));
      if (Eof(aFile)) then Exit;

      GridActiveChild.Grid.ColCount := GridActiveChild.GridCols.Count;
      GridActiveChild.setColWidth(ColWidth);
      GridActiveChild.CheckCols;
      GridActiveChild.NameCols;
      SetLength(GridActiveChild.Undo, GridActiveChild.GridCols.Count);
      for i := 0 to AircraftID.Count-1 do
        GridActiveChild.ACAircrafts.Values[AircraftID[i]] := AircraftType[i];

      Readln(aFile,RowData);
      Row := 1;
      repeat
        Cell := '';
        i:=1;
        column := 0;
      { Read flight data }
        while i < length(RowData) do
        begin
          while (RowData[i] <> ';') and (i < length(RowData)) do
          begin
            Cell := Cell + RowData[i];
            inc(i);
          end;
          if Cell = ' ' then Cell := '';
          GridActiveChild.Grid.Cells[column,Row] := Cell;
          inc(column);
          Cell := '';
          inc(i);
        end;
        if RowData <> '' then inc(Row);
        GridActiveChild.Grid.RowCount := Row;
        if Eof(aFile) then break;
        Readln(aFile,RowData);

      until RowData[1] = ':';

    until Eof(aFile); // Licenses

    GridActiveChild.Grid.FixedCols := 1;
    GridActiveChild.Grid.Row := GridActiveChild.Grid.RowCount-1;
  finally
    CloseFile(aFile);
    AircraftID.Free;
    AircraftType.Free;
  end;

  for i := 0 to FMain.MDIChildCount-1 do
  begin
    GridChild(i).ReCalcGridNr;
    GridChild(i).Grid.FixedCols := 1;
    GridChild(i).Grid.Row := GridChild(i).Grid.RowCount-1;
    GridChild(i).Grid.ColCount := GridChild(i).GridCols.Count;
    GridChild(i).NameCols;
  end;

  FMain.MDIChildren[FMain.MDIChildCount-1].show;
  GridActiveChild.ReCalcGridTime;
  FMain.UpdateButtonState;
  FMain.CreateSButtons;
end;

// ----------------------------------------------------------------
// Read data from flightlog DF4
// ----------------------------------------------------------------
procedure OpenOldFile4;
var
  Row: Word;
  AFile: TextFile;
{----------}
  procedure readGenSettings(RowText: String);
  var
    i,n: word;
    Cell: String;
  begin
    i := 1; n := 1;
    while i < length(RowText) do
    begin
      while (RowText[i] <> ';') and (i < length(RowText)) do
      begin
        Cell := Cell + RowText[i];
        inc(i);
      end;
      case n of
        1: GenSettings.Values['Name'] := Cell;
        2: GenSettings.Values['Road'] := Cell;
        3: GenSettings.Values['Location'] := Cell;
        4: GenSettings.Values['PilotName'] := Cell;
      end;
      Cell := '';
      inc(n);
      inc(i);
    end;
  end;
{----------}
  procedure ReadLicenseData(S: String);
  var
    Cell: String;
    i,Col: Word;
  begin
    i := 1;
    Col := 1;
    while i <= length(S) do
    begin
      Cell := '';
      if S <> '' then
      begin
        while (S[i] <> ';') and (i <= length(S)) do
        begin
          Cell := Cell + S[i];
          inc(i);
        end;
        { License data }
        case Col of
          1: if IsInteger(Cell) then GridActiveChild.Settings.Values['BFStarts'] := Cell;
          2: begin
               if length(Cell) = 7 then Cell := '0'+Cell;
               GridActiveChild.Settings.Values['BFTime'] := Cell;
             end;
          4: GridActiveChild.Settings.Values['LicenseSince'] := Cell;
          5: GridActiveChild.Settings.Values['IDPrefix'] := Cell;
          9: GridActiveChild.Settings.Values['DistUnit'] := Cell;
        end;
        inc(i);
        inc(Col);
      end;
    end;
  end;
{----------}
  procedure CreateFlightlog(RowText: String);
  begin
    if FMain.MDIChildCount <> 0 then
    begin
      GridActiveChild.NameCols;
      GridActiveChild.Grid.RowCount := Row;
      GridActiveChild.Grid.FixedCols := 1;
      GridActiveChild.Grid.Row := GridActiveChild.Grid.RowCount-1;
    end;
    FMain.CreateNewWindow(copy(RowText,2,pos(';',RowText)-2));
  end;
{----------}
  procedure GetSettLine(RowText: String; var TmpCat, Data: String);
  begin
    TmpCat := copy(RowText,2,Pos(']',RowText)-2);
    Data := RightStr(RowText,length(RowText)-pos(']',RowText));
  end;
{----------}
var
  Data, RowText, Cell, TmpCat, TempFileName: String;
  Column, i : Word;
  AircraftID, AircraftType: TStrings;
begin
  if not fileexists(FluFileName) then
  begin
    MessageDlg(format(_('File ''%s'' does not exist'),[FluFileName]),mtWarning,[mbOK],0);
    Exit;
  end;
  AircraftID := TStringList.Create;
  AircraftType := TStringList.Create;
  DataChanged := False;
  FMain.StatusBar1.Panels[2].Text := '';
  FMain.Statusbar1.Panels[3].Text := FluFileName;

  TempFileName := FlpTempDir+'\'+'flightlog.xml';
  AssignFile(AFile,TempFileName);
  Reset(AFile);

  { Data format (1st line) }
  Readln(AFile,RowText);
  if StrtoInt(RowText) < 4 then
  begin
    CloseFile(AFile);
    OpenOldFile0;
    Exit;
  end;

  { General Settings }
  repeat
    Readln(aFile,RowText);
    getSettLine(RowText,TmpCat,Data);
    if TmpCat = 'GenSettings' then  readGenSettings(Data);

  until (RowText[1] = ':') or (Eof(aFile));
  if (Eof(aFile)) then Exit;

  { Flight logs }
  repeat

    CreateFlightlog(RowText);
    Readln(AFile,RowText);
    getSettLine(RowText,TmpCat,Data);
    ReadLicenseData(Data);
    repeat
      Readln(AFile,RowText);
      getSettLine(RowText,TmpCat,Data);
      { AutoComplete }
      if TmpCat = 'AId' then readTStrings(Data,AircraftID);
      if TmpCat = 'AType' then readTStrings(Data,AircraftType);
      if TmpCat = 'CoPilot' then readTStrings(Data,GridActiveChild.ACPilots);
      if TmpCat = 'Loc' then readTStrings(Data,GridActiveChild.ACAirports);
      { ColWidth }
      if TmpCat = 'ColWidth' then GridActiveChild.setColWidth(Data);
      { Categories }
      if TmpCat = 'CatTime' then readTStrings(Data,GridActiveChild.ACTimeCat);
      if TmpCat = 'Category' then readTStrings(Data,GridActiveChild.ACCategories);
      if TmpCat = 'Contest' then readTStrings(Data,GridActiveChild.ACContestCat);
      { TableCols }
      if TmpCat = 'TableCols' then
      begin
        readTStrings(Data,GridActiveChild.GridCols);
        ConvertColNames(GridActiveChild.GridCols);
      end;
      { Licenses }
      if TmpCat = 'LicenseCat' then readTStrings(Data,GridActiveChild.LicenseCategories);
      if TmpCat = 'LicenseTimeCat' then readTStrings(Data,GridActiveChild.LicenseTimeCat);
      if TmpCat = 'LicenseDates' then readTStrings(Data,GridActiveChild.LicenseDates);
      if TmpCat = 'AccLicenses' then readTStrings(Data,GridActiveChild.AccLicenses);
      if TmpCat = 'OptConditions' then readTStrings(Data,GridActiveChild.OptConditions);
    until (TmpCat = 'TableCols') or (Eof(AFile));
    if (Eof(AFile)) then Exit;

    GridActiveChild.Grid.ColCount := GridActiveChild.GridCols.Count;
    SetLength(GridActiveChild.Undo, GridActiveChild.GridCols.Count);
    if AircraftID.Count > 0 then
      for i := 0 to AircraftID.Count-1 do
        GridActiveChild.ACAircrafts.Values[AircraftID[i]] := AircraftType[i];

    Readln(AFile,RowText);
    Row := 1;
    repeat
      Cell := '';
      i:=1;
      column := 0;
    { Read flight data }
      while i < length(RowText) do
      begin
        while (RowText[i] <> ';') and (i < length(RowText)) do
        begin
          Cell := Cell + RowText[i];
          inc(i);
        end;
        if Cell = ' ' then Cell := '';
        GridActiveChild.Grid.Cells[column,Row] := Cell;
        inc(column);
        Cell := '';
        inc(i);
      end;
      if RowText <> '' then inc(Row);
      if Eof(AFile) then break;
      Readln(AFile,RowText);

    until RowText[1] = ':';

  until Eof(AFile); // Licenses

  GridActiveChild.Grid.RowCount := Row;
  GridActiveChild.Grid.FixedCols := 1;
  GridActiveChild.Grid.Row := GridActiveChild.Grid.RowCount-1;
  CloseFile(AFile);
  GridActiveChild.NameCols;
  GridActiveChild.ReCalcGridTime;
  GridActiveChild.ReCalcGridNr;
  FMain.MDIChildren[FMain.MDIChildCount-1].show;
  FMain.UpdateButtonState;
  FMain.CreateSButtons;

  { DF4 -> DF5 }
  
  for i := 0 to FMain.MDIChildCount-1 do
  for Row := 1 to GridChild(i).Grid.RowCount-1 do
  begin
    GridChild(i).Data['Cat',Row] := ReplaceString(GridChild(i).Data['Cat',Row],',','/');
    GridChild(i).Data['Via',Row] := ReplaceString(GridChild(i).Data['Via',Row],',','/');
    GridChild(i).Data['CTi',Row] := ReplaceString(GridChild(i).Data['CTi',Row],',','/');
    GridChild(i).Data['Fil',Row] := ReplaceString(GridChild(i).Data['Fil',Row],',','/');
    GridChild(i).Data['Con',Row] := ReplaceString(GridChild(i).Data['Con',Row],',','/');
  end;

  for i := 0 to FMain.MDIChildCount-1 do
  begin
    GridChild(i).Settings.Values['ShowBlockTime'] := 'False';
    GridChild(i).Settings.Values['ShowFlightTime'] := 'True';
    GridChild(i).Settings.Values['ShowStartType'] := 'True';
    GridChild(i).Settings.Values['DefaultTime'] := '1'; // Flight Time

    if GridChild(i).GridCols.IndexOf('ToS') = -1 then
    begin
      GridChild(i).GridCols.Add('ToS');
      GridChild(i).Grid.ColCount := GridChild(i).GridCols.Count;
      GridChild(i).NameCols;
      for Row := 1 to GridChild(i).Grid.RowCount do
        GridChild(i).Data['ToS',Row] := 'E';
    end;
  end;
  AircraftID.Free;
  AircraftType.Free;
end;

// ----------------------------------------------------------------
// read old data from flightlog
// ----------------------------------------------------------------
procedure OpenOldFile0;
{----------}
  procedure ReadLicenseData(S: String);
  var
    Cell: String;
    i,Col: Word;
  begin
    i := 1;
    Col := 1;
    while i <= length(S) do
    begin
      Cell := '';
      if S <> '' then
      begin
        while (S[i] <> ';') and (i <= length(S)) do
        begin
          Cell := Cell + S[i];
          inc(i);
        end;

        { License data }
        case Col of
          1: if IsInteger(Cell) then GridActiveChild.Settings.Values['BFStarts'] := Cell;
          2: begin
               if length(Cell) = 7 then Cell := '0'+Cell;
               GridActiveChild.Settings.Values['BFTime'] := Cell;
             end;
          4: GridActiveChild.Settings.Values['LicenseSince'] := Cell;
          5: GridActiveChild.Settings.Values['IDPrefix'] := Cell;
          9: GridActiveChild.Settings.Values['DistUnit'] := Cell;
        end;
        inc(i);
        inc(Col);
      end;
    end;
  end;
{----------}
var
  AFile: TextFile;
  RowText, Cell, FType : String;
  Row, column, i,j, n, DataFormat : Word;
  AircraftID, AircraftType: TStrings;
begin
  if not fileexists(FluFileName) then
  begin
    MessageDlg(format(_('File ''%s'' does not exist'),[FluFileName]),mtWarning,[mbOK],0);
    Exit;
  end;
  AircraftID := TStringList.Create;
  AircraftType := TStringList.Create;

  DataChanged := False;
  FMain.StatusBar1.Panels[2].Text := '';
  FMain.Statusbar1.Panels[3].Text := FluFileName;
  AssignFile(AFile,FluFileName);
  Reset(AFile);

{ Einstellungen lesen }
  Cell := '';

  i := 1; n := 0;
  Readln(AFile,RowText);

  DataFormat := StrtoInt(RowText);
  if Dataformat < 3 then
  begin
    CloseFile(AFile);
    MessageDlg(_('This version of the file is not compatible anymore'),mtWarning,[mbOK],0);
    Exit;
  end;
  Readln(AFile,RowText);
  while i < length(RowText) do
  begin
    while (RowText[i] <> ';') and (i < length(RowText)) do
    begin
      Cell := Cell + RowText[i];
      inc(i);
    end;
    inc(n);
    case n of
        1: GenSettings.Values['Name'] := Cell;
        2: GenSettings.Values['Road'] := Cell;
        3: GenSettings.Values['Location'] := Cell;
        4: GenSettings.Values['PilotName'] := Cell;
      end;
    Cell := '';
    inc(i);
  end;
{ Daten }
  Cell := '';
  Row := 1;
  while not Eof(AFile) do
  begin
    Readln(AFile,RowText);
    if length(RowText) > 2 then If RowText[1] = ':' then // ":" = new Flightlog
    begin
      if FMain.MDIChildCount <> 0 then
      begin
        GridActiveChild.Grid.RowCount := Row;
        GridActiveChild.Grid.Row := GridActiveChild.Grid.RowCount-1;
        GridActiveChild.ReCalcGridNr;
      end;
      FType := copy(RowText,pos(';',RowText)+1,length(RowText)-1);
      FMain.CreateNewWindow(copy(RowText,2,pos(';',RowText)-2));

      GridActiveChild.GridCols.Delimiter := ';';
      GridActiveChild.GridCols.QuoteChar := '"';
      if FType = 'Segelflug' then
        ReadTStrings('Num;Dat;ATy;AId;Pi1;Pi2;TOS;StT;LaT;FlT;NoL;StL;LaL;Rem;Dst;Cat;Via;CTi;Fil;Con', GridActiveChild.GridCols)
      else
        ReadTStrings('Num;Dat;ATy;AId;Pi1;Pi2;StT;LaT;FlT;NoL;StL;LaL;Rem;Dst;Cat;Via;CTi;Fil;Con', GridActiveChild.GridCols);

      GridActiveChild.Grid.ColCount := GridActiveChild.GridCols.Count;

      j := 10;
      for Row := 1 to j do      // xx rows data
      begin
        Readln(AFile,RowText);
        n := 1;
        i := 1;
        while i <= length(RowText) do
        begin
          Cell := '';
          if RowText <> '' then
          begin
            while (RowText[i] <> ';') and (i <= length(RowText)) do
            begin
              Cell := Cell + RowText[i];
              inc(i);
            end;
            { License data }
            if (Row = 1) and (n = 1) then if IsInteger(Cell) then GridActiveChild.Settings.Values['BFStarts'] := Cell;
            if (Row = 1) and (n = 2) then
            begin
              if length(Cell) = 7 then Cell := '0'+Cell;
              GridActiveChild.Settings.Values['BFTime'] := Cell;
            end;
            if (Row = 1) and (n = 4) then GridActiveChild.Settings.Values['LicenseSince'] := Cell;
            if (Row = 1) and (n = 5) then GridActiveChild.Settings.Values['IDPrefix'] := Cell;
            if (Row = 1) and (n = 9) then GridActiveChild.Settings.Values['DistUnit'] := Cell;
            if Cell = ' ' then Cell := '';
            { AutoComplete }
            If Row = 2 then if Cell <> '' then AircraftID.Add(Cell);
            If Row = 3 then if Cell <> '' then AircraftType.Add(Cell);
            If Row = 6 then if Cell <> '' then GridActiveChild.ACPilots.Add(Cell);
            If Row = 7 then if Cell <> '' then GridActiveChild.ACAirports.Add(Cell);
            { Categories }
            if Row = 9  then if Cell <> '' then GridActiveChild.ACTimeCat.Add(Cell);
            if Row = 10 then if Cell <> '' then GridActiveChild.ACCategories.Add(Cell);
            if Row = 11 then if Cell <> '' then GridActiveChild.ACContestCat.Add(Cell);
            { Table columns }
            if Row = 12 then GridActiveChild.GridCols.Add(Cell);
            inc(n);
            inc(i);
          end;
        end;
      end;
      if AircraftID.Count > 0 then
        for i := 0 to AircraftID.Count-1 do
          GridActiveChild.ACAircrafts.Values[AircraftID[i]] := AircraftType[i];
      GridActiveChild.NameCols;
      if GridActiveChild.Settings.Values['IDPrefix'] = '' then GridActiveChild.Settings.Values['IDPrefix'] := 'D-';
      Readln(AFile,RowText);
      Row := 1;
    end; // new License

    Cell := '';
    i:=1;
    column := 0;
    { Read flight data }
    while i < length(RowText) do
    begin
      while (RowText[i] <> ';') and (i < length(RowText)) do
      begin
        Cell := Cell + RowText[i];
        inc(i);
      end;
      if Cell = ' ' then Cell := '';

      { Data format 3 }
      if (DataFormat = 3) then
      begin
        if FType = 'Segelflug' then
        begin
          if (column = 16) and (Cell <> '') then
          begin
            GridActiveChild.Data['Con',Row] := 'DMSt|'+GridActiveChild.Grid.Cells[14,Row]+'|'+Cell+',';
          end;
          if column < 15 then GridActiveChild.Grid.Cells[column,Row] := Cell;
          if column > 15 then  GridActiveChild.Grid.Cells[column-2,Row] := Cell;
          inc(column);
        end
        else begin
          GridActiveChild.Grid.Cells[column,Row] := Cell;
          inc(column);
        end;
      end;

      Cell := '';
      inc(i);
    end;
    if RowText <> '' then inc(Row);
  end; // while not Eof(AFile) do

  GridActiveChild.Grid.RowCount := Row;

  for i := 0 to FMain.MDIChildCount-1 do
  for Row := 1 to GridChild(i).Grid.RowCount-1 do
  begin
    GridChild(i).Data['Cat',Row] := ReplaceString(GridChild(i).Data['Cat',Row],',','/');
    GridChild(i).Data['Via',Row] := ReplaceString(GridChild(i).Data['Via',Row],',','/');
    GridChild(i).Data['CTi',Row] := ReplaceString(GridChild(i).Data['CTi',Row],',','/');
    GridChild(i).Data['Fil',Row] := ReplaceString(GridChild(i).Data['Fil',Row],',','/');
    GridChild(i).Data['Con',Row] := ReplaceString(GridChild(i).Data['Con',Row],',','/');
  end; 

  GridActiveChild.Grid.Row := GridActiveChild.Grid.RowCount-1;
  CloseFile(AFile);

  GridActiveChild.ReCalcGridTime;
  GridActiveChild.ReCalcGridNr;
  FMain.MDIChildren[FMain.MDIChildCount-1].show;
  FMain.UpdateButtonState;
  FMain.CreateSButtons;

  for i := 0 to FMain.MDIChildCount-1 do
    if GridChild(i).GridCols.IndexOf('ToS') = -1 then
    begin
      GridChild(i).GridCols.Add('ToS');
      GridChild(i).Grid.ColCount := GridChild(i).GridCols.Count;
      GridChild(i).NameCols;
      for Row := 1 to GridChild(i).Grid.RowCount do
        GridChild(i).Data['ToS',Row] := 'E';
    end;
end;


//*******************************************************
// Import csv-File
//*******************************************************
procedure ImportCSV(FileName: String);
var
  AFile: TextFile;
  TmpTableCols, RowStrings: TStrings;
  RowData: String;
  i: word;
begin
  try
    TmpTableCols := TStringList.Create;
    RowStrings := TStringList.Create;

    AssignFile(AFile,FileName);
    Reset(AFile);
    if Eof(aFile) then
    begin

      Exit;
    end;

    { read TableCols }
    Readln(aFile,RowData);
    TmpTableCols.CommaText := RowData;

    { read data }
    if not Eof(aFile) then
    repeat
      Readln(aFile,RowData);
      //RowStrings.Delimiter := ',';
      //RowStrings.QuoteChar := '"';
      RowStrings.CommaText := RowData;
      if GridActiveChild.Grid.Cells[1,1] <> '' then
        GridActiveChild.Grid.RowCount := GridActiveChild.Grid.RowCount+1;
      for i := 0 to RowStrings.Count-1 do
      begin
        GridActiveChild.Data[TmpTableCols.Strings[i], GridActiveChild.Grid.RowCount-1] := RowStrings[i];
      end;

    until Eof(aFile);
  finally
    CloseFile(aFile);
    TmpTableCols.Free;
    RowStrings.Free;
  end;
end;

end.
