unit Export;

{$MODE Delphi}

interface

uses Forms, ComCtrls, Controls, Classes, SysUtils, Math, Grids, XMLRead, XMLWrite, DOM, Dialogs;

function SaveFluFile(FileName: String) : Boolean; // ZIP, XML-File

procedure ExportCSV(FileName: String);

procedure ExportSchedulesAsICal;
procedure ExportICal(const FileName, AppName: String; const ScheduleList: TSTrings);

procedure ExportGoogleMap;
procedure ExportGoogleEarth;

implementation

uses Main, Tools, ToolsGrid;

//*******************************************************
// Standard XML procedures
//*******************************************************

procedure writeValStrings(XMLDoc: TXMLDocument; RootNode: TDOMNode; ItemName: String; StringList: TStrings);
var i: Word;
    XMLNode: TDOMNode;
begin
  if StringList.Count > 0 then
  begin
    XMLNode := XMLDoc.CreateElement(ItemName);
    for i := 0 to StringList.Count - 1 do
      TDOMElement(XMLNode).SetAttribute(StringList.Names[i], StringList.ValueFromIndex[i]);
    XMLDoc.AppendChild(RootNode);
  end;
end;

procedure writeObjStrings(XMLDoc: TXMLDocument; RootNode: TDOMNode; ItemName: String; var StringList: TStrings);
var XMLSubElem: TDOMElement;
    i: Word;
begin
{  if StringList.Count > 0 then
    for i := 0 to StringList.Count - 1 do begin
      XMLSubElem := XMLElem.Items.Add(ItemName);
      if pos(StringList.NameValueSeparator, StringList.Strings[i]) = 0 then
        XMLSubElem.Properties.Add('Name', StringList.Strings[i])
      else begin
        XMLSubElem.Properties.Add('Name', StringList.Names[i]);
        XMLSubElem.Properties.Add('Value', StringList.ValueFromIndex[i]);
      end;
      if Assigned(StringList.Objects[i]) then
        writeValStrings(XMLSubElem, TStrings(StringList.Objects[i]));
    end;
}end;

procedure writeFlight(XMLDoc: TXMLDocument; RootNode: TDOMNode; ItemName: String; GridIdx, Row: Word);
var Col: Word;
begin
{  for Col := 1 to GridChild(GridIdx).GridCols.Count-1 do
    if GridChild(GridIdx).Grid.Cells[Col,Row] <> '' then
      XMLElem.Properties.Add(GridChild(GridIdx).GridCols[Col], GridChild(GridIdx).Grid.Cells[Col,Row]);
}end;

procedure writeColumns(XMLDoc: TXMLDocument; RootNode: TDOMNode; GridIdx: Word);
var XMLSubElem: TDOMElement;
    i: Word;
begin
{  XMLSubElem := XMLElem.Items.Add('Columns');
  if not (FMain.ActionResetColumns.Checked) then
    for i := 1 to GridChild(GridIdx).Grid.ColCount-1 do
      XMLSubElem.Properties.Add(GridChild(GridIdx).GridCols[i],
        InttoStr(GridChild(GridIdx).Grid.ColWidths[i]));
}end;


//*******************************************************
// FluPP FileVersion 1
//*******************************************************

function SaveFluFile(FileName: String) : Boolean;
var
  XMLDoc: TXMLDocument;
  XMLRoot: TDOMNode;
  XMLNode: TDOMNode;
  GridIdx, i: Integer;
  FLElem: TDOMElement;
  ProgressBar: TProgressBar;
begin
  XMLDoc := TXMLDocument.create;
//  XMLNode := TDOMNode.create;
  try
