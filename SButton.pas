unit SButton;

{$MODE Delphi}

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, gnugettext, LResources;

type
  TFSButton = class(TFrame)
    PanelSB: TPanel;
    LabelHeading: TLabel;
    Panel90: TPanel;
    PanelT: TPanel;
    BevelSB: TBevel;
    procedure MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel90DblClick(Sender: TObject);
    procedure PanelTDblClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public

  end;

implementation

uses Main, Grid; //Licenses;


// ----------------------------------------------------------------
// Press Button
// ----------------------------------------------------------------
procedure TFSButton.MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and not (ssDouble	in Shift) then
  begin
    BevelSB.Shape := bsBox;
    PanelSB.Top := 3;
    PanelSB.Left := 3;
  end;
end;

// ----------------------------------------------------------------
// Release Button
// ----------------------------------------------------------------
procedure TFSButton.MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    BevelSB.Shape := bsFrame;
    PanelSB.Top := 2;
    PanelSB.Left := 2;
    TFGrid(Self.Owner).Show;
  end;
end;

procedure TFSButton.Panel90DblClick(Sender: TObject);
begin
  FMain.MMNinetyDaysClick(Sender);
end;

procedure TFSButton.PanelTDblClick(Sender: TObject);
begin
  FMain.MMTrainBaroClick(Sender);
end;

initialization
  {$i SButton.lrs}

end.
