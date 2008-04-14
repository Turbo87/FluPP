program FluPP;

{$MODE Delphi}


{%ToDo 'FluPP.todo'}

uses
  Forms,
  Main in 'Main.pas' {FMain},
  Info in 'Info.pas' {FInfo},
  Grid in 'Grid.pas' {FGrid},
  SButton in 'SButton.pas' {FSButton: TFrame},
  TrainBaro in 'TrainBaro.pas' {FTrainBaro},
  InputBox in 'InputBox.pas' {FInputBox},
// NinetyDays in 'NinetyDays.pas' {FNinetyDays},
  Tools in 'Tools.pas',
  ToolsShell in 'ToolsShell.pas',
// Print in 'Print.pas' {FPrint},
// Airports in 'Airports.pas' {FAirports},
  Input in 'Input.pas' {FInput},
  Settings in 'Settings.pas' {FSettings},
  BasicSettings in 'BasicSettings.pas' {FBasicSettings},
// Licenses in 'Licenses.pas' {FLicenses},
// Statistics in 'Statistics.pas' {FStatistics},
// StatGraph in 'StatGraph.pas' {FStat_Graph},
  ToolsLicense in 'ToolsLicense.pas',
  FlightLogs in 'FlightLogs.pas' {FFlightLogs},
  ToolsGrid in 'ToolsGrid.pas',
  Import in 'Import.pas',
  Export in 'Export.pas',
//  Debug in 'Debug.pas',
  RunTimeTypeInfoControls,
  TurboPowerIPro,
  TAChartLazarusPkg;

{GlobalExceptionHandler, Logfile}

{$R *.RES}

{$R FluPP.res}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.CreateForm(TFMain, FMain);
  //Application.CreateForm(TFStat_Graph, FStat_Graph);
  Application.CreateForm(TFInput, FInput);
  Application.Run;
end.
