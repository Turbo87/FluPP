unit SButton;

{$MODE Delphi}

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, gnugettext, LResources;

type
  TFSButton = class(TForm)
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
    FlWindow.SetActive(FlWindow.IndexOf(Self.Owner));
  end;
end;

procedure TFSButton.Panel90DblClick(Sender: TObject);
begin
  FMain.NinetyDaysShow(Sender);
end;

procedure TFSButton.PanelTDblClick(Sender: TObject);
begin
  FMain.TrainBaroShow(Sender);
end;

initialization
  {$i SButton.lrs}

end.
