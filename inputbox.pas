unit InputBox;

{$MODE Delphi}

interface

uses
  {Windows,} Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, {Mask,} Buttons, ExtCtrls{, gnugettext, JvExStdCtrls,
  JvButton, JvCtrls}, LResources;

type
  TFInputBox = class(TForm)
    Panel1: TPanel;
    ButtonCancel: TBitBtn;
    ButtonOK: TBitBtn;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FInputBox: TFInputBox;

implementation


initialization
  {$i InputBox.lrs}

end.
