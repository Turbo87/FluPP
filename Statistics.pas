unit Statistics;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, CheckLst, Grids, Math,
  ImgList, StrUtils, JvExGrids, JvStringGrid, gnugettext, JvExStdCtrls,
  JvButton, JvCtrls;

type
  TKat = array of record
    Name: String;
    Value: String;
    Value2: String;
  end;
  TGraphData = array of record
    Flights: Word;
    Time: String;
    Passengers: Word;
    W,F,E,A,G: Word;
    Distance: Real;
    DistanceTime: String;
    CfF, CfC, LaF, EfF : Real;
    Kat: TKat;
    CTime: TKat;
    Contest: TKat;
  end;
  TStatData = array of record
    GraphData: TGraphData;
    Name: String;
    Flights: Word;
    Time: String;
    Passengers: Word;
    F,W,E,A,G: Word;
    Distance: Real;
    LastStart : String;
    DistanceTime: String;
    CfF, CfC, LaF, EfF : Real;
    Kat: TKat;
    CTime: TKat;
    Contest: TKat;
  end;
  TFStatistics = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    BitBtn1: TJvImgBtn;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label23: TLabel;
    Label37: TLabel;
    PanelDatum: TPanel;
    PanelSchein: TPanel;
    PanelStarts: TPanel;
    CBStFrom: TEdit;
    CBStTo: TEdit;
    PanelJahre: TPanel;
    CBJFrom: TComboBox;
    CBJTo: TComboBox;
    RBJahre: TRadioButton;
    RBStarts: TRadioButton;
    RBSchein: TRadioButton;
    RBDatum: TRadioButton;
    LBFlu: TListBox;
    Panel3: TPanel;
    Bevel5: TBevel;
    Bevel10: TBevel;
    Bevel9: TBevel;
    Bevel7: TBevel;
    Bevel4: TBevel;
    Label1: TLabel;
    LabelAlleine: TLabel;
    Label2: TLabel;
    LabelBegleiter: TLabel;
    Label8: TLabel;
    LabelGesamt: TLabel;
    Label9: TLabel;
    LabelDurchn: TLabel;
    LabelGesamt2: TLabel;
    Label11: TLabel;
    LabelSDurchn: TLabel;
    LabelSGesZeit: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    LabelSGesStart: TLabel;
    Label14: TLabel;
    LabelSName: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    LabelSW: TLabel;
    Label29: TLabel;
    LabelSF: TLabel;
    LabelSE: TLabel;
    Label30: TLabel;
    LabelSStrecke: TLabel;
    Label31: TLabel;
    LabelGStrecke: TLabel;
    Label32: TLabel;
    LabelSDGeschw: TLabel;
    LabelGDGeschw: TLabel;
    Label33: TLabel;
    Label26: TLabel;
    Label21: TLabel;
    LabelFrom: TLabel;
    Label22: TLabel;
    LabelTo: TLabel;
    Bevel8: TBevel;
    Label15: TLabel;
    Bevel2: TBevel;
    Label16: TLabel;
    CLBKat: TCheckListBox;
    SGDetail: TJvStringGrid;
    Label3: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    RBKatAnd: TRadioButton;
    RBKatOr: TRadioButton;
    Bevel18: TBevel;
    Label18: TLabel;
    LabelSA: TLabel;
    LabelSG: TLabel;
    Label20: TLabel;
    Label24: TLabel;
    ButtonTabGesamt: TBitBtn;
    ButtonGraphGesamt: TBitBtn;
    ButtonTabDetail: TBitBtn;
    ButtonGraphDetail: TBitBtn;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    RGDistUnit: TRadioGroup;
    BitBtn2: TJvImgBtn;
    LabelCalcTime: TLabel;
    Bevel3: TBevel;
    Bevel6: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LabelWinde: TLabel;
    LabelFSch: TLabel;
    LabelEigen: TLabel;
    Label10: TLabel;
    LabelFluege: TLabel;
    LabelFluege2: TLabel;
    Label19: TLabel;
    LabelAuto: TLabel;
    LabelGummi: TLabel;
    Label35: TLabel;
    Label17: TLabel;
    LabelPIC: TLabel;
    Bevel19: TBevel;
    CBKatGes: TComboBox;
    GridKatG: TJvStringGrid;
    CBKatDetail: TComboBox;
    GridKatDetail: TJvStringGrid;
    CBDateFrom: TDateTimePicker;
    CBDateTo: TDateTimePicker;
    Label25: TLabel;
    LabelPassengers: TLabel;
    Label36: TLabel;
    LabelAvPassengers: TLabel;
    Bevel14: TBevel;
    Label39: TLabel;
    LabelPassenger: TLabel;
    Label34: TLabel;
    Label38: TLabel;
    LabelSDPassengers: TLabel;
    LabelSDAvPassengers: TLabel;
    RGDefaultTime: TRadioGroup;
    CBDetail: TComboBox;
    CheckBox1: TCheckBox;
    Bevel15: TBevel;
    Label40: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    TCSum: TLabel;
    TCEfF: TLabel;
    TCLaF: TLabel;
    TCCfC: TLabel;
    TCCfF: TLabel;
    LabelSName2: TLabel;
    Bevel16: TBevel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    SCCfF: TLabel;
    SCCfC: TLabel;
    SCLaF: TLabel;
    SCEfF: TLabel;
    SCSum: TLabel;
    LastStart: TLabel;
    procedure ButtonStatStartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBJFromChange(Sender: TObject);
    procedure CBJToChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RBClick(Sender: TObject);
    procedure CBDateExit(Sender: TObject);
    procedure LBFluClick(Sender: TObject);
    procedure ButtonJVClick(Sender: TObject);
    procedure DetailChange(Sender: TObject);
    procedure CLBKatClickCheck(Sender: TObject);
    procedure CBKatGesChange(Sender: TObject);
    procedure CBKatDetailChange(Sender: TObject);
    procedure SGDetailSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure SGDetailGetCellAlignment(Sender: TJvStringGrid; AColumn, ARow: Integer; State: TGridDrawState; var CellAlignment: TAlignment);
    procedure FormCreate(Sender: TObject);
    procedure GridKatDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  private
    SGDetailRow : Integer;
    PStatData: ^TStatData;
    GSNr: Word;
    Aircraft: TStatData;
    CoPilot: TStatData;
    Pilot: TStatData;
    AircraftID: TStatData;
    Startort: TStatData;
    Landeort: TStatData;
    GraphData: TGraphData;
    CTime: TKat;
    Kat: TKat;
    Contest: TKat;
    procedure DrawTab;
    procedure ClearDetail;
    procedure FillSGDetail(Data: TStatData);
    function FindInKat(var Kat: TKat; Value: String):Word;
    function FindKat(KatName: String; Kat: TKat):Integer;
  public
    procedure DrawGraph;
    procedure onHint(Sender: TObject);
end;

var
  FStatistics: TFStatistics;

  StartYear, Years: Word;
  DGraphData: TGraphData;
  StatDistUnit: String;

implementation

uses Main, Settings, Grid, StatGraph, Tools, ToolsGrid;

{$R *.DFM}


// ----------------------------------------------------------------
// Form Create
// ----------------------------------------------------------------
procedure TFStatistics.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self);
  CBKatGes.ItemIndex := 0;
  CBKatDetail.ItemIndex := 0;
  GridKatG.Selection := DeselectRect;
  GridKatDetail.Selection := DeselectRect;
  CBDetail.ItemIndex := 0;
end;

// ----------------------------------------------------------------
// Form show
// ----------------------------------------------------------------
procedure TFStatistics.FormShow(Sender: TObject);
var
  i,j: Word;
begin
  SCCfF.Caption := '0'+DecimalSeparator+'00 '+GenSettings.Values['Currency'];
  SCCfC.Caption := '0'+DecimalSeparator+'00 '+GenSettings.Values['Currency'];
  SCLaF.Caption := '0'+DecimalSeparator+'00 '+GenSettings.Values['Currency'];
  SCEfF.Caption := '0'+DecimalSeparator+'00 '+GenSettings.Values['Currency'];
  SCSum.Caption := '0'+DecimalSeparator+'00 '+GenSettings.Values['Currency'];

  TCCfF.Caption := '0'+DecimalSeparator+'00 '+GenSettings.Values['Currency'];
  TCCfC.Caption := '0'+DecimalSeparator+'00 '+GenSettings.Values['Currency'];
  TCLaF.Caption := '0'+DecimalSeparator+'00 '+GenSettings.Values['Currency'];
  TCEfF.Caption := '0'+DecimalSeparator+'00 '+GenSettings.Values['Currency'];
  TCSum.Caption := '0'+DecimalSeparator+'00 '+GenSettings.Values['Currency'];

  LabelFluege.Caption := '0';
  LabelWinde.Caption := '0';
  LabelFSch.Caption := '0';
  LabelEigen.Caption := '0';
  LabelAuto.Caption := '0';
  LabelGummi.Caption := '0';
  LabelFluege.Caption := '0';
  LabelGesamt.Caption := '00:00';
  LabelGesamt2.Caption := '';
  LabelFluege2.Caption := '';
  LabelFrom.Caption := '';
  LabelTo.Caption := '' ;
  LabelPIC.Caption := '00:00';
  LabelAlleine.Caption := '00:00';
  LabelBegleiter.Caption := '00:00';
  LabelDurchn.Caption := '00:00';
  LabelCalcTime.Caption := '';

  CBDateFrom.Date := now();
  CBDateTo.Date := now();

  GridKatG.ColWidths[0] := 75;
  GridKatG.ColWidths[1] := 60;
  GridKatG.ColWidths[2] := 60;
  GridKatG.Cells[0,0]  := '';
  GridKatG.Cells[1,0]  := '';
  GridKatG.Cells[2,0]  := '';

  GridKatDetail.ColWidths[0] := 75;
  GridKatDetail.ColWidths[1] := 60;
  GridKatDetail.ColWidths[2] := 60;
  GridKatDetail.Cells[0,0]  := '';
  GridKatDetail.Cells[1,0]  := '';
  GridKatDetail.Cells[2,0]  := '';

  ClearDetail;

  for i := 0 to 5 do
    for j := 1 to SGDetail.RowCount do SGDetail.Cells[i,j] := '';
  SGDetail.RowCount := 2;

  SGDetail.HideCol(0);
  for i := 4 to 17 do SGDetail.HideCol(i);

  SGDetail.RowHeights[0] := 20;
  SGDetail.Cells[1,0]  := CBDetail.Text;
  SGDetail.Cells[2,0]  := _('Time');
  SGDetail.Cells[3,0]  := _('Flights');
  SGDetail.ColWidths[1] := 100;
  SGDetail.ColWidths[2] := 50;
  SGDetail.ColWidths[3] := 40;

  Application.OnHint := onHint;

  ButtonGraphGesamt.Enabled:= False;
  ButtonGraphDetail.Enabled:= False;
  ButtonTabGesamt.Enabled:= False;
  ButtonTabDetail.Enabled:= False;

  FStat_Graph.CBY1.ItemIndex := 0;
  FStat_Graph.CBY2.ItemIndex := 1;

  { Categoriesn hinzufï¿½gen }
  LBFlu.Items.Clear;
  CLBKat.Clear;
  for i := 0 to FMain.MDIChildCount-1 do
  begin
    LBFlu.Items.Add(GridChild(i).Caption);
    if GridChild(i).ACCategories.Count > 0 then
    for j := 0 to GridChild(i).ACCategories.Count-1 do
    begin
      if CLBKat.Items.IndexOf(GridChild(i).ACCategories[j]) = -1 then
        CLBKat.Items.Add(GridChild(i).ACCategories[j]);
     end;
  end;

  RGDistUnit.ItemIndex := RGDistUnit.Items.IndexOf(GridActiveChild.Settings.Values['DistUnit']);
  RGDefaultTime.ItemIndex := StrToInt(GridActiveChild.Settings.Values['DefaultTime']);

  LabelGStrecke.Caption := '0 '+RGDistUnit.Items[RGDistUnit.ItemIndex];
  LabelGDGeschw.Caption := '0 '+GetSpeedUnit(RGDistUnit.Items[RGDistUnit.ItemIndex]);
  LabelSStrecke.Caption := '0 '+RGDistUnit.Items[RGDistUnit.ItemIndex];
  LabelSDGeschw.Caption := '0 '+GetSpeedUnit(RGDistUnit.Items[RGDistUnit.ItemIndex]);

  LBFlu.Selected[0] := True;
  LBFluClick(self);
