unit Settings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, Inifiles, CheckLst,
  gnugettext, JvExStdCtrls, JvButton, JvCtrls, ToolsLicense, JvSimpleXML,                               
  Grids, ValEdit, ShellAPI, VirtualTrees, StrUtils, JvEdit, JvValidateEdit,
  Menus;

type
  PTreeData = ^TTreeData;
  TTreeData = record
    Caption,
    FileName: String;
  end;

type
  TFSettings = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ButtonOK: TJvImgBtn;
    ButtonExit: TJvImgBtn;
    PageControl: TPageControl;
    TabSheetAutoComplete: TTabSheet;
    TabSheetGeneral: TTabSheet;
    PanelFligtLogs: TPanel;
    LBFlu: TListBox;
    TabSheetLicenses: TTabSheet;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    GEStarts: TEdit;
    GEStunden: TMaskEdit;
    TabSheetCat: TTabSheet;
    GroupBox5: TGroupBox;
    LabelAC: TLabel;
    ButtonRem: TJvImgBtn;
    ButtonAdd: TJvImgBtn;
    PanelFlugz: TPanel;
    LabelTyp: TLabel;
    EditTyp: TEdit;
    LBKatDetail: TListBox;
    EditAC: TEdit;
    LBKatAC: TListBox;
    GroupBox9: TGroupBox;
    PageControlLicenses: TPageControl;
    TSLDate: TTabSheet;
    VLEDate: TValueListEditor;
    TSLCat: TTabSheet;
    VLECat: TValueListEditor;
    TSLAccLic: TTabSheet;
    VLEAccLic: TValueListEditor;
    TSLOptCon: TTabSheet;
    CLBOptCond: TCheckListBox;
    TabSheetMedicals: TTabSheet;
    Label11: TLabel;
    Label18: TLabel;
    GroupBox10: TGroupBox;
    CLBMedicals: TCheckListBox;
    VLEMedicals: TValueListEditor;
    ButtonNext: TJvImgBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    CLBKat: TListBox;
    ButtonKatAdd: TJvImgBtn;
    ButtonKatRem: TJvImgBtn;
    LBCTi: TListBox;
    ButtonCTiAdd: TJvImgBtn;
    ButtonCTiRem: TJvImgBtn;
    Label14: TLabel;
    LBContest: TListBox;
    ButtonContestAdd: TJvImgBtn;
    ButtonContestRem: TJvImgBtn;
    Label15: TLabel;
    Label17: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    GEScheinSeit: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label2: TLabel;
    Label12: TLabel;
    TSLTimeCat: TTabSheet;
    VLETimeCat: TValueListEditor;
    Label13: TLabel;
    TSLInfo: TTabSheet;
    MemoLicInfo: TMemo;
    JvSimpleXML: TJvSimpleXML;
    LabelGetAirports: TLabel;
    VSTLicFiles: TVirtualStringTree;
    TabSheetFlightLog: TTabSheet;
    GroupBox12: TGroupBox;
    RGNumeration: TRadioGroup;
    GroupBox1: TGroupBox;
    Label31: TLabel;
    GEKPrae: TEdit;
    RGDistUnit: TRadioGroup;
    GroupBox6: TGroupBox;
    Bevel6: TBevel;
    Bevel7: TBevel;
    CBStartType: TCheckBox;
    CBBlockTime: TCheckBox;
    CBFlightTime: TCheckBox;
    GroupBox8: TGroupBox;
    LabelDefTime: TLabel;
    RBDefTimeBlock: TRadioButton;
    RBDefTimeFlight: TRadioButton;
    RGDefPosition: TRadioGroup;
    TabSheetCosts: TTabSheet;
    GroupBox14: TGroupBox;
    AircraftList: TListBox;
    GroupBox13: TGroupBox;
    Bevel4: TBevel;
    CurLabel2: TLabel;
    CurLabel1: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label10: TLabel;
    CalcByBT: TRadioButton;
    CalcByFT: TRadioButton;
    CpF: TJvValidateEdit;
    CpH: TJvValidateEdit;
    GroupBox15: TGroupBox;
    Cat: TComboBox;
    Cls: TComboBox;
    Eng: TComboBox;
    Wgt: TComboBox;
    Use: TComboBox;
    Label22: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label16: TLabel;
    Bevel5: TBevel;
    Bevel8: TBevel;
    Label20: TLabel;
    Bevel9: TBevel;
    GECurrency: TJvEdit;
    PopupMenu1: TPopupMenu;
    CleanXMLdata1: TMenuItem;
    GroupBox16: TGroupBox;
    DisallowChange: TCheckBox;
    AllowLastEdit: TCheckBox;
    GroupBox17: TGroupBox;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label19: TLabel;
    GEName: TEdit;
    GERoad: TEdit;
    GELocation: TEdit;
    GEPilotName: TEdit;
    GroupBox7: TGroupBox;
    Label21: TLabel;
    GEWarningMonth: TMaskEdit;
    GroupBox11: TGroupBox;
    CBExportICal: TCheckBox;
    Label1: TLabel;
    procedure LBKatACClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LBKatDetailClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonRemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LBFluClick(Sender: TObject);
    procedure GEExit(Sender: TObject);
    procedure ButtonKatAddClick(Sender: TObject);
    procedure ButtonKatRemClick(Sender: TObject);
    procedure ButtonCTiAddClick(Sender: TObject);
    procedure ButtonCTiRemClick(Sender: TObject);
    procedure ButtonContestAddClick(Sender: TObject);
    procedure ButtonContestRemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VLEGetDateEditMask(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure VLEExit(Sender: TObject);
    procedure CLBOptCondExit(Sender: TObject);
    procedure VLEMedicalsExit(Sender: TObject);
    procedure CLBMedicalsClickCheck(Sender: TObject);
    procedure LBFluDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ButtonNextClick(Sender: TObject);
    procedure LabelGetAirportsClick(Sender: TObject);
    procedure CBTimeClick(Sender: TObject);
    procedure VSTLicFilesGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure VSTLicFilesChecked(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure GECurrencyChange(Sender: TObject);
    procedure AcCostsEditExit(Sender: TObject);
    procedure AcCostsComboExit(Sender: TObject);
    procedure AcCostsCalcByExit(Sender: TObject);
    procedure AircraftListClick(Sender: TObject);
    procedure CleanXMLdata1Click(Sender: TObject);
    procedure TabSheetGeneralShow(Sender: TObject);
    procedure TabSheetGeneralHide(Sender: TObject);
    procedure DisallowChangeClick(Sender: TObject);
  private
    ACAircrafts_S,
    ACPilots_S,
    ACAirports_S,
    ACCategories_S,
    ACTimeCat_S,
    ACContestCat_S,
    Settings_S: Array of TStrings;
    LicenseCategories_S,
    LicenseTimeCat_S,
    LicenseDates_S,
    AccLicenses_S,
    OptConditions_S: Array of TStrings;
    Medicals_S: TStrings;
    DataChanged_S: Boolean;
    procedure onHint(Sender: TObject);
    procedure SaveLicenseSettings;
    procedure LoadLicenseSettings;
    procedure LoadMedicalSettings;
    procedure RefreshMedicalVLE;
    procedure SaveMedicalSettings;
    function AddVSTLicense(Country: String; ARecord: TTreeData): PVirtualNode;
  public
    procedure NewFlightLog;
  end;

var
  FSettings: TFSettings;

implementation

uses Main, Tools, ToolsGrid, Export;

{$R *.DFM}


// ----------------------------------------------------------------
// Form create
// ----------------------------------------------------------------
procedure TFSettings.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self);
  LabelGetAirports.Hint := FluPPDomain+'/airports/'+StrToHTML(GetFileVersion(ParamStr(0)));
end;

// ----------------------------------------------------------------
// Form show
// ----------------------------------------------------------------
procedure TFSettings.FormShow(Sender: TObject);
var
  i: Word;
  SearchRec: TSearchRec;
  CountryStr: String;
  TreeData: TTreeData;
begin
  LBFlu.Items.Clear;
  for i := 0 to FMain.MDIChildCount-1 do
    LBFlu.Items.Add(GridChild(i).caption);
  LBFlu.ItemIndex := 0;
  LBFlu.Columns := LBFlu.Count;
  LBFlu.Visible := false;

  SetLength(ACAircrafts_S,FMain.MDIChildCount);
  SetLength(ACPilots_S,FMain.MDIChildCount);
  SetLength(ACAirports_S,FMain.MDIChildCount);
  SetLength(ACCategories_S,FMain.MDIChildCount);
  SetLength(ACTimeCat_S,FMain.MDIChildCount);
  SetLength(ACContestCat_S,FMain.MDIChildCount);
  SetLength(Settings_S,FMain.MDIChildCount);

  SetLength(LicenseCategories_S,FMain.MDIChildCount);
  SetLength(LicenseTimeCat_S,FMain.MDIChildCount);
  SetLength(LicenseDates_S,FMain.MDIChildCount);
  SetLength(AccLicenses_S,FMain.MDIChildCount);
  SetLength(OptConditions_S,FMain.MDIChildCount);

  for i := 0 to FMain.MDIChildCount-1 do
  begin
    ACAircrafts_S[i] := TStringList.Create;
    ACPilots_S[i] := TStringList.Create;
    ACAirports_S[i] := TStringList.Create;
    ACCategories_S[i] := TStringList.Create;
    ACTimeCat_S[i] := TStringList.Create;
    ACContestCat_S[i] := TStringList.Create;
    Settings_S[i] := TStringList.Create;

    LicenseCategories_S[i] := TStringList.Create;
    LicenseTimeCat_S[i] := TStringList.Create;
    LicenseDates_S[i] := TStringList.Create;
    AccLicenses_S[i] := TStringList.Create;
    OptConditions_S[i] := TStringList.Create;
  end;

  Medicals_S := TStringList.Create;

  { StringLists }
  for i := 0 to FMain.MDIChildCount-1 do
  begin
    ACAircrafts_S[i].Assign(GridChild(i).ACAircrafts);
    ACPilots_S[i].Assign(GridChild(i).ACPilots);
    ACAirports_S[i].Assign(GridChild(i).ACAirports);
    ACCategories_S[i].Assign(GridChild(i).ACCategories);
    ACContestCat_S[i].Assign(GridChild(i).ACContestCat);
    ACTimeCat_S[i].Assign(GridChild(i).ACTimeCat);
    Settings_S[i].Assign(GridChild(i).Settings);

    LicenseCategories_S[i].Assign(GridChild(i).LicenseCategories);
    LicenseTimeCat_S[i].Assign(GridChild(i).LicenseTimeCat);
    LicenseDates_S[i].Assign(GridChild(i).LicenseDates);
    AccLicenses_S[i].Assign(GridChild(i).AccLicenses);
    OptConditions_S[i].Assign(GridChild(i).OptConditions);
  end;

  { General data }
  GEName.Text := GenSettings.Values['Name'];
  GERoad.Text := GenSettings.Values['Road'];
  GELocation.Text := GenSettings.Values['Location'];
  GEPilotName.Text := GenSettings.Values['PilotName'];
  GEWarningMonth.Text := GenSettings.Values['WarningMonth'];
  CBExportICal.Checked := StrToBool(GenSettings.Values['ExportICal']);
  Medicals_S.Assign(Medicals);

  { Aircraft / Costs }
  for i := 0 to GroupBox13.ControlCount-1 do begin
    if TObject(GroupBox13.Controls[i]) is TRadioButton then
      TRadioButton(GroupBox13.Controls[i]).Enabled := false;
    if TObject(GroupBox13.Controls[i]) is TJvValidateEdit then
      TJvValidateEdit(GroupBox13.Controls[i]).Enabled := false;
  end;

  for i := 0 to GroupBox15.ControlCount-1 do begin
    if TObject(GroupBox15.Controls[i]) is TComboBox then
      TComboBox(GroupBox15.Controls[i]).Enabled := false;
  end;

  GECurrency.Text := GenSettings.Values['Currency'];

  { Licenses }
  DefaultInstance.BindtextdomainToFile('countrycodes',GetActualDir(true)+'\locale\countrycodes.mo');

  { Get country list }
  VSTLicFiles.Clear;
  VSTLicFiles.NodeDataSize:=SizeOf(TTreeData);
  VSTLicFiles.BeginUpdate;
  if FindFirst(GetActualDir(true)+'\licenses\*.xml', faAnyFile, SearchRec) = 0 then
  begin
    repeat
      if LoadXMLLicense(GetActualDir(true)+'\licenses\'+SearchRec.Name, JvSimpleXML) then
      begin;
        if (JvSimpleXML.Root.Name = 'license') then
        begin
          CountryStr := JvSimpleXML.Root.Properties.Value('Country');
          TreeData.Caption := JvSimpleXML.Root.Properties.Value('Name');
          TreeData.FileName := SearchRec.Name;
          AddVSTLicense(dgettext('countrycodes', AnsiLowerCase(CountryStr)), TreeData);
        end;
      end;
    until FindNext(SearchRec) <> 0;
  end;
  VSTLicFiles.EndUpdate;

  { Default Country }
  {if GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SISO3166CTRYNAME, CountryName, SizeOf(CountryName)) > 0 then
    CBLicCountries.ItemIndex := Countries.IndexOfName(CountryName);
  if (CBLicCountries.ItemIndex = -1) and (CBLicCountries.Items.Count > 0) then
    CBLicCountries.ItemIndex := 0;     }

  LBKatAC.ItemIndex := 0;
  LBKatACClick(self);
  Application.OnHint := onHint;

  LBFlu.ItemIndex := 0;
  LBFluClick(Self);
  LoadMedicalSettings;
end;

// ----------------------------------------------------------------
// OnHint
// ----------------------------------------------------------------
procedure TFSettings.onHint(Sender: TObject);
begin
  StatusBar1.Panels[0].text := GetLongHint(Application.Hint);
end;

// ----------------------------------------------------------------
// Form close
// ----------------------------------------------------------------
procedure TFSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i: Word;
begin
  { StringLists }
  for i := 0 to LBFlu.Items.Count-1 do
  begin
    ACAircrafts_S[i].Free;   
    ACPilots_S[i].Free;
    ACAirports_S[i].Free;
    ACCategories_S[i].Free;
    ACTimeCat_S[i].Free;
    ACContestCat_S[i].Free;
    Settings_S[i].Free;
    LicenseCategories_S[i].Free;
    LicenseTimeCat_S[i].Free;
    LicenseDates_S[i].Free;
    AccLicenses_S[i].Free;
    OptConditions_S[i].Free;
  end;
  Medicals_S.Free;

  SetLength(ACAircrafts_S,0);
  SetLength(ACPilots_S,0);
  SetLength(ACAirports_S,0);
  SetLength(ACCategories_S,0);
  SetLength(ACTimeCat_S,0);
  SetLength(ACContestCat_S,0);
  SetLength(Settings_S,0);
  SetLength(LicenseCategories_S,0);
  SetLength(LicenseTimeCat_S,0);
  SetLength(LicenseDates_S,0);
  SetLength(AccLicenses_S,0);
  SetLength(OptConditions_S,0);

  Application.OnHint := FMain.onHint;
end;

// ----------------------------------------------------------------
// Draw flight log LB items
// ----------------------------------------------------------------
procedure TFSettings.LBFluDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  LBFlu.Canvas.FillRect(Rect);
  InflateRect(Rect, 0, -4);
  DrawText(LBFlu.Canvas.Handle, PChar(LBFlu.Items[Index]), StrLen(PChar(LBFlu.Items[Index])), Rect,DT_CENTER);
end;

// ----------------------------------------------------------------
// Save settings
// ----------------------------------------------------------------
procedure TFSettings.ButtonOKClick(Sender: TObject);
var
  i, j: Integer;
begin
  GEExit(Self);
  VLEExit(Self);
  
  { StringLists }
  for j := 0 to FMain.MDIChildCount -1 do
  begin
    GridChild(j).ACAircrafts.Assign(ACAircrafts_S[j]);
    GridChild(j).ACPilots.Assign(ACPilots_S[j]);
    GridChild(j).ACAirports.Assign(ACAirports_S[j]);
    GridChild(j).ACCategories.Assign(ACCategories_S[j]);
    GridChild(j).ACContestCat.Assign(ACContestCat_S[j]);
    GridChild(j).ACTimeCat.Assign(ACTimeCat_S[j]);
    
    GridChild(j).LicenseCategories.Assign(LicenseCategories_S[j]);
    GridChild(j).LicenseTimeCat.Assign(LicenseTimeCat_S[j]);
    GridChild(j).LicenseDates.Assign(LicenseDates_S[j]);
    GridChild(j).AccLicenses.Assign(AccLicenses_S[j]);
    GridChild(j).OptConditions.Assign(OptConditions_S[j]);
  end;

  { Settings }
  for j := 0 to FMain.MDIChildCount -1 do
  begin
    { Convert units }
    if GridChild(j).Settings.Values['DistUnit'] <> Settings_S[j].Values['DistUnit'] then
      if MessageDlg(_('Do you want to convert the distances into the new unit?'),mtConfirmation,[mbYes,mbNo],0) = mrYes then
        for i := 1 to GridChild(j).Grid.RowCount-1 do
          if GridChild(j).Data['Dst',i] <> '' then
            GridChild(j).Data['Dst',i] := IntToStr(Round(
              ConvertDistUnits(StrtoFloat(GridChild(j).Data['Dst',i]),
                GridChild(j).Settings.Values['DistUnit'],Settings_S[j].Values['DistUnit'])));

    GridChild(j).Settings.Assign(Settings_S[j]);
  end;

  { General Settings }
  GenSettings.Clear;
  GenSettings.Values['Name'] := GEName.Text;
  GenSettings.Values['Road'] := GERoad.Text;
  GenSettings.Values['Location'] := GELocation.Text;
  GenSettings.Values['PilotName'] := GEPilotName.Text;

  { Aircraft / Costs }
  GenSettings.Values['Currency'] := GECurrency.Text;

  GenSettings.Values['WarningMonth'] := GEWarningMonth.Text;
  GenSettings.Values['ExportICal'] := BoolToStr(CBExportICal.Checked, True);

  Medicals.Assign(Medicals_S);

  if DataChanged_S then DataChanged := True;
  FMain.StatusBar1.Panels[2].Text := '*';

  ExportSchedulesAsICal;

  GridActiveChild.ReCalcGridTime;
  GridActiveChild.ReCalcGridNr;
  FMain.UpdateSButtons;
end;

// ----------------------------------------------------------------
// Wizard for new flight log
// ----------------------------------------------------------------
procedure TFSettings.NewFlightLog;
begin
  ButtonOK.Enabled := False;
  ButtonNext.Visible := True;
  ButtonExit.Visible := False;

  TabSheetFlightLog.TabVisible := False;
  TabSheetLicenses.TabVisible := False;
  TabSheetMedicals.TabVisible := False;
  TabSheetAutoComplete.TabVisible := False;
  TabSheetCat.TabVisible := False;
  TabSheetCosts.TabVisible := False;

  PanelFligtLogs.Visible := False;
  LBFlu.ItemIndex := 0;

  ShowModal;
end;

// ----------------------------------------------------------------
// Next step in new flight log wizard
// ----------------------------------------------------------------
procedure TFSettings.ButtonNextClick(Sender: TObject);
begin
  { General }
  if PageControl.ActivePage = TabSheetGeneral then
  begin
    TabSheetGeneral.TabVisible := False;
    TabSheetFlightLog.TabVisible := True;
    Exit;
  end;
  { FlightLog }
  if PageControl.ActivePage = TabSheetFlightLog then
  begin
    TabSheetFlightLog.TabVisible := False;
    TabSheetLicenses.TabVisible := True;
    PanelFligtLogs.Visible := True;
    Exit;
  end;
  { Licenses }
  if PageControl.ActivePage = TabSheetLicenses then
  begin
    if LBFlu.ItemIndex < LBFLu.Count-1 then
      LBFlu.ItemIndex := LBFlu.ItemIndex +1
    else
    { Medicals }
    begin
      TabSheetLicenses.TabVisible := False;
      TabSheetMedicals.TabVisible := True;
      PanelFligtLogs.Visible := False;
      ButtonNext.Enabled := False;
      ButtonOK.Enabled := True;
    end;
  end;
end;

// ----------------------------------------------------------------
// Select AutoComplete categories
// ----------------------------------------------------------------
procedure TFSettings.LBKatACClick(Sender: TObject);
begin
  { Flugzeug }
  if LBKatAC.ItemIndex = 0 then
  begin
    LBKatDetail.Items.Clear;
    AssignNames(ACAircrafts_S[LBFlu.ItemIndex], LBKatDetail.Items);
    AssignNames(ACAircrafts_S[LBFlu.ItemIndex], AircraftList.Items);
    PanelFlugz.visible := True;
    EditAC.Text := '';
    EditTyp.Text := '';
    LabelAC.Caption := _('Aircraft id');
  end;
  { Begleiter }
  if LBKatAC.ItemIndex = 1 then
  begin
    LBKatDetail.Items.Clear;
    LBKatDetail.Items := ACPilots_S[LBFlu.ItemIndex];
    PanelFlugz.visible := False;
    EditAC.Text := '';
    LabelAC.Caption := _('Passenger');
  end;
  { Ort }
  if LBKatAC.ItemIndex = 2 then
  begin
    LBKatDetail.Items.Clear;
    LBKatDetail.Items := ACAirports_S[LBFlu.ItemIndex];
    PanelFlugz.visible := False;
    //PanelOrtPos.Visible := True;
    EditAC.Text := '';
    LabelAC.Caption := _('Airport name');
  end;
  ButtonRem.Enabled := false;
end;

// ----------------------------------------------------------------
//
// ----------------------------------------------------------------
procedure TFSettings.LBKatDetailClick(Sender: TObject);
begin
  if LBKatDetail.ItemIndex = -1 then exit;
  EditAC.Text := LBKatDetail.Items[LBKatDetail.ItemIndex];

  { Aicraft }
  if LBKatAC.Itemindex = 0 then
  begin
    EditTyp.Text := ACAircrafts_S[LBFlu.Itemindex].Values[LBKatDetail.Items[LBKatDetail.ItemIndex]];
  end;

  ButtonRem.Enabled := True;
end;

// ----------------------------------------------------------------
// Add tree structure
// ----------------------------------------------------------------
function TFSettings.AddVSTLicense(Country: String; ARecord: TTreeData): PVirtualNode;
var
  Data: PTreeData;
  i: Word;
  ANode, RootNode: PVirtualNode;
begin

  RootNode := nil;
  ANode := VSTLicFiles.RootNode.FirstChild;

  if VSTLicFiles.RootNode.ChildCount >0 then
    for i:= 0 to VSTLicFiles.RootNode.ChildCount-1 do
    begin
      Data := VSTLicFiles.GetNodeData(ANode);
      if Data.Caption = Country then
      begin
        RootNode := ANode;
        break;
      end;
      ANode := ANode.NextSibling;
    end;

  if RootNode = nil then
  begin
    RootNode := VSTLicFiles.AddChild(nil);
    Data := VSTLicFiles.GetNodeData(RootNode);
    Data.Caption := Country;
  end;

  Result := VSTLicFiles.AddChild(RootNode);
  Result.CheckType := ctCheckBox;
  //VSTLicFiles.InvalidateNode(Result);
  Data := VSTLicFiles.GetNodeData(Result);
  //VSTLicFiles.ValidateNode(Result, False);
  Data.Caption := ARecord.Caption;
  Data.FileName := ARecord.FileName;
end;

// ----------------------------------------------------------------
// Get VST Text
// ----------------------------------------------------------------
procedure TFSettings.VSTLicFilesGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  Data: PTreeData;
begin
  Data := VSTLicFiles.GetNodeData(Node);
  CellText := Data.Caption;
end;

// ----------------------------------------------------------------
// Add AutoComplete entry
// ----------------------------------------------------------------
procedure TFSettings.ButtonAddClick(Sender: TObject);
begin
  if (EditAC.Text <> '') and ((not PanelFlugz.Visible) or (EditTyp.text <> '')) then
  begin

    { Aircraft }
    if LBKatAC.ItemIndex = 0 then
    begin
      { ID already exists }
      if ACAircrafts_S[LBFlu.Itemindex].IndexOfName(EditAC.Text) >= 0 then
      begin
        MessageDlg(_('Aircraft id already exists!'),mtWarning,[mbOk],0);
        Exit;
      end;
      { Save data }
      ACAircrafts_S[LBFlu.Itemindex].Values[EditAC.Text] := EditTyp.Text;
      AircraftList.Items.Add(EditAC.Text);
    end;

    { CoPlilot }
    if LBKatAC.ItemIndex = 1 then
    begin
      if ACPilots_S[LBFlu.Itemindex].IndexOf(EditAC.Text) >= 0 then
      begin
        MessageDlg(_('Passengert does already exists!'),mtWarning,[mbOk],0);
        Exit;
      end;
      ACPilots_S[LBFlu.Itemindex].Add(EditAC.Text);
    end;

    { Aiport }
    if LBKatAC.ItemIndex = 1 then
    begin
      if ACAirports_S[LBFlu.Itemindex].IndexOf(EditAC.Text) >= 0 then
      begin
        MessageDlg(_('Airport already exists!'),mtWarning,[mbOk],0);
        Exit;
      end;
      ACAirports_S[LBFlu.Itemindex].Add(EditAC.Text);
    end;

    LBKatDetail.Items.Add(EditAC.Text);
  end
  { Text empty }
  else if (EditAC.Text = '') then
  begin
    MessageDlg(format(_('Please enter ''%s''!'),[LabelAC.Caption]),mtWarning,[mbOk],0);
    FSettings.ActiveControl := EditAC;
  end
  else if (EditTyp.Text = '') then
  begin
    MessageDlg(_('Please enter Type!'),mtWarning,[mbOk],0);
    FSettings.ActiveControl := EditTyp;
  end;
  DataChanged_S := True;
end;

// ----------------------------------------------------------------
// Remove AutoComplete entry
// ----------------------------------------------------------------
procedure TFSettings.ButtonRemClick(Sender: TObject);
begin
  if LBKatDetail.ItemIndex >= 0 then
  begin
    { Aircraft }
    if LBKatAC.ItemIndex = 0 then
    begin
      DeleteStringObject(ACAircrafts_S[LBFlu.ItemIndex], LBKatDetail.ItemIndex);
      AssignNames(ACAircrafts_S[LBFlu.ItemIndex], LBKatDetail.Items);
      AssignNames(ACAircrafts_S[LBFlu.ItemIndex], AircraftList.Items);
    end;
    { CoPilot }
    if LBKatAC.ItemIndex = 1 then
    begin
      DeleteStringObject(ACPilots_S[LBFlu.ItemIndex], LBKatDetail.ItemIndex);
      LBKatDetail.Items.Assign(ACPilots_S[LBFlu.ItemIndex]);
    end;
    { Aiport }
    if LBKatAc.ItemIndex = 2 then
    begin
      DeleteStringObject(ACAirports_S[LBFlu.ItemIndex], LBKatDetail.ItemIndex);
      LBKatDetail.Items.Assign(ACAirports_S[LBFlu.ItemIndex]);
    end;

    EditAC.Text := '';
    EditTyp.Text := '';
    DataChanged_S := True;
  end;
  if LBKatDetail.Items.Count = 0 then ButtonRem.Enabled := False;
end;

// ----------------------------------------------------------------
// Select license
// ----------------------------------------------------------------
procedure TFSettings.LBFluClick(Sender: TObject);
{----------}
  function SetTimeLength(Time: String; DestLength: Word): String ;
  var i: Word;
  begin
    if length(Time) = DestLength then
      Result := Time
    else begin
      for i := 1 to DestLength-length(Time) do
        insert('0',Time,1);
      Result := Time;
    end;
  end;
{----------}
begin
  { Settings}
  GEStarts.Text := Settings_S[LBFlu.ItemIndex].Values['BFStarts'];
  GESTunden.Text := SetTimeLength(Settings_S[LBFlu.ItemIndex].Values['BFTime'],8);
  GEScheinSeit.Text := Settings_S[LBFlu.ItemIndex].Values['LicenseSince'];
  GEKPrae.Text := Settings_S[LBFlu.ItemIndex].Values['IDPrefix'];

  RGDistUnit.ItemIndex := RGDistUnit.Items.IndexOf(Settings_S[LBFlu.ItemIndex].Values['DistUnit']);
  if RGDistUnit.ItemIndex = -1 then
   RGDistUnit.ItemIndex := 0;

  if isInteger(Settings_S[LBFlu.ItemIndex].Values['Numeration']) then
    RGNumeration.ItemIndex := StrToInt(Settings_S[LBFlu.ItemIndex].Values['Numeration']);
  if RGNumeration.ItemIndex = -1 then
    RGNumeration.ItemIndex := 0;

  if isInteger(Settings_S[LBFlu.ItemIndex].Values['DefPosition']) then
    RGDefPosition.ItemIndex := StrToInt(Settings_S[LBFlu.ItemIndex].Values['DefPosition']);
  if RGDefPosition.ItemIndex = -1 then
    RGDefPosition.ItemIndex := 0;

  AllowLastEdit.Checked := StrToBool(Settings_S[LBFlu.ItemIndex].Values['AllowLastEdit']);
  DisallowChange.Checked := StrToBool(Settings_S[LBFlu.ItemIndex].Values['DisallowChange']);
  DisallowChangeClick(DisallowChange);

  CBStartType.Checked := StrToBool(Settings_S[LBFlu.ItemIndex].Values['ShowStartType']);
  CBBlockTime.Checked := StrToBool(Settings_S[LBFlu.ItemIndex].Values['ShowBlockTime']);
  CBFlightTime.Checked := StrToBool(Settings_S[LBFlu.ItemIndex].Values['ShowFlightTime']);
  if Settings_S[LBFlu.ItemIndex].Values['DefaultTime'] = '0' then
    RBDefTimeBlock.Checked := True
  else
    RBDefTimeFlight.Checked := True;

  { Categories }
  CLBKat.Items.Assign(ACCategories_S[LBFlu.ItemIndex]);
  LBCTi.Items.Assign(ACTimeCat_S[LBFlu.ItemIndex]);
  LBContest.Items.Assign(ACContestCat_S[LBFlu.ItemIndex]);

  LoadLicenseSettings;
  LoadMedicalSettings;

  LBKatAC.ItemIndex := 0;
  LBKatACClick(self);
end;

// ----------------------------------------------------------------
// Save Data
// ----------------------------------------------------------------
procedure TFSettings.GEExit(Sender: TObject);
begin
  Settings_S[LBFlu.ItemIndex].Clear;
  if GEStarts.Text = '' then GEStarts.Text := '0';
  Settings_S[LBFlu.ItemIndex].Values['BFStarts'] := GEStarts.Text;
  Settings_S[LBFlu.ItemIndex].Values['BFTime'] := GESTunden.Text;
  Settings_S[LBFlu.ItemIndex].Values['LicenseSince'] := GEScheinSeit.Text;
  Settings_S[LBFlu.ItemIndex].Values['IDPrefix'] := GEKPrae.Text;
  Settings_S[LBFlu.ItemIndex].Values['Numeration'] := InttoStr(RGNumeration.ItemIndex);
  Settings_S[LBFlu.ItemIndex].Values['DefPosition'] := InttoStr(RGDefPosition.ItemIndex);

  Settings_S[LBFlu.ItemIndex].Values['DisallowChange'] := BooltoStr(DisallowChange.Checked, True);
  Settings_S[LBFlu.ItemIndex].Values['AllowLastEdit'] := BooltoStr(AllowLastEdit.Checked, True);

  Settings_S[LBFlu.ItemIndex].Values['ShowStartType'] := BooltoStr(CBStartType.Checked, True);
  Settings_S[LBFlu.ItemIndex].Values['ShowBlockTime'] := BooltoStr(CBBlockTime.Checked, True);
  Settings_S[LBFlu.ItemIndex].Values['ShowFlightTime'] := BooltoStr(CBFlightTime.Checked, True);
  if RBDefTimeBlock.Checked then
    Settings_S[LBFlu.ItemIndex].Values['DefaultTime'] := '0'
  else
    Settings_S[LBFlu.ItemIndex].Values['DefaultTime'] := '1';

  case RGDistUnit.ItemIndex of
    0: Settings_S[LBFlu.ItemIndex].Values['DistUnit'] := 'km';
    1: Settings_S[LBFlu.ItemIndex].Values['DistUnit'] := 'nm';
    2: Settings_S[LBFlu.ItemIndex].Values['DistUnit'] := 'miles';
  end;
end;

// ----------------------------------------------------------------
// Add Categories
// ----------------------------------------------------------------
procedure TFSettings.ButtonKatAddClick(Sender: TObject);
var
  InputStr: String;
begin
  if InputQuery(_('Please enter a category'),_('Please enter a category'),InputStr) then
  begin
    if ACCategories_S[LBFlu.ItemIndex].IndexOf(InputStr) >= 0 then
    begin
      MessageDlg(_('Category already exists!'),mtWarning,[mbOk],0);
      Exit;
    end;
    ACCategories_S[LBFlu.ItemIndex].Add(InputStr);
    CLBKat.Items := ACCategories_S[LBFlu.ItemIndex];
  end;
end;

// ----------------------------------------------------------------
// Remove Categories
// ----------------------------------------------------------------
procedure TFSettings.ButtonKatRemClick(Sender: TObject);
begin
  if CLBKat.ItemIndex = -1 then
    Exit;

  ACCategories_S[LBFlu.ItemIndex].Delete(CLBKat.ItemIndex);
  CLBKat.Items := ACCategories_S[LBFlu.ItemIndex];
end;

// ----------------------------------------------------------------
// Add time Categories
// ----------------------------------------------------------------
procedure TFSettings.ButtonCTiAddClick(Sender: TObject);
var
  InputStr: String;
begin
  if InputQuery(_('Please enter a category'),_('Please enter a category'),InputStr) then
  begin
    if ACTimeCat_S[LBFlu.ItemIndex].IndexOf(InputStr) >= 0 then
    begin
      MessageDlg(_('Category already exists!'),mtWarning,[mbOk],0);
      Exit;
    end;
    ACTimeCat_S[LBFlu.ItemIndex].Add(InputStr);
    LBCTi.Items := ACTimeCat_S[LBFlu.ItemIndex]
  end;
end;

// ----------------------------------------------------------------
// Remove time Categories
// ----------------------------------------------------------------
procedure TFSettings.ButtonCTiRemClick(Sender: TObject);
begin
  if LBCTi.ItemIndex = -1 then
    Exit;

  ACTimeCat_S[LBFlu.ItemIndex].Delete(LBCTi.ItemIndex);
  LBCTi.Items := ACTimeCat_S[LBFlu.ItemIndex];
end;

// ----------------------------------------------------------------
// Add contest Categories
// ----------------------------------------------------------------
procedure TFSettings.ButtonContestAddClick(Sender: TObject);
var
  InputStr: String;
begin
  if InputQuery(_('Please enter a category'),_('Please enter a category'),InputStr) then
  begin
    if ACContestCat_S[LBFlu.ItemIndex].IndexOf(InputStr) >= 0 then
    begin
      MessageDlg(_('Category already exists!'),mtWarning,[mbOk],0);
      Exit;
    end;
    ACContestCat_S[LBFlu.ItemIndex].Add(InputStr);
    LBContest.Items := ACContestCat_S[LBFlu.ItemIndex]
  end;
end;

// ----------------------------------------------------------------
// Remove contest Categories
// ----------------------------------------------------------------
procedure TFSettings.ButtonContestRemClick(Sender: TObject);
begin
  if LBContest.ItemIndex = -1 then
    Exit;

  ACContestCat_S[LBFlu.ItemIndex].Delete(LBContest.ItemIndex);
  LBContest.Items := ACContestCat_S[LBFlu.ItemIndex];
end;

// ----------------------------------------------------------------
// Select license
// ----------------------------------------------------------------
procedure TFSettings.VSTLicFilesChecked(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
  SaveLicenseSettings;
  LoadLicenseSettings;
end;

// ----------------------------------------------------------------
// Load license settings
// ----------------------------------------------------------------
procedure TFSettings.LoadLicenseSettings;
var i, j: Word;
    XMLElem: TJvSimpleXMLElem;
    TabInfo, TabDate, TabCat, TabTimeCat, TabAccLic, TabOptCon: Boolean;
{----------}
  procedure AddDate(S: String) ;
  begin
    if (VLEDate.Strings.IndexOfName(S) > -1) or (S = '') then Exit;
    TabDate := True;
    VLEDate.InsertRow(S,LicenseDates_S[LBFlu.ItemIndex].Values[S],True);
  end;
{----------}
  procedure AddCategories(S: String) ;
  var Idx: Integer;
  begin
    if (VLECat.Strings.IndexOfName(S) > -1) or (S = '') then Exit;
    TabCat := True;
    Idx := VLECat.InsertRow(S,LicenseCategories_S[LBFlu.ItemIndex].Values[S],True)-1;
    VLECat.ItemProps[Idx].EditStyle := esPickList;
    VLECat.ItemProps[Idx].PickList.Assign(ACCategories_S[LBFlu.ItemIndex]);
    VLECat.ItemProps[Idx].ReadOnly := True;
  end;
{----------}
  procedure AddTimeCat(S: String) ;
  var Idx: Integer;
  begin
    if (VLETimeCat.Strings.IndexOfName(S) > -1) or (S = '') then Exit;
    TabTimeCat := True;
    Idx := VLETimeCat.InsertRow(S,LicenseTimeCat_S[LBFlu.ItemIndex].Values[S],True)-1;
    VLETimeCat.ItemProps[Idx].EditStyle := esPickList;
    VLETimeCat.ItemProps[Idx].PickList.Assign(ACTimeCat_S[LBFlu.ItemIndex]);
    VLETimeCat.ItemProps[Idx].ReadOnly := True;
  end;
{----------}
  procedure AddAccLicense(S: String) ;
  var
    Idx: Integer;
    i: Word;
    LicList: TStrings;
  begin
    if S = '' then
      Exit;
    LicList := TStringList.Create;
    readTStrings(S, LicList);
    for i := 0 to LicList.Count-1 do
    begin
      if VLEAccLic.Strings.IndexOfName(LicList[i]) = -1 then
      begin
        TabAccLic := True;
        Idx := VLEAccLic.InsertRow(LicList[i],AccLicenses_S[LBFlu.ItemIndex].Values[LicList[i]],True)-1;
        VLEAccLic.ItemProps[Idx].EditStyle := esPickList;
        VLEAccLic.ItemProps[Idx].PickList.Clear;
        VLEAccLic.ItemProps[Idx].PickList.Add('-');
        VLEAccLic.ItemProps[Idx].PickList.AddStrings(LBFlu.Items);
        VLEAccLic.ItemProps[Idx].ReadOnly := True;
        if VLEAccLic.Values[LicList[i]] = '' then
          VLEAccLic.Values[LicList[i]] := '-';
      end;
    end;
    LicList.Free;
  end;
{----------}
  procedure AddOptCondition(S, Cat, AccLic: String) ;
  var Idx: Integer;
  begin
    if (CLBOptCond.Items.IndexOf(S) > -1) or (S = '') then Exit;
    TabOptCon := True;
    Idx := CLBOptCond.Items.Add(S);
    CLBOptCond.Checked[idx] := OptConditions_S[LBFlu.ItemIndex].IndexOf(S) > -1;
    if CLBOptCond.Checked[idx] then
    begin
      AddCategories(Cat);
      AddAccLicense(AccLic);
    end;
  end;
{----------}
var
  Data: PTreeData;
  ANode, RootNode: PVirtualNode;
  LicFileList: TStrings;
begin
  TabInfo := False;
  TabDate := False;
  TabCat := False;
  TabTimeCat := False;
  TabAccLic := False;
  TabOptCon := False;
  try
    LicFileList := TStringList.Create;
    if LBFlu.ItemIndex = -1 then
      Exit;

    VLEDate.Strings.Clear;
    VLECat.Strings.Clear;
    VLETimeCat.Strings.Clear;
    VLEAccLic.Strings.Clear;
    CLBOptCond.Items.Clear;

    VSTLicFiles.OnChecked := nil;
    VSTLicFiles.ClearChecked;
    VSTLicFiles.OnChecked := VSTLicFilesChecked;

    readTStrings(Settings_S[LBFlu.ItemIndex].Values['License'], LicFileList);
    if LicFileList.Count > 0 then
    begin
      for j := 0 to LicFileList.Count-1 do
      begin
        RootNode := VSTLicFiles.RootNode.FirstChild;
        ANode := RootNode.FirstChild;
        repeat
          repeat
            Data := VSTLicFiles.GetNodeData(ANode);
            if Data.FileName = LicFileList[j] then
            begin
              ANode.CheckState := csCheckedNormal;
              VSTLicFiles.Expanded[ANode.Parent] := True;
            end;
            ANode := ANode.NextSibling;
          until ANode = nil;
          RootNode := RootNode.NextSibling;
          if RootNode <> nil then
            ANode := RootNode.FirstChild;
        until RootNode = nil;
      end;
    end;
    VSTLicFiles.Repaint;

    ANode := VSTLicFiles.GetFirstChecked(csCheckedNormal);
    while Assigned(ANode) do
    begin
      Data := VSTLicFiles.GetNodeData(ANode);
      if (ANode.CheckState = csCheckedNormal) and (LoadXMLLicense(GetActualDir(true)+'\licenses\'+Data.FileName, JvSimpleXML)) then
      begin
        if (JvSimpleXML.Root.Name = 'license') and (JvSimpleXML.Root.Items.Count > 0) then
        begin
          if JvSimpleXML.Root.Properties.Value('desc') <> '' then
          begin
            TabInfo := True;
            MemoLicInfo.Text := JvSimpleXML.Root.Properties.Value('desc');
          end;
          if JvSimpleXML.Root.Items.Count > 0 then
          begin
            for i := 0 to JvSimpleXML.Root.Items.Count-1 do
            begin
              { Validation }
              if (JvSimpleXML.Root.Items[i].Name = 'extension') then
                AddDate(JvSimpleXML.Root.Items[i].Properties.Value('date'));
              { Conditions }
              if JvSimpleXML.Root.Items[i].Items.Count > 0 then
              begin
                for j := 0 to JvSimpleXML.Root.Items[i].Items.Count-1 do
                begin
                  XMLElem := JvSimpleXML.Root.Items[i].items[j];
                  { Categories }
                  if (XMLElem.Name = 'condition')  then begin
                    if XMLElem.Properties.Value('value') = 'TimeCat' then
                      AddTimeCat(XMLElem.Properties.Value('timecat'));

                    AddCategories(XMLElem.Properties.Value('category'));
                    AddAccLicense(XMLElem.Properties.Value('acceptedlicenses'));

                    { Optional Condition }
                    if XMLElem.Properties.Value('optional') = 'true' then
                      AddOptCondition(XMLElem.Properties.Value('name'), XMLElem.Properties.Value('category'), XMLElem.Properties.Value('acceptedlicenses'));
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
      ANode := VSTLicFiles.GetNextChecked(ANode, csCheckedNormal);
    end;
    finally
      if (not TabDate) and (not TabCat) and (not TabAccLic) and (not TabOptCon) then
        PageControlLicenses.Visible := False
      else
        PageControlLicenses.Visible := True;

    TSLInfo.TabVisible := TabInfo;
    TSLDate.TabVisible := TabDate;
    TSLCat.TabVisible := TabCat;
    TSLTimeCat.TabVisible := TabTimeCat;
    TSLAccLic.TabVisible := TabAccLic;
    TSLOptCon.TabVisible := TabOptCon;

    LicFileList.Free;
  end;
end;

// ----------------------------------------------------------------
// Save license settings
// ----------------------------------------------------------------
procedure TFSettings.SaveLicenseSettings;
var
  i: Word;
  Data: PTreeData;
  ANode: PVirtualNode;
begin
  LicenseDates_S[LBFlu.ItemIndex].Assign(VLEDate.Strings);
  LicenseCategories_S[LBFlu.ItemIndex].Assign(VLECat.Strings);
  LicenseTimeCat_S[LBFlu.ItemIndex].Assign(VLETimeCat.Strings);
  AccLicenses_S[LBFlu.ItemIndex].Assign(VLEAccLic.Strings);
  OptConditions_S[LBFlu.ItemIndex].Clear;
  if CLBOptCond.Items.Count > 0 then
    for i := 0 to CLBOptCond.Items.Count-1 do
      if CLBOptCond.Checked[i] then OptConditions_S[LBFlu.ItemIndex].Add(CLBOptCond.Items[i]);

  Settings_S[LBFlu.ItemIndex].Values['License'] := '';
  ANode := VSTLicFiles.GetFirstChecked(csCheckedNormal);
  while Assigned(ANode) do
  begin
    Data := VSTLicFiles.GetNodeData(ANode);
    Settings_S[LBFlu.ItemIndex].Values['License'] := Settings_S[LBFlu.ItemIndex].Values['License'] + Data.FileName +';';
    ANode := VSTLicFiles.GetNextChecked(ANode, csCheckedNormal);
  end;

end;

// ----------------------------------------------------------------
// Date edit mask
// ----------------------------------------------------------------
procedure TFSettings.VLEGetDateEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
  if TValueListEditor(Sender).Cells[0,ARow] <> '' then
  Value := '!90/90/0000;1;_';
end;

// ----------------------------------------------------------------
// Save license settings on VLE exit
// ----------------------------------------------------------------
procedure TFSettings.VLEExit(Sender: TObject);
begin
  SaveLicenseSettings;
end;

// ----------------------------------------------------------------
// Save & load license settings (opt condition may have changed)
// ----------------------------------------------------------------
procedure TFSettings.CLBOptCondExit(Sender: TObject);
begin
  SaveLicenseSettings;
  LoadLicenseSettings;
end;

// ----------------------------------------------------------------
// Load medical settings
// ----------------------------------------------------------------
procedure TFSettings.LoadMedicalSettings;
var
  i, j: Word;
  idx: Integer;
  MedList, LicFileList: TStrings;
begin
  if LBFlu.Count = 0 then Exit;
  CLBMedicals.Clear;
  try
    LicFileList := TStringList.Create;
    MedList := TStringList.Create;

    readTStrings(Settings_S[LBFlu.ItemIndex].Values['License'], LicFileList);
    if LicFileList.Count > 0 then
    begin
      for i := 0 to LicFileList.Count-1 do
      begin
        if not FileExists(GetActualDir(true)+'\licenses\'+LicFileList[i]) then
          Exit;
        if LoadXMLLicense(GetActualDir(true)+'\licenses\'+LicFileList[i], JvSimpleXML) then
        begin
          if (JvSimpleXML.Root.Name = 'license') and (JvSimpleXML.Root.Items.Count > 0) then
          begin
            readTStrings(JvSimpleXML.Root.Properties.Value('medical'), MedList);
            if MedList.Count > 0 then
            begin
              for j := 0 to MedList.Count-1 do
              begin
                if (CLBMedicals.Items.IndexOf(MedList[j]) = -1) and (MedList[j] <> '') then
                begin
                  Idx := CLBMedicals.Items.Add(MedList[j]);
                  CLBMedicals.Checked[idx] := Medicals_S.IndexOfName(MedList[j]) > -1;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    LicFileList.Free;
    MedList.Free;
    RefreshMedicalVLE;
  end;
end;

// ----------------------------------------------------------------
// Refresh medical VLE
// ----------------------------------------------------------------
procedure TFsettings.RefreshMedicalVLE;
var
  idx: Word;
begin
 VLEMedicals.Strings.Clear;
 if CLBMedicals.Count = 0 then
   Exit;
 VLEMedicals.Enabled := False;
 for idx := 0 to CLBMedicals.Count-1 do
   if CLBMedicals.Checked[idx] then
   begin
     VLEMedicals.InsertRow(CLBMedicals.Items[idx], Medicals_S.Values[CLBMedicals.Items[idx]], True);
     VLEMedicals.Enabled := True;
   end;
end;

// ----------------------------------------------------------------
// Save medical settings
// ----------------------------------------------------------------
procedure TFSettings.SaveMedicalSettings;
begin
  Medicals_S.Assign(VLEMedicals.Strings);
end;

// ----------------------------------------------------------------
// Save medical settings on VLE exit
// ----------------------------------------------------------------
procedure TFSettings.VLEMedicalsExit(Sender: TObject);
begin
  SaveMedicalSettings;
end;

// ----------------------------------------------------------------
// Refresh medical VLE (Medicals have changed)
// ----------------------------------------------------------------
procedure TFSettings.CLBMedicalsClickCheck(Sender: TObject);
begin
  RefreshMedicalVLE;
end;

// ----------------------------------------------------------------
// Download new licenses
// ----------------------------------------------------------------
procedure TFSettings.LabelGetAirportsClick(Sender: TObject);
begin
  FMain.ActionHPAirportsExecute(Sender);
end;

// ----------------------------------------------------------------
// Block time / flight time
// ----------------------------------------------------------------
procedure TFSettings.CBTimeClick(Sender: TObject);
begin
  if (not CBFlightTime.Checked) and (not CBBlockTime.Checked) then
  begin
    if Sender = CBBlockTime then
      CBFlightTime.Checked := True
    else
      CBBlockTime.Checked := True;
  end;

  if (CBFlightTime.Checked) and (CBBlockTime.Checked) then
  begin
    RBDefTimeBlock.Enabled := True;
    RBDefTimeFlight.Enabled := True;
    LabelDefTime.Enabled := True;
  end
  else
  begin
    RBDefTimeBlock.Enabled := False;
    RBDefTimeFlight.Enabled := False;
    LabelDefTime.Enabled := False;
  end;

  if (CBFlightTime.Checked) xor (CBBlockTime.Checked) then
  begin
    RBDefTimeBlock.Checked := CBBlockTime.Checked;
    RBDefTimeFlight.Checked := CBFlightTime.Checked;
  end;
end;

procedure TFSettings.GECurrencyChange(Sender: TObject);
begin
  CurLabel1.Caption := GECurrency.Text;
  CurLabel2.Caption := GECurrency.Text;
end;

procedure TFSettings.AcCostsEditExit(Sender: TObject);
begin
  if AircraftList.ItemIndex < 0 then exit;
  SetStringObject(ACAircrafts_S[LBFlu.Itemindex], ACAircrafts_S[LBFlu.Itemindex][AircraftList.ItemIndex], TJvValidateEdit(Sender).Name, TJvValidateEdit(Sender).Text);
end;

procedure TFSettings.AcCostsComboExit(Sender: TObject);
begin
  if AircraftList.ItemIndex < 0 then exit;
  SetStringObject(ACAircrafts_S[LBFlu.Itemindex], ACAircrafts_S[LBFlu.Itemindex][AircraftList.ItemIndex], TComboBox(Sender).Name, IntToStr(TComboBox(Sender).ItemIndex));
end;

procedure TFSettings.AcCostsCalcByExit(Sender: TObject);
begin
  if AircraftList.ItemIndex < 0 then exit;
  if TRadioButton(Sender).Checked = false then exit;
  SetStringObject(ACAircrafts_S[LBFlu.Itemindex], ACAircrafts_S[LBFlu.Itemindex][AircraftList.ItemIndex], 'Clc', TRadioButton(Sender).Name);
end;

procedure TFSettings.AircraftListClick(Sender: TObject);
var i : integer;
    Tmp : string;
begin
  if AircraftList.ItemIndex = -1 then exit;

  for i := 0 to GroupBox13.ControlCount-1 do begin
    if TObject(GroupBox13.Controls[i]) is TRadioButton then begin
      Tmp := GetStringObject(ACAircrafts_S[LBFlu.Itemindex], ACAircrafts_S[LBFlu.Itemindex][AircraftList.ItemIndex], 'Clc');
      If TRadioButton(GroupBox13.Controls[i]).Name = Tmp then
        TRadioButton(GroupBox13.Controls[i]).Checked := true
      else
        TRadioButton(GroupBox13.Controls[i]).Checked := false;

      TRadioButton(GroupBox13.Controls[i]).Enabled := true;
      AcCostsCalcByExit(GroupBox13.Controls[i])
    end;

    if TObject(GroupBox13.Controls[i]) is TJvValidateEdit then begin
      TJvValidateEdit(GroupBox13.Controls[i]).Text := GetStringObject(ACAircrafts_S[LBFlu.Itemindex], ACAircrafts_S[LBFlu.Itemindex][AircraftList.ItemIndex], TJvValidateEdit(GroupBox13.Controls[i]).Name);

      TJvValidateEdit(GroupBox13.Controls[i]).Enabled := true;
      AcCostsEditExit(GroupBox13.Controls[i]);
    end;
  end;

  for i := 0 to GroupBox15.ControlCount-1 do begin
    if TObject(GroupBox15.Controls[i]) is TComboBox then begin
      Tmp := GetStringObject(ACAircrafts_S[LBFlu.Itemindex], ACAircrafts_S[LBFlu.Itemindex][AircraftList.ItemIndex], TComboBox(GroupBox15.Controls[i]).Name);
      if Length(Tmp) > 0 then try
        TComboBox(GroupBox15.Controls[i]).ItemIndex := StrToInt(GetStringObject(ACAircrafts_S[LBFlu.Itemindex], ACAircrafts_S[LBFlu.Itemindex][AircraftList.ItemIndex], TComboBox(GroupBox15.Controls[i]).Name));
      except TComboBox(GroupBox15.Controls[i]).ItemIndex := 0; end else
        TComboBox(GroupBox15.Controls[i]).ItemIndex := 0;

      TComboBox(GroupBox15.Controls[i]).Enabled := true;
      AcCostsComboExit(GroupBox15.Controls[i]);
    end;
  end;
end;

procedure TFSettings.CleanXMLdata1Click(Sender: TObject);
begin
  if AircraftList.ItemIndex = -1 then exit;

  if Assigned(ACAircrafts_S[LBFlu.Itemindex].Objects[AircraftList.ItemIndex]) then
    TStrings(ACAircrafts_S[LBFlu.Itemindex].Objects[AircraftList.ItemIndex]).Clear;

  AircraftListClick(Sender);
end;

procedure TFSettings.TabSheetGeneralShow(Sender: TObject);
begin
  LBFlu.Visible := false;
end;

procedure TFSettings.TabSheetGeneralHide(Sender: TObject);
begin
  if LBFlu.Count > 1 then
    LBFlu.Visible := true;
end;

procedure TFSettings.DisallowChangeClick(Sender: TObject);
begin
  AllowLastEdit.Enabled := TCheckBox(Sender).Checked;

  if not (TCheckBox(Sender).Checked) then
    AllowLastEdit.Checked := false;
end;

end.