//    Prolog.Encoding := 'UTF-8';
//    Prolog.Version := '1.0';

    XMLRoot := XMLDoc.CreateElement('FluPP');
    TDOMElement(XMLRoot).SetAttribute('Version', FileVersion);
    TDOMElement(XMLRoot).SetAttribute('Program', 'FluPP ');
    XMLDoc.AppendChild(XMLRoot);

    writeValStrings(XMLDoc, XMLRoot, 'GenSettings', GenSettings);
    writeObjStrings(XMLDoc, XMLRoot,'Medicals' , Medicals);
    writeObjStrings(XMLDoc, XMLRoot, 'Schedules', Schedules);

    { Settings }
    for GridIdx := 0 to FMain.FlWindows.Count-1 do
    begin
      XMLNode := XMLDoc.CreateElement('FlightLog');
      TDOMElement(XMLRoot).SetAttribute('Name', GridChild(GridIdx).Caption);

      { Settings }
      writeValStrings(XMLDoc, XMLNode, 'Settings', GridChild(GridIdx).Settings);

      { AutoComplete }
      writeObjStrings(XMLDoc, XMLNode, 'Aircraft', GridChild(GridIdx).ACAircrafts);
      writeObjStrings(XMLDoc, XMLNode, 'Pilot', GridChild(GridIdx).ACPilots);
      writeObjStrings(XMLDoc, XMLNode, 'Airport', GridChild(GridIdx).ACAirports);

      { Categories }
      writeObjStrings(XMLDoc, XMLNode, 'CatTime', GridChild(GridIdx).ACTimeCat);
      writeObjStrings(XMLDoc, XMLNode, 'Category', GridChild(GridIdx).ACCategories);
      writeObjStrings(XMLDoc, XMLNode, 'EventCat', GridChild(GridIdx).ACEventCat);
      writeObjStrings(XMLDoc, XMLNode, 'Contest', GridChild(GridIdx).ACContestCat);

      { License Data }
      writeObjStrings(XMLDoc, XMLNode, 'LicenseCat', GridChild(GridIdx).LicenseCategories);
      writeObjStrings(XMLDoc, XMLNode, 'LicenseTimeCat', GridChild(GridIdx).LicenseTimeCat);
      writeObjStrings(XMLDoc, XMLNode, 'LicenseDates', GridChild(GridIdx).LicenseDates);
      writeObjStrings(XMLDoc, XMLNode, 'AccLicenses', GridChild(GridIdx).AccLicenses);
      writeObjStrings(XMLDoc, XMLNode, 'OptConditions', GridChild(GridIdx).OptConditions);
      writeObjStrings(XMLDoc, XMLNode, 'Events', GridChild(GridIdx).Events);

      { Columns }
      writeColumns(XMLDoc, XMLNode, GridIdx);

      { Flight data }
      for i := 1 to GridChild(GridIdx).Grid.RowCount-1 do
        writeFlight(XMLDoc, XMLNode, 'Flight', GridIdx, i);
    end;
    writeXMLFile(XMLDoc, FlpTempDir+'\'+'flightlog.xml');
  finally
    XMLDoc.free;
  end;

  { Compress }
  Result := True;
  try
    ProgressBar := TProgressBar.Create(FMain);
    ProgressBar.Parent := FMain.StatusBar1;
    ProgressBar.Top := 2;
    ProgressBar.Width := FMain.StatusBar1.Panels.Items[0].Width;
    ProgressBar.Height := FMain.StatusBar1.Height - 2;
    FMain.StatusBar1.Repaint;
    Screen.Cursor := crHourGlass;
{    try
      FMain.JvZlib.CompressDirectory(FlpTempDir,True,FileName);
    except
      on E: Exception do
      begin
        MessageDlg(E.Message, mtWarning, [mbOK], 0);
        Result := False;
      end;
    end;}
  finally
    ProgressBar.Free;
    Screen.Cursor := crDefault;
    FMain.StatusBar1.Repaint;
  end;
end;

// ----------------------------------------------------------------
// Export flight log as CSV
// ----------------------------------------------------------------
procedure ExportCSV(FileName: String);
var Count : Integer;
begin
  with GridActiveChild do begin
    for Count := 0 to GridCols.Count - 1 do
      Grid.Cells[Count, 0] := GridCols[Count];

    Grid.SaveToFile(FileName); { TODO: Which format??}
    NameCols;
  end;
end;

// ----------------------------------------------------------------
// Export Schedules as ICalendar
// ----------------------------------------------------------------
procedure ExportSchedulesAsICal;
var
  ScheduleList: TStrings;
  GridIdx: Word;
begin
  if (not StrToBool(GenSettings.Values['ExportICal'])) or (FluFileName = '') then Exit;

  ScheduleList := TSTringList.Create;
  try
    ScheduleList.AddStrings(Schedules);
    for GridIdx := 0 to FMain.FlWindows.Count-1 do
      ScheduleList.AddStrings(GridChild(GridIdx).LicenseDates);
    ScheduleList.AddStrings(Medicals);

    ExportICal(FluFileName+'.ics', 'FluPP', ScheduleList);
  finally
    ScheduleList.Free;
  end;
end;

// ----------------------------------------------------------------
// Writes ICal File
// ----------------------------------------------------------------
procedure ExportICal(const FileName, AppName: String; const ScheduleList: TSTrings);
{----------}
  function ICalDate(Date: TDateTime): String;
  begin
    Result := FormatDateTime('yyyymmdd', Date);
  end;
{----------}
  function ICalDateTime(DateTime: TDateTime): String;
  begin
    Result := FormatDateTime('yyyymmdd"T"hhmmss', DateTime);
  end;
{----------}
var
  aFile: TextFile;
  i: Word;
begin
  try
    AssignFile(aFile, FileName);
    ReWrite(aFile);

    writeln(aFile,'BEGIN:VCALENDAR');
    writeln(aFile,'VERSION:2.0');
    writeln(aFile,'PRODID:-//'+AppName+'//EN');

    if ScheduleList.Count > 0 then
      for i := 0 to ScheduleList.Count -1 do
        if isDate(ScheduleList.ValueFromIndex[i]) then
        begin
          Randomize;
          writeln(aFile,'BEGIN:VEVENT');
          writeln(aFile,'UID:'+ICalDateTime(now)+'-'+IntToStr(1)+'-'+AppName+'-'+IntToStr(i));
          { TODO: RandomRange(10000000,99999999}
          writeln(aFile,'CATEGORIES:FluPP');
          writeln(aFile,'SUMMARY:'+UTF8Encode(ScheduleList.Names[i]));
          writeln(aFile,'DTSTART;VALUE=DATE:'+ICalDate(StrToDate(ScheduleList.ValueFromIndex[i])));
          writeln(aFile,'DTEND;VALUE=DATE:'+ICalDate(StrToDate(ScheduleList.ValueFromIndex[i])));
          writeln(aFile,'DTSTAMP:'+ICalDateTime(now));
          writeln(aFile,'END:VEVENT');
        end;
      
    writeln(aFile,'END:VCALENDAR');
  finally
    CloseFile(aFile);
  end;
end;

// ----------------------------------------------------------------
// View flight in GoogleMaps
// ----------------------------------------------------------------
procedure ExportGoogleMap;
var
  Params: String;
  Airport1, Airport2: TAirport;
  TmpDecimalSeparator: Char;
  GridRect: TGridRect;
  Row: Word;
begin
  GridREct := GridActiveChild.Grid.Selection;
  TmpDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
    for Row := GridRect.Top to GridRect.Bottom do
    begin
      if AirportData.Find(GridActiveChild.Data['StL', Row], Airport1)
        and AirportData.Find(GridActiveChild.Data['LaL', Row], Airport2) then
      begin
        Params := Params +
          StrToHTML(Airport1.AirportName+'/'+Airport1.ICAO)+'/'+
          FormatFloat('#.0000',PosToDeg(Airport1.Lat))+'/'+
          FormatFloat('#.0000',PosToDeg(Airport1.Lon))+'/'+
          StrToHTML(Airport2.AirportName+'/'+Airport2.ICAO)+'/'+
          FormatFloat('#.0000',PosToDeg(Airport2.Lat))+'/'+
          FormatFloat('#.0000',PosToDeg(Airport2.Lon));
      end;
    end;
  finally
    DecimalSeparator := TmpDecimalSeparator;
  end;
  { TODO: ShellExecute(FMain.Handle, 'open', PChar(FLuPPDomain+'/gmaps/'+Params), nil, nil, SW_NORMAL);}
end;

// ----------------------------------------------------------------
// Export KMl file
// ----------------------------------------------------------------
procedure ExportGoogleEarth;
{  procedure AddPoint(Airport: TAirport; XMLElem: TJvSimpleXMLElem);
  begin
    XMLElem.Items.Add('Point').Items.Add('coordinates',
      FloatToStr(PosToDeg(Airport.Lon))+','+
      FloatToStr(PosToDeg(Airport.Lat))+','+'0');
  end;

  procedure AddLine(Airport1, Airport2: TAirport; XMLElem: TJvSimpleXMLElem);
  var SubElem: TJvSimpleXMLElem;
  begin
    SubElem := XMLElem.Items.Add('LineString');
    SubElem.Items.Add('tessellate', '1');
    SubElem.Items.Add('coordinates',
      FloatToStr(PosToDeg(Airport1.Lon))+','+
      FloatToStr(PosToDeg(Airport1.Lat))+','+'0'+' '+
      FloatToStr(PosToDeg(Airport2.Lon))+','+
      FloatToStr(PosToDeg(Airport2.Lat))+','+'0');
  end;

  function GetFlightDescription(Row: Word): String;

    function Description(Name: String; Row: Word): String;
    begin
      if GridActiveChild.Data[Name, Row] = '' then
        Result := ''
      else
        Result := GridActiveChild.Data[Name, 0] +': '+ GridActiveChild.Data[Name, Row] +'<br>';
    end;

  begin
    Result :=
        Description('Num', Row)
      + Description('Dat', Row)
      + Description('ATy', Row)
      + Description('AId', Row)
      + Description('Pi1', Row)
      + Description('Pi2', Row)
      + Description('Pas', Row)
      + Description('StB', Row)
      + Description('StT', Row)
      + Description('LaT', Row)
      + Description('LaB', Row)
      + Description('FlT', Row)
      + Description('BlT', Row)
      + Description('NoL', Row)
      + Description('StL', Row)
      + Description('LaL', Row)
      + Description('Dst', Row)
      + Description('Rem', Row)
      + Description('CTi', Row)
      + Description('Cat', Row)
      + Description('Via', Row)
      + Description('Met', Row)
      + Description('Fil', Row)
      + Description('Con', Row)
      + Description('ToS', Row)
      + Description('CfF', Row)
      + Description('LaF', Row)
      + Description('CfC', Row)
      + Description('EfF', Row)
      + Description('Del', Row);
end;

var
  DocElem, FolElem, PlaceMElem, StyleElem, StyleSubElem: TJvSimpleXMLElem;
  GridRect: TGridRect;
  ViaTmp: string;
  Row: Word;
  DestAirport, ActualAirport, TargetAirport: TAirport;
  TmpDecimalSeparator: Char; }
begin
{  GridREct := GridActiveChild.Grid.Selection;
  TmpDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  with TJvSimpleXML.Create(FMain) do
  try
    Prolog.Encoding := 'UTF-8';
    Prolog.Version := '1.0';

    Root.Name := 'kml';
    Root.Properties.Add('xmlns', 'http://earth.google.com/kml/2.0');

    // Document
    DocElem := Root.Items.Add('Document');

    // Styles
    StyleElem := DocElem.Items.Add('Style');
    StyleElem.Properties.Add('id', 'DefaultStyles');

    StyleSubElem := StyleElem.Items.Add('LineStyle');
    StyleSubElem.Items.Add('width', '3');

    StyleSubElem := StyleElem.Items.Add('IconStyle');
    StyleSubElem := StyleSubElem.Items.Add('Icon');
    StyleSubElem.Items.Add('href', 'root://icons/palette-2.png');
    StyleSubElem.Items.Add('x', '0');
    StyleSubElem.Items.Add('y', '0');
    StyleSubElem.Items.Add('w', '32');
    StyleSubElem.Items.Add('h', '32');

    // Placemarks
    for Row := GridRect.Top to GridRect.Bottom do
    begin
      if AirportData.Find(GridActiveChild.Data['StL', Row], DestAirport)
        and AirportData.Find(GridActiveChild.Data['LaL', Row], TargetAirport) then
      begin
        FolElem := DocElem.Items.Add('Folder');
        FolElem.Items.Add('name', GridActiveChild.Data['StL', Row]+'-'+GridActiveChild.Data['LaL', Row]);

        PlaceMElem := FolElem.Items.Add('Placemark');
        PlaceMElem.Items.Add('name', DestAirport.AirportName+' '+DestAirport.ICAO);
        PlaceMElem.Items.Add('description').Items.AddCData('description', GetFlightDescription(Row));
        PlaceMElem.Items.Add('styleUrl', '#DefaultStyles');
        AddPoint(DestAirport, PlaceMElem);

        ViaTmp := GridActiveChild.data['Via',Row];
        if ViaTmp > '' then begin
          while Pos('/', ViaTmp) > 0 do begin
            if AirportData.Find(Copy(ViaTmp, 1, Pos('/',ViaTmp)-1), ActualAirport) then begin
              PlaceMElem := FolElem.Items.Add('Placemark');
              PlaceMElem.Items.Add('name', 'Flight Leg (Route)');
              PlaceMElem.Items.Add('description').Items.AddCData('description', GetFlightDescription(Row));
              PlaceMElem.Items.Add('styleUrl', '#DefaultStyles');
              AddLine(DestAirport, ActualAirport, PlaceMElem);

              PlaceMElem := FolElem.Items.Add('Placemark');
              PlaceMElem.Items.Add('name', ActualAirport.AirportName+' '+ActualAirport.ICAO);
              PlaceMElem.Items.Add('description').Items.AddCData('description', GetFlightDescription(Row));
              PlaceMElem.Items.Add('styleUrl', '#DefaultStyles');
              AddPoint(ActualAirport, PlaceMElem);

              DestAirport := ActualAirport;
            end;
            Delete(ViaTmp, 1, Pos('/',ViaTmp));
          end;
        end;

        PlaceMElem := FolElem.Items.Add('Placemark');
        PlaceMElem.Items.Add('name', 'Flight Leg (Route)');
        PlaceMElem.Items.Add('description').Items.AddCData('description', GetFlightDescription(Row));
        PlaceMElem.Items.Add('styleUrl', '#DefaultStyles');
        AddLine(DestAirport, TargetAirport, PlaceMElem);

        PlaceMElem := FolElem.Items.Add('Placemark');
        PlaceMElem.Items.Add('name', TargetAirport.AirportName+' '+TargetAirport.ICAO);
        PlaceMElem.Items.Add('description').Items.AddCData('description', GetFlightDescription(Row));
        PlaceMElem.Items.Add('styleUrl', '#DefaultStyles');
        AddPoint(TargetAirport, PlaceMElem);
      end;
    end;
    SaveToFile(FluFileName+'.kml');
    MessageDlg(PChar('Google Earth File saved as: '+#10+#13+ExtractFileName(FluFileName)+'.kml'), mtInformation, [mbOK], 0);
    ShellExecute(FMain.Handle, 'open', PChar(ExtractFileName(FluFileName)+'.kml'), nil, nil, SW_NORMAL);
  finally
    Free;
    DecimalSeparator := TmpDecimalSeparator;
  end; }
end;

end.
