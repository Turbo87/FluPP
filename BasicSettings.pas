unit BasicSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Inifiles, registry, gnugettext,
  JvExStdCtrls, JvButton, JvCtrls, Tools;

type
  TFBasicSettings = class(TForm)
    Panel1: TPanel;
    ButtonOK: TJvImgBtn;
    ButtonBeenden: TJvImgBtn;
    StatusBar1: TStatusBar;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    CBAutoLoad: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    LabelAutoload: TLabel;
    TabSheet2: TTabSheet;
    LBLanguages: TListBox;
    Label3: TLabel;
    LabelTranslator: TLabel;
    LabelTransDate: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    GroupBox1: TGroupBox;
    BitBtn1: TJvImgBtn;
    BitBtn2: TJvImgBtn;
    procedure FormShow(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonAddRegClick(Sender: TObject);
    procedure ButtonRemRegClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LBLanguagesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Languages: TStrings;
  public
    procedure onHint(Sender: TObject);
  end;

var
  FBasicSettings: TFBasicSettings;

implementation

uses Main, ToolsGrid;

{$R *.DFM}

// ----------------------------------------------------------------
// Form show
// ----------------------------------------------------------------
procedure TFBasicSettings.FormShow(Sender: TObject);
var
  IniFile: TIniFile;
begin
  { read inifile }
  Inifile := Tinifile.create(GetActualDir(false)+'\FliPS.Ini');
  CBAutoLoad.checked := IniFile.ReadBool('General','AutoLoad',False);
  LabelAutoLoad.caption := Inifile.ReadString('General','AutoLoadFile','');
  Inifile.Free;

  { Languages }
  Languages := TStringList.Create;
  LBLanguages.Items.Clear;
  DefaultInstance.GetListOfLanguages('default',Languages);
  LBLanguages.Items := Languages;

  DefaultInstance.BindTextDomainToFile ('languagecodes',GetActualDir(true)+'\locale\languagecodes.mo');
  DefaultInstance.TranslateProperties(LBLanguages,'languagecodes');

  LBLanguages.ItemIndex := Languages.IndexOf(copy(DefaultInstance.GetCurrentLanguage,1,2));
  if LBLanguages.ItemIndex = -1 then LBLanguages.ItemIndex := Languages.IndexOf(defaultLanguage);
  LBLanguagesClick(self);

  Application.OnHint := onHint;
end;

// ----------------------------------------------------------------
// Form close
// ----------------------------------------------------------------
procedure TFBasicSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.OnHint := FMain.onHint;
  Languages.Free;
end;

// ----------------------------------------------------------------
// Hint
// ----------------------------------------------------------------
procedure TFBasicSettings.onHint(Sender: TObject);
begin
  StatusBar1.Panels[0].text := GetLongHint(Application.Hint);
end;

// ----------------------------------------------------------------
// Write ini file
// ----------------------------------------------------------------
procedure TFBasicSettings.ButtonOKClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  if Languages[LBLanguages.ItemIndex] <> copy(DefaultInstance.GetCurrentLanguage,1,2) then
    MessageDlg(_('Please restart FliPS for changes to apply'),mtInformation,[mbOK],0);

  Inifile := Tinifile.create(GetActualDir(false)+'\FliPS.Ini');
  Inifile.WriteBool('General','AutoLoad',CBAutoLoad.checked);
  Inifile.WriteString('General','AutoLoadFile',LabelAutoLoad.caption);
  if LBLanguages.ItemIndex <> -1 then
  Inifile.WriteString('General','Language',Languages[LBLanguages.ItemIndex]);
  Inifile.Free;

  If FMain.MDIChildCount > 0 then
  begin
   FMain.UpdateSButtons;
   GridActiveChild.ReCalcGridNr;
  end;
end;

// ----------------------------------------------------------------
// Open autoload fligt log
// ----------------------------------------------------------------
procedure TFBasicSettings.Button1Click(Sender: TObject);
begin
  if not FMain.OpenDialog.execute then exit
  else LabelAutoload.caption := FMain.OpenDialog.FileName;
end;

// ----------------------------------------------------------------
// Load current flight log
// ----------------------------------------------------------------
procedure TFBasicSettings.Button2Click(Sender: TObject);
begin
  LabelAutoload.caption := FlpFileName;
end;

// ----------------------------------------------------------------
// Set registry entries
// ----------------------------------------------------------------
procedure TFBasicSettings.ButtonAddRegClick(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CLASSES_ROOT;
    if not Reg.OpenKey('.flg', False) then
    begin
      Reg.OpenKey('.flg',True);
      Reg.WriteString('','FLG-File');

      Reg.OpenKey('\FLG-File',True);
      Reg.WriteString('','FliPS Datei');
      Reg.OpenKey('DefaultIcon',True);
      Reg.WriteString('',ParamStr(0)+',0');
      Reg.OpenKey('\FLG-File\Shell',True);
      Reg.WriteString('','Open');
      Reg.OpenKey('Open\Command',True);
      Reg.WriteString('','"' + ParamStr(0) + '" "%1"');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
    inherited;
  end;
end;

// ----------------------------------------------------------------
// Remove registry entries
// ----------------------------------------------------------------
procedure TFBasicSettings.ButtonRemRegClick(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.DeleteKey('.flu');
    Reg.DeleteKey('FLUFile');
  finally
    Reg.CloseKey;
    Reg.Free;
    inherited;
  end;
end;

// ----------------------------------------------------------------
// Choose language
// ----------------------------------------------------------------
procedure TFBasicSettings.LBLanguagesClick(Sender: TObject);
var TmpLanguage: String;
begin
  TmpLanguage := DefaultInstance.GetCurrentLanguage;
  DefaultInstance.UseLanguage(Languages[LBLanguages.ItemIndex]);
  LabelTranslator.Caption := DefaultInstance.GetTranslationProperty('Language-Team');
  LabelTransDate.Caption := DefaultInstance.GetTranslationProperty('PO-Revision-Date');
  DefaultInstance.UseLanguage(TmpLanguage);
end;

// ----------------------------------------------------------------
// Create form
// ----------------------------------------------------------------
procedure TFBasicSettings.FormCreate(Sender: TObject);
begin
  TP_Ignore(self,'LabelAutoload');
  TP_Ignore(self,'LBLanguages');
  TP_Ignore(self,'LabelTranslator');
  TP_Ignore(self,'LabelTransDate');
  TranslateComponent(self);
end;

end.
