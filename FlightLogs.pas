unit FlightLogs;

{$MODE Delphi}

interface

uses
  {Windows,} Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, {JvExStdCtrls, JvButton, JvCtrls,} ExtCtrls{, gnugettext},
  LResources;

type
  TFFlightLogs = class(TForm)
    Panel1: TPanel;
    ButtonNew: TBitBtn;
    ButtonDelete: TBitBtn;
    ButtonEdit: TBitBtn;
    ButtonOK: TBitBtn;
    Label12: TLabel;
    LBFlu: TListBox;
    procedure FormShow(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
    procedure ButtonNewClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LBFluDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    procedure RefreshLBFlu;
  public
    { Public-Deklarationen }
  end;

var
  FFlightLogs: TFFlightLogs;

implementation

uses Main, Tools, ToolsGrid;


// ----------------------------------------------------------------
// On Create
// ----------------------------------------------------------------
procedure TFFlightLogs.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self);
end;

// ----------------------------------------------------------------
// Form Show
// ----------------------------------------------------------------
procedure TFFlightLogs.FormShow(Sender: TObject);
begin
  //ActiveControl := EditName;
  RefreshLBFlu;
end;

// ----------------------------------------------------------------
// Refresh flight log list
// ----------------------------------------------------------------
procedure TFFlightLogs.RefreshLBFlu;
var
  i: word;
begin
  LBFlu.Items.Clear;
  if FMain.MDIChildCount > 0 then
  begin
    for i := 0 to FMain.MDIChildCount-1 do
      LBFlu.Items.Add(GridChild(i).caption);
    LBFlu.ItemIndex := 0;
  end;
end;

// ----------------------------------------------------------------
// Add flight log
// ----------------------------------------------------------------
procedure TFFlightLogs.ButtonNewClick(Sender: TObject);
var InputStr: String;
begin
  if InputQuery(_('Please enter flight log name'), _('Name'), InputStr) then
  begin
    if LBFlu.Items.IndexOf(InputStr) > -1 then
      MessageDlg(format(_('The name already exists!'), [InputStr]),mtInformation,[mbOK],0)
    else
      FMain.CreateNewWindow(InputStr, DEFAULTTABLECOLS);
    RefreshLBFlu;
  end;
end;

// ----------------------------------------------------------------
// Edit flight log
// ----------------------------------------------------------------
procedure TFFlightLogs.ButtonEditClick(Sender: TObject);
var InputStr: String;
begin
  if LBFlu.ItemIndex = -1 then
    Exit;
  InputStr := LBFlu.Items[LBFlu.ItemIndex];
  if InputQuery(_('Please enter flight log name'), _('Name'), InputStr) then
  begin
    if LBFlu.Items.IndexOf(InputStr) > -1 then
      MessageDlg(_('The name already exists!'), mtInformation, [mbOK], 0)
    else
      GridChild(LBFlu.ItemIndex).caption := InputStr;
    RefreshLBFlu;
  end;
end;

// ----------------------------------------------------------------
// Remove flight log
// ----------------------------------------------------------------
procedure TFFlightLogs.ButtonDeleteClick(Sender: TObject);
var
  Answer: Integer;
begin
  if LBFlu.ItemIndex = -1 then
    Exit;
  Answer := MessageDlg(format(_('Are you sure you want to delete the flightlog ''%s''?'),
    [GridChild(LBFlu.ItemIndex).caption]),mtConfirmation,[mbYes,mbNo],0);
  if answer = mrNo then Exit
  else
    GridChild(LBFlu.ItemIndex).Free;
  RefreshLBFlu;
end;

// ----------------------------------------------------------------
// Exit
// ----------------------------------------------------------------
procedure TFFlightLogs.ButtonOKClick(Sender: TObject);
begin
  if FMain.MDIChildCount = 0 then
  begin
    MessageDlg(_('Please create at least one flightlog'),mtError,[mbOK],0);
    ModalResult := mrNone;
  end;
end;

// ----------------------------------------------------------------
// Exit
// ----------------------------------------------------------------
procedure TFFlightLogs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FMain.MDIChildCount = 0 then
  begin
    MessageDlg(_('Please create at least one flightlog'),mtError,[mbOK],0);
    Action := caNone;
  end;
end;

procedure TFFlightLogs.LBFluDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  TListBox(Control).Canvas.FillRect(Rect);
  InflateRect(Rect, 0, -2);
  DrawText(LBFlu.Canvas.Handle, PChar(LBFlu.Items[Index]), StrLen(PChar(LBFlu.Items[Index])), Rect,DT_CENTER);
end;

initialization
  {$i FlightLogs.lrs}

end.