end;

// ----------------------------------------------------------------
// Clear detail view
// ----------------------------------------------------------------
procedure TFStatistics.ClearDetail;
begin
  LabelSName.Caption := '';
  LabelSName2.Caption := '';
  CBKatDetail.Enabled := False;
  LabelSW.Caption := '0';
  LabelSF.Caption := '0';
  LabelSE.Caption := '0';
  LabelSA.Caption := '0';
  LabelSG.Caption := '0';
  LabelSDurchn.Caption := '0:00';
  LabelSGesZeit.Caption := '0.00 %';
  LabelSGesStart.Caption := '0.00 %';
  LabelSStrecke.Caption := '0 '+RGDistUnit.Items[RGDistUnit.ItemIndex];
  LabelSDGeschw.Caption := '0 '+GetSpeedUnit(RGDistUnit.Items[RGDistUnit.ItemIndex]);
  LabelSDPassengers.Caption := '0';
  LabelSDAvPassengers.Caption := '0';

  GridKatDetail.RowCount := 1;
  GridKatDetail.Cells[0,0] := '';
  GridKatDetail.Cells[1,0] := '';
  GridKatDetail.Cells[2,0] := '';
end;

// ----------------------------------------------------------------
// on Hint
// ----------------------------------------------------------------
procedure TFStatistics.onHint(Sender: TObject);
begin
  StatusBar1.Panels[0].text := GetLongHint(Application.Hint);
end;

// ----------------------------------------------------------------
// Form close
// ----------------------------------------------------------------
procedure TFStatistics.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnHint := FMain.onHint;
end;

// ----------------------------------------------------------------
// Select flightlog
// ----------------------------------------------------------------
procedure TFStatistics.LBFluClick(Sender: TObject);
{----------}
  procedure AddYears(Nr: Word);
  var
    i: Word;
  begin
    if GridChild(Nr).Data['Num',1] <> '' then
    for i := 1 to (ExtractYear(GridChild(Nr).Data['Dat',GridChild(Nr).Grid.RowCount-1])-ExtractYear(GridChild(Nr).Data['Dat',1])) do
    begin
      CBJFrom.Items.Add(InttoStr(ExtractYear(GridChild(Nr).Data['Dat',1])+i));
      CBJTo.Items.Add(InttoStr(ExtractYear(GridChild(Nr).Data['Dat',1])+i));
    end;
  end;
{----------}
begin
  CBJTo.Items.Clear;
  CBJTo.Items.Add(_('End'));
  CBJFrom.Items.Clear;
  CBJFrom.Items.Add(_('Beginning'));

  if LBFlu.SelCount = 1 then AddYears(LBFlu.ItemIndex);
  { else
  begin
    for GridIdx := 0 to FMain.MDIChildCount do
     if GridIdx < LBFlu.Items.Count then
     if LBFlu.Selected[GridIdx] then
     begin

     end;
  end; }
  CBJFrom.ItemIndex := 0;
  CBJTo.ItemIndex := 0;
end;

// ----------------------------------------------------------------
// Fill grid for detail view
// ----------------------------------------------------------------
procedure TFStatistics.FillSGDetail(Data: TStatData);
var
  i: Word;
  canSelect : Boolean;
begin
  for i := 0 to 17 do
    SGDetail.Cells[i,1] := '';

  SGDetail.RowCount := 2;
  SGDetail.Cells[1,0]  := CBDetail.Text;
  SGDetail.Cells[2,0]  := _('Time');
  SGDetail.Cells[3,0]  := _('Flights');

  if length(Data) = 0 then
    Exit;
  for i := 0 to high(Data) do if Data[i].Name <> '' then
  begin
    SGDetail.Cells[0,i+1] := InttoStr(i);
    SGDetail.Cells[1,i+1] := Data[i].Name;
    SGDetail.Cells[2,i+1] := Data[i].Time;
    SGDetail.Cells[3,i+1] := InttoStr(Data[i].Flights);

    SGDetail.Cells[4,i+1] := InttoStr(Data[i].W);
    SGDetail.Cells[5,i+1] := InttoStr(Data[i].F);
    SGDetail.Cells[6,i+1] := InttoStr(Data[i].E);
    SGDetail.Cells[7,i+1] := InttoStr(Data[i].A);
    SGDetail.Cells[8,i+1] := InttoStr(Data[i].G);
    SGDetail.Cells[9,i+1] := FormatFloat('0',Data[i].Distance);
    SGDetail.Cells[10,i+1] := Data[i].DistanceTime;
    SGDetail.Cells[11,i+1] := InttoStr(Data[i].Passengers);

    SGDetail.Cells[12,i+1] := FormatFloat('0.00', Data[i].CfF);
    SGDetail.Cells[13,i+1] := FormatFloat('0.00', Data[i].CfC);
    SGDetail.Cells[14,i+1] := FormatFloat('0.00', Data[i].LaF);
    SGDetail.Cells[15,i+1] := FormatFloat('0.00', Data[i].EfF);
    SGDetail.Cells[16,i+1] := FormatFloat('0.00', Data[i].EfF-(Data[i].CfF+Data[i].CfC+Data[i].LaF));

    SGDetail.Cells[17,i+1] := Data[i].LastStart;

    if i > 0 then SGDetail.RowCount := i+2;
  end;

  SGDetailRow := 1;
  SGDetailSelectCell(self, 1, 1, canSelect);

  SortGridByCols([1],SGDetail);
end;

function TFStatistics.FindInKat(var Kat: TKat; Value: String):Word;
var i: Word;
begin
  if high(Kat) >= 0 then begin
    for i := 0 to High(Kat) do if Kat[i].Name = Value then begin
      Result := i;
      Exit;
    end;
  end;

  setlength(Kat,length(Kat)+1);
  Kat[length(Kat)-1].Name := Value;
  Kat[High(Kat)].Value := '0';
  Kat[High(Kat)].Value2 := '0';
  Result := length(Kat)-1;
end;

