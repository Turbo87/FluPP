unit StatGraph;

{$MODE Delphi}

interface

uses
  {Windows,} Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, {JvExGrids, JvStringGrid,
  gnugettext, JvExStdCtrls, JvButton, JvCtrls,} Statistics, LResources;

type
  TFStat_Graph = class(TForm)
    Panel1: TPanel;
    ButtonExit: TJvImgBtn;
    StatusBar1: TStatusBar;
    PanelGraph: TPanel;
    RBBalken: TRadioButton;
    RBLinien: TRadioButton;
    CBY1: TComboBox;
    CBY2: TComboBox;
    ShapeRed: TShape;
    ShapeBlue: TShape;
    Label1: TLabel;
    ButtonExport: TJvImgBtn;
    procedure Redraw(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonExportClick(Sender: TObject);

  private
    procedure TabFree(Sender: TObject; var Action: TCloseAction);
    procedure DrawAreaFree(Sender: TObject; var Action: TCloseAction);
    procedure TabOnSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure TabOnGetAlignment(Sender: TJvStringGrid; AColumn,
      ARow: Integer; State: TGridDrawState; var CellAlignment: TAlignment);
  public
    DrawArea: TImage;
    Tab: TJvStringGrid;
    procedure CreateDrawArea;
    procedure CreateTab;
    procedure VertText(Text: String; X,Y: Integer; Align: String);
  end;

var
  FStat_Graph: TFStat_Graph;


implementation

uses Main;


// ----------------------------------------------------------------
// create DrawArea
// ----------------------------------------------------------------
procedure TFStat_Graph.CreateDrawArea;
begin
  OnClose := DrawAreaFree;
  OnResize := FormResize;
  DoubleBuffered := True;
  DrawArea := TImage.create(FStat_Graph);
  ButtonExport.Visible := False;
  with DrawArea do
  begin
    Parent := FStat_Graph;
    Align := alClient;
  end;

end;

// ----------------------------------------------------------------
// free DrawArea
// ----------------------------------------------------------------
procedure TFStat_Graph.DrawAreaFree;
begin
  DrawArea.Free;
end;

// ----------------------------------------------------------------
// create Tab
// ----------------------------------------------------------------
procedure TFStat_Graph.CreateTab;
begin
  Tab := TJvStringGrid.create(FStat_Graph);
  ButtonExport.Visible := True;
  OnClose := TabFree;
  OnResize := nil;
  With Tab do
  begin
    Parent := FStat_Graph;
    onSelectCell := TabOnSelectCell;
    onGetCellAlignment := TabOnGetAlignment;
    Align := alClient;
    ColCount := 14;
    DefaultRowHeight := 17;
    DefaultColWidth := 60;
    Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRowSelect,goThumbTracking, goColSizing];
    Cells[0,0] := _('Year');
    Cells[1,0] := _('flights');
    Cells[2,0] := 'W';
    Cells[3,0] := 'F';
    Cells[4,0] := 'E';
    Cells[5,0] := 'A';
    Cells[6,0] := 'G';
    Cells[7,0] := _('Time');
    Cells[8,0] := _('Ø-Flight time:');
    Cells[9,0] := _('Distance');
    Cells[10,0] := _('Ø-Speed');
    Cells[11,0] := _('Passengers');
    Cells[12,0] := _('Ø-Passengers');

    Cells[13,0] := _('Costs:')+' '+_('Aircraft');
    Cells[14,0] := _('Costs:')+' '+_('Crew');
    Cells[15,0] := _('Costs:')+' '+_('Landing');
    Cells[16,0] := _('Costs:')+' '+_('Earning');
    Cells[17,0] := _('Costs:')+' '+_('Total Overview');

    ColWidths[2] := 30;
    ColWidths[3] := 30;
    ColWidths[4] := 30;
    ColWidths[5] := 30;
    ColWidths[6] := 30;
  end;
end;

// ----------------------------------------------------------------
// Free tab
// ----------------------------------------------------------------
procedure TFStat_Graph.TabFree;
begin
  Tab.Free;
end;

// ----------------------------------------------------------------
// Allow no selection
// ----------------------------------------------------------------
procedure TFStat_Graph.TabOnSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect := False;
end;

// ----------------------------------------------------------------
// Grid allignment
// ----------------------------------------------------------------
procedure TFStat_Graph.TabOnGetAlignment(Sender: TJvStringGrid; AColumn,
      ARow: Integer; State: TGridDrawState; var CellAlignment: TAlignment);
begin
  CellAlignment := taRightJustify;
end;

// ----------------------------------------------------------------
// vertical text
// ----------------------------------------------------------------
procedure TFStat_Graph.VertText(Text: String; X,Y: Integer; Align: String);
var
  TextArea: TImage;
  v,w, Versatz: Integer;
begin
  if (Text = '0') or (Text='0:00') or (Text='0,00') then
    Exit;
  TextArea := TImage.create(self);
  With TextArea do
  begin
    Parent := FStat_Graph;
    Top := 0;
    Left := 0;
    Height := Canvas.TextHeight(Text);
    Width := Canvas.TextWidth(Text);
    Transparent := True;
  end;
  if Align = 'Left' then Versatz := TextArea.Width
  else Versatz := 0;
  TextArea.Canvas.TextOut(0,0,Text);
  for v := 1 to TextArea.Width do
    for w := 1 to TextArea.Height do
      if TextArea.Canvas.Pixels[TextArea.Width-v,w] = clBlack then
        DrawArea.Canvas.Pixels[X+w,Y+v-Versatz] := TextArea.Canvas.Pixels[TextArea.Width-v,w];
  TextArea.Free
end;

procedure TFStat_Graph.Redraw(Sender: TObject);
begin
  DrawArea.Free;
  FStatistics.DrawGraph;
end;

procedure TFStat_Graph.FormResize(Sender: TObject);
begin
  DrawArea.Free;
  FStatistics.DrawGraph;
end;

procedure TFStat_Graph.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self);
  ShapeBlue.Brush.Color := clFBlue;
  ShapeRed.Brush.Color := clFRed;
end;

// ----------------------------------------------------------------
// Export Stats to CSV
// ----------------------------------------------------------------
procedure TFStat_Graph.ButtonExportClick(Sender: TObject);
begin
  FMain.SaveDialog.Filter := _('Comma-Separated Variables')+' (*.csv)'+'|*.csv';
  if not FMain.SaveDialog.Execute then exit;
  Tab.SaveToCSV(FMain.SaveDialog.FileName);
end;

initialization
  {$i StatGraph.lrs}
  {$i StatGraph.lrs}
  {$i StatGraph.lrs}

end.
