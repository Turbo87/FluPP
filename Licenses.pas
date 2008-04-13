unit Licenses;

{$MODE Delphi}

interface

uses
  {Windows,} Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, {Mask,} Grids, ImgList, {VirtualTrees,
  gnugettext, JvSimpleXml, JvExStdCtrls, JvButton, JvCtrls,} DateUtils,
  LResources;

type TTreeNodeType = (License, Condition, MedCondition, Currency, Validation, Medical);

type
  PTreeData = ^TTreeData;
  TTreeData = record
    Caption: String;
    FAvailable: String;
    FMissing: String;
    FRequired: String;
    Complied: Boolean;
    Date: String;
    DataType: TTreeNodeType;
    Desc: String;
    Meet: Integer;
  end;

type
  TFLicenses = class(TForm)
    Panel1: TPanel;
    ButtonExit: TJvImgBtn;
    StatusBar1: TStatusBar;
    VST: TVirtualStringTree;
    ImageListLicenses: TImageList;
    ButtonSettings: TJvImgBtn;
    JvSimpleXML: TJvSimpleXML;
    MemoDesc: TMemo;
    Splitter1: TSplitter;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VSTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VSTGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure VSTPaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType);
    procedure ButtonSettingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex);
  private
    procedure onHint(Sender: TObject);
    function GetActualValue(CurFlb: Word; XMLElem:TJvSimpleXMLElem; Date: String; Category, TimeCat: String): String;
    function ValidTo(CurFlb: Word; XMLElem: TJvSimpleXMLElem; Category, TimeCat: String): String;
    procedure ClearTreeData(ARecord: TTreeData);
    function AddVSTStructure(AVST: TCustomVirtualStringTree; ANode: PVirtualNode; ARecord: TTreeData): PVirtualNode;
    procedure ParseXMLLicense;
    function AddSubNode(Node: PVirtualNode; XMLElem:TJvSimpleXMLElem; Value, Date: String): PVirtualNode;
    procedure CheckNode(RootNode: PVirtualNode);
  public
    procedure FillVST;
  end;

var  
  FLicenses: TFLicenses;

implementation

uses Main, Settings, Tools, ToolsGrid, ToolsLicense;


// ----------------------------------------------------------------
// Form create
// ----------------------------------------------------------------
procedure TFLicenses.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self);
end;

// ----------------------------------------------------------------
// Form show
// ----------------------------------------------------------------
procedure TFLicenses.FormShow(Sender: TObject);
begin
  Application.OnHint := onHint;
	FillVST;
end;

// ----------------------------------------------------------------
// On hint
// ----------------------------------------------------------------
procedure TFLicenses.onHint(Sender: TObject);
begin
  StatusBar1.Panels[0].text := GetLongHint(Application.Hint);
end;

// ----------------------------------------------------------------
// Form close
// ----------------------------------------------------------------
procedure TFLicenses.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.OnHint := FMain.onHint;
end;

// ----------------------------------------------------------------
// Add tree structure
// ----------------------------------------------------------------
function TFLicenses.AddVSTStructure(AVST: TCustomVirtualStringTree; ANode: PVirtualNode;
  ARecord: TTreeData): PVirtualNode;
var
  Data: PTreeData;
begin
  Result := AVST.AddChild(ANode);
  Data := AVST.GetNodeData(Result);
  AVST.ValidateNode(Result,False);
  Data.Caption := ARecord.Caption;
  Data.FRequired := ARecord.FRequired;
  Data.FAvailable := ARecord.FAvailable;
  Data.FMissing := ARecord.FMissing;
  Data.Complied := ARecord.Complied;
  Data.Date := ARecord.Date;
  Data.DataType := ARecord.DataType;
  Data.Desc := PipeToCR(ARecord.Desc);
  Data.Meet := ARecord.Meet;
  ClearTreeData(ARecord);
end;