// ----------------------------------------------------------------
// Start statistics
// ----------------------------------------------------------------
procedure TFStatistics.ButtonStatStartClick(Sender: TObject);
var
  i,j,k: Integer;
  RCfF, RCfC, RLaF, REfF, RCalc : Real;
  ZGesamt, ZPIC, ZAlleine, ZBegleiter, BegleitTemp, DistanceTime, KatStr: String;
  ZWinde, ZFsch, ZEigen, ZAuto, ZGummi, StartDate, EndDate, Fluege, AnzahlStarts, Passengers: Integer;
  Distance: Real;
  YearNr: Word;
  TmpStrecke: Real;
  Accept, prevAccept, ItsIn, ItsInNot, KatSel, KatSelNot, ItsInNotP, FlightsFound: Boolean;
  X,Faktor: Real;
  GridIdx: Word;
  tick_now: array[0..1] of Longint;
{----------}
  { Time categories }
  procedure AddCTime(var CTime: TKat);
  var
    l: word;
    TempKat, TempStr: String;
  begin
    for l := 1 to length(GridChild(GridIdx).data['CTi',i]) do
    begin
      if (GridChild(GridIdx).data['CTi',i][l] = '|') then
      begin
        TempKat := TempStr;
        TempStr := '';
      end
      else if (GridChild(GridIdx).data['CTi',i][l] = '/') then
      begin
        CTime[FindInKat(CTime,TempKat)].Value := AddTime(CTime[FindInKat(CTime,TempKat)].Value,TempStr);
        TempStr := '';
      end
      else TempStr := TempStr + GridChild(GridIdx).data['CTi',i][l];
    end;
  end;
{----------}
  { Categories }
  procedure AddKat(var Kat: TKat);
  var
    l, TempKat: word;
    TempStr: String;
  begin
    for l := 1 to length(GridChild(GridIdx).data['Cat',i]) do
    begin
      if (GridChild(GridIdx).data['Cat',i][l] = '/') then
      begin
        TempKat := FindInKat(Kat,TempStr);
        Kat[TempKat].Value := InttoStr(StrtoInt(Kat[TempKat].Value) + AnzahlStarts);
        TempStr := '';
      end
      else TempStr := TempStr + GridChild(GridIdx).data['Cat',i][l];
    end;
  end;
{----------}
  { Contest categories }
  procedure AddContest(var Contest: TKat);
  var
    l, pos: word;
    tempKat, tempStr: String;
    tmpDistance: Real;
  begin
    pos := 0;
    for l := 1 to length(GridChild(GridIdx).data['Con',i]) do
    begin
      if (GridChild(GridIdx).data['Con',i][l] = '|') then
      begin
        if pos = 0 then
        begin
          tempKat := tempStr;
          tempStr := '';
          inc(pos);
        end
        else
        if pos = 1 then
        begin
          tmpDistance := ConvertDistUnits(StrToFloat(Contest[FindInKat(Contest,tempKat)].Value),GridChild(GridIdx).Settings.Values['DistUnit'],StatDistUnit);
          Contest[FindInKat(Contest,tempKat)].Value := FloatToStr(tmpDistance + StrToFloat(tempStr));
          inc(pos);
          tempStr := '';
        end;
      end
      else if (GridChild(GridIdx).data['Con',i][l] = '/') then
      begin
        Contest[FindInKat(Contest,tempKat)].Value2 := FloatToStr(StrToFloat(Contest[FindInKat(Contest,tempKat)].Value2) + StrToFloat(tempStr));
        tempStr := '';
        pos := 0;
      end
      else tempStr := tempStr + GridChild(GridIdx).data['Con',i][l];
    end;
  end;
{----------}
  { TStatData-Records ausfüllen }
  procedure AddData(var StatData: TStatData; j: Word);
  begin
    StatData[j].Time := CalcTime(GridIdx, StatData[j].Time,i,i, RGDefaultTime.ItemIndex);
    StatData[j].LastStart := GridChild(GridIdx).Data['Dat',i];
    inc(StatData[j].Flights,AnzahlStarts);
    if GridChild(GridIdx).Data['Pas',i] <> '' then
    begin
      inc(StatData[j].Passengers, StrToInt(GridChild(GridIdx).Data['Pas',i]));
      inc(StatData[j].GraphData[YearNr].Passengers, StrToInt(GridChild(GridIdx).Data['Pas',i]));
    end;
    AddCTime(StatData[j].CTime);
    AddCTime(StatData[j].GraphData[YearNr].CTime);
    AddKat(StatData[j].Kat);
    AddKat(StatData[j].GraphData[YearNr].Kat);
    AddContest(StatData[j].Contest);
    AddContest(StatData[j].GraphData[YearNr].Contest);
    if GridChild(GridIdx).Data['ToS',i] = 'W' then
    begin
      inc(StatData[j].W,AnzahlStarts);
      inc(StatData[j].GraphData[YearNr].W,AnzahlStarts);
    end;
    if GridChild(GridIdx).Data['ToS',i] = 'F' then
    begin
      inc(StatData[j].F,AnzahlStarts);
      inc(StatData[j].GraphData[YearNr].F,AnzahlStarts);
    end;
    if GridChild(GridIdx).Data['ToS',i] = 'E' then
    begin
      inc(StatData[j].E,AnzahlStarts);
      inc(StatData[j].GraphData[YearNr].E,AnzahlStarts);
    end;
    if GridChild(GridIdx).Data['ToS',i] = 'A' then
    begin
      inc(StatData[j].A,AnzahlStarts);
      inc(StatData[j].GraphData[YearNr].A,AnzahlStarts);
    end;
    if GridChild(GridIdx).Data['ToS',i] = 'G' then
    begin
      inc(StatData[j].G,AnzahlStarts);
      inc(StatData[j].GraphData[YearNr].G,AnzahlStarts);
    end;
    if GridChild(GridIdx).Data['CfF',i] > '' then begin
      try
        StatData[j].CfF := StatData[j].CfF + StrToFloat(GridChild(GridIdx).Data['CfF',i]);
        StatData[j].GraphData[YearNr].CfF := StatData[j].GraphData[YearNr].CfF + StrToFloat(GridChild(GridIdx).Data['CfF',i]);
      except end;
    end;
    if GridChild(GridIdx).Data['CfC',i] > '' then begin
      try
        StatData[j].CfC := StatData[j].CfC + StrToFloat(GridChild(GridIdx).Data['CfC',i]);
        StatData[j].GraphData[YearNr].CfC := StatData[j].GraphData[YearNr].CfC + StrToFloat(GridChild(GridIdx).Data['CfC',i]);
      except end;
    end;
    if GridChild(GridIdx).Data['LaF',i] > '' then begin
      try
        StatData[j].LaF := StatData[j].LaF + StrToFloat(GridChild(GridIdx).Data['LaF',i]);
        StatData[j].GraphData[YearNr].LaF := StatData[j].GraphData[YearNr].LaF + StrToFloat(GridChild(GridIdx).Data['LaF',i]);
      except end;
    end;
    if GridChild(GridIdx).Data['EfF',i] > '' then begin
      try
        StatData[j].EfF := StatData[j].EfF + StrToFloat(GridChild(GridIdx).Data['EfF',i]);
        StatData[j].GraphData[YearNr].EfF := StatData[j].GraphData[YearNr].EfF + StrToFloat(GridChild(GridIdx).Data['EfF',i]);
      except end;
    end;

    inc(StatData[j].GraphData[YearNr].Flights,AnzahlStarts);
    StatData[j].GraphData[YearNr].Time := CalcTime(GridIdx, StatData[j].GraphData[YearNr].Time,i,i, RGDefaultTime.ItemIndex);
    if TmpStrecke > 0 then
    begin
      StatData[j].Distance := StatData[j].Distance + TmpStrecke;
      StatData[j].DistanceTime := CalcTime(GridIdx, StatData[j].DistanceTime,i,i, RGDefaultTime.ItemIndex);
      StatData[j].GraphData[YearNr].DistanceTime := CalcTime(GridIdx, StatData[j].GraphData[YearNr].DistanceTime,i,i, RGDefaultTime.ItemIndex);
      StatData[j].GraphData[YearNr].Distance := StatData[j].GraphData[YearNr].Distance + TmpStrecke;
    end;
  end;
{----------}
  { Prüfen ob TStatData-Record schon vorhanden }
  procedure AddDetail(var StatData: TStatData; Data: String);
  var j: Integer;
  begin
    if GridChild(GridIdx).data[Data,i] = '' then Exit;
    ItsIn := False;
    if length(StatData)>0 then
      for j := 0 to length(StatData)-1 do
    begin
      if GridChild(GridIdx).data[Data,i] = StatData[j].Name then
      begin
        Itsin := True;
        AddData(StatData,j);
        Break;
      end;
    end;
    if not ItsIn then
    begin
      SetLength(StatData,length(StatData)+1);
      SetLength(StatData[length(StatData)-1].GraphData,years);
      StatData[length(StatData)-1].Name := GridChild(GridIdx).data[Data,i];
      AddData(StatData,length(StatData)-1);
    end;
  end;
{----------}
  procedure Reset(var StatData: TStatData);
  var i: Word;
  begin
    if length(StatData)=0 then
      Exit;
    for i := 0 to length(StatData)-1 do
    begin
      StatData[i].Name := '';
      StatData[i].Flights := 0;
      StatData[i].Time := '00:00';
      StatData[i].W := 0;
      StatData[i].F := 0;
      StatData[i].E := 0;
      StatData[i].A := 0;
      StatData[i].G := 0;
      StatData[i].Distance := 0;
      StatData[i].LastStart := '';
      StatData[i].DistanceTime := '00:00';
      StatData[i].CfF := 0;
      StatData[i].CfC := 0;
      StatData[i].LaF := 0;
      StatData[i].EfF := 0;
      SetLength(StatData[i].GraphData,0);
      SetLength(StatData[i].CTime,0);
      SetLength(StatData[i].Kat,0);
      SetLength(StatData[i].Contest,0);
    end;
    SetLength(STatData,0);
  end;
{----------}
begin
  { Initialisierung }
  tick_now[0] := GetTickCount;
  ZPIC := '00:00'; ZGesamt := '00:00'; ZAlleine := '00:00'; ZBegleiter := '00:00'; DistanceTime := '00:00';
  ZWinde := 0; ZFsch := 0; ZEigen := 0; ZAuto := 0; ZGummi := 0;
  Fluege := 0; Distance := 0; Faktor := 0; StartYear := 0; Passengers := 0;
  RCfF := 0; RCfC := 0; RLaF := 0; REfF := 0; RCalc := 0;
  LabelFluege2.Caption := ''; LabelGesamt2.Caption := '';
  LabelCalcTime.Caption := '';
  FlightsFound := False;
  prevAccept := False;
  Accept := False;
  LabelFrom.Caption := '';
  LabelTo.Caption := '';
  ButtonGraphGesamt.Enabled:= False;
  ButtonGraphDetail.Enabled:= False;
  ButtonTabGesamt.Enabled:= False;
  ButtonTabDetail.Enabled:= False;

  Reset(Aircraft);
  Reset(AircraftID);
  Reset(Pilot);
  Reset(CoPilot);
  Reset(Startort);
  Reset(Landeort);
  SetLength(CTime,0);
  SetLength(Kat,0);
  SetLength(Contest,0);

  GridKatG.RowCount := 1;
  GridKatG.Cells[0,0] := '';
  GridKatG.Cells[1,0] := '';

  CBKatGes.ItemIndex := 0;

  SetLength(CoPilot, 1);
  CoPilot[0].Name := ' '+_('With passenger');

  try
    Screen.Cursor := crHourGlass;
    
    case RGDistUnit.ItemIndex of
      0: StatDistUnit := 'km';
      1: StatDistUnit := 'nm';
      2: StatDistUnit := 'miles';
    end;

    If LBFlu.SelCount = 0 then
    begin
      exit;
    end;

    { Gültiger Wert in Flights? }
    if RBStarts.checked then
    begin
      try StrToInt(CBSTFrom.Text)
      except
        on EConvertError do
        begin
          MessageDlg(_('Please enter a number'),mtError,[mbOK],0);
          ActiveControl := CBSTFrom;
          Exit;
        end;
      end;
      try
        StrToInt(CBSTTo.Text)
      except
        on EConvertError do
        begin
          MessageDlg(_('Please enter a number'),mtError,[mbOK],0);
          ActiveControl := CBSTTo;
          Exit;
        end;
      end;
    end;

    { Startjahr für Statistik }
    SetLength(GraphData,0);
    Years := 0;
    for GridIdx := 0 to FMain.MDIChildCount do if GridIdx < LBFlu.Items.Count then
    if LBFlu.Selected[GridIdx] then
    if GridChild(GridIdx).Data['Num',1] <> '' then
    begin

    { Auswahl nach Jahren }
    if RBJahre.checked then
    begin
      if CBJFrom.Text = _('Beginning') then StartDate := ExtractYear(GridChild(GridIdx).Data['Dat',1])
      else StartDate := StrtoInt(CBJFrom.Text);
      if CBJTo.Text = _('End') then EndDate := ExtractYear(GridChild(GridIdx).Data['Dat',GridChild(GridIdx).Grid.RowCount-1])+1
      else EndDate := StrtoInt(CBJTo.Text);
      if CBJFrom.Text = _('Beginning') then LabelFrom.Caption := _('Start')+' '
        +GridChild(GridIdx).Data['Dat',1]
        +' am '+GridChild(GridIdx).Data['Dat',1];
      if CBJTo.Text = _('End') then LabelTo.Caption := _('Start')+' '
        +GridChild(GridIdx).Data['Num',GridChild(GridIdx).Grid.RowCount-1]
        +' am '+GridChild(GridIdx).Data['Dat',GridChild(GridIdx).Grid.RowCount-1];
    end;

    if (StartYear > ExtractYear(GridChild(GridIdx).Data['Dat',1])) or (StartYear = 0) then
      StartYear := ExtractYear(GridChild(GridIdx).Data['Dat',1]);
    if years < ExtractYear(GridChild(GridIdx).Data['Dat',GridChild(GridIdx).Grid.RowCount-1])
      - ExtractYear(GridChild(GridIdx).Data['Dat',1])+1 then
         Years := ExtractYear(GridChild(GridIdx).Data['Dat',GridChild(GridIdx).Grid.RowCount-1])
         - ExtractYear(GridChild(GridIdx).Data['Dat',1])+1;

      SetLength(GraphData,Length(GraphData)+years);
    end;
  { Schleife über alle Flugbücher }
    for GridIdx := 0 to FMain.MDIChildCount do if GridIdx < LBFlu.Items.Count then
    begin
      GSNr := GridIdx;
      { für alle ausgewählten Scheine }
      if LBFlu.Selected[GridIdx] then
      if GridChild(GridIdx).Data['Num',1] <> '' then
      begin
        { Wenn Seit Schein: "Schein Seit" ausgefüllt? }
        if RBSchein.checked then
        begin
          if GridChild(GridIdx).Settings.Values['LicenseSince'] = '  .  .    ' then
          begin
            Messagedlg(_('Please fill out "License obtained"!'),mtWarning,[mbOK],0);
            with FSettings.Create(Application) do
            try
              FSettings.PageControl.ActivePageIndex := 3;
              ShowModal;
            finally
              Free;
            end;
            if GridChild(GridIdx).Settings.Values['LicenseSince'] = '  .  .    ' then Exit;
          end;
        end;

  { Main loop }
        for i := 1 to GridChild(GridIdx).Grid.RowCount-1 do
        begin
          { Auswahl nach Jahren }
          if RBJahre.checked then
          begin
            Accept := False;
            if (ExtractYear(GridChild(GridIdx).Data['Dat',i]) >= StartDate)
              and (ExtractYear(GridChild(GridIdx).Data['Dat',i]) < EndDate)
            then  Accept := True;
          end;

          { Auswahl nach Datum }
          if RBDatum.checked then
          begin
            if (StrToDate(GridChild(GridIdx).Data['Dat',i]) >= CBDateFrom.Date)
              and (StrToDate(GridChild(GridIdx).Data['Dat',i]) <= CBDateTo.Date)
            then  Accept := True
            else  Accept := False;
          end;

          { Auswahl nach Flights }
          if RBStarts.checked then
          begin
            Accept := False;
            if (StrtoInt(GridChild(GridIdx).Data['Num',i]) >= (StrtoInt(CBStFrom.Text)))
              and (StrtoInt(GridChild(GridIdx).Data['Num',i]) <= (StrtoInt(CBStTo.Text)))
            then Accept := True;
          end;

          { Seit Schein }
          if RBSchein.checked then
          begin
            if (StrToDate(GridChild(GridIdx).Data['Dat',i]) > StrToDate(GridChild(GridIdx).Settings.Values['LicenseSince']))
            then Accept := True
            else Accept := False;
          end;

          { Categoriesn }
          ItsIn := False;
          ItsInNot := False;
          KatSel := False;
          KatSelNot := False;
          ItsInNotP := False;
          if (Accept) and (CLBKat.Count > 0) then
          for j := 0 to CLBKat.Count-1 do if (CLBKat.State[j] = cbChecked) or (CLBKat.State[j] = cbGrayed) then
          begin
            if CLBKat.State[j] = cbChecked then KatSel := True;
            if CLBKat.State[j] = cbGrayed then KatSelNot := True;
            if RBKatAnd.Checked then ItsIn := False;
            if RBKatAnd.Checked then ItsInNot := False;
            k := 0;
            while k < length(GridChild(GridIdx).data['Cat',i]) do
            begin
              if (GridChild(GridIdx).data['Cat',i][k+1] = '/') then
              begin
                if KatStr = CLBKat.Items.Strings[j] then
                begin
                  if CLBKat.State[j] = cbChecked then ItsIn := True;
                  if CLBKat.State[j] = cbGrayed then ItsInNot := True;
                end
                else if RBKatOr.Checked and (CLBKat.State[j] = cbGrayed) then ItsInNotP := True;
                KatStr := '';
              end
              else KatStr := KatStr + GridChild(GridIdx).data['Cat',i][k+1];
              inc(k);
            end;
            if RBKatAnd.Checked then
            begin
              if (CLBKat.State[j] = cbChecked) and (not ItsIn) then Accept := False;
              if (CLBKat.State[j] = cbGrayed) and (ItsinNot) then Accept := False;
            end;
          end;
          if RBKatOr.Checked then
          begin
            Accept := False;
            if (KatSel and ItsIn) or (KatSelNot and not ItsInNot) then Accept := True;
            if ItsInNotP then Accept := True;
            if CLBKat.SelCount = 0 then Accept := True;
          end;

          { Start- und Endflug }
          if accept and not prevaccept then //erster Flug
            LabelFrom.Caption := _('Start')+' '+GridChild(GridIdx).Data['Num',i]
                  +' '+_('on')+' '+GridChild(GridIdx).Data['Dat',i];
          if not accept and prevaccept and (i>1) then // letzter Flug
            LabelTo.Caption := _('Start')+' '+GridChild(GridIdx).Data['Num',i-1]
                  +' '+_('on')+' '+GridChild(GridIdx).Data['Dat',i-1];
          prevaccept := accept;

  { Statistikerhebung }
          if Accept then
          begin
            FlightsFound := True;
            AnzahlStarts := StrToInt(GridChild(GridIdx).Data['NoL',i]);
            if GridChild(GridIdx).Data['Dst',i] <> '' then
            TmpStrecke := ConvertDistUnits(StrtoInt(GridChild(GridIdx).Data['Dst',i]),GridChild(GridIdx).Settings.Values['DistUnit'],StatDistUnit)
            else TmpStrecke := 0;

            { Allgemein }
            inc(Fluege,AnzahlStarts);
            ZGesamt := CalcTime(GridIdx, ZGesamt,i,i, RGDefaultTime.ItemIndex);
            YearNr  := ExtractYear(GridChild(GridIdx).Data['Dat',i])-StartYear;
            inc(GraphData[YearNr].Flights,AnzahlStarts);
            if GridChild(GridIdx).Data['Pas',i] <> '' then
            begin
              inc(Passengers, StrToInt(GridChild(GridIdx).Data['Pas',i]));
              inc(GraphData[YearNr].Passengers, StrToInt(GridChild(GridIdx).Data['Pas',i]));
            end;
            GraphData[YearNr].Time := CalcTime(GridIdx, GraphData[YearNr].Time,i,i, RGDefaultTime.ItemIndex);
            AddCTime(CTime);
            AddCTime(GraphData[YearNr].CTime);
            AddKat(Kat);
            AddKat(GraphData[YearNr].Kat);
            AddContest(Contest);
            AddContest(GraphData[YearNr].Contest);
            if TmpStrecke > 0 then
            begin
              Distance := Distance + TmpStrecke;
              DistanceTime := CalcTime(GridIdx, DistanceTime,i,i, RGDefaultTime.ItemIndex);
              GraphData[YearNr].DistanceTime := CalcTime(GridIdx, GraphData[YearNr].DistanceTime,i,i, RGDefaultTime.ItemIndex);
              GraphData[YearNr].Distance := GraphData[YearNr].Distance + TmpStrecke;
            end;
            if GridChild(GridIdx).Data['Pi1',i] = GenSettings.Values['PilotName'] then
              ZPIC := CalcTime(GridIdx, ZPIC,i,i, RGDefaultTime.ItemIndex);
            if GridChild(GridIdx).Data['Pi2',i] = '' then ZAlleine := CalcTime(GridIdx, ZAlleine,i,i, RGDefaultTime.ItemIndex)
            else
            if GridChild(GridIdx).Data['Pi2',i] <> '' then ZBegleiter := CalcTime(GridIdx, ZBegleiter,i,i, RGDefaultTime.ItemIndex);
            if GridChild(GridIdx).Data['ToS',i] = 'W' then
            begin
              inc(ZWinde, AnzahlStarts);
              inc(GraphData[YearNr].W, AnzahlStarts)
            end;
            if GridChild(GridIdx).Data['ToS',i] = 'F' then
            begin
              inc(ZFsch,AnzahlStarts);
              inc(GraphData[YearNr].F,AnzahlStarts)
            end;
            if GridChild(GridIdx).Data['ToS',i] = 'E' then
            begin
              inc(ZEigen,AnzahlStarts);
              inc(GraphData[YearNr].E,AnzahlStarts)
            end;
            if GridChild(GridIdx).Data['ToS',i] = 'A' then
            begin
              inc(ZAuto,AnzahlStarts);
              inc(GraphData[YearNr].A,AnzahlStarts)
            end;
            if GridChild(GridIdx).Data['ToS',i] = 'G' then
            begin
              inc(ZGummi,AnzahlStarts);
              inc(GraphData[YearNr].G,AnzahlStarts)
            end;
            AddDetail(Aircraft,'ATy');
            AddDetail(AircraftID,'AId');
            AddDetail(Startort,'StL');
            AddDetail(Landeort,'LaL');
            AddDetail(Pilot,'Pi1');

            { AddDetail CoPilot }
            j:= 0;
            ItsIn := False;
            if GridChild(GridIdx).Data['Pi2',i] = '' then
              BegleitTemp := ' '+_('Solo') else BegleitTemp := GridChild(GridIdx).Data['Pi2',i];
            if length(CoPilot) > 0 then
            begin
              for j := 0 to length(CoPilot)-1 do
            begin
              if BegleitTemp = CoPilot[j].Name then
              begin
                Itsin := True;
                AddData(CoPilot,j);
                break;
              end;
            end;
            if GridChild(GridIdx).Data['Pi2',i] <> '' then
            begin
              SetLength(CoPilot[0].GraphData,years);
              AddData(CoPilot,0);
            end;
            end;
            if not ItsIn then
            begin
              SetLength(CoPilot,length(CoPilot)+1);
              SetLength(CoPilot[length(CoPilot)-1].GraphData,years);
              CoPilot[length(CoPilot)-1].Name := BegleitTemp;
              AddData(CoPilot,length(CoPilot)-1);
            end;

            { Costs }
            try if GridChild(GridIdx).Data['CfF',i] > '' then RCfF := RCfF + StrToFloat(GridChild(GridIdx).Data['CfF',i]) except end;
            try if GridChild(GridIdx).Data['CfC',i] > '' then RCfC := RCfC + StrToFloat(GridChild(GridIdx).Data['CfC',i]) except end;
            try if GridChild(GridIdx).Data['LaF',i] > '' then RLaF := RLaF + StrToFloat(GridChild(GridIdx).Data['LaF',i]) except end;
            try if GridChild(GridIdx).Data['EfF',i] > '' then REfF := REfF + StrToFloat(GridChild(GridIdx).Data['EfF',i]) except end;

          end; { if Accept then }
        end; { for i := 1 to GridChild(LBFlu.ItemIndex).Grid.RowCount-1 do }

        if (CBJFrom.Text = _('Beginning')) and (RBJahre.checked) then
        begin
          if GridChild(GridIdx).Settings.Values['BFTime'] <> '00000:00' then
            LabelGesamt2.Caption := '('+AddTime(ZGesamt,GridChild(GridIdx).Settings.Values['BFTime'])+')';

          if StrtoInt(GridChild(GridIdx).Settings.Values['BFStarts']) > 0 then
            LabelFluege2.Caption := '('+InttoStr(Fluege + StrtoInt(GridChild(GridIdx).Settings.Values['BFStarts']))+')';
        end;
      end; { if LBFlu.Selected[GridIdx] }
     end; { if GridIdx < LBFlu.Items.Count }

  { Auswertung  }
    if not FlightsFound then
    begin
      CBDetail.ItemIndex := 0;
      DetailChange(Self);

      messagedlg(_('No data found'),mtInformation,[mbOK],0);
      Exit;
    end
    else
    begin
      ButtonGraphGesamt.Enabled:= True;
      ButtontabGesamt.Enabled:= True;
    end;

    if LBFlu.SelCount > 1 then //noch ï¿½ndern!!
    begin
      LabelFrom.Caption := '-';
      LabelTo.Caption := '-';
    end
    else
    { LabelTo oder LabelFrom leer --> letzter oder erster Flug }
    begin
      if LabelFrom.Caption = '' then LabelFrom.Caption := _('Start')+' '+GridChild(LBFlu.ItemIndex).Data['Num',1]+' am '+GridChild(LBFlu.ItemIndex).Data['Dat',1];
      if LabelTo.Caption = '' then LabelTo.Caption := _('Start')+' '
        +GridChild(LBFlu.ItemIndex).Data['Num',GridChild(LBFlu.ItemIndex).Grid.RowCount-1]
        +' '+_('on')+' '+GridChild(LBFlu.ItemIndex).Data['Dat',GridChild(LBFlu.ItemIndex).Grid.RowCount-1];
    end;

    CBDetail.ItemIndex := 0;
    DetailChange(Self);

    TCCfF.Caption := FormatFloat('0.00', RCfF)+' '+GenSettings.Values['Currency'];
    TCCfC.Caption := FormatFloat('0.00', RCfC)+' '+GenSettings.Values['Currency'];
    TCLaF.Caption := FormatFloat('0.00', RLaF)+' '+GenSettings.Values['Currency'];
    TCEfF.Caption := FormatFloat('0.00', REfF)+' '+GenSettings.Values['Currency'];
    TCSum.Caption := FormatFloat('0.00', REfF-(RCfF+RCfC+RLaF))+' '+GenSettings.Values['Currency'];

    LabelGesamt.Caption := ZGesamt;
    LabelPIC.Caption := ZPIC;
    LabelAlleine.Caption := ZAlleine;
    LabelBegleiter.Caption := ZBegleiter;
    LabelPassengers.Caption := InttoStr(Passengers);
    LabelAvPassengers.Caption := FormatFloat('0.00', Passengers/Fluege);
    LabelWinde.Caption := InttoStr(ZWinde);
    LabelFsch.Caption := InttoStr(ZFsch);
    LabelEigen.Caption := InttoStr(ZEigen);
    LabelAuto.Caption := InttoStr(ZAuto);
    LabelGummi.Caption := InttoStr(ZGummi);
    LabelDurchn.Caption := avgTime(ZGesamt,Fluege);
    LabelFluege.Caption := InttoStr(Fluege);

    LabelGStrecke.Caption := FormatFloat('0',Distance)+' '+RGDistUnit.Items[RGDistUnit.ItemIndex];
    LabelGDGeschw.Caption := InttoStr(avgSpeed(Round(Distance),DistanceTime))+' '+GetSpeedUnit(RGDistUnit.Items[RGDistUnit.ItemIndex]);

    CBKatGesChange(Self);
    //CBKatDetailChange(Self);
    tick_now[1] := GetTickCount;
    LabelCalcTime.Caption := Format('%u ms', [tick_now[1] - tick_now[0]]);
  finally
    Screen.Cursor := crDefault;
  end;
