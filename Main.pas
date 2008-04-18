unit Main;

{$MODE Delphi}

interface

uses
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, StdCtrls, Buttons, IniFiles, Grids,
  SButton, ExtCtrls, Grid, ActnList, Tools, DateUtils,
  LResources, Contnrs, XMLRead, DOM, gnugettext, interfaces;

type

  { TFMain }
  TFMain = class(TForm)
    ABasicSettings: TAction;
    AClose: TAction;
    AFlightNew: TAction;
    AExit: TAction;
    ASettings: TAction;
    AFlightLogs: TAction;
    APrint: TAction;
    AEFilexport: TAction;
    AFileImport: TAction;
    AFileSaveAs: TAction;
    AFileSave: TAction;
    AFileOpen: TAction;
    AFileNew: TAction;
    ActionList: TActionList;
    GridSched: TStringGrid;
    ImageList32: TImageList;
    ImageList16: TImageList;
    KatAdd: TMenuItem;
    KatRem: TMenuItem;
    MainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem4: TMenuItem;
    MiFile: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    N1: TMenuItem;
    N5: TMenuItem;
    OpenDialog: TOpenDialog;
    Panel2: TPanel;
    PanelSButtons: TPanel;
    PUFiles: TMenuItem;
    PUFlightEdit: TMenuItem;
    PUFlightNew: TMenuItem;
    PUFlugEinfuegen: TMenuItem;
    PUFlugloeschen: TMenuItem;
    PUGoogleEarth: TMenuItem;
    PUGoogleMap: TMenuItem;
    PUKategorieZuordnen: TMenuItem;
    PUloeschrueck: TMenuItem;
    PUSepFiles: TMenuItem;
    SaveDialog: TSaveDialog;
    StartTimer: TTimer;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure ASettingsExecute(Sender: TObject);
    procedure ActionExit(Sender: TObject);
    procedure ActionFileSave(Sender: TObject);
    procedure ActionFileOpen(Sender: TObject);
    procedure ActionFileNew(Sender: TObject);
    procedure MMStatisticsClick(Sender: TObject);
    procedure InfoClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure ActionSettings(Sender: TObject);
    procedure ActionFileSaveAs(Sender: TObject);
    procedure FlightEdit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LastFifeClick(Sender: TObject);
    procedure StartTimerTimer(Sender: TObject);
    procedure LicenseClick(Sender: TObject);
    procedure ActionPrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var AFileNew: TCloseAction);
    procedure ActionClose(Sender: TObject);
    procedure ActionFlightNew(Sender: TObject);
    procedure FlightDeleteUndo(Sender: TObject);
    procedure FlightDelete(Sender: TObject);
    procedure ActionBasicSettings(Sender: TObject);
    procedure AirportsClick(Sender: TObject);
    procedure FlightInsert(Sender: TObject);
    procedure SortAllFlightsClick(Sender: TObject);
    procedure MMTrainBaroClick(Sender: TObject);
    procedure MMNinetyDaysClick(Sender: TObject);
    procedure SchedulerClick(Sender: TObject);
    procedure ActionFlightLogs(Sender: TObject);
    procedure ActionHPExecute(Sender: TObject);
    procedure ActionHPAirportsExecute(Sender: TObject);
    procedure ActionHPLicensesExecute(Sender: TObject);
    procedure ActionHPLanguagesExecute(Sender: TObject);
    procedure ActionHPRFEExecute(Sender: TObject);
    procedure ActionHPBugsExecute(Sender: TObject);
    procedure ActionHPSupportExecute(Sender: TObject);
    procedure GridSchedDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ActionFileExport(Sender: TObject);
    procedure JvZlibProgress(Sender: TObject; Position, Total: Integer);
    procedure ActionExportGoogleMapExecute(Sender: TObject);
    procedure ActionExportGoogleEarthExecute(Sender: TObject);
    procedure ActionResetColumnsExecute(Sender: TObject);
    procedure ActionFileImportExecute(Sender: TObject);
    procedure TIPropertyGrid1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    ProgressBar: TProgressBar;
    procedure LoadFluFile;
    procedure SaveFile(SaveFileName: String);
    procedure LoadDefaultGenSettings;
  public
    function SpeichernAbfrage: Boolean;
    procedure InsertData;
    procedure onHint(Sender: TObject);
    procedure ReadAirportData;
    procedure UpdateButtonState;
    procedure UpdateScheduleGrid;
    procedure LastFife(FileName: String);
    procedure CreateSButtons;
    procedure UpdateSButtons;

    ActiveFlWindow: Word;
  end;
  
    { TFlWindow }
  TFlWindow = class(TObjectList)
  private
    ActiveFlWindow: Integer;
  public
    function Add(Name: String; GridCols: String = DEFAULTTABLECOLS): TFGrid;
    function GetActive: TFGrid;
    procedure SetActive(Index: Integer);
  end;

var
  FMain: TFMain;
  DataChanged: Boolean;
  AirportData: TAirportList;
  GenSettings: TSTrings;
  Medicals: TStrings;
  Schedules: TSTrings;
  SchedValidity: TSTrings;
  FluFileName: String;
  FlpTempDir: String;
  FlWindow: TFlWindow;
  ChWindow: TFGrid;
  
const

{$I FluPP.lrs}

implementation

uses
  Input, BasicSettings, FlightLogs,
  ToolsGrid, ToolsShell, Import, Export, Debug;
