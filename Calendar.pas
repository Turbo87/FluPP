unit Calendar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, Grids, ComCtrls, ExtCtrls,
  JvExGrids, JvStringGrid, JvExStdCtrls, JvButton, JvCtrls, GNUGetText,
  JvExExtCtrls, JvComponent, JvTMTimeLine, DateUtils,
  JvExtComponent;

type
  TFCalendar = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    GridSched: TJvStringGrid;
    ButtonDelete: TJvImgBtn;
    ButtonNew: TJvImgBtn;
    JvTMTimeline: TJvTMTimeline;
    ButtonExtend: TJvImgBtn;
    ButtonOK: TJvImgBtn;
    ButtonCancel: TJvImgBtn;
    CBViewSchedules: TCheckBox;
    CBViewEvents: TCheckBox;
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonRemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure JvTMTimelineClick(Sender: TObject);
    procedure GridSchedDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridSchedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonExtendClick(Sender: TObject);
    procedure CBViewClick(Sender: TObject);
  private
    procedure onHint(Sender: TObject);
    procedure UpdateTimeline;
  public
    { Public-Deklarationen }
  end;

var
  FCalendar: TFCalendar;

implementation

uses Main, Tools, ToolsGrid, InputBox, Export;

{$R *.dfm}

// ----------------------------------------------------------------
// Form create
// ----------------------------------------------------------------
procedure TFCalendar.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self);
end;

