{TODO: Weather (setzen von ItemIndex bei vorhandenem Wetter) }
{TODO: ACEventCat - waiting for field-name (in file) in FluPS }

unit Input;

{$MODE Delphi}

interface

uses
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MaskEdit, ExtCtrls, Buttons, ComCtrls, Spin, CheckLst,
  Grids, LResources, EditBtn;

type

  { TFInput }
  TFInput = class(TForm)
    DTPDate: TDateEdit;
    EditLandings: TSpinEdit;
    EditPassengers: TSpinEdit;
    Label6: TLabel;
    Panel1: TPanel;
    ButtonCancel: TBitBtn;
    ButtonOK: TBitBtn;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Label1: TLabel;
    LabelFlugNr: TLabel;
    ButtonNext: TBitBtn;
    TabControl: TPageControl;
    TIMaskEdit1: TMaskEdit;
    TSFlugdaten: TTabSheet;
    TSStreckenflug: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    PanelStartType: TPanel;
    Label7: TLabel;
    RBW: TRadioButton;
    RBF: TRadioButton;
    RBE: TRadioButton;
    CBAircraftID: TComboBox;
    CBCoPilot: TComboBox;
    CBAircraftType: TEdit;
    LabelFlbArt: TLabel;
    CBPilot: TComboBox;
    Label25: TLabel;
    PanelCat: TPanel;
    PanelAC: TPanel;
    RBA: TRadioButton;
    RBG: TRadioButton;
    Panel2: TPanel;
    Label16: TLabel;
    ButtonFindViaOrt: TBitBtn;
    CBViaOrt: TComboBox;
    ButtonWPAdd: TBitBtn;
    ButtonWPRem: TBitBtn;
    ButtonViaUp: TBitBtn;
    ButtonViaDown: TBitBtn;
    GridVia: TStringGrid;
    TabSheet1: TTabSheet;
    Label27: TLabel;
    LabelViaDist: TLabel;
    LabelViaDistUnit: TLabel;
    LabelViaOrt: TLabel;
    Panel4: TPanel;
    Label32: TLabel;
    CLBKatTime: TCheckListBox;
    ButtonKatTimeAdd: TBitBtn;
    GridKatTime: TStringGrid;
    Panel5: TPanel;
    LBFiles: TListBox;
    ButtonFileAdd: TBitBtn;
    ButtonFileRem: TBitBtn;
    Label23: TLabel;
    Panel6: TPanel;
    Label31: TLabel;
    ButtonContestAdd: TBitBtn;
    CLBContest: TCheckListBox;
    GridContest: TStringGrid;
    Panel7: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label24: TLabel;
    LabelAvSpeed: TLabel;
    EditDistance: TEdit;
    Label26: TLabel;
    PanelFlightTime: TPanel;
    Label8: TLabel;
    Label29: TLabel;
    MEFlightTimeDep: TMaskEdit;
    PanelBlockTime: TPanel;
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    MEBlockTimeDep: TMaskEdit;
    MEBlockTimeArr: TMaskEdit;
    MEBlockTime: TMaskEdit;
    PanelFromTo: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    LabelStO: TLabel;
    LabelDist: TLabel;
    LabelLaO: TLabel;
    Label4: TLabel;
    ImageAccNotDist: TImage;
    ImageAccDist: TImage;
    ButtonFindLandeOrt: TBitBtn;
    ButtonFindStartOrt: TBitBtn;
    CBAPFrom: TComboBox;
    CBAPTo: TComboBox;
    PanelRemarks: TPanel;
    Label14: TLabel;
    EditRemarks: TEdit;
    CBStartType: TComboBox;
    TimerKennung: TTimer;
    OpenDialogFiles: TOpenDialog;
    Bevel2: TBevel;
    ButtonKatAdd: TBitBtn;
    CLBKat: TCheckListBox;
    ButtonNeuFlugzeug: TBitBtn;
    ButtonNeuPilot: TBitBtn;
    ButtonNeuBegleiter: TBitBtn;
    ButtonNeuLandeOrt: TBitBtn;
    ButtonNeuStartOrt: TBitBtn;
    Label11: TLabel;
    Label9: TLabel;
    PanelLandings: TPanel;
    Label30: TLabel;
    MEFlightTimeArr: TMaskEdit;
    Label28: TLabel;
    Label10: TLabel;
    MEFlightTime: TMaskEdit;
    TabSheet2: TTabSheet;
    Panel9: TPanel;
    TabSheet3: TTabSheet;
    Panel8: TPanel;
    Label21: TLabel;
    CurLabel1: TLabel;
    Label22: TLabel;
    CurLabel3: TLabel;
    Label34: TLabel;
    CurLabel2: TLabel;
    Label36: TLabel;
    CurLabel4: TLabel;
    CfF: TEdit;
    LaF: TEdit;
    CfC: TEdit;
    EfF: TEdit;
    CAVOK: TCheckBox;
    INTENSITY: TComboBox;
    DESCRIPTOR: TComboBox;
    PRECIPITATION: TComboBox;
    OBSCURATION1: TComboBox;
    OBSCURATION2: TComboBox;
    OTHER: TComboBox;
    CLOUDS: TComboBox;
    CLOUDBASE: TEdit;
    Label33: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Bevel1: TBevel;
    WeatherText: TMemo;
    CLOUDTYPE: TComboBox;
    OWNWEATHER: TEdit;
    Metar: TEdit;
    procedure ButtonOKClick(Sender: TObject);
    procedure METimeExit(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure CBAircraftExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonNeuFlugzeugClick(Sender: TObject);
    procedure CBMusterExit(Sender: TObject);
    procedure CBCrewExit(Sender: TObject);
    procedure ButtonNeuBegleiterClick(Sender: TObject);
    procedure ButtonNeuOrtClick(Sender: TObject);
    procedure EditDistanceExit(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
    procedure CBOrtExit(Sender: TObject);
    procedure EditPassLandingsExit(Sender: TObject);
    procedure ButtonKatAddClick(Sender: TObject);
    procedure ButtonFindOrtClick(Sender: TObject);
    procedure MEFlightTimeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonWPAddClick(Sender: TObject);
    procedure ButtonWPRemClick(Sender: TObject);
    procedure ButtonViaUpClick(Sender: TObject);
    procedure ButtonViaDownClick(Sender: TObject);
    procedure CBAircraftIDEnter(Sender: TObject);
    procedure MEFlightTimeDepKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEFlightTimeArrKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerKennungTimer(Sender: TObject);
    procedure CLBKatTimeClickCheck(Sender: TObject);
    procedure ButtonKatTimeAddClick(Sender: TObject);
    procedure onFileDrop(Sender: TObject; X, Y: Integer);
    procedure ButtonFileAddClick(Sender: TObject);
    procedure ButtonFileRemClick(Sender: TObject);
    procedure LBFilesDblClick(Sender: TObject);
    procedure CLBContestClickCheck(Sender: TObject);
    procedure ButtonContestAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NoRowSelect(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridGetCellAlignment(Sender: TStringGrid; AColumn,
      ARow: Integer; State: TGridDrawState; var CellAlignment: TAlignment);
    procedure MEBlockTimeDepKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEBlockTimeArrKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DTPDateExit(Sender: TObject);
    procedure CfFDblClick(Sender: TObject);
    procedure CAVOKClick(Sender: TObject);
    procedure WeatherChange(Sender: TObject);
  private
    PDefaultTime, PDefaultStartTime: ^TMaskEdit;
    procedure onHint(Sender: TObject);
    procedure InsertAutoComplete;
    procedure ResetInput;
    procedure CheckPanelVis;
    procedure SaveData;
    procedure ClearGrids;
    procedure CalcViaDist;
    procedure CalcAvSpeed;
    procedure RenumberVia;
    procedure CheckCustomDist;
    procedure AddFiles(Files: TStrings);
    procedure UpdateWeather(Sender: TObject);
    procedure FillDataFromIgcFile(FileName: String);
    procedure CopyFiles(FileQueue: TStrings);
  public
    { Public-Deklarationen }
    procedure Neu(FlugNr: Word);
    procedure Change(FlugNr: Word);
    function CheckComplete: Boolean;
    function CanEdit(Default : Boolean) : Boolean;
  end;

var
  FInput: TFInput;
  Status: String;
  PrevDist: Word;
  InputRow: Word;
  FileQueue: TSTrings;

implementation

uses Main, Grid, Airports, InputBox, Tools, ToolsShell, ToolsGrid, ToolsIGCParse;


// ----------------------------------------------------------------
// Form create
// ----------------------------------------------------------------
procedure TFInput.FormCreate(Sender: TObject);
begin
 // TranslateComponent(Self);
  FileQueue := TStringList.Create;
  GridContest.Selection := DeSelectRect;
  GridKatTime.Selection := DeSelectRect;
end;

// ----------------------------------------------------------------
// Form destroy
// ----------------------------------------------------------------
procedure TFInput.FormDestroy(Sender: TObject);
begin
  FileQueue.Free;
end;

// ----------------------------------------------------------------
// Form show
// ----------------------------------------------------------------
procedure TFInput.UpdateWeather(Sender: TObject);
begin
  CAVOK.Checked := false;

  INTENSITY.ItemIndex := 0;
  DESCRIPTOR.ItemIndex := 0;
  PRECIPITATION.ItemIndex := 0;
  OBSCURATION1.ItemIndex := 0;
  OBSCURATION2.ItemIndex := 0;
  OTHER.ItemIndex := 0;
  CLOUDS.ItemIndex := 0;
  CLOUDTYPE.ItemIndex := 0;

  CLOUDBASE.Text := '';
  OWNWEATHER.Text := FlWindow.GetActive.data['Met',InputRow];
  OWNWEATHER.Text := Copy(OWNWEATHER.Text, 1, Length(OWNWEATHER.Text)-1);

  WeatherChange(Sender);
end;

procedure TFInput.FormShow(Sender: TObject);
begin
  Application.OnHint := onHint;
  Label18.caption := FlWindow.GetActive.Settings.Values['DistUnit'];
  LabelViaDistUnit.caption := FlWindow.GetActive.Settings.Values['DistUnit'];

  { Via }
  GridVia.ColWidths[0] := 30;
  GridVia.ColWidths[1] := 56;
  GridVia.ColWidths[2] := 56;
  GridVia.Cells[0,0]  := _('Nr.');
  GridVia.Cells[1,0]  := _('Airport');
  GridVia.Cells[2,0]  := _('Distance');

  GridKatTime.ColWidths[0] := -1;
  GridKatTime.ColWidths[1] := 90;
  GridKatTime.ColWidths[2] := 60;
  GridKatTime.Cells[1,0]  := _('Category');
  GridKatTime.Cells[2,0]  := _('Time');

  GridContest.ColWidths[0] := -1;
  GridContest.ColWidths[1] := 80;
  GridContest.ColWidths[2] := 45;
  GridContest.ColWidths[3] := 45;
  GridContest.Cells[1,0]  := _('Category');
  GridContest.Cells[2,0]  := _('Distance');
  GridContest.Cells[3,0]  := _('Points');

  { Currency }
  CurLabel1.Caption := GenSettings.Values['Currency'];
  CurLabel2.Caption := GenSettings.Values['Currency'];
  CurLabel3.Caption := GenSettings.Values['Currency'];
  CurLabel4.Caption := GenSettings.Values['Currency'];

  { Weather }
  UpdateWeather(Sender);
end;

// ----------------------------------------------------------------
// onHint
// ----------------------------------------------------------------
procedure TFInput.onHint(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := GetLongHint(Application.Hint);
end;

// ----------------------------------------------------------------
// form close
// ----------------------------------------------------------------
procedure TFInput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnHint := FMain.onHint;
  if FlWindow.GetActive.Grid.RowCount > 2 then
  begin
    if (Status = 'Neu') and (ModalResult = mrCancel) then FlWindow.GetActive.Grid.DeleteColRow(False,InputRow);
    FlWindow.GetActive.ReCalcGridNr;
  end;
end;

// ----------------------------------------------------------------
// fill Drop-Down lists
// ----------------------------------------------------------------
procedure TFInput.InsertAutoComplete;
begin
  AssignNames(FlWindow.GetActive.ACAircrafts, CBAircraftID.Items);
  CBCoPilot.Items.Assign(FlWindow.GetActive.ACPilots);
  CBPilot.Items.Assign(FlWindow.GetActive.ACPilots);
  CBAPFrom.Items.Assign(FlWindow.GetActive.ACAirports);
  CBAPTo.Items.Assign(FlWindow.GetActive.ACAirports);
end;

// ----------------------------------------------------------------
// Initialize Form for next entry
// ----------------------------------------------------------------
procedure TFInput.ResetInput;
begin
  if FlWindow.GetActive.Settings.Values['DefaultTime'] = '0' then
  begin
    PDefaultTime := @MEBlockTime;
    PDefaultStartTime := @MEBlockTimeDep;
  end
  else
  begin
    PDefaultTime := @MEFlightTime;
    PDefaultStartTime := @MEFlightTimeDep;
  end;

  CheckPanelVis;
  FileQueue.Clear;
//  DTPDate.Color := clWindow;
  MEFlightTimeDep.Text := '';
  MEFlightTimeArr.Text := '';
  MEBlockTimeDep.Text := '';
  MEBlockTimeArr.Text := '';
  MEFlightTime.Text := '00:00';
  MEBlockTime.Text := '00:00';
  EditLandings.Value := 1;
  EditPassengers.Value := 0;
  EditRemarks.Text := '';
  EditDistance.text := '';
  LabelAvSpeed.caption := '0 '+GetSpeedUnit(FlWindow.GetActive.Settings.Values['DistUnit']);
  CBAircraftID.Items.Clear;
  CBpilot.Items.Clear;
  CBCoPilot.Items.Clear;
  CBAPFrom.Items.Clear;
  CBAPTo.Items.Clear;
  LBFiles.Clear;
  ClearGrids;
  ButtonOK.Default := False;
  ButtonNext.Default := True;
  ButtonNeuFlugzeug.Visible := False;
  ButtonNeuBegleiter.Visible := False;
  ButtonNeuPilot.Visible := False;
  ButtonNeuStartOrt.visible := False;
  ButtonNeuLandeOrt.visible := False;
  ImageAccNotDist.visible := False;
  ImageAccDist.visible := True;

  InsertAutoComplete;
//  if Active then ActiveControl := DTPDate;

  CBAPFrom.Text := CBAPTo.Text;
  CBAPTo.Text := '';
  CBortExit(CBAPFrom);
end;

// ----------------------------------------------------------------
// control visible panels
// ----------------------------------------------------------------
procedure TFInput.CheckPanelVis;
var
  PanelPos: Word;
{-------------}
  procedure AddPanelRow(Panel: TPanel; NewRow: Boolean = True);
  begin
    Panel.Top := PanelPos;
    if (Panel.Visible) and (NewRow) then
      inc(PanelPos,Panel.Height-2);
  end;
{-------------}
begin
  PanelFlightTime.Visible := StrToBool(FlWindow.GetActive.Settings.Values['ShowFlightTime']);
  PanelBlockTime.Visible := StrToBool(FlWindow.GetActive.Settings.Values['ShowBlockTime']);
  PanelStartType.Visible := StrToBool(FlWindow.GetActive.Settings.Values['ShowStartType']);

  if (not PanelFlightTime.Visible) or (not PanelBlockTime.Visible) then
    PanelLandings.Height := PanelFlightTime.Height
  else
    PanelLandings.Height := PanelFlightTime.Height + PanelBlockTime.Height-2;
  //PanelPos := BevelPilot.Top + BevelPilot.Height -2;
  AddPanelRow(PanelFlightTime);
  AddPanelRow(PanelBlockTime);
  AddPanelRow(PanelFromTo);
  AddPanelRow(PanelStartType);
  AddPanelRow(PanelRemarks);
  AddPanelRow(PanelCat, False);
  AddPanelRow(PanelAC);
end;

// ----------------------------------------------------------------
// New flight
// ----------------------------------------------------------------
procedure TFInput.Neu(FlugNr: Word);
begin
  ResetInput;
  InputRow := FlugNr;
  Status := 'Neu';
  caption := _('Create new flight');
  if FlWindow.GetActive.Data['Num',1] <> '' then
  begin
    if InputRow > 1 then
      LabelFlugNr.caption := InttoStr(Strtoint(FlWindow.GetActive.Data['Num',InputRow-1])
      +Strtoint(FlWindow.GetActive.data['NoL',InputRow-1]))
    else LabelFlugNr.caption := InttoStr(Strtoint(FlWindow.GetActive.Settings.Values['BFStarts'])+1);
  end
  else LabelFlugNr.caption := InttoStr(Strtoint(FlWindow.GetActive.Settings.Values['BFStarts'])+1);
  LabelFlbArt.caption := FlWindow.GetActive.Name;
  DTPDate.Date := now;
  CBAircraftID.Text := FlWindow.GetActive.Settings.Values['IDPrefix'];

  LabelStO.Caption := '';
  LabelLaO.Caption := '';
  LabelViaOrt.Caption := '';
  if FlWindow.GetActive.Settings.Values['DefPosition'] = '0' then
  begin
    CBPilot.Text := GenSettings.Values['PilotName'];
    CBCoPilot.Text := '';
    CBPilot.TabStop := False;
    CBCoPilot.TabStop := True;
  end
  else
  begin
    CBCoPilot.Text := GenSettings.Values['PilotName'];
    CBPilot.Text := '';
    CBPilot.TabStop := True;
    CBCoPilot.TabStop := False;
  end;
  LabelDist.Caption := '0 '+ FlWindow.GetActive.Settings.Values['DistUnit'];
  LabelAvSpeed.caption := '0 '+GetSpeedUnit(FlWindow.GetActive.Settings.Values['DistUnit']);
  CBAPFrom.Text := '';
  if FlWindow.GetActive.Data['Num',1] <> '' then
    CBAPFrom.Text := FlWindow.GetActive.data['LaL',FlugNr-1];
    If FlWindow.GetActive.data['ToS',FlugNr-1] = 'W' Then RBW.Checked := True;
    If FlWindow.GetActive.data['ToS',FlugNr-1] = 'F' Then RBF.Checked := True;
    If FlWindow.GetActive.data['ToS',FlugNr-1] = 'E' Then RBE.Checked := True;
    If FlWindow.GetActive.data['ToS',FlugNr-1] = 'A' Then RBA.Checked := True;
    If FlWindow.GetActive.data['ToS',FlugNr-1] = 'G' Then RBG.Checked := True;

  TabControl.ActivePage := TSFlugdaten;
  ButtonNext.Enabled := True;
  CBAPFrom.Text := CBAPTo.Text;

  CLBKat.Items := FlWindow.GetActive.ACCategories;
  CLBKatTime.Items := FlWindow.GetActive.ACTimeCat;
  CLBContest.Items := FlWindow.GetActive.ACContestCat;

  if not Active then
    ShowModal;
end;

// ----------------------------------------------------------------
// change flight
// ----------------------------------------------------------------
procedure TFInput.Change(FlugNr: Word);
var
  i: Word;
  TempStr: String;
begin
  ResetInput;
  InputRow := FlugNr;
  ButtonOK.Default := True;
  Status := 'Change';
  caption := _('Edit flight');

  ButtonNext.Enabled := False;

  CfF.Text := FlWindow.GetActive.data['CfF',InputRow];
  LaF.Text := FlWindow.GetActive.data['LaF',InputRow];
  CfC.Text := FlWindow.GetActive.data['CfC',InputRow];
  EfF.Text := FlWindow.GetActive.data['EfF',InputRow];

  Metar.Text := FlWindow.GetActive.data['Met',InputRow];

  LabelFlugNr.caption := FlWindow.GetActive.data['Num',InputRow];
  LabelFlbArt.caption := FlWindow.GetActive.Name;
  DTPDate.Date := StrToDate(FlWindow.GetActive.data['Dat',InputRow]);
  CBAircraftType.Text:= FlWindow.GetActive.data['ATy',InputRow];
  CBAircraftID.Text := FlWindow.GetActive.data['AId',InputRow];
  CBPilot.Text := FlWindow.GetActive.data['Pi1',InputRow];
  CBCoPilot.Text := FlWindow.GetActive.data['Pi2',InputRow];

  if FlWindow.GetActive.data['Pas',InputRow] <> '' then
    EditPassengers.Value := StrToInt(FlWindow.GetActive.data['Pas',InputRow])
  else EditPassengers.Value := 0;

  if FlWindow.GetActive.data['NoL',InputRow] <> '' then
    EditLandings.Value := StrToInt(FlWindow.GetActive.data['NoL',InputRow])
  else EditLandings.Value := 1;

  If FlWindow.GetActive.data['ToS',InputRow] = 'W' Then RBW.Checked := True;
  If FlWindow.GetActive.data['ToS',InputRow] = 'F' Then RBF.Checked := True;
  If FlWindow.GetActive.data['ToS',InputRow] = 'E' Then RBE.Checked := True;
  If FlWindow.GetActive.data['ToS',InputRow] = 'A' Then RBA.Checked := True;
  If FlWindow.GetActive.data['ToS',InputRow] = 'G' Then RBG.Checked := True;

  MEFlightTimeDep.Text := FlWindow.GetActive.data['StT',InputRow];
  MEFlightTimeArr.Text := FlWindow.GetActive.data['LaT',InputRow];
  MEBlockTimeDep.Text := FlWindow.GetActive.data['StB',InputRow];
  MEBlockTimeArr.Text := FlWindow.GetActive.data['LaB',InputRow];
  if FlWindow.GetActive.data['FlT',InputRow] <> '' then
    MEFlightTime.Text := FormatDateTime('hh":"nn',StrtoTime(FlWindow.GetActive.data['FlT',InputRow]))
  else
    MEFlightTime.Text := '00:00';
  if FlWindow.GetActive.data['BlT',InputRow] <> '' then
    MEBlockTime.Text := FormatDateTime('hh":"nn',StrtoTime(FlWindow.GetActive.data['BlT',InputRow]))
  else
    MEBlockTime.Text := '00:00';
  CBAPFrom.Text := FlWindow.GetActive.data['StL',InputRow];
  CBAPTo.Text := FlWindow.GetActive.data['LaL',InputRow];
  EditRemarks.Text := FlWindow.GetActive.data['Rem',InputRow];
  EditDistance.Text := FlWindow.GetActive.data['Dst',InputRow];
  LabelAvSpeed.caption := '0 '+GetSpeedUnit(FlWindow.GetActive.Settings.Values['DistUnit']);
  CalcAvSpeed;

  { Categories }
  CLBKat.Items := FlWindow.GetActive.ACCategories;
  CLBKatTime.Items := FlWindow.GetActive.ACTimeCat;
  CLBContest.Items := FlWindow.GetActive.ACContestCat;

  if FlWindow.GetActive.data['Cat',InputRow] <> '' then
    StringsToCLB(FlWindow.GetActive.ACCategories,FlWindow.GetActive.data['Cat',InputRow],CLBKat);
  if FlWindow.GetActive.data['CTi',InputRow] <> '' then
    StringsToCLB(FlWindow.GetActive.ACTimeCat,FlWindow.GetActive.data['CTi',InputRow],GridKatTime,CLBKatTime);
  if FlWindow.GetActive.data['Con',InputRow] <> '' then
    StringsToCLB(FlWindow.GetActive.ACContestCat,FlWindow.GetActive.data['Con',InputRow],GridContest,CLBContest);

  { via }
  if length(FlWindow.GetActive.data['Via',InputRow]) > 0 then
  for i := 1 to length(FlWindow.GetActive.data['Via',InputRow]) do
  if (FlWindow.GetActive.data['Via',InputRow][i] = '/')
    or (i = length(FlWindow.GetActive.data['Via',InputRow])) then
  begin
    GridVia.InsertColRow(False, GridVia.RowCount-1);
    GridVia.Cells[1,GridVia.RowCount-2] := TempStr;
    TempStr := '';
  end
  else TempStr := TempStr + FlWindow.GetActive.data['Via',InputRow][i];

  CBOrtExit(CBAPFrom);
  CBOrtExit(CBAPTo);
  PrevDist := StrtoInt(LabelViaDist.Caption);
  CheckCustomDist;
  RenumberVia;

  { Files }
  TempStr := '';
  if length(FlWindow.GetActive.data['Fil',InputRow]) > 0 then
  for i := 1 to length(FlWindow.GetActive.data['Fil',InputRow]) do
  if (FlWindow.GetActive.data['Fil',InputRow][i] = '/') then
  begin
    ButtonFileRem.Enabled := True;
    LBFiles.Items.Add(TempStr);
    TempStr := '';
  end
  else TempStr := TempStr + FlWindow.GetActive.data['Fil',InputRow][i];

  CalcAvSpeed;

  { Initialize AutoComplete buttons}
  CBAircraftExit(Self);
  CBCrewExit(CBPilot);
  if CBCoPilot.Enabled then CBCrewExit(CBCoPilot);
  
  TabControl.ActivePage := TSFlugdaten;
  ActiveControl := DTPDate;
  ShowModal;
end;

// ----------------------------------------------------------------
// Save flightdata
// ----------------------------------------------------------------
procedure TFInput.SaveData;
var
  i: Word;
  TempStr: String;
begin
  TempStr := '';
  DataChanged := True;
//  FMain.StatusBar1.Panels[2].Text := '*';

  with FlWindow.GetActive do
  begin
    data['Dat',InputRow] := DateToStr(DTPDate.Date);
    data['ATy',InputRow] := CBAircraftType.Text;
    data['AId',InputRow] := CBAircraftID.Text;
    data['Pi1',InputRow] := CBPilot.Text;
    data['Pi2',InputRow] := CBCoPilot.Text;
    if EditPassengers.Text = '0' then data['Pas',InputRow] := ''
    else data['Pas',InputRow] := EditPassengers.Text;
    if RBW.Checked then data['ToS',InputRow] := 'W';
    if RBF.Checked then data['ToS',InputRow] := 'F';
    if RBE.Checked then data['ToS',InputRow] := 'E';
    if RBA.Checked then data['ToS',InputRow] := 'A';
    if RBG.Checked then data['ToS',InputRow] := 'G';
    data['NoL',InputRow] := EditLandings.Text;
    if not (PanelFlightTime.Visible) and (MEFlightTime.Text = '00:00') then
    begin
      data['StT',InputRow] := '';
      data['LaT',InputRow] := '';
      data['FlT',InputRow] := '';
    end
    else
    begin
      data['StT',InputRow] := MEFlightTimeDep.Text;
      data['LaT',InputRow] := MEFlightTimeArr.Text;
      data['FlT',InputRow] := FormatDateTime('h":"nn',StrToTime(MEFlightTime.Text));
    end;
    if not (PanelBlockTime.Visible) and (MEBlockTime.Text = '00:00') then
    begin
      data['StB',InputRow] := '';
      data['LaB',InputRow] := '';
      data['BlT',InputRow] := '';
    end
    else
    begin
      data['StB',InputRow] := MEBlockTimeDep.Text;
      data['LaB',InputRow] := MEBlockTimeArr.Text;
      data['BlT',InputRow] := FormatDateTime('h":"nn',StrToTime(MEBlockTime.Text));
    end;
    data['StL',InputRow] := CBAPFrom.Text;
    data['LaL',InputRow] := CBAPTo.Text;
    data['Rem',InputRow] := EditRemarks.Text;

    { Categories }
    TempStr := '';
    if CLBKat.Count > 0 then
      for i := 0 to CLBKat.Count-1 do
        if CLBKat.checked[i] then
          TempStr := TempStr
     + CLBKat.Items.Strings[i]+'/';
    data['Cat',InputRow] := TempStr;

    { Time Categories }
    TempStr := '';
    if GridKatTime.Cells[1,1] <> '' then
      for i := 1 to GridKatTime.RowCount-1 do TempStr := TempStr
       + GridKatTime.Cells[1,i]+'|'+GridKatTime.Cells[2,i]+'/';
    data['CTi',InputRow] := TempStr;

    { Contest Categories }
    TempStr := '';
    if GridContest.Cells[1,1] <> '' then
    for i := 1 to GridContest.RowCount-1 do
      TempStr := TempStr
       + GridContest.Cells[1,i]+'|'+GridContest.Cells[2,i]+'|'+GridContest.Cells[3,i]+'/';
    data['Con',InputRow] := TempStr;

    { Via }
    TempStr := '';
    if GridVia.RowCount > 3 then
      for i := 2 to GridVia.RowCount-2 do
        TempStr := TempStr + GridVia.Cells[1,i]+'/';
    data['Via',InputRow] := TempStr;
    if EditDistance.Text <> '0' then data['Dst',InputRow] := EditDistance.Text
    else data['Dst',InputRow] := '';
    TempStr := '';

    { Files }
    if LBFiles.Count > 0 then
      for i := 1 to LBFiles.Count do
        TempStr := TempStr + LBFiles.Items[i-1]+'/';
    data['Fil',InputRow] := TempStr;
    CopyFiles(FileQueue);

    { Costs }
    data['CfF',InputRow] := CfF.Text;
    data['LaF',InputRow] := LaF.Text;
    data['CfC',InputRow] := CfC.Text;
    data['EfF',InputRow] := EfF.Text;

    { Meteo }
    data['Met',InputRow] := Metar.Text;
  end;
end;

// ----------------------------------------------------------------
// Button OK click
// ----------------------------------------------------------------
procedure TFInput.ButtonOKClick(Sender: TObject);
begin
  if not CheckComplete then
  begin
    Modalresult := mrNone;
    exit;
  end;
  SaveData;
  FMain.InsertData;
end;
// ----------------------------------------------------------------
// Next flight
// ----------------------------------------------------------------
procedure TFInput.ButtonNextClick(Sender: TObject);
begin
  if not CheckComplete then
  begin
    Modalresult := mrNone;
    exit;
  end;
  SaveData;
  FMain.InsertData;
  FlWindow.GetActive.Grid.InsertColRow(False, InputRow+1);
  inc(InputRow);

  ResetInput;

  LabelFlugNr.caption := InttoStr(Strtoint(FlWindow.GetActive.Grid.Cells[0,InputRow-1])
   +Strtoint(FlWindow.GetActive.data['NoL',InputRow-1]));
end;

// ----------------------------------------------------------------
// Calc average speed
// ----------------------------------------------------------------
procedure TFInput.CalcAvSpeed;
begin
  if not assigned(PDefaultTime) then
    Exit;
  if (PDefaultTime^.Text <> '00:00') and (PDefaultTime^.Text <> '  :  ') and (EditDistance.Text <> '') then
    LabelAvSpeed.caption :=
     InttoStr(avgSpeed(StrtoInt(EditDistance.text),PDefaultTime^.Text))+' '
     +GetSpeedUnit(FlWindow.GetActive.Settings.Values['DistUnit']);
end;

// ----------------------------------------------------------------
// Check if all required data is supplied
// ----------------------------------------------------------------
function TFInput.CheckComplete: Boolean;
{--------}
  procedure RaiseError(S: String; aControl: TWinControl);
  begin
    Messagedlg(S,mtWarning,[mbOK],0);
    Result := False;
    ActiveControl := aControl;
  end;
{--------}
begin
  TabControl.ActivePage := TSFlugdaten;
  Result := True;
  if (CBAircraftID.Text = '') or
    (CBAircraftID.Text = FlWindow.GetActive.Settings.Values['IDPrefix']) then
  begin
    RaiseError(_('Please enter aircraft id'), CBAircraftID);
    Exit;
  end; 
  if CBAircraftType.Text = '' then
  begin
    RaiseError(_('Please enter aircraft type'), CBAircraftType);
    Exit;
  end;
  if PanelFlightTime.Visible then
  begin
    if MEFlightTimeDep.Text = '  :  ' then
    begin
      RaiseError(_('Please enter start time'), MEFlightTimeDep);
      Exit;
    end;
    if MEFlightTimeArr.Text = '  :  ' then
    begin
      RaiseError(_('Please enter landing time'), MEFlightTimeArr);
      Exit;
    end;
  end;
  if PanelBlockTime.Visible then
  begin
    if MEBlockTimeDep.Text = '  :  ' then
    begin
      RaiseError(_('Please enter start time'), MEBlockTimeDep);
      Exit;
    end;
    if MEBlockTimeArr.Text = '  :  ' then
    begin
      RaiseError(_('Please enter landing time'), MEBlockTimeArr);
      Exit;
    end;
  end;
  if CBAPFrom.Text = '' then
  begin
    RaiseError(_('Please enter departure location'), CBAPFrom);
    Exit;
  end;
  if CBAPTo.Text = '' then
  begin
    RaiseError(_('Please enter arrival location'), CBAPTo);
    Exit;
  end;
end;

// ----------------------------------------------------------------
// Check date
// ----------------------------------------------------------------
procedure TFInput.DTPDateExit(Sender: TObject);
begin
  if InputRow <= 1 then
    Exit;
  if DTPDate.Date < StrtoDate(FlWindow.GetActive.Data['Dat',InputRow-1]) then
  begin
    DTPDate.Color := clFYellow;
    DTPDate.Hint := 'This date is before the date of the last flight';
  end
  else
  begin
    DTPDate.Color := clWindow;
    DTPDate.Hint := '';
  end;
end;

// ----------------------------------------------------------------
// CBAircraftID Enter
// ----------------------------------------------------------------
procedure TFInput.CBAircraftIDEnter(Sender: TObject);
begin
  TimerKennung.Enabled := True;
end;

// ----------------------------------------------------------------
// Timer
// Select only Text after KPrae or '-'
// ----------------------------------------------------------------
procedure TFInput.TimerKennungTimer(Sender: TObject);
var
  i: Word;
  found : boolean;
begin
  TimerKennung.Enabled := False;
  found := False;
  i := 1;
  while i <= length(CBAircraftID.Text) do
  begin
    if FlWindow.GetActive.Settings.Values['IDPrefix'] = copy(CBAircraftID.Text,1,i) then
    begin
      found := True;
      break;
    end;
    inc(i);
  end;
  if not found then
  begin
    i := 1;
    while i < length(CBAircraftID.Text) do
    begin
      if CBAircraftID.Text[i] = '-' then break;
      inc(i);
    end;
  end;
  CBAircraftID.SelStart := i;
  CBAircraftID.SelLength := length(CBAircraftID.Text)-i;
end;

// ----------------------------------------------------------------
// CBAircraftID exit
// ----------------------------------------------------------------
procedure TFInput.CBAircraftExit(Sender: TObject);
var
  Idx, i: Integer;
  ACCatList: String;
begin
  CBAircraftID.Text := UpperCase(CBAircraftID.Text);
  if TabControl.ActivePage = TSFlugdaten then
  begin
    Idx := FlWindow.GetActive.ACAircrafts.IndexOfName(CBAircraftID.Text);
    { unknown aircraft }
    if (Idx = -1) then
    begin
      CBAircraftType.TabStop := True;
      if (CBAircraftType.Text <> '') and (CBAircraftID.Text <> '') then
      begin
        ButtonNeuFlugzeug.visible := True;
        CBCoPilot.Enabled := True;
      end
      else
      begin
        ButtonNeuFlugzeug.visible := False;
      end;
    end
    else
    { known aircraft }
    begin
      CBAircraftType.Text := FlWindow.GetActive.ACAircrafts.ValueFromIndex[Idx];
      ActiveControl := FindNextControl(CBAircraftType,True,True,False);
      { aircraft categories }
      for i := 0  to CLBKat.Items.Count-1 do
      begin
        {CLBKat.ItemEnabled[i] := true;
        if CLBKat.State[i] = cbGrayed then
          CLBKat.State[i] := cbUnchecked;}
        CLBKat.Checked[i]:=False;
      end;

      ACCatList := GetStringObject(FlWindow.GetActive.ACAircrafts, CBAircraftID.Text, 'AircraftCat');
      GrayCLB(FlWindow.GetActive.ACCategories, ACCatList, CLBKat);
      CLBKat.Repaint;
    end;
  end;
end;

// ----------------------------------------------------------------
// Add new aircraft to AutoComplete
// ----------------------------------------------------------------
procedure TFInput.ButtonNeuFlugzeugClick(Sender: TObject);
begin
  { Prüfen, ob Kennung schon existiert (dürfte eigentlich nicht passieren!) }
  if FlWindow.GetActive.ACAircrafts.IndexOfName(CBAircraftID.Text) >= 0 then
  begin
    MessageDlg(_('Aircraft id already exists!'),mtWarning,[mbOk],0);
    Exit;
  end;
  DataChanged := True;
//  FMain.StatusBar1.Panels[2].Text := '*';
  ButtonNeuFlugzeug.Visible := False;

  FlWindow.GetActive.ACAircrafts.Values[CBAircraftID.Text] := CBAircraftType.Text;
end;

// ----------------------------------------------------------------
// CBAircraftType exit
// ----------------------------------------------------------------
procedure TFInput.CBMusterExit(Sender: TObject);
begin
  if (FlWindow.GetActive.ACAircrafts.IndexOfName(CBAircraftID.Text) >= 0)
    and (CBAircraftID.Text <> '') and (CBAircraftType.Text <> '') then
      ButtonNeuFlugzeug.visible := True
  else
    ButtonNeuFlugzeug.visible := False;
end;

// ----------------------------------------------------------------
// CBCrew exit
// ----------------------------------------------------------------
procedure TFInput.CBCrewExit(Sender: TObject);
var
  TempButton: ^TBitBtn;
  Idx: Integer;
begin
  if TCOmboBox(Sender).Text = '' then Exit;
  if TComboBox(Sender).Name = 'CBPilot' then
    TempButton := @ButtonNeuPilot
  else TempButton := @ButtonNeuBegleiter;

  Idx := FlWindow.GetActive.ACPilots.IndexOf(UpperCase(TComboBox(Sender).Text));
  if Idx >= 0 then
  begin
    TempButton^.Visible := False;
    TComboBox(Sender).Text := FlWindow.GetActive.ACPilots[Idx];
  end
  else
    TempButton^.Visible := True;
end;

// ----------------------------------------------------------------
// Add new Pilots
// ----------------------------------------------------------------
procedure TFInput.ButtonNeuBegleiterClick(Sender: TObject);
var
  PComboBox: ^TComboBox;
begin
  DataChanged := True;
//  FMain.StatusBar1.Panels[2].Text := '*';
  if TSpeedButton(Sender).Name = 'ButtonNeuPilot' then
  begin
    ButtonNeuPilot.visible := False;
    PComboBox := @CBPilot;
  end
  else
  begin
    ButtonNeuBegleiter.visible := False;
    PComboBox := @CBCoPilot;
  end;

  if FlWindow.GetActive.ACPilots.IndexOf(PComboBox^.Text) >= 1 then
  begin
    MessageDlg(_('Person already exists!'),mtWarning,[mbOk],0);
    Exit;
  end;

  FlWindow.GetActive.ACPilots.Add(PComboBox^.Text);
end;

// ----------------------------------------------------------------
// MEZeit exit
// Check time and calc time and speed
// ----------------------------------------------------------------
procedure TFInput.METimeExit(Sender: TObject);
var
  Zeit: TDateTime;
  Calc1, Calc2 : Double;
  Tmp, Clc1, Clc2 : string;
  PMEArr, PMEDep, PMETime: ^TMaskEdit;
begin
  if TMaskEdit(Sender).Text <> '  :  ' then
  begin
    if not isTime(TMaskEdit(Sender).Text) then
    begin
      MessageDlg(_('Please enter a time'),mtWarning,[mbOK],0);
      ActiveControl := TMaskEdit(Sender);
      Exit;
    end;
  end;

  if (Sender = MEFlightTimeDep) or (Sender = MEFlightTimeArr) then
  begin
    PMEArr := @MEFlightTimeArr;
    PMEDep := @MEFlightTimeDep;
    PMETime := @MEFlightTime;
  end
  else
  begin
    PMEArr := @MEBlockTimeArr;
    PMEDep := @MEBlockTimeDep;
    PMETime := @MEBlockTime;
  end;

  { calc flight time }
  if (PMEDep^.Text <> '  :  ') and (PMEArr^.Text <> '  :  ') then
  begin
    if Strtotime(PMEDep^.Text) < Strtotime(PMEArr^.Text) then
      Zeit := StrToTime(PMEArr^.Text)-StrToTime(PMEDep^.Text)
    else
    begin
      Zeit := StrToTime(PMEArr^.Text)-StrToTime(PMEDep^.Text)+StrToTime('23:00')+StrToTime('1:00');
    end;
    PMETime^.Text := FormatDateTime('hh":"nn',Zeit);

    Tmp := GetStringObject(FlWindow.GetActive.ACAircrafts, CBAircraftID.Text, 'Clc');
    Clc1 := GetStringObject(FlWindow.GetActive.ACAircrafts, CBAircraftID.Text, 'CpH');
    if Clc1 = '' then Clc1 := '0'; try Calc1 := StrToFloat(Clc1); except Calc1 := 0; end;
    Clc2 := GetStringObject(FlWindow.GetActive.ACAircrafts, CBAircraftID.Text, 'CpF');
    if Clc2 = '' then Clc2 := '0'; try Calc2 := StrToFloat(Clc2); except Calc2 := 0; end;

    if StrToFloat(CfF.Text) = 0 then
    begin
      if (Tmp = 'CalcByFT') and ((Sender = MEFlightTimeDep) or (Sender = MEFlightTimeArr)) then
      begin
        CfF.Text := FormatFloat('0.00', ((Zeit*24)*Calc1)+Calc2);
      end else
      if (Tmp = 'CalcByBT') and ((Sender = MEBlockTimeDep) or (Sender = MEBlockTimeArr)) then
      begin
        CfF.Text := FormatFloat('0.00', ((Zeit*24)*Calc1)+Calc2);
      end;
    end;
  end;
  CalcAvSpeed;

  if (Sender = MEFlightTimeArr) and (StrtoInt(EditLandings.Text) > 1) then
    ActiveControl := MEFlightTime;
end;

// ----------------------------------------------------------------
// EditLandings exit
// ----------------------------------------------------------------
procedure TFInput.EditPassLandingsExit(Sender: TObject);
begin
  try StrToInt(TEdit(Sender).Text);
  except
    on EConvertError do
    begin
      MessageDlg(_('Please enter a number'),mtWarning,[mbOK],0);
      ActiveControl := TEdit(Sender);
      Exit;
    end;
  end;

  If TSpinEdit(Sender) = EditLandings then begin
    if StrtoInt(TSpinEdit(Sender).Text) < 1 then TEdit(Sender).Text := '1'
  end else
    if StrtoInt(TSpinEdit(Sender).Text) < 0 then TEdit(Sender).Text := '0'
end;

// ----------------------------------------------------------------
// CBOrt exit
// ----------------------------------------------------------------
procedure TFInput.CBOrtExit(Sender: TObject);
var
  PLabelOrt: ^Tlabel;
  Idx: Integer;
  Airport: TAirport;
begin
  if TComboBox(Sender).Name = 'CBAPFrom' then PLabelOrt := @LabelStO;
  if TComboBox(Sender).Name = 'CBAPTo' then PLabelOrt := @LabelLaO;
  if TComboBox(Sender).Name = 'CBViaOrt' then PLabelOrt := @LabelViaOrt;

  Idx := FlWindow.GetActive.ACAirports.IndexOf(TComboBox(Sender).Text);
  if Idx = -1 then
  begin
    if TComboBox(Sender).Name = 'CBAPFrom' then ButtonNeuStartOrt.visible := True;
    if (TComboBox(Sender).Name = 'CBAPTo') and (CBAPFrom.Text <> CBAPTo.Text)
    then ButtonNeuLandeOrt.visible := True;
  end
  else
  begin
    ButtonNeuStartOrt.Visible := False;
    ButtonNeuLandeOrt.Visible := False;
  end;

  { Airport info }
  if AirportData.Find(TComboBox(Sender).Text, Airport) then
  begin
    if Uppercase(Airport.ICAO) = Uppercase(TComboBox(Sender).Text)
    then
    begin
      TComboBox(Sender).Text := Airport.ICAO;
      PLabelOrt^.caption := Airport.AirportName;
    end
    else
    begin
      TComboBox(Sender).Text := Airport.AirportName;
      PLabelOrt^.caption := Airport.ICAO;
    end;
    if PLabelOrt^.caption = '' then PLabelOrt^.caption := Airport.Lat +' - '+ Airport.Lon;
  end
  else PLabelOrt^.caption := '';

  if (Sender = CBAPFrom) and (CBAPTo.Text = '') then CBAPTo.Text := CBAPFrom.Text;

  { Via }
  GridVia.Cells[1,1] := CBAPFrom.Text;
  GridVia.Cells[1,GridVia.RowCount-1] := CBAPTo.Text;
  CalcViaDist;
  CalcAvSpeed;
end;

// ----------------------------------------------------------------
// Add airport to AutoComplete
// ----------------------------------------------------------------
procedure TFInput.ButtonNeuOrtClick(Sender: TObject);
var
  TempComboBox: TComboBox;
begin
  DataChanged := True;
//  FMain.StatusBar1.Panels[2].Text := '*';
  if TSpeedButton(Sender).Name = 'ButtonNeuStartOrt' then
  begin
    ButtonNeuStartOrt.visible := False;
    TempComboBox := CBAPFrom;
  end;
  if TSpeedButton(Sender).Name = 'ButtonNeuLandeOrt' then
  begin
    ButtonNeuLandeOrt.visible := False;
    TempComboBox := CBAPTo;
  end;

  if FlWindow.GetActive.ACAirports.IndexOf(TempComboBox.Text) >= 0 then
  begin
    MessageDlg(_('Airport aleready exists!'),mtWarning,[mbOk],0);
    Exit;
  end;

  FlWindow.GetActive.ACAirports.Add(TempComboBox.Text);
end;

// ----------------------------------------------------------------
// Go to landing time on key up
// ----------------------------------------------------------------
procedure TFInput.MEFlightTimeDepKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if MEFlightTimeDep.SelLength = 0 then
    ActiveControl := MEFlightTimeArr;
end;

procedure TFInput.MEBlockTimeDepKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if MEBlockTimeDep.SelLength = 0 then
    ActiveControl := MEBlockTimeArr;
end;

// ----------------------------------------------------------------
// Go to flights on key up
// ----------------------------------------------------------------
procedure TFInput.MEFlightTimeArrKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (MEFlightTimeArr.SelLength = 0) then
  begin
    if not PanelBlockTime.Visible then
      ActiveControl := CBAPFrom
    else
      ActiveControl := MEBlockTimeDep;
  end;
end;

procedure TFInput.MEBlockTimeArrKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if MEBlockTimeArr.SelLength = 0 then
    ActiveControl := CBAPFrom;
end;

// ----------------------------------------------------------------
//
// ----------------------------------------------------------------
procedure TFInput.EditDistanceExit(Sender: TObject);
begin
  if EditDistance.Text <> '' then
  begin
    try StrToInt(EditDistance.Text);
    except
      on EConvertError do
      begin
        MessageDlg(_('Please enter a number'),mtWarning,[mbOK],0);
        ActiveControl := EditDistance;
      end;
    end;
  end;
  CalcAvSpeed;

  CheckCustomDist;
end;

procedure TFInput.TabControlChange(Sender: TObject);
begin
  if TabControl.ActivePage = TSStreckenflug then
  begin
    if EditDistance.text = '' then ActiveControl := EditDistance;
  end;
end;

{ Categories hinzufügen }
procedure TFInput.ButtonKatAddClick(Sender: TObject);
var
  InputStr: String;
begin
  if InputQuery(_('Please enter a category'),_('Please enter a category'),InputStr) then
  begin
    if FlWindow.GetActive.ACCategories.IndexOf(InputStr) >= 0 then
    begin
      MessageDlg(_('Category already exists!'),mtWarning,[mbOk],0);
      Exit;
    end;
    FlWindow.GetActive.ACCategories.Add(InputStr);
    CLBKat.Items.Add(InputStr);
  end;
end;

{ Ort suchen }
procedure TFInput.ButtonFindOrtClick(Sender: TObject);
var
  PCB: ^TComboBox;
  Col: Word;
  PGrid: ^TStringGrid;
begin
  with TFAirports.Create(Application) do
  try
    ActiveControl := EditFind;
    if ShowModal = mrCancel then
    begin
      Application.OnHint := onHint;
      Exit;
    end;
    Application.OnHint := onHint;
    if Sender = ButtonFindStartOrt then PCB := @CBAPFrom;
    if Sender = ButtonFindLandeOrt then PCB := @CBAPTo;
    If Sender = ButtonFindViaOrt then PCB := @CBViaOrt;
    if ButtonFlp.Down = True then
      PGrid := @GridFlp
    else PGrid := @GridOwnFlp;
    if (RBKennung.Checked) and (PGrid^.Cells[1,PGrid^.Row] <> '') then Col := 1
    else Col := 0;
  finally
    Release;
  end;
  PCB^.Text := PGrid^.Cells[Col,PGrid^.Row];
  PCB^.OnExit(PCB^);
  ActiveControl := PCB^;
end;

procedure TFInput.MEFlightTimeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if MEFlightTime.SelLength = 0 then
    ActiveControl := CBAPFrom;
end;

// ----------------------------------------------------------------
// Clear grids
// ----------------------------------------------------------------
procedure TFInput.ClearGrids;
begin
  GridVia.Cells[0,1]  := _('From');
  GridVia.Cells[0,2]  := _('To');
  GridVia.Cells[1,1] := '';
  GridVia.Cells[1,2] := '';
  GridVia.Cells[2,2] := '';
  GridVia.RowCount := 3;

  GridKatTime.RowCount := 2;
  GridKatTime.Cells[1,1]  := '';
  GridKatTime.Cells[2,1]  := '';

  GridContest.RowCount := 2;
  GridContest.Cells[1,1]  := '';
  GridContest.Cells[2,1]  := '';
  GridContest.Cells[3,1]  := '';
end;

// ----------------------------------------------------------------
// Add via
// ----------------------------------------------------------------
procedure TFInput.ButtonWPAddClick(Sender: TObject);
var
  Airport: TAirport;
begin
  if CBViaOrt.Text = '' then Exit;
  if not AirportData.Find(CBViaOrt.Text, Airport) then
  begin
    MessageDlg(_('Airport not found in the database'+#10#13+
      'The distance cannot be calculated'),mtInformation,[mbOK],0);
  end;
  GridVia.InsertColRow(False, GridVia.RowCount-1);
  GridVia.Cells[1,GridVia.RowCount-2] := CBViaOrt.Text;
  RenumberVia;
  CalcViaDist;
  CalcAvSpeed;
end;

// ----------------------------------------------------------------
// Remove via
// ----------------------------------------------------------------
procedure TFInput.ButtonWPRemClick(Sender: TObject);
begin
  if (GridVia.Row > 1) and (GridVia.Row < GridVia.RowCount -1) then
    GridVia.DeleteColRow(False, GridVia.Row);
  RenumberVia;
  CalcViaDist;
  CalcAvSpeed;
end;

// ----------------------------------------------------------------
// Renumber via
// ----------------------------------------------------------------
procedure TFInput.RenumberVia;
var
  i: Word;
begin
  if GridVia.RowCount > 3 then for i := 2 to GridVia.RowCount-2 do
  GridVia.Cells[0,i] := InttoStr(i-1);
end;

// ----------------------------------------------------------------
// Move via up
// ----------------------------------------------------------------
procedure TFInput.ButtonViaUpClick(Sender: TObject);
var
  Temp: String;
begin
  if not ((GridVia.Row > 2) and (GridVia.Row < GridVia.RowCount -1)) then Exit;
  Temp := GridVia.Cells[1,GridVia.Row];
  GridVia.Cells[1,GridVia.Row] := GridVia.Cells[1,GridVia.Row-1];
  GridVia.Cells[1,GridVia.Row-1] := Temp;
  GridVia.Row := GridVia.Row -1;
  RenumberVia;
  CalcViaDist;
end;

// ----------------------------------------------------------------
// Move via down
// ----------------------------------------------------------------
procedure TFInput.ButtonViaDownClick(Sender: TObject);
var
  Temp: String;
begin
  if not ((GridVia.Row > 1) and (GridVia.Row < GridVia.RowCount -2)) then Exit;
  Temp := GridVia.Cells[1,GridVia.Row];
  GridVia.Cells[1,GridVia.Row] := GridVia.Cells[1,GridVia.Row+1];
  GridVia.Cells[1,GridVia.Row+1] := Temp;
  GridVia.Row := GridVia.Row +1;
  CalcViaDist;
end;

// ----------------------------------------------------------------
// Calc via distance
// ----------------------------------------------------------------
procedure TFInput.CalcViaDist;
var
  i, Dist, TotDist: Word;
begin
  if GridVia.Cells[1,1] = '' then
    Exit;
  TotDist := 0;
  for i := 2 to GridVia.RowCount-1 do
  begin
    Dist := Round(AirportData.Distance(GridVia.Cells[1,i],GridVia.Cells[1,i-1],FlWindow.GetActive.Settings.Values['DistUnit']));
    inc(TotDist,Dist);
    GridVia.Cells[2,i] := inttoStr(Dist);
  end;
  LabelViaDist.caption := inttoSTr(TotDist);

  LabelDist.caption := LabelViaDist.Caption + ' '+FlWindow.GetActive.Settings.Values['DistUnit'];
  CheckCustomDist;
end;

// ----------------------------------------------------------------
// Check if distance is changed by hand
// ----------------------------------------------------------------
procedure TFInput.CheckCustomDist;
begin
  if EditDistance.Text = '' then
  begin
    EditDistance.Text := LabelViaDist.Caption;
    PrevDist := StrtoInt(LabelViaDist.Caption);
//    ButtonCalcStrecke.Enabled := False;
    ImageAccNotDist.Visible := False;
    ImageAccDist.Visible := True;
  end
  else if PrevDist = StrtoInt(EditDistance.Text) then
  begin
    EditDistance.Text := LabelViaDist.Caption;
    PrevDist := StrtoInt(LabelViaDist.Caption);
    ImageAccNotDist.Visible := False;
    ImageAccDist.Visible := True;
  end
  else
  begin
    ImageAccNotDist.Visible := True;
    ImageAccDist.Visible := False;
  end;
end;

// ----------------------------------------------------------------
// Enter time cat
// ----------------------------------------------------------------
procedure TFInput.CLBKatTimeClickCheck(Sender: TObject);
var
  i, j: Word;
  InputBox: TFInputBox;
  EditTime: TMaskEdit;
  LabelTime: TLabel;
begin
  { Select }
  if CLBKatTime.Checked[CLBKatTime.ItemIndex] then
  try
    InputBox := TFInputBox.Create(FInput);

    InputBox.Caption := _('Please enter start time');
    InputBox.Width := 250;
    InputBox.Height := 150;

    EditTime := TMaskEdit.Create(InputBox);
    EditTime.Parent := InputBox;
    EditTime.EditMask := '!90:00;1;_';
    EditTime.Width := 70;
    EditTime.Left := 80;
    EditTime.Top := 30;
    EditTime.Text := PDefaultTime^.Text;

    LabelTime := TLabel.Create(InputBox);
    LabelTime.Parent := InputBox;
    LabelTime.Left := 80;
    LabelTime.Top := 15;
    LabelTime.Caption := _('Time');

    InputBox.ActiveControl := EditTime;

    repeat InputBox.ShowModal;
      if EditTime.Text = '  :  ' then
        InputBox.ModalResult := mrCancel;
      if InputBox.ModalResult = mrOK then
      begin
        try
          Strtotime(EditTime.Text);
        except
          MessageDlg(_('Please enter a valid time'),mtWarning,[mbOK],0);
          ActiveControl := EditTime;
          InputBox.ModalResult := mrNone;
        end;

        if InputBox.ModalResult = mrOK then
        begin
          if GridKatTime.Cells[1,1] <> '' then
            GridKatTime.RowCount := GridKatTime.RowCount +1;
          GridKatTime.Cells[0,GridKatTime.RowCount-1] := InttoStr(CLBKatTime.Itemindex);
          GridKatTime.Cells[1,GridKatTime.RowCount-1] := CLBKatTime.Items[CLBKatTime.ItemIndex];
          GridKatTime.Cells[2,GridKatTime.RowCount-1] := EditTime.Text;
        end;
      end;
      if InputBox.ModalResult = mrCancel then
      begin
        CLBKatTime.Checked[CLBKatTime.ItemIndex] := False;
        Exit;
      end;
    until (InputBox.ModalResult <> mrNone);
  finally
    EditTime.Free;
    LabelTime.Free;
    InputBox.Free;
  end
  { Unselect }
  else
  begin
    if GridKatTime.RowCount > 2 then
    begin
      for i := 1 to GridKatTime.RowCount do
      if GridKatTime.Cells[0,i] = InttoStr(CLBKatTime.ItemIndex) then
      for j := i+1 to GridKatTime.RowCount-1 do
      GridKatTime.Rows[j-1] := GridKatTime.Rows[j];
      GridKatTime.RowCount := GridKatTime.RowCount -1;
    end
    else
    begin
      GridKatTime.Cells[1,1] := '';
      GridKatTime.Cells[2,1] := '';
    end;
  end;
end;

procedure TFInput.ButtonKatTimeAddClick(Sender: TObject);
var
  InputStr: String;
begin
  if InputQuery(_('Please enter a category'),_('Please enter a category'),InputStr) then
  begin
    if FlWindow.GetActive.ACTimeCat.IndexOf(InputStr) >= 0 then
    begin
      MessageDlg(_('Category already exists!'),mtWarning,[mbOk],0);
      Exit;
    end;
    FlWindow.GetActive.ACTimeCat.Add(InputStr);
    CLBKatTime.Items.Add(InputStr);
  end;
end;

// ----------------------------------------------------------------
// Parse IGC File
// ----------------------------------------------------------------
procedure TFInput.FillDataFromIgcFile(FileName: String);
var
  IGCParseData: TIGCParseData;
begin
  if AnsiLowerCase(ExtractFileExt(FileName)) = '.igc' then
  begin
    ParseIGCFile(FileName,IGCParseData);
    if CBAircraftType.Text = '' then
    begin
      CBAircraftID.Text := IGCParseData.GliderID;
      CBAircraftExit(Self);
      CBPilot.Text := NormalCase(IGCParseData.Pilot);
      MEFlightTimeDep.Text := IGCParseData.StZ;
      MEFlightTimeArr.Text := IGCParseData.LaZ;
      //CBAPFrom.Text := IGCParseData.StO;
      //CBAPTo.Text := IGCParseData.LaO;
    end;
  end;
end;

// ----------------------------------------------------------------
// Copy file
// ----------------------------------------------------------------
procedure TFInput.CopyFiles(FileQueue: TStrings);
var
  i: Word;
begin
  if FileQueue.Count = 0 then Exit;

  ForceDirectories(FlpTempDir+'\Files\'+IntToStr(InputRow));
  for i := 0 to FileQueue.Count-1 do begin
    if LBFiles.Items.IndexOf(ExtractFilename(FileQueue.Strings[i])) > -1 then begin
{ TODO: Copy File }
{      if not CopyFile(pChar(FileQueue.Strings[i]), pChar(FlpTempDir+'\Files\'+IntToStr(InputRow)+'\'+ExtractFilename(FileQueue.Strings[i])), False) then
      begin
        MessageDlg(format(_('File ''%s'' could not be copied'),[FileQueue.Strings[i]]),mtError,[mbOK],0);
        Exit;
      end;}
    end;
  end;
end;

// ----------------------------------------------------------------
// Add files by Drag & Drop
// ----------------------------------------------------------------
procedure TFInput.onFileDrop(Sender: TObject; X, Y: Integer);
begin
{ TODO: Drag&Drop  AddFiles(FileDrop.Files);}
end;

// ----------------------------------------------------------------
// Add files by OpenDialog
// ----------------------------------------------------------------
procedure TFInput.ButtonFileAddClick(Sender: TObject);
begin
  if OpenDialogFiles.Execute then
  AddFiles(OpenDialogFiles.Files);
end;

// ----------------------------------------------------------------
// Add files
// ----------------------------------------------------------------
procedure TFInput.AddFiles(Files: TStrings);
var
  i : Integer;
begin
  if Files.Count = 1 then FillDataFromIgcFile(Files[0]);
  if Files.Count > 0 then
  for i:=0 to Files.Count-1 do
  begin
    if (FileExists(FlpTempDir+'\Files\'+IntToStr(InputRow)+'\'+ExtractFileName(Files[i])))
      or (LBFiles.Items.IndexOf(ExtractFileName(Files[i])) <> -1) then
    begin
      Messagedlg(_('File already exists'),mtError,[mbOK],0);
      exit;
    end;
    FileQueue.Add(Files[i]);
    ButtonFileRem.Enabled := True;
    LBFiles.Items.Add(ExtractFileName(Files[i]))
  end;
end;

// ----------------------------------------------------------------
// Remove file
// ----------------------------------------------------------------
procedure TFInput.ButtonFileRemClick(Sender: TObject);
begin
  DeleteFile(FlpTempDir+'\Files\'+IntToStr(InputRow)+'\'+LBFiles.Items[LBFiles.ItemIndex]);
{ TODO:  LBFiles.DeleteSelected;}

  If LBFiles.Count = 0 then begin
    ButtonFileRem.Enabled := False;
    RemoveDir(FlpTempDir+'\Files\'+IntToStr(InputRow));
  end;
end;

// ----------------------------------------------------------------
// run file (self handle)
// ----------------------------------------------------------------
procedure TFInput.LBFilesDblClick(Sender: TObject);
var FileName: String;
begin
  FileName := LBFiles.Items[LBFiles.ItemIndex];
{ TODO: Shellexecute }
{  if FileExists(FlpTempDir+'\Files\'+IntToStr(InputRow)+'\'+FileName) then
    ShellExecute(self.handle, 'open', PChar(FileName),nil, PChar(FlpTempDir+'\Files\'+IntToStr(InputRow)),SW_SHOWNORMAL)
  else if FileExists(FlpTempDir+'\Files\'+FileName) then
    ShellExecute(self.handle, 'open', PChar(FileName),nil, PChar(FlpTempDir+'\Files'),SW_SHOWNORMAL);}
end;

// ----------------------------------------------------------------
// Add contest
// ----------------------------------------------------------------
procedure TFInput.CLBContestClickCheck(Sender: TObject);
var
  i, j: Word;
  FInput: TFInputBox;
  EditDistance, EditPoints: TLabeledEdit;
begin
  { Select }
  if CLBContest.Checked[CLBContest.ItemIndex] then
  begin
    FInput := TFInputBox.Create(FInput);
    FInput.Caption := _('Contest');
    FInput.Width := 250;
    FInput.Height := 150;

    EditDistance := TLabeledEdit.Create(FInput);
    EditDistance.Parent := FInput;
    EditDistance.EditLabel.Caption := _('Distance');
    EditDistance.Font.Size := 10;
    EditDistance.Width := 70;
    EditDistance.Left := 40;
    EditDistance.Top := 50;

    EditPoints := TLabeledEdit.Create(FInput);
    EditPoints.Parent := FInput;
    EditPoints.EditLabel.Caption := _('Points');
    EditPoints.Font.Size := 10;
    EditPoints.Width := 70;
    EditPoints.Left := 140;
    EditPoints.Top := 50;

    FInput.ActiveControl := EditDistance;

    repeat FInput.ShowModal;
      if (EditDistance.Text = '') and (EditPoints.Text = '') then FInput.ModalResult := mrCancel;
      if FInput.ModalResult = mrOK then
      begin
        if EditDistance.Text = '' then EditDistance.Text := '0';
        if EditPoints.Text = '' then EditPoints.Text := '0';

        try
          StrtoFloat(EditDistance.Text);
        except
          MessageDlg(_('Please enter a number'),mtWarning,[mbOK],0);
          FInput.ActiveControl := EditDistance;
          FInput.ModalResult := mrNone;
        end;
        if FInput.ModalResult = mrOK then
        try
          StrtoFloat(EditPoints.Text);
        except
          MessageDlg(_('Please enter a number'),mtWarning,[mbOK],0);
          FInput.ActiveControl := EditPoints;
          FInput.ModalResult := mrNone;
        end;

        if FInput.ModalResult = mrOK then
        begin
          if GridContest.Cells[1,1] <> '' then GridContest.RowCount := GridContest.RowCount +1;
          GridContest.Cells[0,GridContest.RowCount-1] := InttoStr(CLBContest.Itemindex);
          GridContest.Cells[1,GridContest.RowCount-1] := CLBContest.Items[CLBContest.ItemIndex];
          GridContest.Cells[2,GridContest.RowCount-1] := EditDistance.Text;
          GridContest.Cells[3,GridContest.RowCount-1] := EditPoints.Text;
        end;
      end;

      if FInput.ModalResult = mrCancel then
      begin
        CLBContest.Checked[CLBContest.ItemIndex] := False;
        Exit;
      end;
    until (FInput.ModalResult <> mrNone);
  end
  { Unselect }
  else
  begin
    if GridContest.RowCount > 2 then
    begin
      for i := 1 to GridContest.RowCount do
        if GridContest.Cells[0,i] = InttoStr(CLBContest.ItemIndex) then
      for j := i+1 to GridContest.RowCount-1 do
        GridContest.Rows[j-1] := GridContest.Rows[j];
      GridContest.RowCount := GridContest.RowCount -1;
    end
    else
    begin
      GridContest.Cells[1,1] := '';
      GridContest.Cells[2,1] := '';
      GridContest.Cells[3,1] := '';
    end;
  end;
end;

// ----------------------------------------------------------------
// Add contest category
// ----------------------------------------------------------------
procedure TFInput.ButtonContestAddClick(Sender: TObject);
var
  InputStr: String;
begin
  if InputQuery(_('Please enter a category'),_('Please enter a category'),InputStr) then
  begin
    if FlWindow.GetActive.ACContestCat.IndexOf(InputStr) >= 0 then
    begin
      MessageDlg(_('Category already exists!'),mtWarning,[mbOk],0);
      Exit;
    end;
    FlWindow.GetActive.ACContestCat.Add(InputStr);
    CLBContest.Items.Add(InputStr);
  end;
end;

procedure TFInput.NoRowSelect(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  CanSelect := False;
end;

procedure TFInput.GridGetCellAlignment(Sender: TStringGrid; AColumn,
  ARow: Integer; State: TGridDrawState; var CellAlignment: TAlignment);
begin
  if Sender = GridVia then
  begin
    if (AColumn = 0) or (AColumn = 2) then CellAlignment := taRightJustify;
  end;
end;


procedure TFInput.CfFDblClick(Sender: TObject);
begin
  CfF.Text := '0';

  METimeExit(MEBlockTimeDep);
  METimeExit(MEFlightTimeDep);
end;

procedure TFInput.CAVOKClick(Sender: TObject);
begin
  if CAVOK.Checked then begin
    INTENSITY.Enabled := false;
    DESCRIPTOR.Enabled := false;
    PRECIPITATION.Enabled := false;
    OBSCURATION1.Enabled := false;
    OBSCURATION2.Enabled := false;
    OTHER.Enabled := false;
    CLOUDS.Enabled := false;
    CLOUDBASE.Enabled := false;
    CLOUDTYPE.Enabled := false;
  end else begin
    INTENSITY.Enabled := true;
    DESCRIPTOR.Enabled := true;
    PRECIPITATION.Enabled := true;
    OBSCURATION1.Enabled := true;
    OBSCURATION2.Enabled := true;
    OTHER.Enabled := true;
    CLOUDS.Enabled := true;
    CLOUDBASE.Enabled := true;
    CLOUDTYPE.Enabled := true;
  end;

  WeatherChange(Sender);
end;

function FillZeroToNumber(Text : String; Laenge : Byte) : string;
begin
  if Length(Text) > Laenge then
    Text := Copy(Text, 1, Laenge);

  while (Length(Text) < Laenge) do
    Text := '0' + Text;

  Result := Text;
end;

procedure TFInput.WeatherChange(Sender: TObject);
begin
  if CAVOK.Checked then begin
    Metar.Text := 'CAVOK/';
    WeatherText.Text := _('Ceiling and Visibility OK');
  end else begin

    { ------------------------------------------------------------------------ }

    Metar.Text := '';
    WeatherText.Text := '';

    if (CLOUDS.ItemIndex > 0) then begin
      Metar.Text := Metar.Text + CLOUDS.Items[CLOUDS.ItemIndex];

      if CLOUDBASE.Text > '' then
        Metar.Text := Metar.Text + FillZeroToNumber( Format('%d', [Trunc(StrToFloat(CLOUDBASE.Text) / 100)]), 3);

      if (CLOUDTYPE.ItemIndex <> 0) then
        Metar.Text := Metar.Text + CLOUDTYPE.Items[CLOUDTYPE.ItemIndex];

      Metar.Text := Metar.Text + '/';
    end;

    Metar.Text := Metar.Text + INTENSITY.Items[INTENSITY.ItemIndex];
    Metar.Text := Metar.Text + DESCRIPTOR.Items[DESCRIPTOR.ItemIndex];
    Metar.Text := Metar.Text + PRECIPITATION.Items[PRECIPITATION.ItemIndex];
    if (INTENSITY.ItemIndex > 0) or (DESCRIPTOR.ItemIndex > 0) or (PRECIPITATION.ItemIndex > 0) then
      Metar.Text := Metar.Text + '/';

    if (OBSCURATION1.ItemIndex > 0) then
      Metar.Text := Metar.Text + OBSCURATION1.Items[OBSCURATION1.ItemIndex]+'/';

    if (OBSCURATION2.ItemIndex > 0) then
      Metar.Text := Metar.Text + OBSCURATION2.Items[OBSCURATION2.ItemIndex]+'/';

    if (OTHER.ItemIndex > 0) then
      Metar.Text := Metar.Text + OTHER.Items[OTHER.ItemIndex]+'/';

    if (Length(OWNWEATHER.Text) > 0) then
      Metar.Text := Metar.Text + OWNWEATHER.Text+'/';

    { ------------------------------------------------------------------------ }

    if DESCRIPTOR.ItemIndex > 0 then begin
      if INTENSITY.ItemIndex = 0 then WeatherText.Text := _('Moderate')+ ' ';
      if INTENSITY.ItemIndex = 1 then WeatherText.Text := _('Light')+ ' ';
      if INTENSITY.ItemIndex = 2 then WeatherText.Text := _('Heavy')+ ' ';
    end;

    { ------------------------------------------------------------------------ }

    if DESCRIPTOR.ItemIndex = 1 then WeatherText.Text := WeatherText.Text + _('shallow');
    if DESCRIPTOR.ItemIndex = 2 then WeatherText.Text := WeatherText.Text + _('patches');
    if DESCRIPTOR.ItemIndex = 3 then WeatherText.Text := WeatherText.Text + _('partial');
    if DESCRIPTOR.ItemIndex = 4 then WeatherText.Text := WeatherText.Text + _('low drifting');
    if DESCRIPTOR.ItemIndex = 5 then WeatherText.Text := WeatherText.Text + _('blowing');
    if DESCRIPTOR.ItemIndex = 6 then WeatherText.Text := WeatherText.Text + _('shower(s)');
    if DESCRIPTOR.ItemIndex = 7 then WeatherText.Text := WeatherText.Text + _('thunderstorm');
    if DESCRIPTOR.ItemIndex = 8 then WeatherText.Text := WeatherText.Text + _('freezing');

    { ------------------------------------------------------------------------ }

    if ((PRECIPITATION.ItemIndex <= 0) and (DESCRIPTOR.ItemIndex = 2)) then WeatherText.Text := WeatherText.Text + ',';
    if ((PRECIPITATION.ItemIndex > 0) and (DESCRIPTOR.ItemIndex = 2)) then WeatherText.Text := WeatherText.Text + _(' of');

    if ((PRECIPITATION.ItemIndex <= 0) and (DESCRIPTOR.ItemIndex = 6)) then WeatherText.Text := WeatherText.Text + ',';
    if ((PRECIPITATION.ItemIndex > 0) and (DESCRIPTOR.ItemIndex = 6)) then WeatherText.Text := WeatherText.Text + _(' of');

    if ((PRECIPITATION.ItemIndex <= 0) and (DESCRIPTOR.ItemIndex = 7)) then WeatherText.Text := WeatherText.Text + ',';
    if ((PRECIPITATION.ItemIndex > 0) and (DESCRIPTOR.ItemIndex = 7)) then WeatherText.Text := WeatherText.Text + _(' and');

    if PRECIPITATION.ItemIndex = 1 then WeatherText.Text := WeatherText.Text + ' ' + _('drizzle');
    if PRECIPITATION.ItemIndex = 2 then WeatherText.Text := WeatherText.Text + ' ' + _('rain');
    if PRECIPITATION.ItemIndex = 3 then WeatherText.Text := WeatherText.Text + ' ' + _('snow');
    if PRECIPITATION.ItemIndex = 4 then WeatherText.Text := WeatherText.Text + ' ' + _('snow grains');
    if PRECIPITATION.ItemIndex = 5 then WeatherText.Text := WeatherText.Text + ' ' + _('ice crystals');
    if PRECIPITATION.ItemIndex = 6 then WeatherText.Text := WeatherText.Text + ' ' + _('ice pellets');
    if PRECIPITATION.ItemIndex = 7 then WeatherText.Text := WeatherText.Text + ' ' + _('hail');
    if PRECIPITATION.ItemIndex = 8 then WeatherText.Text := WeatherText.Text + ' ' + _('small hail and/or snow pellets');

    { ------------------------------------------------------------------------ }

    if ((OBSCURATION1.ItemIndex > 0) and (PRECIPITATION.ItemIndex > 0)) then WeatherText.Text := WeatherText.Text + _(' and');
    if OBSCURATION1.ItemIndex = 1 then WeatherText.Text := WeatherText.Text + ' ' + _('fog');
    if OBSCURATION1.ItemIndex = 2 then WeatherText.Text := WeatherText.Text + ' ' + _('mist');

    { ------------------------------------------------------------------------ }

    if ((OBSCURATION2.ItemIndex > 0) and (OBSCURATION1.ItemIndex > 0)) or
       ((OBSCURATION2.ItemIndex > 0) and (PRECIPITATION.ItemIndex > 0)) then WeatherText.Text := WeatherText.Text + _(' and');
    if OBSCURATION2.ItemIndex = 1 then WeatherText.Text := WeatherText.Text + ' ' + _('smoke');
    if OBSCURATION2.ItemIndex = 2 then WeatherText.Text := WeatherText.Text + ' ' + _('volcanic ash');
    if OBSCURATION2.ItemIndex = 3 then WeatherText.Text := WeatherText.Text + ' ' + _('widespread dust');
    if OBSCURATION2.ItemIndex = 4 then WeatherText.Text := WeatherText.Text + ' ' + _('sand');
    if OBSCURATION2.ItemIndex = 5 then WeatherText.Text := WeatherText.Text + ' ' + _('haze');

    { ------------------------------------------------------------------------ }

    if ((OTHER.ItemIndex > 0) and (OBSCURATION1.ItemIndex > 0)) or
       ((OTHER.ItemIndex > 0) and (OBSCURATION2.ItemIndex > 0)) or
       ((OTHER.ItemIndex > 0) and (PRECIPITATION.ItemIndex > 0)) then WeatherText.Text := WeatherText.Text + _(' and');
    if OTHER.ItemIndex = 1 then WeatherText.Text := WeatherText.Text + ' ' + _('dust/sand whirls');
    if OTHER.ItemIndex = 2 then WeatherText.Text := WeatherText.Text + ' ' + _('squalls');
    if OTHER.ItemIndex = 3 then WeatherText.Text := WeatherText.Text + ' ' + _('funnel cloud(s) (tornado or waterspout)');
    if OTHER.ItemIndex = 4 then WeatherText.Text := WeatherText.Text + ' ' + _('sandstorm');
    if OTHER.ItemIndex = 5 then WeatherText.Text := WeatherText.Text + ' ' + _('duststorm');

    if WeatherText.Text > '' then WeatherText.Text := WeatherText.Text + '.';

    { ------------------------------------------------------------------------ }

    if CLOUDS.ItemIndex <= 0 then begin
      if WeatherText.Text > '' then WeatherText.Text := WeatherText.Text + #13+#10;
      WeatherText.Text := WeatherText.Text + _('Clear sky, no clouds.');
      CLOUDBASE.Enabled := false;
      CLOUDTYPE.Enabled := false;
      exit;
    end else begin
      if WeatherText.Text > '' then WeatherText.Text := WeatherText.Text + #13+#10;
      if CLOUDS.ItemIndex = 1 then WeatherText.Text := WeatherText.Text + _(Format('Cloudy (1/8 - 2/8) in %s feet', [CLOUDBASE.Text]));
      if CLOUDS.ItemIndex = 2 then WeatherText.Text := WeatherText.Text + _(Format('Cloudy (3/8 - 4/8) in %s feet', [CLOUDBASE.Text]));
      if CLOUDS.ItemIndex = 3 then WeatherText.Text := WeatherText.Text + _(Format('Cloudy (5/8 - 7/8) in %s feet', [CLOUDBASE.Text]));
      if CLOUDS.ItemIndex = 4 then WeatherText.Text := WeatherText.Text + _(Format('Overcast in %s feet', [CLOUDBASE.Text]));

      if CLOUDTYPE.ItemIndex > 0 then begin
        if CLOUDS.ItemIndex > 0 then WeatherText.Text := WeatherText.Text + ' ';
        WeatherText.Text := WeatherText.Text + '('+CLOUDTYPE.Items[CLOUDTYPE.ItemIndex]+')';
      end;

      CLOUDBASE.Enabled := true;
      CLOUDTYPE.Enabled := true;
    end;

    { ------------------------------------------------------------------------ }

  end;
end;

function TFInput.CanEdit(Default : Boolean) : Boolean;
begin
  try Result := Default;
    if (StrToBool(FlWindow.GetActive.Settings.Values['DisallowChange'])) then begin
      Result := false;

      if ((StrToBool(FlWindow.GetActive.Settings.Values['AllowLastEdit'])) and (FlWindow.GetActive.Grid.Row = FlWindow.GetActive.Grid.RowCount-1)) then
        Result := true;
    end;
  except end;
end;

initialization
  {$i Input.lrs}
  {$i Input.lrs}
  {$i Input.lrs}

end.
