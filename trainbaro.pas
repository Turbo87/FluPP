unit TrainBaro;

{$MODE Delphi}

interface

uses
  {Windows,} Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids{, gnugettext,
  JvExStdCtrls, JvButton, JvCtrls}, LResources;

type
  TFTrainBaro = class(TForm)
    DrawArea: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TJvImgBtn;
    Bevel2: TBevel;
    PanelFligtLogs: TPanel;
    LBFlu: TListBox;
    LabelText: TLabel;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LBFluClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LBFluDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private

  public
    { Public-Deklarationen }
  end;

var
  FTrainBaro: TFTrainBaro;

implementation


uses Grid, Main, Tools, ToolsGrid;

// ----------------------------------------------------------------
// Form create
// ----------------------------------------------------------------
procedure TFTrainBaro.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self);
end;

// ----------------------------------------------------------------
// Form show
// ----------------------------------------------------------------
procedure TFTrainBaro.FormShow(Sender: TObject);
var
  i: Word;
begin
  { Scheine }
  LBFlu.Items.Clear;
  for i := 0 to FMain.MDIChildCount-1 do
    LBFlu.Items.Add(GridChild(i).caption);
  LBFlu.ItemIndex := 0;
  LBFlu.Columns := LBFlu.Count;
  if LBFlu.Count = 1 then
    LBFlu.Visible := False
  else
    LBFlu.Visible := True;
  LBFlu.Selected[0] := True;
  LBFluClick(self);
end;

// ----------------------------------------------------------------
// Form close
// ----------------------------------------------------------------
procedure TFTrainBaro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnHint := FMain.onHint;
end;

// ----------------------------------------------------------------
// Draw training barometer
// ----------------------------------------------------------------
procedure TFTrainBaro.LBFluClick(Sender: TObject);
var
  GridIdx: Word;
  myRect: TRect;
  StartPoint: TPoint;
  i, Flights, TotalPos: Word;
  FlightTime: String;
  FlightPoints, TimePoints, TotalPoints: Real;
const
  tbHeight = 380;
  tbWidth = 140;
  tbOffsetH = 40;
  tbOffsetV = 10;
  tbDHeight = tbHeight-2*tbOffsetV;
  tbSegH = tbDHeight div 3;