// ----------------------------------------------------------------
// Clear tree data
// ----------------------------------------------------------------
procedure TFLicenses.ClearTreeData(ARecord: TTreeData);
begin
  ARecord.Caption := '';
  ARecord.FRequired := '';
  ARecord.Date := '';
  ARecord.FAvailable := '';
  ARecord.FMissing := '';
  ARecord.Desc := '';
  ARecord.DataType := License;
  ARecord.Meet := -1;
end;

// ----------------------------------------------------------------
// Free tree node
// ----------------------------------------------------------------
procedure TFLicenses.VSTFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: PTreeData;
begin // wtf...
  Data:=VST.GetNodeData(Node);
  if Assigned(Data) then
  begin
    Data.Caption := '';
    Data.FAvailable := '';
  end;
end;

// ----------------------------------------------------------------
// Get tree image index
// ----------------------------------------------------------------
procedure TFLicenses.VSTGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
var
  Data: PTreeData;
begin
  Data:=VST.GetNodeData(Node);
  if (column = 0) then
  begin
    if (Data.DataType = Condition) or (Data.DataType = Currency) or (Data.DataType = Validation) or (Data.DataType = Medical) then
    begin
      if Data.Complied then
        ImageIndex := 1
      else
        ImageIndex := 0;
    end
    else
      ImageIndex := 2;
  end;
end;

// ----------------------------------------------------------------
// Get tree cell text
// ----------------------------------------------------------------
procedure TFLicenses.VSTGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  Data: PTreeData;
begin
  Data := VST.GetNodeData(Node);
  case Column of
    0: CellText := Data.Caption;
    1: CellText := Data.FRequired;
    2: CellText := Data.FAvailable;
    3: CellText := Data.FMissing;
    4: CellText := Data.Date;
  end;
end;

// ----------------------------------------------------------------
// Paint tree cell text
// ----------------------------------------------------------------
procedure TFLicenses.VSTPaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
var
  Data: PTreeData;
begin
  Data := VST.GetNodeData(Node);
  { License }
  if (Sender.GetNodeLevel(Node) = 0) and (Column = 0) then
  begin
    TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
    TargetCanvas.Font.Height := 18;
  end;
  { Date }
  if (Column = 4) and (Data.Date <> '') then
    if MonthsBetween(now, StrToDate(Data.Date)) <  StrToInt(GenSettings.Values['WarningMonth']) then
      TargetCanvas.Font.Color := clFRed;
  { Missing }
  if Column = 3 then
    TargetCanvas.Font.Color := clFRed;
end;

// ----------------------------------------------------------------
// Fill license tree
// ----------------------------------------------------------------
procedure TFLicenses.FillVST;
begin
  VST.Clear;
  VST.NodeDataSize:=SizeOf(TTreeData);
  VST.BeginUpdate;
  ParseXMLLicense;
  VST.EndUpdate;
end;

// ----------------------------------------------------------------
// Parse XML license
// ----------------------------------------------------------------
procedure TFLicenses.ParseXMLLicense;
var
  i,j, Flb, LicIdx: Word;
  TreeData: TTreeData;
  Node: PVirtualNode;
  RootNode: PVirtualNode;
  XMLElem: TJvSimpleXMLElem;
  ReDate, ValidDate, Categories, TimeCat: String;
  MedList, LicFileList: TStrings;