end;

{ Anpassen der Jahreszahlen in der Detailauswahl }
procedure TFStatistics.CBJFromChange(Sender: TObject);
var
  i: Word;
begin
  if CBJFrom.Text = _('Beginning') then CBJFrom.Itemindex := 0;
  CBJTo.Items.Clear;
  CBJTo.Items.Add(_('End'));
  for i := 1 to (ExtractYear(GridActiveChild.Data['Dat',GridActiveChild.Grid.RowCount-1])
   -ExtractYear(GridActiveChild.Data['Dat',1])) do
  begin
    CBJTo.Items.Add(InttoStr(ExtractYear(GridActiveChild.Data['Dat',1])+i));
  end;
  if CBJFrom.ItemIndex <> 0 then for i := 1 to CBJFrom.ItemIndex do CBJTo.Items.Delete(1);
end;

{ Anpassen der Jahreszahlen in der Detailauswahl }
procedure TFStatistics.CBJToChange(Sender: TObject);
var
  i: Word;
begin
  if CBJTo.Text = _('End') then CBJTo.Itemindex := 0;
  CBJFrom.Items.Clear;
  CBJFrom.Items.Add(_('Beginning'));
  for i := 1 to (ExtractYear(GridActiveChild.Data['Dat',GridActiveChild.Grid.RowCount-1])
   -ExtractYear(GridActiveChild.Data['Dat',1])) do
  begin
    CBJFrom.Items.Add(InttoStr(ExtractYear(GridActiveChild.Data['Dat',1])+i));
  end;
 if CBJTo.ItemIndex <> 0 then for i := 1 to (CBJTo.Items.Count-CBJTo.ItemIndex) do CBJFrom.Items.Delete(CBJFrom.Items.Count-1);