begin
  FlightTime := '0:00'; Flights := 0;
  for GridIdx := 0 to FMain.MDIChildCount-1 do
  if LBFlu.Selected[GridIdx] then
  if GridChild(GridIdx).Grid.Cells[0,1] <> '' then
  begin
    for i := 1 to GridChild(GridIdx).Grid.RowCount-1 do
    begin
      if StrToDate(GridChild(GridIdx).Grid.Cells[1,i]) >= IncMonth(Now,-6) then
      begin
        inc(Flights, StrToInt(GridChild(GridIdx).Data['NoL',i]));
        FlightTime := CalcTime(GridIdx,FlightTime,i,i);
      end;
    end;
  end;

  with DrawArea.Canvas do
  begin
    MyRect := Rect(0,0,DrawArea.Width,DrawArea.Height);
    Brush.Color := clBtnFace;
    Fillrect(MyRect);

    { color areas }
    Brush.Color := clFGreen;
    Fillrect(Rect(tbOffsetH,tbOffsetV,tbWidth-tbOffsetH,1*tbSegH+tbOffsetV));
    Brush.Color := clBlack;
    FrameRect(Rect(tbOffsetH,tbOffsetV-1,tbWidth-tbOffsetH,1*tbSegH+tbOffsetV));

    Brush.Color := clFYellow;
    Fillrect(Rect(tbOffsetH,1*tbSegH+tbOffsetV,tbWidth-tbOffsetH,2*tbSegH+tbOffsetV));
    Brush.Color := clBlack;
    FrameRect(Rect(tbOffsetH,1*tbSegH+tbOffsetV-1,tbWidth-tbOffsetH,2*tbSegH+tbOffsetV));

    Brush.Color := clFRed;
    Fillrect(Rect(tbOffsetH,2*tbSegH+tbOffsetV,tbWidth-tbOffsetH,3*tbSegH+tbOffsetV));
    Brush.Color := clBlack;
    FrameRect(Rect(tbOffsetH,2*tbSegH+tbOffsetV-1,tbWidth-tbOffsetH,3*tbSegH+tbOffsetV));

    Pen.Color := clBlack;
    Pen.Width := 1;
    Brush.Color := clBtnFace;

    { time labels }
    for i := 1 to 6 do
    begin
      TextOut(tbOffsetH-20,tbHeight-tbOffsetV-round(i*tbDHeight/6)-7,InttoStr(i*5));
      Rectangle(tbOffsetH,tbHeight-tbOffsetV-round(i*tbDHeight/6),tbOffsetH-5,
        tbHeight-tbOffsetV-round(i*tbDHeight/6)-1);
    end;

    { start labels }
    for i := 1 to 9 do
    begin
      TextOut(tbWidth-tbOffsetH+10,tbHeight-tbOffsetV-round(i*tbDHeight/9)-7,InttoStr(i*5));
      Rectangle(tbWidth-tbOffsetH,tbHeight-tbOffsetV-round(i*tbDHeight/9),
        tbWidth-tbOffsetH+5,tbHeight-tbOffsetV-round(i*tbDHeight/9)-1);
    end;

    { limit }
    if Flights > 30 then Flights := 30;
    if TimeToExact(FlightTime) > 45 then FlightTime := '45:00';

    FlightPoints := Flights/30;
    TimePoints := TimeToExact(FlightTime)/45;
    TotalPoints := (FlightPoints+TimePoints)/2;

    { line }
    StartPoint := Point(tbOffsetH,tbHeight-tbOffsetV-Round(FlightPoints*tbDHeight));
    PenPos := StartPoint;
    LineTo(tbWidth-tbOffsetH,tbHeight-tbOffsetV-Round(TimePoints*tbDHeight));
    { circle }
    Brush.Color := clWhite;
    TotalPos := tbHeight-tbOffsetV-Round(TotalPoints*tbDHeight);
    Ellipse((tbWidth div 2)-7,TotalPos+7,(tbWidth div 2)+7,TotalPos-7);

    { red area }
    if TotalPoints < 1/3 then
      LabelText.Caption := _('Red Area')+#13#10+
        _('Exercise is necessary - Flying can be risky.')+#13#10+#13#10+
        _('For Novices:'+#13#10+
        '- the first few takeoffs after a prolonged period of non-flying should only be made on familiar aircraft and in good weather conditions'+#13#10+
        '- if the last takeoff has been made more than three months ago, training with a flight instructor is the best way to regain good flying abilities');
    { yellow area }
    if (TotalPoints >= 1/3) and (TotalPoints < 2/3) then
      LabelText.Caption := _('Yellow Area')+#13#10+
        _('More exercise helpful - Unexpected events could be dangerous')+#13#10+#13#10+
        _('Attention on takeoff:'+#13#10+
        '- in unknown area (eg mountaineous terrain)'+#13#10+
        '- on unknown airfields'+#13#10+
        '- on rarely flown aircraft'+#13#10+
        '- in a rarely performed type of start');
    { green area }
    if TotalPoints >= 2/3 then
      LabelText.Caption := _('Green Area')+#13#10+
        _('The level of exercise is good - but stay cautious!')+#13#10+#13#10+
        _('Well trained pilots often make the following mistakes:'+#13#10+
        '- Aircraft is poorly equipped'+#13#10+
        '- poor cockpit check procedure'+#13#10+
        '- poor airmanship during rejected takeoffs'+#13#10+
        '- mistakes in flying the landing pattern'+#13#10+
        '(especially at off-airfield landings)');
  end;
end;

// ----------------------------------------------------------------
// Draw flight log LB items
// ----------------------------------------------------------------
procedure TFTrainBaro.LBFluDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  LBFlu.Canvas.FillRect(Rect);
  InflateRect(Rect, 0, -4);
  DrawText(LBFlu.Canvas.Handle, PChar(LBFlu.Items[Index]), StrLen(PChar(LBFlu.Items[Index])), Rect,DT_CENTER);
end;

initialization
  {$i TrainBaro.lrs}
  {$i TrainBaro.lrs}
  {$i TrainBaro.lrs}
  {$i TrainBaro.lrs}
  {$i TrainBaro.lrs}
  {$i TrainBaro.lrs}

end.