// ----------------------------------------------------------------
// onHint
// ----------------------------------------------------------------
procedure TFCalendar.onHint(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := GetLongHint(Application.Hint);
end;

// ----------------------------------------------------------------
// Load Schedules
// ----------------------------------------------------------------
procedure TFCalendar.FormShow(Sender: TObject);
{----------}
  procedure LoadSchedule(Schedule: TSTrings; ImageIdx: Integer);
  var
    i: Word;
  begin
    if Schedule.Count > 0 then
      for i := 0 to Schedule.Count-1 do
       begin
         if GridSched.Cells[0,1] <> '' then
           GridSched.RowCount := GridSched.RowCount + 1;

         GridSched.Cells[0,GridSched.RowCount-1] := InttoStr(ImageIdx);
         GridSched.Cells[1,GridSched.RowCount-1] := Schedule.ValueFromIndex[i];
         GridSched.Cells[2,GridSched.RowCount-1] := Schedule.Names[i];
         GridSched.Objects[0,GridSched.RowCount-1] := Schedule;
       end;
  end;
{----------}
var
  GridIdx: Integer;
begin
  Application.OnHint := onHint;
  GridSched.ColWidths[0] := 30;
  GridSched.ColWidths[1] := 60;
  GridSched.ColWidths[2] := GridSched.Width - 98;
  GridSched.RowCount := 2;
  GridSched.Cells[1,0]  := _('Date');
  GridSched.Cells[2,0]  := _('Description');
  JvTMTimeline.Date := now;

  { Load Schedules }
  LoadSchedule(Schedules, SchImageIdxUsr);
  for GridIdx := 0 to FMain.MdiChildCount-1 do
  begin
    LoadSchedule(GridChild(GridIdx).LicenseDates, SchImageIdxLic);
    LoadSchedule(GridChild(GridIdx).Events, SchImageIdxEvt);
  end;
  LoadSchedule(Medicals, SchImageIdxMed);
  LoadSchedule(SchedValidity, SchImageIdxLic);

  UpdateTimeline;
  SortGridByCols([1], GridSched);
end;

// ----------------------------------------------------------------
// From close
// ----------------------------------------------------------------
procedure TFCalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnHint := FMain.onHint;
end;

// ----------------------------------------------------------------
// Update TimeLine
// ----------------------------------------------------------------
procedure TFCalendar.UpdateTimeline;
var i: Word;
begin
  JvTMTimeline.ClearImages;
  if GridSched.Cells[0,1] <> '' then
    for i := 1 to GridSched.RowCount-1 do
      if isDate(GridSched.Cells[1,i])
        then JvTMTimeline.ImageIndex[StrToDate(GridSched.Cells[1,i])] := StrToInt(GridSched.Cells[0,i]);
end;

// ----------------------------------------------------------------
// Save Schedules
// ----------------------------------------------------------------
procedure TFCalendar.ButtonOKClick(Sender: TObject);
var
  Row: Word;
  GridIdx: Word;
begin
  Schedules.Clear;
  Medicals.Clear;
  SchedValidity.Clear;
  for GridIdx := 0 to FMain.MdiChildCount-1 do
  begin
    GridChild(GridIdx).LicenseDates.Clear;
    GridChild(GridIdx).Events.Clear;
  end;

  for Row := 1 to GridSched.RowCount-1 do
    if Assigned(GridSched.Objects[0,Row]) then
        TStrings(GridSched.Objects[0,Row]).Add(GridSched.Cells[2,Row]+'='+GridSched.Cells[1,Row]);

  DataChanged := True;
  FMain.StatusBar1.Panels[2].Text := '*';
  ExportSchedulesAsICal;
end;

// ----------------------------------------------------------------
// Change View
// ----------------------------------------------------------------
procedure TFCalendar.CBViewClick(Sender: TObject);
var
  Row: Word;
begin
  if (not CBViewEvents.Checked) and (not CBViewSchedules.Checked) then
  begin
    if Sender = CBViewEvents then
      CBViewSchedules.Checked := True
    else
      CBViewEvents.Checked := True;
  end;

  for Row := 1 to GridSched.RowCount-1 do
    if StrToInt(GridSched.Cells[0,Row]) = SchImageIdxEvt then
    begin
      if CBViewEvents.Checked then
        GridSched.ShowRow(Row, GridSched.DefaultRowHeight)
      else
        GridSched.HideRow(Row);
    end
    else
      if CBViewSchedules.Checked then
        GridSched.ShowRow(Row, GridSched.DefaultRowHeight)
      else
        GridSched.HideRow(Row);
end;

// ----------------------------------------------------------------
// Add Schedule
// ----------------------------------------------------------------
procedure TFCalendar.ButtonAddClick(Sender: TObject);
var
  GridIdx : Integer;
  InputBox: TFInputBox;
  ComboBox : TComboBox;
  DateTimePicker: TDateTimePicker;
  EditDesc: TEdit;
  LabelDate, LabelDesc: TLabel;
begin
  try
    InputBox := TFInputBox.Create(FCalendar);

    InputBox.Caption := _('Date and description');
    InputBox.Width := 250;
    InputBox.Height := 170;

    DateTimePicker := TDateTimePicker.Create(InputBox);
    DateTimePicker.Parent := InputBox;
    DateTimePicker.Date := now;
    DateTimePicker.Width := 80;
    DateTimePicker.Left := 20;
    DateTimePicker.Top := 30;

    EditDesc := TEdit.Create(InputBox);
    EditDesc.Parent := InputBox;
    EditDesc.Width := 120;
    EditDesc.Left := 110;
    EditDesc.Top := 30;

    ComboBox := TComboBox.Create(InputBox);
    ComboBox.Style := csDropDownList;
    ComboBox.Parent := InputBox;
    ComboBox.Width := 210;
    ComboBox.Left := 20;
    ComboBox.Top := 60;

    ComboBox.Items.Add(_('-- General --'));
    for GridIdx := 0 to FMain.MdiChildCount-1 do
      ComboBox.Items.Add(_('Event: ')+GridChild(GridIdx).Caption);
    If ComboBox.Items.Count > 0 then ComboBox.ItemIndex := 0;

    LabelDate := TLabel.Create(InputBox);
    LabelDate.Parent := InputBox;
    LabelDate.Left := DateTimePicker.Left;
    LabelDate.Top := DateTimePicker.Top-15;
    LabelDate.Caption := _('Date');

    LabelDesc := TLabel.Create(InputBox);
    LabelDesc.Parent := InputBox;
    LabelDesc.Left := EditDesc.Left;
    LabelDesc.Top := EditDesc.Top-15;
    LabelDesc.Caption := _('Description');

    InputBox.ActiveControl := EditDesc;

    repeat InputBox.ShowModal;
      if InputBox.ModalResult = mrOK then
      begin
        if EditDesc.Text = '' then
        begin
          MessageDlg(_('Please enter a description'),mtWarning,[mbOK],0);
          InputBox.ActiveControl := EditDesc;
          InputBox.ModalResult := mrNone;
        end;
        if InputBox.ModalResult = mrOK then
        begin
          if GridSched.Cells[1,1] <> '' then
            GridSched.InsertRow(GridSched.RowCount);

          If ComboBox.ItemIndex = 0 then begin
            GridSched.Objects[0,GridSched.RowCount-1] := Schedules;
            GridSched.Cells[0,GridSched.RowCount-1] := InttoStr(SchImageIdxUsr);
          end else begin
            GridSched.Objects[0,GridSched.RowCount-1] := GridChild(ComboBox.ItemIndex-1).Events;
            GridSched.Cells[0,GridSched.RowCount-1] := InttoStr(SchImageIdxEvt);
          end;

          GridSched.Cells[1,GridSched.RowCount-1] := DatetoStr(DateTimePicker.Date);
          GridSched.Cells[2,GridSched.RowCount-1] := EditDesc.Text;
          GridSched.Cells[3,GridSched.RowCount-1] := 'Sch';

          SortGridByCols([1], GridSched);
          UpdateTimeline;
        end;
      end;
      if InputBox.ModalResult = mrCancel then
        Exit;
    until (InputBox.ModalResult <> mrNone);
  finally
    DateTimePicker.Free;
    EditDesc.Free;
    LabelDate.Free;
    LabelDesc.Free;
    InputBox.Free;
  end;
end;

// ----------------------------------------------------------------
// Remove Schedule
// ----------------------------------------------------------------
procedure TFCalendar.ButtonRemClick(Sender: TObject);
begin
  if (GridSched.Cells[0,1] = '') or (GridSched.Row = 0) then Exit;

  if ((StrToInt(GridSched.Cells[0, GridSched.Row]) <> SchImageIdxUsr) and
     (StrToInt(GridSched.Cells[0, GridSched.Row]) <> SchImageIdxEvt)) then begin
    MessageDlg(_('License and Medical schedules cannot be removed here.'),mtInformation,[mbOK],0);
    Exit;
  end;
  if (GridSched.RowCount > 2) then
    GridSched.RemoveRow(GridSched.Row)
  else
    GridSched.Clear;
  UpdateTimeline;
end;

// ----------------------------------------------------------------
// Extend schedule
// ----------------------------------------------------------------
procedure TFCalendar.ButtonExtendClick(Sender: TObject);
  var
  InputBox: TFInputBox;
  ComboBox: TComboBox;
  EditNum: TEdit;
  LabelNum: TLabel;
begin
  if not isInteger(GridSched.Cells[0,GridSched.Row]) then
    Exit;
  try
    InputBox := TFInputBox.Create(FCalendar);

    InputBox.Caption := _('Please enter a time');
    InputBox.Width := 250;
    InputBox.Height := 150;

    EditNum := TEdit.Create(InputBox);
    EditNum.Parent := InputBox;
    EditNum.Width := 40;
    EditNum.Left := 50;
    EditNum.Top := 30;

    ComboBox := TComboBox.Create(InputBox);
    ComboBox.Parent := InputBox;
    ComboBox.Width := 120;
    ComboBox.Left := 100;
    ComboBox.Top := 30;
    ComboBox.Items.Add('Years');
    ComboBox.Items.Add('Months');
    ComboBox.Items.Add('Weeks');
    ComboBox.Items.Add('Days');
    ComboBox.ItemIndex := 0;
    ComboBox.Style := csDropDownList;

    LabelNum := TLabel.Create(InputBox);
    LabelNum.Parent := InputBox;
    LabelNum.Left := EditNum.Left;
    LabelNum.Top := EditNum.Top-15;
    LabelNum.Caption := _('Extend by:');

    InputBox.ActiveControl := EditNum;

    repeat InputBox.ShowModal;
      if InputBox.ModalResult = mrOK then
      begin
        if not isInteger(EditNum.Text) then
        begin
          MessageDlg(_('Please enter a number'),mtWarning,[mbOK],0);
          InputBox.ActiveControl := EditNum;
          InputBox.ModalResult := mrNone;
        end;
        if InputBox.ModalResult = mrOK then
        begin
          case ComboBox.ItemIndex of
            0: GridSched.Cells[1,GridSched.Row] := DateToStr(incYear(StrToDate(GridSched.Cells[1,GridSched.Row]),
              StrToInt(EditNum.Text)));
            1: GridSched.Cells[1,GridSched.Row] := DateToStr(incMonth(StrToDate(GridSched.Cells[1,GridSched.Row]),
              StrToInt(EditNum.Text)));
            2: GridSched.Cells[1,GridSched.Row] := DateToStr(incWeek(StrToDate(GridSched.Cells[1,GridSched.Row]),
              StrToInt(EditNum.Text)));
            3: GridSched.Cells[1,GridSched.Row] := DateToStr(incDay(StrToDate(GridSched.Cells[1,GridSched.Row]),
              StrToInt(EditNum.Text)));
          end;
          SortGridByCols([1], GridSched);
          UpdateTimeline;
        end;
      end;
      if InputBox.ModalResult = mrCancel then
        Exit;
    until (InputBox.ModalResult <> mrNone);
  finally
    ComboBox.Free;
    EditNum.Free;
    InputBox.Free;
  end;
end;

// ----------------------------------------------------------------
// Select date on timeline
// ----------------------------------------------------------------
procedure TFCalendar.JvTMTimelineClick(Sender: TObject);
var aRow: Integer;
begin
 if SearchInGrid(GridSched, DateToStr(JvTMTimeline.SelDate), aRow) then
 begin
   GridSched.OnClick := nil;
   GridSched.Row := aRow;
   GridSched.OnClick := GridSchedClick;
 end;
end;

// ----------------------------------------------------------------
// Select timeline date
// ----------------------------------------------------------------
procedure TFCalendar.GridSchedClick(Sender: TObject);
begin
  if GridSched.Cells[0,1] = '' then Exit;
  JvTMTimeline.Date := Trunc(StrToDate(GridSched.Cells[1,GridSched.Row]) - 3);
  JvTMTimeline.SelDate := StrToDate(GridSched.Cells[1,GridSched.Row]);
end;

// ----------------------------------------------------------------
// Draw Icons
// ----------------------------------------------------------------
procedure TFCalendar.GridSchedDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if not(gdFixed in State) and (not(gdSelected in State) or (ACol = 0)) then
  with TStringGrid(Sender) do
  begin
    Canvas.Font.Color := Font.Color;
    Canvas.Brush.Color := clWhite;
    if GridSched.Cells[0,1] <> '' then
    begin
      if MonthsBetween(now, StrToDate(Cells[1, ARow])) <  StrToInt(GenSettings.Values['WarningMonth']) then
        Canvas.Brush.Color := clFYellow;
      if now >= StrToDate(Cells[1, ARow]) then
        Canvas.Brush.Color := clFRed;
    end;
    Canvas.FillRect(Rect);
    InflateRect(Rect, -2, -2);
    if ACol > 0 then
      DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), StrLen(PChar(Cells[ACol, ARow])), Rect,DT_LEFT);
    if (ACol = 0) and (isInteger(Cells[0, ARow])) then
      FMain.ImageList.Draw(Canvas, Rect.Left+5, Rect.Top-1, StrToInt(Cells[0, ARow]));
  end;
end;

end.