end;

{ Detailauswahl }
procedure TFStatistics.DetailChange(Sender: TObject);
begin
  ButtonTabDetail.Enabled := False;
  ButtonGraphDetail.Enabled := False;
  ClearDetail;

  case CBDetail.ItemIndex of
    0:
      begin
        PStatData := @Aircraft;
        FillSGDetail(Aircraft);
      end;
    1:
      begin
        PStatData := @AircraftID;
        FillSGDetail(AircraftID);
      end;
    2:
      begin
        PStatData := @Pilot;
        FillSGDetail(Pilot);
      end;
    3:
      begin
        PStatData := @CoPilot;
        FillSGDetail(CoPilot);
      end;
    4:
      begin
        PStatData := @StartOrt;
        FillSGDetail(StartOrt);
      end;
    5:
      begin
        PStatData := @LandeOrt;
        FillSGDetail(LandeOrt);
      end;
  end;
end;

{ Anzeigen des richtigen Panels in der Detailauswahl }
procedure TFStatistics.RBClick(Sender: TObject);
begin
  PanelJahre.visible := False;
  PanelStarts.visible := False;
  PanelSchein.visible := False;
  PanelDatum.visible := False;

  if RBJahre.checked then PanelJahre.visible := True;
  if RBStarts.checked then PanelStarts.visible := True;
  if RBDatum.checked then PanelDatum.visible := True;
  if RBSchein.checked then PanelSchein.visible := True;
end;

{ Datum checken }
procedure TFStatistics.CBDateExit(Sender: TObject);
begin

end;

// ----------------------------------------------------------------
// SGDetail alignment
// ----------------------------------------------------------------
procedure TFStatistics.SGDetailGetCellAlignment(Sender: TJvStringGrid;
  AColumn, ARow: Integer; State: TGridDrawState;
  var CellAlignment: TAlignment);
begin
  if (AColumn = 2) or (AColumn = 3) then CellAlignment := taRightJustify
  else CellAlignment := taLeftJustify
end;