begin
  try
    SchedValidity.Clear;
    LicFileList := TStringList.Create;

    if FMain.MDIChildCount = 0 then Exit;
    for Flb := 0 to FMain.MDIChildCount-1 do
    begin
      readTStrings(GridChild(Flb).Settings.Values['License'], LicFileList);
      if LicFileList.Count > 0 then
      begin
        for LicIdx := 0 to LicFileList.Count-1 do
        begin
          if LoadXMLLicense(GetActualDir(true)+'\licenses\'+LicFileList[LicIdx], JvSimpleXML) then
          begin;
            try
              VerifyXMLLicense(JvSimpleXML, Flb)
            except
              on E: Exception do
              begin
                MemoDesc.Lines.Add(_('Error')+': '+E.Message);
                Continue;
              end;
            end;
            if (JvSimpleXML.Root.Name = 'license') then
            begin
              //JvSimpleXML.Root.Properties.Value('country');
              TreeData.Caption := JvSimpleXML.Root.Properties.Value('name');
              TreeData.DataType := License;
              TreeData.Date := '';
              TreeData.Desc := JvSimpleXML.Root.Properties.Value('desc');
              RootNode := AddVSTStructure(VST,nil,TreeData);
              RootNode.States := RootNode.States+[vsExpanded];
              { Medical }
              if JvSimpleXML.Root.Properties.Value('medical') <> '' then
              begin
                TreeData.DataType := Medical;
                TreeData.Caption := _('Medical');
                Node := AddVSTStructure(VST,RootNode,TreeData);
                MedList := TStringList.Create;
                readTStrings(JvSimpleXML.Root.Properties.Value('medical'), MedList);
                for i := 0 to Medlist.Count-1 do
                  if Medicals.IndexOfName(MedList[i]) > -1 then
                  begin
                    TreeData.Caption := MedList[i];
                    TreeData.Date := Medicals.Values[MedList[i]];
                    TreeData.DataType := Condition;
                    if StrToDate(TreeData.Date) > now then
                      TreeData.Complied := True
                    else
                      TreeData.Complied := False;
                    AddVSTStructure(VST,Node,TreeData);
                  end;
                MedList.Free;
                CheckNode(Node);
              end;
              { Currency & Validation }
              if JvSimpleXML.Root.Items.Count > 0 then
              begin
                for i := 0 to JvSimpleXML.Root.Items.Count-1 do
                begin
                  if (JvSimpleXML.Root.Items[i].Name = 'currency') or
                     (JvSimpleXML.Root.Items[i].Name = 'extension') then
                  begin
                    TreeData.Desc := (JvSimpleXML.Root.Items[i].Properties.Value('desc'));
                    { Currency }
                    if JvSimpleXML.Root.Items[i].Name = 'currency' then
                    begin
                      if JvSimpleXML.Root.Items[i].Properties.Value('name') <> '' then
                        TreeData.Caption := JvSimpleXML.Root.Items[i].Properties.Value('name')
                      else
                        TreeData.Caption := _('Currency');
                      TreeData.DataType := Currency;
                      ReDate := DateToStr(now);
                      TreeData.Date := '';
                    end;
                    { Validation }
                    if JvSimpleXML.Root.Items[i].Name = 'extension' then
                    begin
                      if JvSimpleXML.Root.Items[i].Properties.Value('name') <> '' then
                        TreeData.Caption := JvSimpleXML.Root.Items[i].Properties.Value('name')
                      else
                        TreeData.Caption := _('Extension');
                      if (JvSimpleXML.Root.Items[i].Properties.Value('meet') <> '') and
                        isInteger(JvSimpleXML.Root.Items[i].Properties.Value('meet')) then
                           TreeData.Meet := StrToInt(JvSimpleXML.Root.Items[i].Properties.Value('meet'));
                      TreeData.DataType := Validation;
                      { Date }
                      TreeData.Date := '';
                      TreeData.Date := GridChild(Flb).LicenseDates.Values[JvSimpleXML.Root.Items[i].Properties.Value('date')];
                      ReDate := TreeData.Date;
                    end;
                    Node := AddVSTStructure(VST,RootNode,TreeData);
                    { Conditions }
                    if JvSimpleXML.Root.Items[i].Items.Count > 0 then
                    begin
                      for j := 0 to JvSimpleXML.Root.Items[i].Items.Count-1 do
                      begin
                        XMLElem := JvSimpleXML.Root.Items[i].items[j];
                        if (XMLElem.Name = 'condition') then
                          if (XMLElem.Properties.Value('optional') <> 'true') or ((XMLElem.Properties.Value('optional') = 'true') and
                            (GridChild(Flb).OptConditions.IndexOf(XMLElem.Properties.Value('name')) > -1)) then begin

                              { Categories }
                              Categories := GridChild(Flb).LicenseCategories.Values[XMLElem.Properties.Value('category')];
                              TimeCat := GridChild(Flb).LicenseTimeCat.Values[XMLElem.Properties.Value('timecat')];

                              { Valid date }
                              if (JvSimpleXML.Root.Items[i].Name) = 'currency' then
                                ValidDate := ValidTo(Flb, XMLElem, Categories, TimeCat)
                              else ValidDate := '';

                              AddSubNode(Node, XMLElem, GetActualValue(Flb, XMLElem, ReDate, Categories, TimeCat), ValidDate);
                            end;
                      end;
                      CheckNode(Node);
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    LicFileList.Free;
  end;
end;

// ----------------------------------------------------------------
// Add sub node
// ----------------------------------------------------------------
function TFLicenses.AddSubNode(Node: PVirtualNode; XMLElem:TJvSimpleXMLElem; Value, Date: String): PVirtualNode;
var
  TreeData: TTreeData;
  ValueType: String;
  Req: String;
begin
  ValueType := XMLElem.Properties.Value('value');
  Req := XMLElem.Properties.Value('required');

  TreeData.Caption := XMLElem.Properties.Value('name');
  TreeData.FRequired := XMLElem.Properties.Value('required');
  TreeData.Desc := XMLElem.Properties.Value('desc');
  TreeData.FMissing := '';
  TreeData.Date := Date;
  TreeData.FAvailable := Value;
  TreeData.DataType := Condition;

  if InList(ValueType,ValueTypeStarts) then
  // starts
  begin
    if StrtoInt(Req) <> 0 then
    begin
      if StrtoInt(Value) >= StrtoInt(Req) then
      begin
        TreeData.FMissing := '';
        TreeData.Complied := True;
      end
      else
      begin
        TreeData.FMissing := Inttostr(StrtoInt(Req)-StrtoInt(Value));
        TreeData.Complied := False;
      end;
    end;
  end;
  if InList(ValueType,ValueTypeTime) then
  // time
  begin
    if Req <> '' then
    begin
      if TimetoExact(value) >= TimetoExact(Req) then
      begin
        TreeData.FMissing := '';
        TreeData.Complied := True;
      end
      else
      begin
        TreeData.FMissing := MinutetoTime(TimetoMinute(Req)-TimetoMinute(Value));
        TreeData.Complied := False;
      end;
    end;
  end;
  Result := AddVSTStructure(VST,Node,TreeData);
end;

// ----------------------------------------------------------------
// Check if conditions for node complied
// set date of RootNode
// ----------------------------------------------------------------
procedure TFLicenses.CheckNode(RootNode: PVirtualNode);
var
  RootNodeComplied: Word;
  NodeData: ^TTreeData;
  Node: PVirtualNode;
  i: Word;
  Date, ParentCaption: String;
begin
  if RootNode.ChildCount = 0 then
    Exit;
  NodeData := VST.GetNodeData(RootNode.Parent);
  ParentCaption := NodeData.Caption;

  RootNodeComplied := 0;
  Node := RootNode.FirstChild;
  Date := '';

  { Get node state and smallest date }
  for i:= 0 to RootNode.ChildCount-1 do
  begin
    NodeData := VST.GetNodeData(Node);
    if (Date = '') or (StrToDate(Date) > StrToDate(NodeData.Date)) then
      Date := NodeData.Date;
    if NodeData.Complied then
      inc(RootNodeComplied);
    Node := Node.NextSibling;
  end;

  { Set date of RootNode }
  NodeData := VST.GetNodeData(RootNode);
  if (NodeData.DataType = Currency) or (NodeData.DataType = Medical) then
    NodeData.Date := Date;

  { Set folding }
  if ((NodeData.Meet <= 0) and (RootNodeComplied = RootNode.ChildCount))
    or ((NodeData.Meet > 0) and (RootNodeComplied >= NodeData.Meet)) then
      NodeData.Complied := True
  else
  begin
    NodeData.Complied := False;
    VST.Expanded[RootNode] := True;
  end;

  { Add currencies to schedules }
  if NodeData.DataType = Currency then
   if NodeData.Date <> '' then
    SchedValidity.Values[_('Currency') +': '+ ParentCaption] := NodeData.Date;
end;

// ----------------------------------------------------------------
// Get ValueType Data
// ----------------------------------------------------------------
procedure GetValueTypeData(ValueType, TimeCat: String; Flb, Row: Word; var Starts: Word; var Time: String);
var
  EntryStarts: Word;
  TmpStr: Array[0..1] of String;
begin
  EntryStarts := StrToInt(GridChild(Flb).Data['NoL',Row]);
  { Time }
  if ValueType = 'FlightTime' then
    Time := CalcTime(Flb,Time,Row,Row,1);
  if ValueType = 'BlockTime' then
    Time := CalcTime(Flb,Time,Row,Row,0);
    // TODO -cFeature Request: flight instructor
  { PIC }
  if ValueType = 'PICFlightTime' then
    if GridChild(Flb).Data['Pi1',Row] = GenSettings.Values['PilotName'] then
      Time := CalcTime(Flb,Time,Row,Row,1);
  if ValueType = 'PICBlockTime' then
    if GridChild(Flb).Data['Pi1',Row] = GenSettings.Values['PilotName'] then
      Time := CalcTime(Flb,Time,Row,Row,0);
  { Starts }
  if ValueType = 'Starts' then
    inc(Starts,EntryStarts);
  { WStarts }
  if ValueType = 'WStarts' then
    if GridChild(Flb).Data['ToS',Row] = 'W' then
      inc(Starts,EntryStarts);
  { FStarts }
  if ValueType = 'FStarts' then
    if GridChild(Flb).Data['ToS',Row] = 'F' then
      inc(Starts,EntryStarts);
  { EStarts }
  if ValueType = 'EStarts' then
    if GridChild(Flb).Data['ToS',Row] = 'E' then
      inc(Starts,EntryStarts);
  { TimeCat }
  if ValueType = 'TimeCat' then
    if GridChild(Flb).KeyInKat(TimeCat,'CTi',Row,TmpStr) then
    Time := AddTime(Time,TmpStr[0]);
end;


// ----------------------------------------------------------------
// Get actual value
// ----------------------------------------------------------------
function TFLicenses.GetActualValue(CurFlb: Word; XMLElem:TJvSimpleXMLElem; Date: String; Category, TimeCat: String): String;
var
  ReDate: TDate;
  i, Flb, Row, Starts : Word;
  ValueType, Req, Month, Time: String;
  IsAccLicense: Boolean;
  AccLicenses: TStrings;
begin
  ValueType := XMLElem.Properties.Value('value');
  Req := XMLElem.Properties.Value('required');
  Month := XMLElem.Properties.Value('duration');
  ReDate := IncMonth(StrToDate(Date),-StrToInt(Month));
  AccLicenses := TStringList.Create;
  readTStrings(XMLElem.Properties.Value('acceptedlicenses'), AccLicenses);
  Time := '00:00';
  Starts := 0;

  for Flb := 0 to FMain.MDIChildCount-1 do
  begin
    { AccLicenses }
    IsAccLicense := False;
    if AccLicenses.Count > 0 then
    begin
      for i := 0 to AccLicenses.Count-1 do
        if GridChild(CurFlb).AccLicenses.Values[AccLicenses.Strings[i]] = GridChild(Flb).Caption then
          IsAccLicense := True
        else
          if not IsAccLicense then IsAccLicense := False;
    end;

    if ((CurFlb = Flb) or (IsAccLicense)) and (GridChild(Flb).Data['Num',1] <> '') then
    begin
      for Row := 1 to GridChild(Flb).Grid.RowCount-1 do
      begin
      { Date after reference date }
        if (StrtoDate(GridChild(Flb).Data['Dat',Row]) >= ReDate) and (GridChild(Flb).KeyInKat(Category,'Cat',Row)) then
          GetValueTypeData(ValueType, TimeCat, Flb, Row, Starts, Time);
      end;
    end;
  end;
  if InList(ValueType,ValueTypeStarts) then
    Result := InttoStr(Starts)
  else
    Result := Time;
  AccLicenses.Free;
end;

// ----------------------------------------------------------------
// Calc date to which the regulation is current
// ----------------------------------------------------------------
function TFLicenses.ValidTo(CurFlb: Word; XMLElem: TJvSimpleXMLElem; Category, TimeCat: String): String;
var
  i, Flb, Row, Starts: Word;
  ValueType, Req, Month, Time: String;
  IsAccLicense: Boolean;
  AccLicenses: TStrings;
begin
  Month := XMLElem.Properties.Value('duration');
  Req := XMLElem.Properties.Value('required');
  ValueType := XMLElem.Properties.Value('value');
  AccLicenses := TStringList.Create;
  readTStrings(XMLElem.Properties.Value('acceptedlicenses'), AccLicenses);
  Starts := 0;
  Time := '00:00';

  for Flb := 0 to FMain.MDIChildCount-1 do
  begin
    { AccLicenses }
    IsAccLicense := False;
    if AccLicenses.Count > 0 then
    begin
      for i := 0 to AccLicenses.Count-1 do
        if GridChild(CurFlb).AccLicenses.Values[AccLicenses.Strings[i]] = GridChild(Flb).Caption then
          IsAccLicense := True
        else
          if not IsAccLicense then IsAccLicense := False;
    end;

    Row := GridChild(CurFlb).Grid.RowCount-1;
    if ((CurFlb = Flb) or (IsAccLicense)) and (GridChild(Flb).Data['Num',1] <> '') then
    begin
      while (Row > 1) and (StrtoDate(GridChild(Flb).Data['Dat',Row]) > IncMonth(now,-StrToint(Month))) do
      begin
        GetValueTypeData(ValueType, TimeCat, Flb, Row, Starts, Time);
        { Requirements fulfilled -> Result := Date }
        if ((InList(ValueType,ValueTypeStarts)) and (Starts >= StrToInt(Req))) or
           ((InList(ValueType,ValueTypeTime)) and (TimeToMinute(Time) >= TimeToMinute(Req))) then
        begin
          Result := DateToStr(IncMonth(StrToDate(GridChild(CurFlb).Data['Dat',Row]),StrToInt(Month)));
          Break;
        end;
        dec(Row);
      end;
    end;
  end;
end;

// ----------------------------------------------------------------
// Change license settings
// ----------------------------------------------------------------
procedure TFLicenses.ButtonSettingsClick(Sender: TObject);
begin
  with TFSettings.Create(Application) do
  try
    TabSheetGeneral.TabVisible := True;
    TabSheetLicenses.TabVisible := True;
    TabSheetMedicals.TabVisible := True;
    TabSheetAutoComplete.TabVisible := True;
    TabSheetCat.TabVisible := True;
    ButtonNext.Visible := False;
    ButtonOK.Enabled := True;
    ButtonExit.Visible := True;
    PageControl.ActivePage := TabSheetLicenses;
    ShowModal;
  finally
    Release
  end;
  ModalResult := mrNone;
  onShow(Self);
end;

// ----------------------------------------------------------------
// Show node description
// ----------------------------------------------------------------
procedure TFLicenses.VSTFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
var
  NodeData: ^TTreeData;
begin
  if Node = nil then Exit;
  NodeData := VST.GetNodeData(Node);
  MemoDesc.Lines.Text := NodeData.Desc;
end;

initialization
  {$i Licenses.lrs}
  {$i Licenses.lrs}
  {$i Licenses.lrs}

end.
