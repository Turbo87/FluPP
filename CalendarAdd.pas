unit CalendarAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvButton, JvCtrls, ExtCtrls, ComCtrls,
  gnugettext;

type
  TFCalendarAdd = class(TForm)
    Panel1: TPanel;
    ButtonCancel: TJvImgBtn;
    ButtonOK: TJvImgBtn;
    PageControl: TPageControl;
    tsEvent: TTabSheet;
    tsSchedule: TTabSheet;
    DtpSchedule: TDateTimePicker;
    DtpEvent: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    EditDesc: TEdit;
    Label3: TLabel;
    cbFlightLog: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    cbEvent: TComboBox;
    procedure ButtonOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbFlightLogChange(Sender: TObject);
  private

  public
    { Public-Deklarationen }
  end;

var
  FCalendarAdd: TFCalendarAdd;

implementation

uses Main,ToolsGrid;

{$R *.dfm}

// ----------------------------------------------------------------
// Form create
// ----------------------------------------------------------------
procedure TFCalendarAdd.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self);
end;

// ----------------------------------------------------------------
// onShow
// ----------------------------------------------------------------
procedure TFCalendarAdd.FormShow(Sender: TObject);
var
  i: Word;
begin
  cbFlightLog.Items.Clear;
  for i := 0 to FMain.MdiChildCount -1 do
    cbFlightLog.Items.Add(GridChild(i).Caption);
  cbFlightLogChange(Self);
end;

// ----------------------------------------------------------------
// fill events
// ----------------------------------------------------------------
procedure TFCalendarAdd.cbFlightLogChange(Sender: TObject);
begin
  //cbEvent.Items.Assign(GridChild(cbFlightLog.ItemIndex).ACEventCat);
end;

// ----------------------------------------------------------------
// Check data
// ----------------------------------------------------------------
procedure TFCalendarAdd.ButtonOKClick(Sender: TObject);
begin
  { Event }
  if PageControl.ActivePageIndex = 0 then
  begin

  end;
  { Schedule }
  if PageControl.ActivePageIndex = 1 then
  begin
    if EditDesc.Text = '' then
    begin
      MessageDlg(_('Please enter a description'),mtWarning,[mbOK],0);
      ActiveControl := EditDesc;
      ModalResult := mrNone;
    end;
  end;
end;

end.