//  Info, Calendar, NinetyDays, TrainBaro, Airports, Print, Statistics, Licenses, Settings;

{--\/-- TFlWindow --\/--}

// ----------------------------------------------------------------
// Add new FlWindow
//   hides TObjectList.Add
//   returns the added FGrid
// ----------------------------------------------------------------
function TFlWindow.Add(Name: String; GridCols: String = DEFAULTTABLECOLS): TFGrid;
begin
  ChWindow := TFGrid.Create(Application);
  
  ActiveFlWindow := inherited Add(ChWindow);

  ChWindow.Name := 'ChWindow' + IntToStr(FlWindow.Count);  { TODO: bad, when deleting}
  ChWindow.FlName := Name;
//  ChWindow.Parent := FMain;
  ChWindow.Align := alClient;
  ChWindow.Show;;

  ChWindow.Grid.ColCount := NumberOfGridRows + 1;
  ChWindow.setColWidth(DefaultColWidth);

  ChWindow.LoadDefaultSettings;

  ReadTStrings(GridCols, ChWindow.GridCols);
  ChWindow.Grid.ColCount := ChWindow.GridCols.Count;
  ChWindow.NameCols;
  SetLength(ChWindow.Undo, ChWindow.GridCols.Count);

  Result := TFGrid(FlWindow[ActiveFlWindow]);

//  FMain.CreateSButtons;
//  FMain.UpdateSButtons;
end;

// ----------------------------------------------------------------
// Returns the active FlWindow
// ----------------------------------------------------------------
function TFlWindow.GetActive: TFGrid;
begin
  Result := TFGrid(Items[ActiveFlWindow]);
end;

// ----------------------------------------------------------------
// Sets the active FlWindow
// ----------------------------------------------------------------
procedure TFlWindow.SetActive(Index: Integer);
var i: Integer;
begin
  ActiveFlWindow := Index;
  for i:= 0 to FlWindow.Count -1 do
    if i = Index then
    begin
      TFGRid(FlWindow.Items[i]).Visible := True;
      TFGRid(FlWindow.Items[i]).SButton.PanelSB.Color := clFOrange;
    end
    else begin
      TFGRid(FlWindow.Items[i]).Visible := False;
      TFGRid(FlWindow.Items[i]).SButton.PanelSB.Color := clSilver;
    end;
end;

{--/\-- TFlWindow --/\--}

// ----------------------------------------------------------------
// Form create
// ----------------------------------------------------------------
procedure TFMain.FormCreate(Sender: TObject);
var IniFile: TIniFile;
begin
  Caption := 'FluPP';
  FluFileName := '';

  ShortTimeFormat := 'hh:mm';
  TimeSeparator := ':';

  //ShortDateFormat := 'dd.MM.yyyy';
  //DateSeparator := '.';

  { read inifile }
  Inifile := Tinifile.create(GetActualDir(false)+'\FluPP.Ini');
{  LF1.Caption := Inifile.ReadString('LastFife', '1', '');
  LF2.Caption := Inifile.ReadString('LastFife', '2', '');
  LF3.Caption := Inifile.ReadString('LastFife', '3', '');
  LF4.Caption := Inifile.ReadString('LastFife', '4', '');
  LF5.Caption := Inifile.ReadString('LastFife', '5', '');
}  if Inifile.ReadBool('General', 'AutoLoad', False) = True then
  begin
    FluFileName := Inifile.ReadString('General', 'AutoLoadFile', '');
    StartTimer.Enabled := True;
  end;  
  Height := Inifile.ReadInteger('General', 'Height', 480);
  Width := Inifile.ReadInteger('General', 'Width', 640);
  Left := (Screen.Width div 2) - (width div 2);
  if IniFile.ReadBool('General', 'WMaximized', False) then
    WindowState := wsMaximized;

  DefaultInstance.UseLanguage(Inifile.ReadString('General', 'Language', copy(DefaultInstance.GetCurrentLanguage,1,2)));
  Inifile.Free;

  GenSettings := TSTringList.Create;
  GenSettings.Values['WarningMonth'] := '2';
  GenSettings.Values['ExportICal'] := '0';
  Medicals := TStringList.Create;
  Schedules := TStringList.Create;
  SchedValidity := TStringList.Create;
  AirportData := TAirportList.Create;
  
  FlWindow := TFlWindow.create;

  with GridSched do
  begin
    ColWidths[0] := 47;
    ColWidths[1] := GridSched.Width - ColWidths[0] - 2;
    Selection := DeSelectRect;
  end;

  PanelSButtons.Width := 0;
  UpdateButtonState;

  TranslateComponent(Self);

  Application.OnHint := onHint;

{  LF1.visible := LF1.Caption <> '';
  LF2.visible := LF2.Caption <> '';
  LF3.visible := LF3.Caption <> '';
  LF4.visible := LF4.Caption <> '';
  LF5.visible := LF5.Caption <> '';
}
  { Load with params }
  if (ParamStr(1) <> '') and (ExtractFileExt(ParamStr(1)) = '.flu') then
  begin
    FluFileName := ParamStr(1);
    StartTimer.Enabled := True;
  end;
  //ReadAirportData;
end;

// ----------------------------------------------------------------
// Timer for param MiFile opening
// ----------------------------------------------------------------
procedure TFMain.StartTimerTimer(Sender: TObject);
begin
  StartTimer.Enabled := False;
  LoadFluFile;
end;

