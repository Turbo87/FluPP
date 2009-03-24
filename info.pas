unit Info;

{$MODE Delphi}

interface

uses
  {Windows,} Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, {shellapi, gnugettext, JvExStdCtrls,
  JvButton, JvCtrls, JvGIF,} DateUtils, Tools, LResources;

type
  TFInfo = class(TForm)
    LabelVersionDate: TLabel;
    LabelLizenz: TLabel;
    LabelHomepage: TLabel;
    LabelFeature: TLabel;
    LabelVersion: TLabel;
    LabelBugs: TLabel;
    ButtonExit: TJvImgBtn;
    PanelCredits: TPanel;
    TimerCredits: TTimer;
    LabelCredits: TLabel;
    LabelPrgName: TLabel;
    procedure HomepageClick(Sender: TObject);
    procedure LabelBugsClick(Sender: TObject);
    procedure LabelFeatureClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerCreditsTimer(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FInfo: TFInfo;

implementation

uses Main;


procedure TFInfo.HomepageClick(Sender: TObject);
begin
  FMain.ActionHPExecute(Sender);
end;

procedure TFInfo.LabelBugsClick(Sender: TObject);
begin
  FMain.ActionHPBugsExecute(Sender);
end;

procedure TFInfo.LabelFeatureClick(Sender: TObject);
begin
  FMain.ActionHPRFEExecute(Sender);
end;

procedure TFInfo.FormCreate(Sender: TObject);
begin
  TP_Ignore(self,'LabelVersionDate');
  TP_Ignore(self,'LabelVersion');
  TranslateComponent(Self);
  //DoubleBuffered := True;
end;

procedure TFInfo.FormShow(Sender: TObject);
begin
  LabelHomepage.caption := FluPPDomain;

  LabelVersion.caption := GetFileVersion(ParamStr(0));
  LabelVersionDate.caption := DateToStr(UnixToDateTime(GetImageLinkTimeStamp(Application.ExeName)));

  LabelCredits.Caption := CREDITS;
  LabelCredits.Top := PanelCredits.Height + 10;

  TimerCredits.Enabled := True;
end;

procedure TFInfo.TimerCreditsTimer(Sender: TObject);
begin
  LabelCredits.Top := LabelCredits.Top - 1;
  if LabelCredits.Top + LabelCredits.Height < 0 then
    LabelCredits.Top := PanelCredits.Height;
end;

initialization
  {$i Info.lrs}
  {$i Info.lrs}
  {$i Info.lrs}
  {$i Info.lrs}
  {$i Info.lrs}
  {$i Info.lrs}

end.
