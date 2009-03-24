program FluPP;

{$MODE Delphi}


{%ToDo 'FluPP.todo'}

uses
  Forms,
  Main in 'main.pas' {FMain},
  Grid in 'grid.pas' {FGrid},
  SButton in 'sbutton.pas' {FSButton},
  InputBox in 'inputbox.pas' {FInputBox},
  Tools in 'tools.pas',
  ToolsShell in 'toolsshell.pas',
  Input in 'input.pas' {FInput},
  BasicSettings in 'basicsettings.pas' {FBasicSettings},
  FlightLogs in 'flightlogs.pas' {FFlightLogs},
  ToolsGrid in 'toolsgrid.pas',
  Import in 'import.pas',
  Export in 'export.pas',
  debug in 'debug.pas',
  RunTimeTypeInfoControls,
  TurboPowerIPro,
  TAChartLazarusPkg;

{$IFDEF WINDOWS}{$R FluPP.rc}{$ENDIF}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFInput, FInput);
  Application.Run;
end.