// ----------------------------------------------------------------
// On hint
// ----------------------------------------------------------------
procedure TFMain.onHint(Sender: TObject);
begin
  //StatusBar1.Panels[1].text := GetLongHint(Application.Hint);
end;

// ----------------------------------------------------------------
// Load default GenSettings
// ----------------------------------------------------------------
procedure TFMain.LoadDefaultGenSettings;
begin
  GenSettings.Values['WarningMonth'] := '2';
  GenSettings.Values['ExportICal'] := '0';
end;

// ----------------------------------------------------------------
// Load airport database
// ----------------------------------------------------------------
procedure TFMain.ReadAirportData;
{----------}
  procedure GetData(FileName: String);
  var
    AFile: TextFile;
    RowText, Cell: String;
    l,i,Col: Word;
    TmpAirport: TAirport;
  begin
    if not FileExists(FileName) then
      Exit;
    AssignFile(AFile,FileName);
    try
      Reset(AFile);
      while not Eof(AFile) do
      begin
        Readln(AFile,RowText);
        Col := 1;
        i := 1;
        l := length(RowText);
        while i < l do
        begin
          Cell := '';
          begin
            while (RowText[i] <> ';') and (i < length(RowText)) do
            begin
              Cell := Cell + RowText[i];
              inc(i);
            end;
            case Col of
              1: TmpAirport.AirportName := Cell;
              2: TmpAirport.ICAO := Cell;
              3: TmpAirport.Lat :=Cell;
              4: TmpAirport.Lon := Cell;
            end;
            inc(Col);
            inc(i);
          end;
        end;
        AirportData.Add(TmpAirport);
      end;
    finally
      CloseFile(AFile);
    end;
  end;
{----------}
var
  Found: Word;
  SearchRec: TSearchRec;
