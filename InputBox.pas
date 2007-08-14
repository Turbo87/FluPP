unit InputBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, gnugettext, JvExStdCtrls,
  JvButton, JvCtrls;

type
  TFInputBox = class(TForm)
    Panel1: TPanel;
    ButtonCancel: TJvImgBtn;
    ButtonOK: TJvImgBtn;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FInputBox: TFInputBox;

implementation

{$R *.dfm}

end.