// ----------------------------------------------------------------
// select detail cell
// ----------------------------------------------------------------
procedure TFStatistics.SGDetailSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if (SGDetail.Cells[1,1] = '') then Exit;
  ClearDetail;
  
  { Detailanzeige }
  ButtonGraphDetail.Enabled:= True;
  ButtonTabDetail.Enabled:= True;
  LabelSName.Caption := SGDetail.Cells[1,ARow];
  LabelSName2.Caption := SGDetail.Cells[1,ARow];
  CBKatDetail.Enabled := True;
  LabelSW.Caption := SGDetail.Cells[4,ARow];
  LabelSF.Caption := SGDetail.Cells[5,ARow];
  LabelSE.Caption := SGDetail.Cells[6,ARow];
  LabelSA.Caption := SGDetail.Cells[7,ARow];
  LabelSG.Caption := SGDetail.Cells[8,ARow];
  LabelSStrecke.Caption := SGDetail.Cells[9,ARow]+' '+RGDistUnit.Items[RGDistUnit.ItemIndex];
  LabelSDGeschw.Caption := InttoStr(avgSpeed(Round(StrtoFloat(SGDetail.Cells[9,ARow])),SGDetail.Cells[10,ARow]))+' '+GetSpeedUnit(RGDistUnit.Items[RGDistUnit.ItemIndex]);
  LabelSStrecke.Caption := SGDetail.Cells[9,ARow]+' '+RGDistUnit.Items[RGDistUnit.ItemIndex];

  LabelSDPassengers.Caption := SGDetail.Cells[11,ARow];
  LabelSDAvPassengers.Caption := FormatFloat('0.00',StrToInt(SGDetail.Cells[11,ARow]) / StrToInt(SGDetail.Cells[3,ARow])) ;

  LabelSDurchn.Caption := avgTime(SGDetail.Cells[2,ARow], StrToInt(SGDetail.Cells[3,ARow]));
  LabelSGesZeit.Caption := CalcSGesZeit(SGDetail.Cells[2,ARow],LabelGesamt.Caption);
  LabelSGesStart.Caption := CalcSGesStart(StrtoInt(SGDetail.Cells[3,ARow]),StrtoInt(LabelFluege.Caption));

  SCCfF.Caption := SGDetail.Cells[12,ARow]+' '+GenSettings.Values['Currency'];
  SCCfC.Caption := SGDetail.Cells[13,ARow]+' '+GenSettings.Values['Currency'];
  SCLaF.Caption := SGDetail.Cells[14,ARow]+' '+GenSettings.Values['Currency'];
  SCEfF.Caption := SGDetail.Cells[15,ARow]+' '+GenSettings.Values['Currency'];
  SCSum.Caption := SGDetail.Cells[16,ARow]+' '+GenSettings.Values['Currency'];

  LastStart.Caption := SGDetail.Cells[17,ARow];

  if (StrToDate(LastStart.Caption) >= now-90) then
    LastStart.Font.Color := clGreen else LastStart.Font.Color := clRed;

  SGDetailRow := ARow;
  CBKatDetailChange(Self);
end;

// ----------------------------------------------------------------
// year stats
// ----------------------------------------------------------------
procedure TFStatistics.ButtonJVClick(Sender: TObject);
var i: Word;
begin
  { Detail }
  if (Sender = ButtonGraphDetail) or (Sender = ButtonTabDetail) then
  begin
    if SGDetailRow = 0 then
    begin
       Exit;
    end;
    FStat_Graph.Caption := format(_('Statistics from -->''%s''<-- in selected area'),[LabelSName.Caption]);
    DGraphData := PStatData^[StrToInt(SGDetail.Cells[0,SGDetailRow])].GraphData;
  end;

  { Gesamt }
  if (Sender = ButtonGraphGesamt) or (Sender = ButtonTabGesamt) then
  begin
    FStat_Graph.Caption := _('Selection of all flights in selected area');
    DGraphData := GraphData;
  end;

  { Tab }
  if (Sender = ButtonTabGesamt) or (Sender = ButtonTabDetail) then DrawTab;

  { Graph }
  if (Sender = ButtonGraphGesamt) or (Sender = ButtonGraphDetail) then
  begin
    { CB aufï¿½llen }
    FSTat_Graph.CBY1.Clear;
    FSTat_Graph.CBY1.Items.Add(_('Flights'));
    FSTat_Graph.CBY1.Items.Add(_('Time'));
    FSTat_Graph.CBY1.Items.Add(_('ï¿½-Flight Time:'));
    FSTat_Graph.CBY1.Items.Add(_('Distance'));
    FSTat_Graph.CBY1.Items.Add(_('ï¿½-Speed'));
    FSTat_Graph.CBY1.Items.Add(_('Passengers'));
    FSTat_Graph.CBY1.Items.Add(_('ï¿½-Passengers'));
    FSTat_Graph.CBY1.Items.Add('------------------------------');
    FSTat_Graph.CBY1.Items.Add(_('Costs:')+' '+_('Aircraft'));
    FSTat_Graph.CBY1.Items.Add(_('Costs:')+' '+_('Crew'));
    FSTat_Graph.CBY1.Items.Add(_('Costs:')+' '+_('Landing'));
    FSTat_Graph.CBY1.Items.Add(_('Costs:')+' '+_('Earning'));
    FSTat_Graph.CBY1.Items.Add(_('Costs:')+' '+_('Total Overview'));

    if high(Kat) >= 0 then begin
      FSTat_Graph.CBY1.Items.Add('------------------------------');
      for i := 0 to high(Kat) do FSTat_Graph.CBY1.Items.Add(_('Cat:')+' '+Kat[i].Name);
    end;
    if high(CTime) >= 0 then begin
      FSTat_Graph.CBY1.Items.Add('------------------------------');
      for i := 0 to high(CTime) do FSTat_Graph.CBY1.Items.Add(_('Time:')+' '+CTime[i].Name);
    end;
    if high(Contest) >= 0 then begin
      FSTat_Graph.CBY1.Items.Add('------------------------------');
      for i := 0 to high(Contest) do FSTat_Graph.CBY1.Items.Add(_('ConD:')+' '+Contest[i].Name);
    end;
    if high(Contest) >= 0 then begin
      FSTat_Graph.CBY1.Items.Add('------------------------------');
      for i := 0 to high(Contest) do FSTat_Graph.CBY1.Items.Add(_('ConP:')+' '+Contest[i].Name);
    end;

    FSTat_Graph.CBY2.Items := FSTat_Graph.CBY1.Items;
    FSTat_Graph.CBY1.ItemIndex := 0;
    FSTat_Graph.CBY2.ItemIndex := 1;
    FStat_Graph.PanelGraph.visible := True;
    DrawGraph;
  end;
  FStat_Graph.Showmodal;
end;

function TFStatistics.FindKat(KatName: String; Kat: TKat):Integer;
var i: Word;
begin
  Result := -1;
  if high(Kat) >= 0 then
  for i := 0 to High(Kat) do
    if Kat[i].Name = KatName then
      Result := i;
end;