begin
  { FluPP 1.08 -> 1.09 }
  if FileExists(GetActualDir(true)+'\Eigene Flugplaetze.txt') then
{ TODO:    MoveFile(PChar(GetActualDir(true)+'\Eigene Flugplaetze.txt'), PChar(GetActualDir(true)+'airports\airports.txt'));}

  Found := FindFirst(GetActualDir(true)+'\airports\airports*.txt', faAnyFile, SearchRec);
{  while Found = 0 do
  begin
    GetData(GetActualDir(true)+'\airports\'+SearchRec.Name);
    Found := FindNext(SearchRec);
  end;}
  FindClose(SearchRec);
end;

// ----------------------------------------------------------------
// create new flightlog
// ----------------------------------------------------------------
procedure TFMain.ActionFileNew(Sender: TObject);
begin
//  if not SpeichernAbfrage then Exit;
//  ActionClose(Sender);

{ TODO:  FlpTempDir := FileGetTempName('Flp');}
{  DeleteFile(FlpTempDir);
  CreateDir(FlpTempDir);
  CreateDir(FlpTempDir+'\Files');}

  LoadDefaultGenSettings;

  with TFFlightLogs.Create(Application) do
  try
    ButtonNewClick(Sender);
    ShowModal;
  finally
    Release;
  end;
//  UpdateButtonState;
//  CreateSButtons;

{  with TFSettings.Create(Application) do
  try
    NewFlightLog;
  finally
    Release;
  end;}

//  UpdateButtonState;
//  CreateSButtons;
end;

// ----------------------------------------------------------------
// Set button state
// ----------------------------------------------------------------
procedure TFMain.UpdateButtonState;
var State, GridAssigned: Boolean;
begin
{  State := False;
  if FlWindow.Count >0 then
  if Assigned(TFGrid(FlWindow[ActiveFlWindow])) then
    if (GridActiveChild.Data['Dat',1] <> '') then
      State := True;
 }
  { Undo }
//  ActionFlightDeleteUndo.Enabled := False;
{  if State then
  begin
    if length(GridActiveChild.Undo) > 0 then
      if GridActiveChild.Undo[1] <> '' then
        ActionFlightDeleteUndo.Enabled := True;
  end;}

  { Enable when data available }
{  ActionFlightEdit.Enabled := State;
  ActionFlightInsert.Enabled := State;
  ActionFlightDelete.Enabled := State;
  ActionPrint.Enabled := State;
  ActionExportGoogleMap.Enabled := State;
  ActionExportGoogleEarth.Enabled := State;}

{  if Assigned(TFGrid(ActiveMDIChild)) then
  begin
    GridActiveChild.PUFlightEdit.Enabled := State;
    GridActiveChild.PUFlugEinfuegen.Enabled := State;
    GridActiveChild.PUFlugloeschen.Enabled := State;
    GridActiveChild.PUKategorieZuordnen.Enabled := State;

    ActionFlightEdit.Enabled := FInput.CanEdit(State);
    GridActiveChild.PUFlightEdit.Enabled := FInput.CanEdit(State);
  end;
}
  { Enable when flight log available }
{  GridAssigned := Assigned(TFGrid(ActiveMDIChild));
  AFileSave.Enabled := GridAssigned;
  ActionFileSaveAs.Enabled := GridAssigned;
  ActionFileImport.Enabled := GridAssigned;
  ActionFileExport.Enabled := GridAssigned;
  ActionFlightNew.Enabled := GridAssigned;
  ActionSettings.Enabled := GridAssigned;
  ActionScheduler.Enabled := GridAssigned;
  ActionFlightLogs.Enabled := GridAssigned;
  ActionClose.Enabled := GridAssigned;

  ActionScheduler.Enabled := GridAssigned;
  ActionNinetyDays.Enabled := GridAssigned;
  ActionStatistic.Enabled := GridAssigned;
  ActionLicense.Enabled := GridAssigned;
  ActionTrainBaro.Enabled := GridAssigned;
  ActionAirports.Enabled := GridAssigned;
  ActionSortFlights.Enabled := GridAssigned;
  ActionResetColumns.Enabled := GridAssigned;

  UpdateScheduleGrid;
}end;

// ----------------------------------------------------------------
// Form close
// ----------------------------------------------------------------
procedure TFMain.FormClose(Sender: TObject; var AFileNew: TCloseAction);
begin
  AFileNew := caNone;
  ActionExit(self);
end;

// ----------------------------------------------------------------
// Exit, write ini-MiFile
// ----------------------------------------------------------------
procedure TFMain.ActionExit(Sender: TObject);
var
  IniFile: TIniFile;
begin
  if FlWindow.Count = 0 then
    Application.Terminate
  else
    if SpeichernAbfrage then
      Application.Terminate
    else
      Exit;

{ TODO:  DelTree(FlpTempDir); }

  Inifile := Tinifile.create(GetActualDir(false)+'\FluPP.Ini');
{  Inifile.WriteString('LastFife', '1', LF1.Caption);
  Inifile.WriteString('LastFife', '2', LF2.Caption);
  Inifile.WriteString('LastFife', '3', LF3.Caption);
  Inifile.WriteString('LastFife', '4', LF4.Caption);
  Inifile.WriteString('LastFife', '5', LF5.Caption);}
  Inifile.WriteBool('General', 'WMaximized', WindowState = wsMaximized);
  if not (WindowState = wsMaximized) then
  begin
    Inifile.WriteInteger('General','Height',Height);
    Inifile.WriteInteger('General','Width',Width);
  end;
  Inifile.Free;

  GenSettings.Free;
  Medicals.Free;
  Schedules.Free;
  SchedValidity.Free;
  AirportData.Free;
end;

procedure TFMain.ASettingsExecute(Sender: TObject);
begin

end;

// ----------------------------------------------------------------
// Closes all flight logs
// ----------------------------------------------------------------
procedure TFMain.ActionClose(Sender: TObject);
var
  i: Integer;
begin
  if (Sender <> AFileNew) then
    if not SpeichernAbfrage then Exit;

//  if FlWindow.Count > 0 then
//  for i:= FlWindow.Count - 1 downto 0 do
//    GridChild(i).Free;

{ TODO:  DelTree(FlpTempDir);}

  GenSettings.Clear;
  Medicals.Clear;
  Schedules.Clear;
  GridSched.Clear;
  SchedValidity.Clear;
//  GridSched.Visible := False;

  DataChanged := False;
{  StatusBar1.Panels[0].Text := '';
  StatusBar1.Panels[2].Text := '';
  StatusBar1.Panels[3].Text := '';}
  FluFileName := '';
  UpdateButtonState;
end;

// ----------------------------------------------------------------
// Opens a MiFile from LastFife
// ----------------------------------------------------------------
procedure TFMain.LastFifeClick(Sender: TObject);
begin
 if not SpeichernAbfrage then Exit;
 ActionClose(Self);
 FluFileName := TAction(Sender).Caption;
 LoadFluFile;
end;

// ----------------------------------------------------------------
// Add "MiFile" to LastFife
// ----------------------------------------------------------------
procedure TFMain.LastFife(FileName: String);
var
  i,j: Word;
  SLastFife: Array[0..4] of String;
  Found: Boolean;
begin
  //is MiFile already in list -> move to 1st position
{  found := False;
  SLastFife[0] := LF1.Caption;
  SLastFife[1] := LF2.Caption;
  SLastFife[2] := LF3.Caption;
  SLastFife[3] := LF4.Caption;
  SLastFife[4] := LF5.Caption;
  i := 0;
  while (not found) and (i < 5) do
  begin
    if FileName = SLastFife[i] then
    begin
      if i > 0 then for j := i downto 1 do
      begin
        SLastFife[j] := SLastFife[j-1];
      end;
      SLastFife[0] := FileName;
      Found := True;
    end;
    inc(i);
  end;
  //Not in list yet
  if not found then
  begin
    for i := 3 downto 0 do SLastFife[i+1] := SLastFife[i];
    SLastFife[0] := FileName;
  end;

  //Hide empty entries
  LF1.Caption := SLastFife[0];
  LF2.Caption := SLastFife[1];
  LF3.Caption := SLastFife[2];
  LF4.Caption := SLastFife[3];
  LF5.Caption := SLastFife[4];

  LF1.visible := LF1.Caption <> '';
  LF2.visible := LF2.Caption <> '';
  LF3.visible := LF3.Caption <> '';
  LF4.visible := LF4.Caption <> '';
  LF5.visible := LF5.Caption <> '';
}end;

// ----------------------------------------------------------------
// Insert data
// ----------------------------------------------------------------
procedure TFMain.InsertData;
begin
  GridActiveChild.ReCalcGridTime;
  GridActiveChild.ReCalcGridNr;
  UpdateButtonState;
  UpdateSButtons;
end;

// ----------------------------------------------------------------
// Open flightlog
// ----------------------------------------------------------------
procedure TFMain.ActionFileOpen(Sender: TObject);
begin
  ActionClose(Self);
//  OpenDialog.Filter := _('FluPP File')+' (*.flu)'+'|*.flu'+'|';
//  if not OpenDialog.Execute then Exit;
//  FluFileName := OpenDialog.FileName;
  FluFileName := '/home/momme/Daten/Programming/Delphi/FluPP/flightlog.flu';
  LoadFluFile;
end;

// ----------------------------------------------------------------
// Read data from flightlog
// ----------------------------------------------------------------
procedure TFMain.LoadFluFile;
var IGCDir, TempFileName: String;
    XMLDoc: TXMLDocument;
    i : Word;
begin
  if not FileExists(FluFileName) then
  begin
    MessageDlg(format(_('File ''%s'' does not exist'), [FluFileName]), mtWarning, [mbOK], 0);
    Exit;
  end;

//  LastFife(FluFileName);
  DataChanged := False;
{  StatusBar1.Panels[2].Text := '';
  Statusbar1.Panels[3].Text := FluFileName;
}
  GenSettings.Clear;
  Medicals.Clear;
  Schedules.Clear;
  SchedValidity.Clear;
  LoadDefaultGenSettings;

{  FlpTempDir := FileGetTempName('Flu');
  DeleteFile(FlpTempDir);
  CreateDir(FlpTempDir);
  CreateDir(FlpTempDir+'\Files');
  TempFileName := FlpTempDir+'\flightlog.xml';}

{  try
    ProgressBar := TProgressBar.Create(FMain);
    ProgressBar.Parent := StatusBar1;
    ProgressBar.Top := 2;
    ProgressBar.Width := StatusBar1.Panels.Items[0].Width;
    ProgressBar.Height := StatusBar1.Height - 2;
    StatusBar1.Repaint;
    Screen.Cursor := crHourGlass;
    try
      JvZlib.DecompressFile(FluFileName,FlpTempDir,True);
    except
      on E: Exception do
      begin
        CopyFile(pChar(FluFileName), pChar(TempFileName), False);
        IGCDir := copy(FluFileName, 1, length(FluFileName)-length(ExtractFileExt(FluFileName)));
        if DirectoryExists(IGCDir) then
          ShellCopyFile(IGCDir+'\*.*', FlpTempDir+'\Files', False);
        OpenOldFile4;
        Exit;
      end;
    end;
  finally
    ProgressBar.Free;
    Screen.Cursor := crDefault;
    StatusBar1.Repaint;
  end;}

  XMLDoc := TXMLDocument.Create;
  with XMLDoc do try
    try
       ReadXMLFile(XMLDoc, FluFileName);
    except
      on E: Exception do begin
        OpenOldFile5;
        Exit;
      end;
    end;

    if ((XMLDoc.DocumentElement.NodeName = 'FluPP')) and
      (assigned(XMLDoc.DocumentElement.Attributes.GetNamedItem('Version'))) then begin
      case StrToInt(XMLDoc.DocumentElement.Attributes.GetNamedItem('Version').NodeValue) of
        1 : OpenFluFile1(XMLDoc);
      end;
    end;

    if (XMLDoc.DocumentElement.NodeName = 'FliPS') then
      OpenFlpFile7(XMLDoc);

  finally
    XMLDoc.Free;
  end;

  if FlWindow.Count > 0 then
  for i := 0 to FlWindow.Count-1 do
  begin
    GridChild(i).ReCalcGridNr;
    GridChild(i).Grid.FixedCols := 1;
    GridChild(i).Grid.Row := GridChild(i).Grid.RowCount-1;
    GridChild(i).Grid.ColCount := GridChild(i).GridCols.Count;
    GridChild(i).NameCols;
  end;

{TODO:  MDIChildren[FlWindow.Count-1].show; }
//  GridActiveChild.ReCalcGridTime;

//  UpdateButtonState;
//  CreateSButtons;
end;

// ----------------------------------------------------------------
// Save changes
// ----------------------------------------------------------------
function TFMain.SpeichernAbfrage: Boolean;
var
  answer: Integer;
begin
  result := true;
  answer := mrNo;

  if DataChanged then
    answer := MessageDlg(format(_('Do you want to save the file ''%s''?'),
      [extractFilename(FluFileName)]),mtConfirmation,[mbYes,mbNo,mbCancel],0);

  if answer = mrYes then ActionFileSave(self);
  if answer = mrCancel then result := false;
end;

// ----------------------------------------------------------------
// Save
// ----------------------------------------------------------------
procedure TFMain.ActionFileSave(Sender: TObject);
begin
  if FluFileName = '' then
  begin
    SaveDialog.Filter := _('FluPP File')+' (*.flu)'+'|*.flu';
    if not SaveDialog.Execute then Exit;
    SaveFile(SaveDialog.FileName);
    FluFileName := SaveDialog.FileName;
    LastFife(FluFileName);
    Statusbar1.Panels[3].Text := FluFileName;
  end
  else SaveFile(FluFileName)
end;

// ----------------------------------------------------------------
// Save as
// ----------------------------------------------------------------
procedure TFMain.ActionFileSaveAs(Sender: TObject);
begin
  SaveDialog.Filter := _('FluPP File')+' (*.flu)'+'|*.flu';
  if not SaveDialog.Execute then Exit;

  SaveFile(SaveDialog.FileName);

  FluFileName := SaveDialog.FileName;
  LastFife(FluFileName);

  Statusbar1.Panels[3].Text := FluFileName;
end;

// ----------------------------------------------------------------
// Write data
// ----------------------------------------------------------------
procedure TFMain.SaveFile(SaveFileName: String);
begin
  SaveFluFile(SaveFileName);

  DataChanged := False;
  StatusBar1.Panels[2].Text := '';

  UpdateButtonState;
end;

// ----------------------------------------------------------------
// Export
// ----------------------------------------------------------------
procedure TFMain.ActionFileExport(Sender: TObject);
begin
  SaveDialog.Filter := _('Comma-Separated Variables')+' (*.csv)'+'|*.csv';
  if not SaveDialog.Execute then exit;
  ExportCSV(SaveDialog.FileName);
end;

// ----------------------------------------------------------------
// View flight in GoogleMaps
// ----------------------------------------------------------------
procedure TFMain.ActionExportGoogleMapExecute(Sender: TObject);
begin
  ExportGoogleMap;
end;

// ----------------------------------------------------------------
// Export KMl MiFile
// ----------------------------------------------------------------
procedure TFMain.ActionExportGoogleEarthExecute(Sender: TObject);
begin
  ExportGoogleEarth;
end;

// ----------------------------------------------------------------
// Info Dialog
// ----------------------------------------------------------------
procedure TFMain.InfoClick(Sender: TObject);
begin
{  with TFInfo.Create(Application) do
  try
    ShowModal;
  finally
    Release;
  end;}
end;

procedure TFMain.MenuItem1Click(Sender: TObject);
begin

end;

procedure TFMain.MenuItem3Click(Sender: TObject);
begin

end;

// ----------------------------------------------------------------
// Settings
// ----------------------------------------------------------------
procedure TFMain.ActionSettings(Sender: TObject);
var LastFile : string;
begin
{  with TFSettings.Create(Application) do
  try
    TabSheetGeneral.TabVisible := True;
    TabSheetLicenses.TabVisible := True;
    TabSheetMedicals.TabVisible := True;
    TabSheetAutoComplete.TabVisible := True;
    TabSheetCat.TabVisible := True;
    ButtonNext.Visible := False;
    ButtonOK.Enabled := True;
    ButtonExit.Visible := True;

    ShowModal;
  finally
    Release;
  end; }
end;

// ----------------------------------------------------------------
// Basic settings
// ----------------------------------------------------------------
procedure TFMain.ActionBasicSettings(Sender: TObject);
begin
  with TFBasicSettings.Create(Application) do
  try
    ShowModal;
  finally
    Release;
  end;
end;

// ----------------------------------------------------------------
// Sheduler
// ----------------------------------------------------------------
procedure TFMain.SchedulerClick(Sender: TObject);
begin
{  with TFCalendar.Create(Application) do try
    ShowModal;
  finally
    Release;
  end;
  UpdateScheduleGrid;    }
end;

// ----------------------------------------------------------------
// 90 day regulation
// ----------------------------------------------------------------
procedure TFMain.MMNinetyDaysClick(Sender: TObject);
begin
{  with TFNinetyDays.Create(Application) do try
    ShowModal;
  finally
    Release;
  end;    }
end;

// ----------------------------------------------------------------
// Statistics
// ----------------------------------------------------------------
procedure TFMain.MMStatisticsClick(Sender: TObject);
begin
{  with TFStatistics.Create(Application) do
  try
    ShowModal;
  finally
    Release;
  end;
end;

// ----------------------------------------------------------------
// Training barometer
// ----------------------------------------------------------------
procedure TFMain.MMTrainBaroClick(Sender: TObject);
begin
  with TFTrainBaro.Create(Application) do
  try
    ShowModal;
  finally
    Release;
  end;}
end;

// ----------------------------------------------------------------
// Licenses
// ----------------------------------------------------------------
procedure TFMain.LicenseClick(Sender: TObject);
begin
{  with TFLicenses.Create(Application) do
  try
    ShowModal;
  finally
    Release;
  end;}
end;

// ----------------------------------------------------------------
// Printing
// ----------------------------------------------------------------
procedure TFMain.ActionPrint(Sender: TObject);
begin
{  with TFPrint.Create(Application) do
  try
    ShowModal;
  finally
    Release;
  end;}
end;

// ----------------------------------------------------------------
// Manage flight logs
// ----------------------------------------------------------------
procedure TFMain.ActionFlightLogs(Sender: TObject);
begin
  with TFFlightLogs.Create(Application) do
  try
    ShowModal;
  finally
    Release;
  end;
  UpdateButtonState;
  CreateSButtons;
end;

// ----------------------------------------------------------------
// Airports
// ----------------------------------------------------------------
procedure TFMain.AirportsClick(Sender: TObject);
begin
{  with TFAirports.Create(Application) do
  try
    PanelFindEingabe.Visible := False;
    ShowModal;
  finally
    Release;
  end;}
end;

// ----------------------------------------------------------------
// sort all flights
// ----------------------------------------------------------------
procedure TFMain.SortAllFlightsClick(Sender: TObject);
begin
{ TODO: sort}
{  SortGridByCols([GridActiveChild.GridCols.IndexOf('Dat'),GridActiveChild.GridCols.IndexOf('StB'),GridActiveChild.GridCols.IndexOf('StT')], GridActiveChild.Grid);
  GridActiveChild.ReCalcGridNr;
}end;

procedure TFMain.MMTrainBaroClick(Sender: TObject);
begin

end;

// ----------------------------------------------------------------
// Edit flight
// ----------------------------------------------------------------
procedure TFMain.FlightEdit(Sender: TObject);
begin
  FInput.Change(GridActiveChild.Grid.Row);
end;

// ----------------------------------------------------------------
// New flight
// ----------------------------------------------------------------
procedure TFMain.ActionFlightNew(Sender: TObject);
begin
  if GridActiveChild.Grid.Cells[0,1] = '' then
    FInput.Neu(1)
  else
  begin
    GridActiveChild.Grid.InsertColRow(False, GridActiveChild.Grid.RowCount);
    FInput.Neu(GridActiveChild.Grid.RowCount-1);
  end;
end;

// ----------------------------------------------------------------
// Insert flight
// ----------------------------------------------------------------
procedure TFMain.FlightInsert(Sender: TObject);
begin
  GridActiveChild.Grid.InsertColRow(False, GridActiveChild.Grid.Row);
  FInput.Neu(GridActiveChild.Grid.Row);
  GridActiveChild.ReCalcGridNr;
end;

// ----------------------------------------------------------------
// Delete flight
// ----------------------------------------------------------------
procedure TFMain.FlightDelete(Sender: TObject);
begin
  GridActiveChild.PUFlugloeschenClick(Self);
end;

// ----------------------------------------------------------------
// Undo delete flight
// ----------------------------------------------------------------
procedure TFMain.FlightDeleteUndo(Sender: TObject);
begin
  GridActiveChild.PUloeschrueckClick(Self);
end;

// ----------------------------------------------------------------
// Create SButtons
// ----------------------------------------------------------------
procedure TFMain.CreateSButtons;
var
  i: Word;
begin
  for i:= 0 to FlWindow.Count -1 do
  begin
    if not Assigned(GridChild(i).SButton) then
    begin
      GridChild(i).SButton := TFSButton.create(GridChild(i)); //
      GridChild(i).SButton.Parent := PanelSButtons;

      GridChild(i).SButton.Top := 2;
      GridChild(i).SButton.Width := 94;
      GridChild(i).SButton.Height := 50;

      GridChild(i).SButton.PanelSB.ControlStyle := ControlStyle - [csParentBackground];
      GridChild(i).SButton.Panel90.ControlStyle := ControlStyle - [csParentBackground];
      GridChild(i).SButton.PanelT.ControlStyle  := ControlStyle - [csParentBackground];

      TranslateComponent(GridChild(i).SButton);
    end;
    GridChild(i).SButton.Left := i*94+2;
    GridChild(i).SButton.LabelHeading.Caption := GridChild(i).Name;
    UpdateSButtons;
  end;
  if FlWindow.Count > 0 then PanelSButtons.width := FlWindow.Count*94+4;
  UpdateSButtons;
end;

// ----------------------------------------------------------------
// SButton CheckSButton
// ----------------------------------------------------------------
procedure TFMain.UpdateSButtons;
var
  FlightTime: String;
  TotalPoints : Real;
  Flights, GridIdx, Row: Word;
begin
  for GridIdx := 0 to FlWindow.Count -1 do
    if Assigned(GridChild(GridIdx).SButton) then
      with GridChild(GridIdx).SButton do
      begin
        FlightTime := '00:00';;
        Flights := 0;

        if (GridChild(GridIdx).Data['Dat',1] = '') then
          Continue;

        { 90 days }
        for Row := 1 to GridChild(GridIdx).Grid.RowCount -1 do
          if StrToDate(GridChild(GridIdx).Data['Dat',Row]) >= now -90 then
            inc(Flights,StrtoInt(GridChild(GridIdx).Data['NoL',Row]));
        if Flights >= 3 then
          Panel90.Color := clFGreen
        else
          Panel90.Color := clFRed;
        Panel90.Hint := format(_('90 Day Regulation')+': '+#13+
          _('In the last 90 days you have %s flights'),[InttoStr(Flights)]);

        { TrainBaro }
        Flights := 0;
        for Row := GridChild(GridIdx).Grid.RowCount-1 downto 1 do
        begin
          if StrToDate(GridChild(GridIdx).Grid.Cells[1,Row]) >= IncMonth(Now,-6) then
          begin
            inc(Flights,StrToInt(GridChild(GridIdx).Data['NoL',Row]));

            FlightTime := CalcTime(GridIdx,FlightTime,Row,Row);
          end;
        end;
        TotalPoints := ((Flights/30)+(TimeToExact(FlightTime))/45)/2;
        if TotalPoints < 1/3 then
        begin
          PanelT.Color := clFRed;
          PanelT.Hint := _('Training Barometer')+': '+#13+
            _('Red Area')+' - '+_('Exercise is necessary - Flying can be risky.');
        end;
        if (TotalPoints >= 1/3) and (TotalPoints < 2/3) then
        begin
          PanelT.Color := clFYellow;
          PanelT.Hint := _('Training Barometer')+': '+#13+
            _('Yellow Area')+' - '+_('More exercise helpful - Unexpected events could be dangerous');
        end;
        if TotalPoints >= 2/3 then
        begin
          PanelT.Color := clFGreen;
          PanelT.Hint := _('Training Barometer')+': '+#13+
            _('Green Area')+' - '+_('The level of exercise is good - but stay cautious!');
        end;
      end;
end;

// ----------------------------------------------------------------
// Load schedules
// ----------------------------------------------------------------
procedure TFMain.UpdateScheduleGrid;
{----------}
  procedure LoadSchedule(Schedule: TSTrings);
  var i: Word;
  begin
    if Schedule.Count > 0 then
      for i := 0 to Schedule.Count-1 do
        if isDate(Schedule.ValueFromIndex[i]) then
        begin
          if GridSched.Cells[0,0] <> '' then
             GridSched.RowCount := GridSched.RowCount + 1;
           GridSched.Cells[0,GridSched.RowCount-1] := Schedule.ValueFromIndex[i];
           GridSched.Cells[1,GridSched.RowCount-1] := Schedule.Names[i];
        end;
  end;
{----------}
var
  GridIdx: Integer;
begin
  if FlWindow.Count = 0 then Exit;
  GridSched.RowCount := 1;
  GridSched.Clear;

{  with TFLicenses.Create(Application) do
  try
    FillVST;
  finally
    Release;
  end;}

  { Load Schedules }
{  LoadSchedule(Schedules);
  for GridIdx := 0 to FlWindow.Count-1 do begin
    LoadSchedule(GridChild(GridIdx).LicenseDates);
    LoadSchedule(GridChild(GridIdx).Events);
  end;
  LoadSchedule(Medicals);
  LoadSchedule(SchedValidity);

  if GridSched.Cells[0,0] = '' then
    GridSched.Visible := False
  else
  begin
    GridSched.Visible := True;
    SortGridByCols([0], GridSched);
  end;                        }
end;

// ----------------------------------------------------------------
// Draw schedule grid
// ----------------------------------------------------------------
procedure TFMain.GridSchedDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  Rect.Top := Rect.Top -1 ;
  with TStringGrid(Sender) do
  begin
    Canvas.Font := Font;
    Canvas.Brush.Color := clBtnFace;
    if GridSched.Cells[0,ARow] <> '' then
    begin
      if MonthsBetween(now, StrToDate(Cells[0, ARow])) <  StrToInt(GenSettings.Values['WarningMonth']) then
        Canvas.Brush.Color := clFYellow;
      if now >= StrToDate(Cells[0, ARow]) then
        Canvas.Brush.Color := clFRed;
    end;
    Canvas.FillRect(Rect);
//    DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), StrLen(PChar(Cells[ACol, ARow])), Rect,DT_LEFT);
  end;
end;

// ----------------------------------------------------------------
// JvZlib ProgressBar
// ----------------------------------------------------------------
procedure TFMain.JvZlibProgress(Sender: TObject; Position, Total: Integer);
begin
  if Assigned(ProgressBar) then
  begin
    ProgressBar.Max := Total;
    ProgressBar.Position := Position;
  end;
end;

// ----------------------------------------------------------------
// Links to HP
// ----------------------------------------------------------------
procedure TFMain.ActionHPExecute(Sender: TObject);
begin
//  ShellExecute(Application.Handle,'open',FluPPDomain,nil,nil,SW_NORMAL);
end;

procedure TFMain.ActionHPAirportsExecute(Sender: TObject);
begin
//  ShellExecute(Application.Handle,'open',PAnsiChar(FluPPDomain+'/airports/'+StrToHTML(GetFileVersion(ParamStr(0)))),nil,nil,SW_NORMAL);
end;

procedure TFMain.ActionHPLicensesExecute(Sender: TObject);
begin
//  ShellExecute(Application.Handle,'open',PAnsiChar(FluPPDomain+'/licenses/'+StrToHTML(GetFileVersion(ParamStr(0)))),nil,nil,SW_NORMAL);
end;

procedure TFMain.ActionHPLanguagesExecute(Sender: TObject);
begin
//  ShellExecute(Application.Handle,'open',PAnsiChar(FluPPDomain+'/languages/'+StrToHTML(GetFileVersion(ParamStr(0)))),nil,nil,SW_NORMAL);
end;

procedure TFMain.ActionHPRFEExecute(Sender: TObject);
begin
//  ShellExecute(Application.Handle,'open',PAnsiChar(FluPPDomain+'/request/'+StrToHTML(GetFileVersion(ParamStr(0)))),nil,nil,SW_NORMAL);
end;

procedure TFMain.ActionHPBugsExecute(Sender: TObject);
begin
//  ShellExecute(Application.Handle,'open',PAnsiChar(FluPPDomain+'/bug/'+StrToHTML(GetFileVersion(ParamStr(0)))),nil,nil,SW_NORMAL);
end;

procedure TFMain.ActionHPSupportExecute(Sender: TObject);
begin
//  ShellExecute(Application.Handle,'open',PAnsiChar(FluPPDomain+'/support/'+StrToHTML(GetFileVersion(ParamStr(0)))),nil,nil,SW_NORMAL);
end;

procedure TFMain.ActionResetColumnsExecute(Sender: TObject);
begin
{  if ActionResetColumns.Checked then
    ActionResetColumns.Checked := false
  else begin
    MessageDlg('Please save your flightlog and restart FliPS so that'+#13+#10+'restoring of default column values can take place.', mtInformation, [mbOK], 0);
    ActionResetColumns.Checked := true;
  end;
}end;

procedure TFMain.ActionFileImportExecute(Sender: TObject);
begin
  OpenDialog.Filter := _('Comma-Separated Variables')+' (*.csv)'+'|*.csv';
  if not OpenDialog.Execute then Exit;
  ImportCSV(OpenDialog.FileName);
  InsertData;
end;

procedure TFMain.TIPropertyGrid1Click(Sender: TObject);
begin

end;

procedure TFMain.ToolButton5Click(Sender: TObject);
begin

end;


initialization
  {$i Main.lrs}

end.
