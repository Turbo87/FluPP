unit NinetyDays;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  Grids, JvExGrids, JvStringGrid, gnugettext, JvExStdCtrls, JvButton,
  JvCtrls, DateUtils;

type
  TNinetyDays = array of record
    Typ: String;
    Starts: Word;
    Date: String;
  end;
  TFNinetyDays = class(TForm)
    GridNinetyDaysFlz: TJvStringGrid;
    Panel1: TPanel;
    BitBtn1: TJvImgBtn;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    GridNinetyDaysLic: TJvStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure GridNinetyDaysSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure GridNinetyDaysFlzDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
  private
    procedure Calc90days;
  public
    { Public-Deklarationen }
  end;

var
  FNinetyDays: TFNinetyDays;

implementation

uses Main, Grid, Settings, Tools, ToolsGrid;

{$R *.dfm}


// ----------------------------------------------------------------
// Form create
// ----------------------------------------------------------------
procedure TFNinetyDays.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self);
end;

// ----------------------------------------------------------------
// Form show
// ----------------------------------------------------------------
procedure TFNinetyDays.FormShow(Sender: TObject);
begin
  Calc90days;
end;

// ----------------------------------------------------------------
// Calc 90 day regulation
// ----------------------------------------------------------------
procedure TFNinetyDays.Calc90days;
var
  i,j,k: Word;
  AnzahlFluege: Word;
  Aircraft: TNinetyDays;
  License: TNinetyDays;
  ItsIn: Boolean;
{----------}
  procedure InsertLicenses(Fluege: Word; Text: String);
  begin
    if Fluege > 0 then
    begin
      SetLength(Aircraft,length(Aircraft)+1);
      Aircraft[High(Aircraft)].Typ := Text;
      Aircraft[High(Aircraft)].Starts := Fluege;
    end;
  end;
{----------}
begin
  SetLength(Aircraft,0);
  SetLength(License,0);

  GridNinetyDaysFlz.Cells[0,0] := _('Aircraft ID');
  GridNinetyDaysFlz.Cells[1,0] := _('Flights');
  GridNinetyDaysFlz.Cells[2,0] := _('3 flights to');
  GridNinetyDaysFlz.ColWidths[0] := 150;
  GridNinetyDaysFlz.ColWidths[1] := 50;
  GridNinetyDaysFlz.ColWidths[2] := 80;

  GridNinetyDaysLic.Cells[0,0] := _('Flight log');
  GridNinetyDaysLic.Cells[1,0] := _('Flights');
  GridNinetyDaysLic.Cells[2,0] := _('3 flights to');
  GridNinetyDaysLic.ColWidths[0] := 150;
  GridNinetyDaysLic.ColWidths[1] := 50;
  GridNinetyDaysLic.ColWidths[2] := 80;

  GridNinetyDaysLic.Selection := DeSelectRect;
  GridNinetyDaysFlz.Selection := DeSelectRect;

  for i:= 0 to FMain.MdiChildCount - 1 do
  begin
    SetLength(License, i+1);
    License[i].Typ := GridChild(i).Caption;
    if GridChild(i).Grid.Cells[0,1] <> '' then
    for j := GridChild(i).Grid.RowCount-1 downto 1 do
    if (StrToDate(GridChild(i).Data['Dat',j]) >= now-90)
      and (GridChild(i).Data['Pi1',j] = GenSettings.Values['PilotName']) then
    begin
      AnzahlFluege := StrtoInt(GridChild(i).data['NoL',j]);
      inc(License[i].Starts,AnzahlFluege);
      if (License[i].Starts >= 3) and (License[i].Date = '') then
        License[i].Date := DateToStr(IncDay(StrToDate(GridChild(i).data['Dat',j]),90));

      k:= 0;
      ItsIn := False;
      while (length(Aircraft) > k) and (not ItsIn) do
      begin
        if GridChild(i).data['ATy',j] = Aircraft[k].Typ then
        begin
          Itsin := True;
          inc(Aircraft[k].Starts,AnzahlFluege);
          if (Aircraft[k].Starts >= 3) and (Aircraft[k].Date = '') then
            Aircraft[k].Date := DateToStr(IncDay(StrToDate(GridChild(i).data['Dat',j]),90));
        end;
      inc(k);
      end;
      if not ItsIn then
      begin
        SetLength(Aircraft,length(Aircraft)+1);
        Aircraft[k].Typ := GridChild(i).data['ATy',j];
        inc(Aircraft[k].Starts,AnzahlFluege);
        if (Aircraft[k].Starts >= 3) and (Aircraft[k].Date = '') then
          Aircraft[k].Date := DateToStr(IncDay(StrToDate(GridChild(i).data['Dat',j]),90));
      end;
    end;
  end;

  { Flight logs }
  if length(License) > 0 then
  begin
    GridNinetyDaysLic.RowCount := length(License)+1;
    for i := 0 to high(License) do
    begin
      GridNinetyDaysLic.Cells[0,i+1] := License[i].Typ;
      GridNinetyDaysLic.Cells[1,i+1] := inttoStr(License[i].Starts);
      GridNinetyDaysLic.Cells[2,i+1] := License[i].Date;
    end;
  end
  else GridNinetyDaysLic.RowCount := 2;
   SortGridByCols([0],GridNinetyDaysLic);

  { Aircraft type }
  if length(Aircraft) > 0 then
  begin
    GridNinetyDaysFlz.RowCount := length(Aircraft)+1;
    for i := 0 to high(Aircraft) do
    begin
      GridNinetyDaysFlz.Cells[0,i+1] := Aircraft[i].Typ;
      GridNinetyDaysFlz.Cells[1,i+1] := inttoStr(Aircraft[i].Starts);
      GridNinetyDaysFlz.Cells[2,i+1] := Aircraft[i].Date;
    end;
  end
  else GridNinetyDaysFlz.RowCount := 2;
end;

// ----------------------------------------------------------------
// Allow no selection
// ----------------------------------------------------------------
procedure TFNinetyDays.GridNinetyDaysSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect := False;
end;

// ----------------------------------------------------------------
// Draw schedule grid with colors for date
// ----------------------------------------------------------------
procedure TFNinetyDays.GridNinetyDaysFlzDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with TStringGrid(Sender) do
  begin
    Canvas.Font := Font;
    if ((ARow > 0) and (Cells[2, ARow] <> '')) then
      if MonthsBetween(now, StrToDate(Cells[2, ARow])) <  StrToInt(GenSettings.Values['WarningMonth']) then
        Canvas.Brush.Color := clFYellow;
    if ((ARow > 0) and isInteger(Cells[1, ARow])) then
      if StrToInt(Cells[1, ARow]) < 3 then
        Canvas.Brush.Color := clFRed;
    Canvas.FillRect(Rect);
    InflateRect(Rect, -2, -2);
    DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), StrLen(PChar(Cells[ACol, ARow])), Rect,DT_LEFT);
  end;
end;

end.