// ----------------------------------------------------------------
// Draw graph
// ----------------------------------------------------------------
procedure TFStatistics.DrawGraph;
var
  i, incrBb, IncrYear, StartIndex, EndIndex, TempYears: Word;
  myPoints: array of TPoint;
  myRect: TRect;
  xLeft, xRight, yTop, yBottom: Word;
{----------}
  procedure DrawYAxis(ComboBoxY: TComboBox; ColorY: TColor; YAxis: Word);
  type
    TGraphData = record
      Data: Real;
      Text: String;
  end;
  var
    GraphDataY: array of TGraphData;
    CTimeIndex, KatIndex: integer;
    MaxY, IncrY: Real;
    i: Word;
    YLabel: String;

  begin
    { GraphData
       herausfinden des höchsten Datensatzes
       skalieren
       Text für Beschriftung erstellen }
    SetLength(GraphDataY,Years);

    case ComboBoxY.ItemIndex of
      0: begin { Start }
           for i := 0 to Years-1 do
           begin
             GraphDataY[i].Data := DGraphData[i].Flights;
             GraphDataY[i].Text := InttoStr(DGraphData[i].Flights);
           end;
           YLabel := _('Flights');
         end;
      1: begin { Time }
           for i := 0 to Years-1 do
           begin
             GraphDataY[i].Data := TimeToHour(DGraphData[i].Time);
             GraphDataY[i].Text := DGraphData[i].Time;
           end;
           YLabel := _('Time')+' [hh:mm]';
         end;
      2: begin  { Ø-Flugzeit }
           for i := 0 to Years-1 do
           begin
             GraphDataY[i].Data := TimeToHour(avgTime(DGraphData[i].Time,DGraphData[i].Flights));
             GraphDataY[i].Text := avgTime(DGraphData[i].Time,DGraphData[i].Flights);
           end;
           YLabel := _('Ø-Flight Time:')+' [hh:mm]';
         end;
      3: begin { Distance }
           for i := 0 to Years-1 do
           begin
             GraphDataY[i].Data := DGraphData[i].Distance;
             GraphDataY[i].Text := FormatFloat('0',DGraphData[i].Distance);
           end;
           YLabel := _('Distance')+' ['+StatDistUnit+']';
         end;
      4: begin  { Ø-Speed }
           for i := 0 to Years-1 do
           begin
             GraphDataY[i].Data := avgSpeed(Round(DGraphData[i].Distance),DGraphData[i].DistanceTime);
             GraphDataY[i].Text := InttoStr(avgSpeed(Round(DGraphData[i].Distance),DGraphData[i].DistanceTime));
           end;
           YLabel := _('Ø-speed')+' ['+GetSpeedUnit(StatDistUnit)+']';
         end;
      5: begin  { Passengers }
           for i := 0 to Years-1 do
           begin
             GraphDataY[i].Data := DGraphData[i].Passengers;
             GraphDataY[i].Text := InttoStr(DGraphData[i].Passengers);
           end;
           YLabel := _('Passengers');
         end;
      6: begin  { Ø-Passengers }
           for i := 0 to Years-1 do
           begin
             GraphDataY[i].Data := avgPassengers(DGraphData[i].Passengers, DGraphData[i].Flights);
             GraphDataY[i].Text := FormatFloat('0.00',avgPassengers(DGraphData[i].Passengers, DGraphData[i].Flights));
           end;
           YLabel := _('Ø-Passengers');
         end;
      8: begin
           for i := 0 to Years-1 do begin
             GraphDataY[i].Data := DGraphData[i].CfF;
             GraphDataY[i].Text := FormatFloat('0.00', DGraphData[i].CfF)+' '+GenSettings.Values['Currency'];
           end;
           YLabel := _('Costs:')+' '+_('Aircraft');
         end;
      9: begin
           for i := 0 to Years-1 do begin
             GraphDataY[i].Data := DGraphData[i].CfC;
             GraphDataY[i].Text := FormatFloat('0.00', DGraphData[i].CfC)+' '+GenSettings.Values['Currency'];
           end;
           YLabel := _('Costs:')+' '+_('Crew');
         end;
      10: begin
           for i := 0 to Years-1 do begin
             GraphDataY[i].Data := DGraphData[i].LaF;
             GraphDataY[i].Text := FormatFloat('0.00', DGraphData[i].LaF)+' '+GenSettings.Values['Currency'];
           end;
           YLabel := _('Costs:')+' '+_('Landing');
         end;
      11: begin
           for i := 0 to Years-1 do begin
             GraphDataY[i].Data := DGraphData[i].EfF;
             GraphDataY[i].Text := FormatFloat('0.00', DGraphData[i].EfF)+' '+GenSettings.Values['Currency'];
           end;
           YLabel := _('Costs:')+' '+_('Earning');
         end;
      12: begin
           for i := 0 to Years-1 do begin
             GraphDataY[i].Data := (DGraphData[i].EfF-(DGraphData[i].CfF+DGraphData[i].CfC+DGraphData[i].LaF));
             if GraphDataY[i].Data < 0 then GraphDataY[i].Data := 0;
             GraphDataY[i].Text := FormatFloat('0.00', (DGraphData[i].EfF-(DGraphData[i].CfF+DGraphData[i].CfC+DGraphData[i].LaF)))+' '+GenSettings.Values['Currency'];
           end;
           YLabel := _('Costs:')+' '+_('Total Overview');
         end;
      14..255: begin
           { ZeitCategories }
           if PosEx(_('Time:'),ComboBoxY.Items[ComboBoxY.ItemIndex],1) = 1 then
           begin
             for i := 0 to Years-1 do
             begin
               CTimeIndex := FindKat(copy(ComboBoxY.Items[ComboBoxY.ItemIndex],7,length(ComboBoxY.Items[ComboBoxY.ItemIndex])-6),DGraphData[i].CTime);
               if CTimeIndex >= 0 then
               begin
                 GraphDataY[i].Data := TimeToHour(DGraphData[i].CTime[CTimeIndex].Value);
                 GraphDataY[i].Text := DGraphData[i].CTime[CTimeIndex].value;
               end
               else GraphDataY[i].Data := 0;
             end;
             YLabel := _('Time')+' [hh:mm]';
           end;

           { Categories }
           if PosEx(_('Cat:'),ComboBoxY.Items[ComboBoxY.ItemIndex],1) = 1 then
           begin
             for i := 0 to Years-1 do
             begin
               KatIndex := FindKat(copy(ComboBoxY.Items[ComboBoxY.ItemIndex],6,length(ComboBoxY.Items[ComboBoxY.ItemIndex])-5),DGraphData[i].Kat);
               if KatIndex >= 0 then
               begin
                 GraphDataY[i].Data := StrtoInt(DGraphData[i].Kat[KatIndex].Value);
                 GraphDataY[i].Text := DGraphData[i].Kat[KatIndex].Value;
               end
               else GraphDataY[i].Data := 0;
             end;
             YLabel := _('Flights');
           end;

           { Contest dist }
           if PosEx(_('ConD:'),ComboBoxY.Items[ComboBoxY.ItemIndex],1) = 1 then
           begin
             for i := 0 to Years-1 do
             begin
               KatIndex := FindKat(copy(ComboBoxY.Items[ComboBoxY.ItemIndex],6,length(ComboBoxY.Items[ComboBoxY.ItemIndex])-5),DGraphData[i].Contest);
               if KatIndex >= 0 then
               begin
                 GraphDataY[i].Data := StrtoFloat(DGraphData[i].Contest[KatIndex].Value);
                 GraphDataY[i].Text := DGraphData[i].Contest[KatIndex].Value;
               end
               else GraphDataY[i].Data := 0;
             end;
             YLabel := _('Contests')+' ['+StatDistUnit+']';
           end;

           { Contest points }
           if PosEx(_('ConP:'),ComboBoxY.Items[ComboBoxY.ItemIndex],1) = 1 then
           begin
             for i := 0 to Years-1 do
             begin
               KatIndex := FindKat(copy(ComboBoxY.Items[ComboBoxY.ItemIndex],6,length(ComboBoxY.Items[ComboBoxY.ItemIndex])-5),DGraphData[i].Contest);
               if KatIndex >= 0 then
               begin
                 GraphDataY[i].Data := StrtoFloat(DGraphData[i].Contest[KatIndex].Value2);
                 GraphDataY[i].Text := DGraphData[i].Contest[KatIndex].Value2;
               end
               else GraphDataY[i].Data := 0;
             end;
             YLabel := _('Contests')+' [pt]';
           end;
         end;
    end; { case }

    MaxY := 0.001; // sonst evt. Division durch Null
    { Hï¿½chsten Wert ermitteln }
    for i := StartIndex to EndIndex do
    if GraphDataY[i].Data > MaxY then MaxY := GraphDataY[i].Data;



    { Skalierung }
    IncrY := 5000;
    if MaxY < 20000 then IncrY := 2000;
    if MaxY < 10000 then IncrY := 1000;
    if MaxY < 5000 then IncrY := 500;
    if MaxY < 2000 then IncrY := 200;
    if MaxY < 1000 then IncrY := 100;
    if MaxY < 500 then IncrY := 50;
    if MaxY < 200 then IncrY := 20;
    if MaxY < 100 then IncrY := 10;
    if MaxY < 50 then IncrY := 5;
    if MaxY < 20 then IncrY := 2;
    if MaxY < 10 then IncrY := 1;
    if MaxY < 5 then IncrY := 0.5;
    if MaxY < 1 then IncrY := 0.1;
    if MaxY < 0.1 then
    begin
      MaxY := 0.1;
      IncrY := 0.01;
    end;

    { Scale }
    for i := StartIndex to EndIndex do
    GraphDataY[i].Data := Round(GraphDataY[i].Data /MaxY*(yBottom-50));

    { Draw }
    with FStat_Graph.DrawArea.Canvas do
    begin
      { Bars }
      if FStat_Graph.RBBalken.checked then
      begin
        for i := StartIndex to EndIndex do
        begin
          myRect := Rect((50+YAxis*IncrBb)+(i-StartIndex)*IncrYear,yBottom,50+IncrBb+YAxis*IncrBb
            +(i-StartIndex)*IncrYear,yBottom-Round(GraphDataY[i].Data));
          Brush.Color := ColorY;
          Fillrect(myrect);
          FStat_Graph.VertText(GraphDataY[i].Text, myRect.Left+(IncrBb div 2)-7,myRect.Bottom-4, 'Left');
        end;
      end
      else
      begin
        { Lines }
        for i := StartIndex to EndIndex do
        begin
          SetLength(myPoints,TempYears+1);
          myPoints[i-StartIndex].X := 50+IncrBB+(i-StartIndex)*IncrYear;
          myPoints[i-StartIndex].Y := yBottom-Round(GraphDataY[i].Data);
        end;
        Pen.Color := ColorY;
        Pen.Width := 2;
        Polyline(myPoints);
      end;

      { Label y-axis }
      Pen.Color := clBlack;
      Pen.Width := 1;
      Brush.Color := clBtnFace;
      Font.Color := ColorY;
      SetRoundMode(rmDown);
      { Label for minutes }
      if (COmboBoxY.ItemIndex in [1,2,7..255]) and (MaxY < 1) then
      begin
        for i := 1 to Round(MaxY*60 / 20) do
        begin
          TextOut(23+YAxis*(xRight-10), yBottom-6-Round(i*20*(yBottom-50)/MaxY/60), InttoStr(i*20));
          Rectangle(49+YAxis*(xRight-45),yBottom-Round(i*20*(yBottom-50)/MaxY/60),45+YAxis
            *(xRight-45),yBottom+1-Round(i*20*(yBottom-50)/MaxY/60));
        end;
        YLabel := copy(YLabel,1,Length(Ylabel)-7)+ '[min]';
      end
      else
      { Other labels }
      begin
        for i := 1 to Round(MaxY / IncrY) do
        begin
          TextOut(20+YAxis*(xRight-10), yBottom-6-Round(i*IncrY*(yBottom-50)/MaxY), FormatFloat('0.##',i*IncrY));
          Rectangle(49+YAxis*(xRight-45),yBottom-Round(i*IncrY*(yBottom-50)/MaxY),45+YAxis
            *(xRight-45),yBottom+1-Round(i*IncrY*(yBottom-50)/MaxY));
        end;
      end;
      SetRoundMode(rmNearest);
      FStat_Graph.VertText(YLabel,YAxis*(xRight+35),yBottom div 2 + 50,'Left');
    end;
  end; { Procedure DrawYAxis }
{----------}
begin
  FStat_Graph.CreateDrawArea;

  xLeft := 50;
  xRight := FStat_Graph.DrawArea.Width-70;
  yTop := 40;
  yBottom := FStat_Graph.DrawArea.Height-85;

  { Find first and last year with data }
  StartIndex := 0;
  EndIndex := Years-1;

  for i := high(DGraphData) downto 0 do
  if DGraphData[i].Flights > 0 then
  StartIndex := i;

  for i := 0 to high(DGraphData) do
  if DGraphData[i].Flights > 0 then
  EndIndex := i;
  TempYears := EndIndex-StartIndex;

  { Bar width }
  IncrYear := (FStat_Graph.DrawArea.Width-70-49) div (TempYears+1);
  if IncrYear > 100 then IncrYear := 100;
  IncrBb := IncrYear div 5*2;

  with FStat_Graph.DrawArea.Canvas do
  begin
    myRect := Rect(0,0,FStat_Graph.DrawArea.Width,FStat_Graph.DrawArea.Height);
    Brush.Color := clBtnFace;
    Fillrect(myrect);

    { Canvas }
    Pen.Color := clBlack;
    SetLength(myPoints,4);
    myPoints[0].X := xLeft;
    myPoints[0].Y := yTop;
    myPoints[1].X := xLeft;
    myPoints[1].Y := yBottom;
    myPoints[2].X := xRight;
    myPoints[2].Y := yBottom;
    myPoints[3].X := xRight;
    myPoints[3].Y := yTop;
    Polyline(myPoints);

    { Label year axis }
    Brush.Color := clBtnFace;
    for i := StartIndex to EndIndex do TextOut(xLeft-10+IncrBb+(i-StartIndex)*IncrYear,yBottom+5,Copy(InttoStr(StartYear+i),3,2));
  end;
  DrawYAxis(FStat_Graph.CBY1,clFRed,0);
  DrawYAxis(FStat_Graph.CBY2,clFBlue,1);
end;

