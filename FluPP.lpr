program FluPP;

{$MODE Delphi}


{%ToDo 'FluPP.todo'}

uses
  Forms,
  Main in 'Main.pas' {FMain},
  Grid in 'Grid.pas' {FGrid},
  SButton in 'SButton.pas' {FSButton: TFrame},
  InputBox in 'InputBox.pas' {FInputBox},
  Tools in 'Tools.pas',
  ToolsShell in 'ToolsShell.pas',
  Input in 'Input.pas' {FInput},
  BasicSettings in 'BasicSettings.pas' {FBasicSettings},
  FlightLogs in 'FlightLogs.pas' {FFlightLogs},
  ToolsGrid in 'ToolsGrid.pas',
  Import in 'Import.pas',
  Export in 'Export.pas',
  RunTimeTypeInfoControls,
  TurboPowerIPro,
  TAChartLazarusPkg;

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFInput, FInput);
  Application.Run;
end.