// ----------------------------------------------------------------
// Draw tab
// ----------------------------------------------------------------
procedure TFStatistics.DrawTab;
const
  FixedCols = 18;
var
  i, j, CTimeIndex, KatIndex, Year: Integer;
  StartIndex, EndIndex, TempYears, RowIdx: Word;
  KatIdx, CTimeIdx: Word;
begin
  FStat_Graph.CreateTab;
  FStat_Graph.PanelGraph.visible := False;

  { find first and last year with data }
  StartIndex := 0;
  EndIndex := Years-1;

  for i := high(DGraphData) downto 0 do
  if DGraphData[i].Flights > 0 then
  StartIndex := i;

  for i := 0 to high(DGraphData) do
  if DGraphData[i].Flights > 0 then
  EndIndex := i;
  TempYears := EndIndex-StartIndex;

  CTimeIdx := length(CTime);
  KatIdx := {KatIdx +} length(Kat);

  FStat_Graph.Tab.ColCount := FixedCols+length(CTime)+length(Kat)+length(Contest)*2;
  for i := 0 to high(CTime) do FStat_Graph.Tab.Cells[FixedCols+i,0] := CTime[i].Name;
  for i := 0 to high(Kat) do FStat_Graph.Tab.Cells[FixedCols+i+CTimeIdx,0] := Kat[i].Name;
  for i := 0 to high(Contest) do FStat_Graph.Tab.Cells[FixedCols+i*2+KatIdx,0] := Contest[i].Name;
  for i := 0 to high(Contest) do FStat_Graph.Tab.Cells[FixedCols+i*2+KatIdx+1,0] := Contest[i].Name;

  FStat_Graph.Tab.RowCount := TempYears+2;
  for Year := StartIndex to EndIndex do
  begin
    RowIdx := Year-StartIndex+1;
    FStat_Graph.Tab.Cells[0,RowIdx] := InttoStr(StartYear+Year);
    if DGraphData[Year].Flights > 0 then
      FStat_Graph.Tab.Cells[1,RowIdx] := InttoStr(DGraphData[Year].Flights);
    if DGraphData[Year].W > 0 then
      FStat_Graph.Tab.Cells[2,RowIdx] := InttoStr(DGraphData[Year].W);
    if DGraphData[Year].F > 0 then
      FStat_Graph.Tab.Cells[3,RowIdx] := InttoStr(DGraphData[Year].F);
    if DGraphData[Year].E > 0 then
      FStat_Graph.Tab.Cells[4,RowIdx] := InttoStr(DGraphData[Year].E);
    if DGraphData[Year].A > 0 then
      FStat_Graph.Tab.Cells[5,RowIdx] := InttoStr(DGraphData[Year].A);
    if DGraphData[Year].G > 0 then
      FStat_Graph.Tab.Cells[6,RowIdx] := InttoStr(DGraphData[Year].G);
    if DGraphData[Year].Time <> '0:00' then
      FStat_Graph.Tab.Cells[7,RowIdx] := DGraphData[Year].Time;
    if DGraphData[Year].Flights > 0 then
      FStat_Graph.Tab.Cells[8,RowIdx] := avgTime(DGraphData[Year].Time,DGraphData[Year].Flights);
    if DGraphData[Year].Distance > 0 then
      FStat_Graph.Tab.Cells[9,RowIdx] := FormatFloat('0',DGraphData[Year].Distance)+' '+StatDistUnit;
    if DGraphData[Year].Distance > 0 then
      FStat_Graph.Tab.Cells[10,RowIdx] := InttoStr(avgSpeed(Round(DGraphData[Year].Distance),DGraphData[Year].DistanceTime))+' '+GetSpeedUnit(StatDistUnit);
    if DGraphData[Year].Passengers > 0 then
      FStat_Graph.Tab.Cells[11,RowIdx] := IntToStr(DGraphData[Year].Passengers);
    if (DGraphData[Year].Passengers > 0) and (DGraphData[Year].Flights > 0) then
      FStat_Graph.Tab.Cells[12,RowIdx] := FormatFloat('0.00',DGraphData[Year].Passengers / DGraphData[Year].Flights);

    FStat_Graph.Tab.Cells[13,RowIdx] := FormatFloat('0.00',DGraphData[Year].CfF)+' '+GenSettings.Values['Currency'];
    FStat_Graph.Tab.Cells[14,RowIdx] := FormatFloat('0.00',DGraphData[Year].CfC)+' '+GenSettings.Values['Currency'];
    FStat_Graph.Tab.Cells[15,RowIdx] := FormatFloat('0.00',DGraphData[Year].LaF)+' '+GenSettings.Values['Currency'];
    FStat_Graph.Tab.Cells[16,RowIdx] := FormatFloat('0.00',DGraphData[Year].EfF)+' '+GenSettings.Values['Currency'];
    FStat_Graph.Tab.Cells[17,RowIdx] := FormatFloat('0.00',(DGraphData[Year].EfF-(DGraphData[Year].CfF+DGraphData[Year].CfC+DGraphData[Year].LaF)))+' '+GenSettings.Values['Currency'];

    CTimeIdx := FixedCols + length(CTime);
    KatIdx := CTimeIdx + length(Kat);

    { time cat }
    for j := FixedCols to CTimeIdx-1 do
    begin
      CTimeIndex := FindKat(FStat_Graph.Tab.Cells[j,0],DGraphData[Year].CTime);
      if CTimeIndex >= 0 then FStat_Graph.Tab.Cells[j,RowIdx] := DGraphData[Year].CTime[CTimeIndex].Value;
    end;

    { categories }
    for j := CTimeIdx to KatIdx-1 do
    begin
      KatIndex := FindKat(FStat_Graph.Tab.Cells[j,0],DGraphData[Year].Kat);
      if KatIndex >= 0 then FStat_Graph.Tab.Cells[j,RowIdx] := DGraphData[Year].Kat[KatIndex].Value;
    end;

    { contests }
    for j := 0 to length(Contest)-1 do
    begin
      KatIndex := FindKat(FStat_Graph.Tab.Cells[KatIdx+j*2,0],DGraphData[Year].Contest);
      if KatIndex >= 0 then
      begin
        FStat_Graph.Tab.Cells[KatIdx+j*2,RowIdx] := FormatFloat('0',StrtoFloat(DGraphData[Year].Contest[KatIndex].Value))+' '+StatDistUnit;
        FStat_Graph.Tab.Cells[KatIdx+j*2+1,RowIdx] := FormatFloat('0',StrtoFloat(DGraphData[Year].Contest[KatIndex].Value2))+' pt';
      end;
    end;
  end;
  FStat_Graph.Tab.Selection := DeSelectRect;
end;

procedure TFStatistics.CLBKatClickCheck(Sender: TObject);
begin
  with CLBKat do
  begin
    if State[ItemIndex] = cbChecked then State[ItemIndex] := cbUnchecked
    else if State[ItemIndex] = cbGrayed then State[ItemIndex] := cbChecked
    else if State[ItemIndex] = cbUnchecked then State[ItemIndex] := cbGrayed;
  end;
end;

procedure TFStatistics.CBKatGesChange(Sender: TObject);
var
  PKat: ^TKat;
  i: word;
begin
  PKat := nil;
  case CBKatGes.ItemIndex of
    0: PKat := @Kat;
    1: PKat := @CTime;
    2: PKat := @Contest;
  end;

  if not Assigned(PKat^) then
  begin
    GridKatG.visible := False;
    exit;
  end;

  GridKatG.Cells[0,0]  := '';
  GridKatG.Cells[1,0]  := '';
  GridKatG.Cells[2,0]  := '';

  if PKat^ = Contest then GridKatG.ColWidths[0] := 75
  else GridKatG.ColWidths[0] := 135;

  GridKatG.visible := True;
  GridKatG.RowCount := length(PKat^);
  for i := 0 to high(PKat^) do
  begin
    GridKatG.Cells[0,i] := PKat^[i].Name;
    GridKatG.Cells[1,i] := PKat^[i].Value;
    if PKat^ = Contest then
    begin
      GridKatG.Cells[1,i] := FormatFloat('0',StrToFloat(PKat^[i].Value))+' '+RGDistUnit.Items[RGDistUnit.ItemIndex];;
      GridKatG.Cells[2,i] := FormatFloat('0',StrToFloat(PKat^[i].Value2))+' pt';
    end;
  end;
end;

procedure TFStatistics.CBKatDetailChange(Sender: TObject);
var PKat  : ^TKat;
    Nr, i : Integer;
begin
  Pkat := nil;
  Nr := StrtoInt(SGDetail.Cells[0, SGDetailRow]);

  case CBKatDetail.ItemIndex of
    0: PKat := @PStatData^[Nr].Kat;
    1: PKat := @PStatData^[Nr].CTime;
    2: PKat := @PStatData^[Nr].Contest;
  end;

  if not Assigned(PKat) then
  begin
    GridKatDetail.visible := False;
    exit;
  end;
  GridKatDetail.visible := True;

  GridKatDetail.Cells[0,0] := '';
  GridKatDetail.Cells[1,0] := '';
  GridKatDetail.Cells[2,0] := '';

  if PKat^ = PStatData^[nr].Contest then GridKatDetail.ColWidths[0] := 75
  else GridKatDetail.ColWidths[0] := 135;

  GridKatDetail.RowCount := high(PKat^)+1;
  for i := 0 to high(PKat^) do
  begin
    GridKatDetail.Cells[0,i] := PKat^[i].Name;
    GridKatDetail.Cells[1,i] := PKat^[i].Value;

    if PKat^ = PStatData^[nr].Contest then
    begin
      GridKatDetail.Cells[1,i] := FormatFloat('0',StrToFloat(PKat^[i].Value))+' '+RGDistUnit.Items[RGDistUnit.ItemIndex];
      GridKatDetail.Cells[2,i] := FormatFloat('0',StrToFloat(PKat^[i].Value2))+' pt';
    end;
  end;
end;

// ----------------------------------------------------------------
// Draw kat grid
// ----------------------------------------------------------------
procedure TFStatistics.GridKatDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with TStringGrid(Sender) do
  begin
    Canvas.Brush.Color := clInfoBk;
    Canvas.FillRect(Rect);

    if (ACol = 1) or (ACol = 2) then
      DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), StrLen(PChar(Cells[ACol, ARow])), Rect, DT_RIGHT)
    else
      DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), StrLen(PChar(Cells[ACol, ARow])), Rect, DT_LEFT);
  end;
end;

end.
