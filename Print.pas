unit Print;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, PrintDrv, Mask, inifiles,
   Printers, CheckLst, gnugettext, JvExStdCtrls, JvButton,
  JvCtrls, TypInfo;

const
  numFixedCols = 22;

type
  TFPrint = class(TForm)
    Panel1: TPanel;
    BitBtn1: TJvImgBtn;
    StatusBar1: TStatusBar;
    ButtonVorschau: TJvImgBtn;
    ButtonPrint: TJvImgBtn;
    Print: TMWPrintObject;
    Label1: TLabel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Label23: TLabel;
    Label37: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel18: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    Label24: TLabel;
    Image1: TImage;
    Bevel4: TBevel;
    PrintFormatCB: TComboBox;
    PanelSchein: TPanel;
    PanelDatum: TPanel;
    CBDateFrom: TMaskEdit;
    CBDateTo: TMaskEdit;
    PanelStarts: TPanel;
    CBStFrom: TEdit;
    CBStTo: TEdit;
    PanelJahre: TPanel;
    CBJFrom: TComboBox;
    CBJTo: TComboBox;
    RBJahre: TRadioButton;
    RBStarts: TRadioButton;
    RBSchein: TRadioButton;
    RBDatum: TRadioButton;
    LBFlu: TListBox;
    CBPageNumber: TCheckBox;
    CBFileName: TCheckBox;
    CBHeadLine: TCheckBox;
    CBPrintNr: TCheckBox;
    CBPrintArt: TCheckBox;
    CBPrintFlights: TCheckBox;
    CLBKat: TCheckListBox;
    Panel4: TPanel;
    RBKatAnd: TRadioButton;
    RBKatOr: TRadioButton;
    CBPrintKat: TCheckBox;
    CBPrintBem: TCheckBox;
    CBPrintVia: TCheckBox;
    CBPrintCTi: TCheckBox;
    PrintSettingsCB: TComboBox;
    Label7: TLabel;
    ButtonSpeichern: TJvImgBtn;
    Bevel5: TBevel;
    Bevel2: TBevel;
    CBPrintCon: TCheckBox;
    CTiCheckListBox: TCheckListBox;
    CTiUpButton: TJvImgBtn;
    CTiDownButton: TJvImgBtn;
    KatSelPanel: TPanel;
    KatSelCTiRB: TRadioButton;
    KatSelConRB: TRadioButton;
    ConCheckListBox: TCheckListBox;
    Label8: TLabel;
    CBPrintStr: TCheckBox;
    CBDateTime: TCheckBox;
    Kummulieren: TCheckBox;
    PICOnly: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PrintAfterNewPage(Sender: TObject);
    procedure RBClick(Sender: TObject);
    procedure CBJFromChange(Sender: TObject);
    procedure CBJToChange(Sender: TObject);
    procedure ButtonVorschauClick(Sender: TObject);
    procedure ButtonPrintClick(Sender: TObject);
    procedure PrintNewPage(Sender: TObject);
    procedure LBFluClick(Sender: TObject);
    procedure CLBKatClickCheck(Sender: TObject);
    procedure PrintSettingsCBChange(Sender: TObject);
    procedure ButtonSpeichernClick(Sender: TObject);
    procedure CTiUpButtonClick(Sender: TObject);
    procedure CTiDownButtonClick(Sender: TObject);
    procedure KatSelCTiRBClick(Sender: TObject);
    procedure KatSelConRBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function CreateDescription: Boolean;
    procedure OnHint(Sender: TObject);
    procedure PrintIt;
  public
    { Public-Deklarationen }
  end;

var
  FPrint: TFPrint;
  Fluege, Strecke, TmpFluege, TmpStrecke : Integer;
  ZFlGesamt, ZBlGesamt, TmpZFlGesamt, TmpZBlGesamt : String;
  TopMargin,
  BottomMargin,
  LeftMargin,
  RightMargin :Integer;
  TotalColWidth : Word;


implementation

uses Settings, Main, Grid, BasicSettings, Grids, Tools, ToolsGrid;

{$R *.DFM}

procedure TFPrint.FormShow(Sender: TObject);
var
  i,j: Integer;
  DruckIni: TIniFile;
begin
  { Papierformate einlesen }
  DruckIni := Tinifile.create(GetActualDir(false)+'\PrinterFormats.Ini');
  DruckIni.ReadSections(PrintFormatCB.Items);
  PrintFormatCB.ItemIndex := 0;
  DruckIni.Free;

  DruckIni := Tinifile.create(GetActualDir(false)+'\PrinterSettings.Ini');
  DruckIni.ReadSections(PrintSettingsCB.Items);
  PrintSettingsCB.ItemIndex := 0;
  DruckIni.Free;
  PrintSettingsCB.OnChange(Self);

  { Initialisieren der Auswahlliste }
  CBJTo.Items.Clear;
  CBJTo.Items.Add('Ende');
  CBJFrom.Items.Clear;
  CBJFrom.Items.Add('Anfang');
  for i := 1 to (ExtractYear(GridActiveChild.Data['Dat',GridActiveChild.Grid.RowCount-1])-ExtractYear(GridActiveChild.Data['Dat',1])) do
  begin
    CBJFrom.Items.Add(InttoStr(ExtractYear(GridActiveChild.Data['Dat',1])+i));
    CBJTo.Items.Add(InttoStr(ExtractYear(GridActiveChild.Data['Dat',1])+i));
  end;
  CBJFrom.ItemIndex := 0;
  CBJTo.ItemIndex := 0;
  Application.OnHint := onHint;

  { Add categories, timecategories + licenses }
  CLBKat.Clear;
  CTiCheckListBox.Clear;
  ConCheckListBox.Clear;
  for i := 0 to FMain.MDIChildCount-1 do
  begin
    LBFlu.Items.Add(GridChild(i).caption);
    for j := 0 to GridChild(i).ACCategories.Count-1 do
    begin
      if CLBKat.Items.IndexOf(GridChild(i).ACCategories[j]) = -1 then
        CLBKat.Items.Add(GridChild(i).ACCategories[j]);
     end;
     if GridChild(i).ACTimeCat.Count > 0 then
     for j := 0 to GridChild(i).ACTimeCat.Count-1 do
     begin
       if CTiCheckListBox.Items.IndexOf(GridChild(i).ACTimeCat[j]) = -1 then
        CTiCheckListBox.Items.Add(GridChild(i).ACTimeCat[j]);
     end;
     if GridChild(i).ACContestCat.Count > 0 then
     for j := 0 to GridChild(i).ACContestCat.Count-1 do
     begin
       if ConCheckListBox.Items.IndexOf(GridChild(i).ACContestCat[j]) = -1 then
        ConCheckListBox.Items.Add(GridChild(i).ACContestCat[j]);
     end;
  end;
  LBFlu.Selected[0] := True;
  LBFluClick(self);
  PrintSettingsCBChange(Self);
  KatSelCTiRBClick(Self);
end;

procedure TFPrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnHint := FMain.onHint;
end;

procedure TFPrint.OnHint(Sender: TObject);
begin
  StatusBar1.Panels[0].text := GetLongHint(Application.Hint);
end;

{ Vorschau }
procedure TFPrint.ButtonVorschauClick(Sender: TObject);
begin
  Print.Preview := True;
  PrintIt;
end;

{ Drucken }
procedure TFPrint.ButtonPrintClick(Sender: TObject);
begin
 Print.Preview := False;
 PrintIt;
end;

{ Druck zusammenstellen }
procedure TFPrint.PrintIt;
var
  SNr, i, j, k, StartDate, EndDate : Integer;
  spalte, row, CurPage: Integer;
  Accept, PrevAccept: Boolean;
  pFont: TFont;
  incr, KatRows: Word;
  DruckIni: TIniFile;
  Format, Scheine: string;
  Align: Byte;
  LineIsDeleted : Boolean;
  ItsIn ,ItsInNot, KatSel, KatSelNot, ItsInNotP: Boolean;
  katStr, tmpCol: String;
  selKatStr: Array[0..1] of String;

begin
  { Druckformat definieren }
  DruckIni := Tinifile.create(GetActualDir(false)+'\PrinterFormats.Ini');
  Format := PrintFormatCB.Items.Strings[PrintFormatCB.ItemIndex];
  TopMargin := DruckIni.ReadInteger(Format,'TopMargin',5);
  BottomMargin := DruckIni.ReadInteger(Format,'BottomMargin',135);
  LeftMargin := DruckIni.ReadInteger(Format,'LeftMargin',10);
  RightMargin := DruckIni.ReadInteger(Format,'RightMargin',203);
  Print.PaperSize := PaperSizes(getEnumValue(typeInfo(PaperSizes),DruckIni.ReadString(Format,'PaperSize','PAPER_A5')));
  //Print.SetMeasure(mtPixels);

  if DruckIni.ReadInteger(Format,'Orientation',0) = 0 then
   Print.Orientation := poLandscape
  else
   Print.Orientation := poPortrait;

  DruckIni.Free;

  { Gültiger Wert in Starts? }
  if RBStarts.checked then
  begin
    try StrToInt(CBSTFrom.Text)
    except
      on EConvertError do
      begin
        MessageDlg(_('Please enter a number'),mtError,[mbOK],0);
        ActiveControl := CBSTFrom;
        Exit;
      end;
    end;
    try
      StrToInt(CBSTTo.Text)
    except
      on EConvertError do
      begin
        MessageDlg(_('Please enter a number'),mtError,[mbOK],0);
        ActiveControl := CBSTTo;
        Exit;
      end;
    end;
  end;
  { Gültiger Wert in Datum? }
  if RBDatum.checked then
  begin
    try StrToDate(CBDateFrom.Text)
    except
      on EConvertError do
      begin
        MessageDlg(_('Please enter date'),mtError,[mbOK],0);
        ActiveControl := CBDateFrom;
        Exit;
      end;
    end;
    try StrToDate(CBDateFrom.Text)
    except
      on EConvertError do
      begin
        MessageDlg(_('Please enter date'),mtError,[mbOK],0);
        ActiveControl := CBDateTo;
        Exit;
      end;
    end;
  end;

  Fluege := 0;
  Strecke := 0;

  TmpFluege := 0;
  TmpStrecke := 0;

  ZFlGesamt := '00:00';
  ZBlGesamt := '00:00';

  TmpZFlGesamt := '00:00';
  TmpZBlGesamt := '00:00';

  Accept := False;
  PrevAccept := False;
  Scheine := '';

  { Temp. Schein 'Print' erstellen und ausfüllen mit gewählten Scheinen}
  try FMain.CreateNewWindow('Print','< Schein >');
    GridActiveChild.GridCols.Delimiter := ';';
    GridActiveChild.GridCols.QuoteChar := '"';
    GridActiveChild.GridCols.DelimitedText := '"Num";"Dat";"ATy";"AId";"Pi1";"Pi2";"ToS";"StT";"LaT";"FlT";"StB";"LaB";"BlT";"NoL";"StL";"LaL";"Rem";"Dst";"Cat";"Via";"CTi";"Con";"Rem";"Del"';

    GridActiveChild.Grid.ColCount := GridActiveChild.GridCols.Count;

    for SNr := 0 to FMain.MDIChildCount-1 do
    if (GridChild(SNr).Caption <> 'Print') and (LBFlu.Selected[SNr]) then
    if GridChild(SNr).Data['Num',1] <> '' then
    begin
      { Auswahl nach Jahren }
      if RBJahre.checked then
      begin
        if CBJFrom.Text = 'Anfang' then StartDate := ExtractYear(GridChild(SNr).Data['Dat',1])
        else StartDate := StrtoInt(CBJFrom.Text);
        if CBJTo.Text = 'Ende' then EndDate := ExtractYear(GridChild(SNr).Data['Dat',GridChild(SNr).Grid.RowCount-1])+1
        else EndDate := StrtoInt(CBJTo.Text);
      end;

      if Scheine <> '' then Scheine := Scheine + ' + ';
      Scheine := Scheine + GridChild(SNr).Caption;

      { Wenn Seit Schein: "Schein Seit" ausgefüllt? }
      if RBSchein.checked then
      begin
        if GridChild(SNr).Settings.Values['LicenseSince'] = '  .  .    ' then
        begin
          Messagedlg(_('Please fill out "Licence obtained"!'),mtWarning,[mbOK],0);
          FBasicSettings.PageControl.ActivePageIndex := 3;
          FSettings.ShowModal;
          if GridChild(SNr).Settings.Values['LicenseSince'] = '  .  .    ' then Exit;
        end;
      end;

      for i := 1 to GridChild(SNr).Grid.RowCount-1 do
      begin

        { Auswahl nach Jahren }
        if RBJahre.checked then begin
          if Kummulieren.Checked then begin
            Accept := False;
            If (ExtractYear(GridChild(SNr).Data['Dat',i]) < EndDate)
            then  Accept := True;
          end else begin
            Accept := False;
            if (ExtractYear(GridChild(SNr).Data['Dat',i]) >= StartDate)
              and (ExtractYear(GridChild(SNr).Data['Dat',i]) < EndDate)
            then  Accept := True;
          end;
        end;

        { Auswahl nach Datum }
        if RBDatum.checked then begin
          if (StrToDate(GridChild(SNr).Data['Dat',i]) >= StrToDate(CBDateFrom.Text))
            and (StrToDate(GridChild(SNr).Data['Dat',i]) <= StrToDate(CBDateTo.Text))
          then  Accept := True
          else  Accept := False;
        end;

        { Auswahl nach Starts }
        if RBStarts.checked then begin
          Accept := False;
          if (StrtoInt(GridChild(SNr).Data['Num',i]) >= (StrtoInt(CBStFrom.Text)))
            and (StrtoInt(GridChild(SNr).Data['Num',i]) <= (StrtoInt(CBStTo.Text)))
          then Accept := True;
        end;

        { Seit Schein }
        if RBSchein.checked then begin
          if (StrToDate(GridChild(SNr).Data['Dat',i]) > StrToDate(GridChild(SNr).Settings.Values['LicenseSince']))
          then Accept := True
          else Accept := False;
        end;

        { PIC only }
        if PICOnly.checked then begin
          if UpperCase(GenSettings.Values['PilotName']) <> UpperCase(GridChild(SNr).Data['Pi1',i]) then
            Accept := False;
        end;

        { Categories }
        ItsIn := False;
        ItsInNot := False;
        KatSel := False;
        KatSelNot := False;
        ItsInNotP := False;

        if Accept then
        for j := 0 to CLBKat.Count-1 do
        if (CLBKat.State[j] = cbChecked) or (CLBKat.State[j] = cbGrayed) then begin
          if CLBKat.State[j] = cbChecked then KatSel := True;
          if CLBKat.State[j] = cbGrayed then KatSelNot := True;
          if RBKatAnd.Checked then ItsIn := False;
          if RBKatAnd.Checked then ItsInNot := False;
          k := 0;
          while k < length(GridChild(SNr).data['Cat',i]) do
          begin
            if (GridChild(SNr).data['Cat',i][k+1] = '/') then
            begin
              if KatStr = CLBKat.Items.Strings[j] then
              begin
                if CLBKat.State[j] = cbChecked then ItsIn := True;
                if CLBKat.State[j] = cbGrayed then ItsInNot := True;
              end
              else if RBKatOr.Checked and (CLBKat.State[j] = cbGrayed) then ItsInNotP := True;
              KatStr := '';
            end
            else KatStr := KatStr + GridChild(SNr).data['Cat',i][k+1];
            inc(k);
          end;
          if RBKatAnd.Checked then
          begin
            if (CLBKat.State[j] = cbChecked) and (not ItsIn) then Accept := False;
            if (CLBKat.State[j] = cbGrayed) and (ItsinNot) then Accept := False;
          end;
        end;

        if RBKatOr.Checked then begin
          Accept := False;
          if (KatSel and ItsIn) or (KatSelNot and not ItsInNot) then Accept := True;
          if ItsInNotP then Accept := True;
          if CLBKat.SelCount = 0 then Accept := True;
        end;

        { Erster Start Accepted }
        if Accept and not PrevAccept then
        if i = 1 then  begin
          if GridChild(SNr).Settings.Values['BFTime'] <> '00000:00' then
            GridActiveChild.Settings.Values['BFTime'] :=
              AddTime(GridActiveChild.Settings.Values['BFTime'], GridChild(SNr).Settings.Values['BFTime']);

          if StrtoInt(GridChild(SNr).Settings.Values['BFStarts']) > 0 then
            GridActiveChild.Settings.Values['BFStarts'] :=
              InttoStr(StrtoInt(GridActiveChild.Settings.Values['BFStarts']) + StrtoInt(GridChild(SNr).Settings.Values['BFStarts']));
        end;
        {else begin
          GridActiveChild.Settings.Values['BFTime'] :=
           AddTime(GridActiveChild.Settings.Values['BFTime'], CalcZeit(SNr,GridChild(SNr).Settings.Values['BFTime'],1,i-1));

          if FMain.Nummerierung = 1 then
           GridActiveChild.Settings.Values['BFStarts'] :=
           InttoStr(StrtoInt(GridActiveChild.Settings.Values['BFStarts'])
           + CalcFlights(SNr,0,1,i-1) + StrtoInt(GridChild(SNr).Settings.Values['BFStarts']))
          else GridActiveChild.Settings.Values['BFStarts'] :=
           InttoStr(StrtoInt(GridActiveChild.Settings.Values['BFStarts'])
           + i-1 + StrtoInt(GridChild(SNr).Settings.Values['BFStarts']));
        end;
        PrevAccept := Accept;}

        { Statistikerhebung }
        if Accept then begin
          if GridActiveChild.Data['Dat',1] <> '' then
            GridActiveChild.Grid.RowCount := GridActiveChild.Grid.RowCount +1;

          for j := 0 to GridActiveChild.GridCols.Count-1 do
          begin
            TmpCol := GridActiveChild.GridCols[j];
            GridActiveChild.data[TmpCol,GridActiveChild.Grid.RowCount-1]
              := GridChild(SNr).data[TmpCol,i];
          end;
        end;
      end; { for i := 1 to GridChild(SNr).Grid.RowCount-1 do }
    end; { for SNr := 0 to FMain.MDIChildCount-1 do }


    { Abbrechen wenn KEINE Datensätze }
    if ((GridActiveChild.Grid.RowCount = 2) and (GridActiveChild.Data['Num',1] = '')) then begin
      MessageDlg(_('No data found'),mtInformation,[mbOK],0); Exit;
    end;


    { Sortieren }
    SortGridByCols(
      [GridActiveChild.GridCols.IndexOf('Dat'), GridActiveChild.GridCols.IndexOf('StT')], GridActiveChild.Grid
    ); GridActiveChild.ReCalcGridNr;


    { Drucken }
    with Print do begin
      if not Start then exit;

      pFont := TFont.Create;
      SetMargins(TopMargin,BottomMargin,LeftMargin,RightMargin);
      { Überschrift }
      pFont.Name := 'Verdana';
      pFont.Size := 10;
      pFont.Style := [fsBold];
      SetHeaderDim(LeftMargin,10,RightMargin,15,false,0,RGB(0,0,0));
      if CBHeadLine.checked then SetHeaderInfo(1,7,'Flugbuch ['+Scheine+'] - '+
      GenSettings.Values['Name'],1,pFont);

      { Maintext }
      pFont.Size := 7;
      SetFontInfo(pFont);
      SetDetailTopBottom(15,BottomMargin+2);
      if CBPageNumber.Checked then SetPageNumberInfo(11,'Seite %d',1,True,pFont);
      pFont.Size := 10;
      pFont.Style := [];
      SetTopOfPage;
      if not CreateDescription then
      begin
        messagedlg(_('Too many columns for one page!'),mtError,[mbOK],0);
        abort; exit;
      end;

      ProgressBarMax := GridActiveChild.Grid.RowCount-1;
      for row := 1 to GridActiveChild.Grid.RowCount-1 do
      begin
        Increment;

        try LineIsDeleted := false;
          if GridActiveChild.Data['Del', row] > '' then
            LineIsDeleted := true;
        finally
          if LineIsDeleted then
            SetFontStyle([fsBold, fsStrikeOut])
          else SetFontStyle([fsBold]);
        end;

        if ((RBJahre.checked) and (Kummulieren.Checked)) then begin
          if not (ExtractYear(GridActiveChild.Data['Dat',row]) >= StartDate) then begin
            { Temp. Zusammenzählen der nicht gedruckten Flüge }

            if not LineIsDeleted then begin
              TmpFluege := TmpFluege + StrToInt(GridActiveChild.Data['NoL',row]);
              TmpZFlGesamt := AddTime(TmpZFlGesamt,GridActiveChild.Data['FlT',row]);
              TmpZBlGesamt := AddTime(TmpZBlGesamt,GridActiveChild.Data['BlT',row]);
            end;

            if GridActiveChild.Data['Dst',row] > '' then
              TmpStrecke := TmpStrecke + StrToInt(GridActiveChild.Data['Dst',row]);

            if Row+1 <= GridActiveChild.Grid.RowCount-1 then begin
              if (ExtractYear(GridActiveChild.Data['Dat',row+1]) >= StartDate) then begin

                GridActiveChild.Data['FlT',row] := TmpZFlGesamt;
                GridActiveChild.Data['BlT',row] := TmpZBlGesamt;
                GridActiveChild.Data['NoL',row] := IntToStr(TmpFluege);
                GridActiveChild.Data['DSt',row] := IntToStr(TmpStrecke);

                SetFontStyle([fsBold]);
                WriteLineColumnAlign(10,GetYPosition,GridActiveChild.Data['FlT',row],2);
                WriteLineColumnAlign(13,GetYPosition,GridActiveChild.Data['BlT',row],2);
                WriteLineColumnAlign(14,GetYPosition,GridActiveChild.Data['NoL',row],2);
                WriteLineColumnAlign(17,GetYPosition,GridActiveChild.Data['Dst',row],2);

                if row < GridActiveChild.Grid.RowCount-1 then begin
                  CurPage := CurrentPageNumber; NextLine;
                  If CurPage = CurrentPageNumber then
                    DrawLine(0,GetYPosition,TotalColWidth,GetYPosition,0);
                end;

                Fluege := Fluege + TmpFluege;
                Strecke := Strecke + TmpStrecke;
                ZFlGesamt := AddTime(ZFlGesamt,TmpZFlGesamt);
                ZBlGesamt := AddTime(ZBlGesamt,TmpZBlGesamt);

                TmpZFlGesamt := '00:00';
                TmpZBlGesamt := '00:00';
                TmpFluege := 0; TmpStrecke := 0;
              end;
            end;
            continue;
          end;
        end;

        { Standard rows }
        for spalte := 0 to 15 do
        begin
          if (spalte = 1) or (spalte = 6) or (spalte = 7) or (spalte = 8) or (spalte = 10) or (spalte = 11) or (spalte = 14) or (spalte = 15) then Align := 1
          else if (spalte = 0) or (spalte = 9) or (spalte = 10) or (spalte = 12) or (spalte = 13) then Align := 2
          else Align := 0;
          WriteLineColumnAlign(spalte+1,GetYPosition,GridActiveChild.Grid.cells[spalte,row],Align);
        end;

        { Selected rows }
        WriteLineColumnAlign(17,GetYPosition,GridActiveChild.Data['Dst',row],2);
        WriteLineColumnAlign(18,GetYPosition,GridActiveChild.Data['Cat',row],0);
        WriteLineColumnAlign(19,GetYPosition,GridActiveChild.Data['Via',row],0);
        WriteLineColumnAlign(20,GetYPosition,GridActiveChild.Data['CTi',row],0);
        WriteLineColumnAlign(21,GetYPosition,GridActiveChild.Data['Con',row],0);
        WriteLineColumnAlign(22,GetYPosition,GridActiveChild.Data['Rem',row],0);

        { Timecategories from CheckListBox }
        KatRows := 0;
        if CTiCheckListBox.Items.Count > 0 then
        for i := 0 to CTiCheckListBox.Items.Count-1 do
        if CTiCheckListBox.Checked[i] then
        begin
          inc(KatRows);
          GridChild(0).KeyInKat(CTiCheckListBox.Items.Strings[i],'CTi',row,selKatStr);
          WriteLineColumnAlign(numFixedCols+KatRows,GetYPosition,selKatStr[0],2);
        end;

        { Contests from CheckListBox }
        if ConCheckListBox.Items.Count > 0 then
        for i := 0 to ConCheckListBox.Items.Count-1 do
        if ConCheckListBox.Checked[i] then
        begin
          inc(KatRows);
          GridChild(0).KeyInKat(ConCheckListBox.Items.Strings[i],'Con',row,selKatStr);
          WriteLineColumnAlign(numFixedCols+KatRows,GetYPosition,selKatStr[0],2);
        end;

        if not LineIsDeleted then begin
          Fluege := Fluege + StrToInt(GridActiveChild.Data['NoL',row]);
          ZFlGesamt := AddTime(ZFlGesamt,GridActiveChild.Data['FlT',row]);
          ZBlGesamt := AddTime(ZBlGesamt,GridActiveChild.Data['BlT',row]);
        end;

        if GridActiveChild.Data['Dst',row] > '' then
          Strecke := Strecke + StrToInt(GridActiveChild.Data['Dst',row]);

        if row < GridActiveChild.Grid.RowCount-1 then begin
          CurPage := CurrentPageNumber; NextLine;
          If CurPage = CurrentPageNumber then
            DrawLine(0,GetYPosition,TotalColWidth,GetYPosition,0);
        end;
      end;

      { Ausgabe }
      Quit; Show;
    end;
  finally
    GridActiveChild.Free;
  end;
end;

{ Erstellen der Beschreibung + Spalten für Daten }
function TFPrint.CreateDescription: Boolean;
var
  shading: Integer;
  printWidth: Integer;
  colWidth: Array[1..50] of Word;
  colNum, katRows: Word;
  colPos: Real;
  i: Word;
  druckIni: TIniFile;
  format: String;
{----------}
  procedure SetColumn(column, colWidth: Word);
  begin
    Print.CreateColumn(column,colPos,colWidth);
    colPos := colPos + colWidth;
  end;
{----------}
  procedure SetColumnHeader(height: Real; colSpan: Word; text: String);
  var hColWidth, i: Word;
  begin
    hColWidth := 0;
    for i := 1 to colSpan do inc(hColWidth,colWidth[colNum+i-1]);
    Print.CreateColumn(colNum,colPos,hColWidth);
    with Print do begin
      DrawLine(GetColumnLeft(ColNum),TopMargin+16.2,GetColumnLeft(ColNum),BottomMargin-3,1);
      TextColumnBox(GetColumnLeft(ColNum),GetYPosition,GetColumnRight(ColNum), GetYPosition + Height,1,Shading,Text,ColNum,wtCenter);
    end;
    ColPos := ColPos + HColWidth;
    inc(ColNum,ColSpan);
  end;
{----------}
  procedure SetColumnHeader2(Column: Word; Text: String);
  begin
    with Print do begin
      DrawLine(GetColumnLeft(Column),TopMargin+16.2,GetColumnLeft(Column),BottomMargin-3,1);
      TextColumnBox(GetColumnLeft(Column),GetYPosition,GetColumnRight(Column), GetYPosition + 3.4,1,Shading,Text,Column,wtCenter);
    end;
  end;
{----------}
begin
  DruckIni := Tinifile.create(GetActualDir(false)+'\PrinterSettings.Ini');
  Format := PrintSettingsCB.Items.Strings[PrintSettingsCB.ItemIndex];
  { Load User ColWidth }
  ColWidth[1] :=  DruckIni.ReadInteger(Format,'ColWidth_Num', 9);
  ColWidth[2] :=  DruckIni.ReadInteger(Format,'ColWidth_Dat',14);
  ColWidth[3] :=  DruckIni.ReadInteger(Format,'ColWidth_ATy',15);
  ColWidth[4] :=  DruckIni.ReadInteger(Format,'ColWidth_AId',13);
  ColWidth[5] :=  DruckIni.ReadInteger(Format,'ColWidth_Pi1',16);
  ColWidth[6] :=  DruckIni.ReadInteger(Format,'ColWidth_Pi2',16);
  ColWidth[7] :=  DruckIni.ReadInteger(Format,'ColWidth_ToS', 6);

  ColWidth[8] :=  DruckIni.ReadInteger(Format,'ColWidth_StT',10);
  ColWidth[9] :=  DruckIni.ReadInteger(Format,'ColWidth_LaT',12);
  ColWidth[10] := DruckIni.ReadInteger(Format,'ColWidth_FlT', 9);

  ColWidth[11] := DruckIni.ReadInteger(Format,'ColWidth_StT',10);
  ColWidth[12] := DruckIni.ReadInteger(Format,'ColWidth_LaT',12);
  ColWidth[13] := DruckIni.ReadInteger(Format,'ColWidth_FlT', 9);

  ColWidth[14] := DruckIni.ReadInteger(Format,'ColWidth_NoL', 5);
  ColWidth[15] := DruckIni.ReadInteger(Format,'ColWidth_StL',17);
  ColWidth[16] := DruckIni.ReadInteger(Format,'ColWidth_LaL',17);
  ColWidth[17] := DruckIni.ReadInteger(Format,'ColWidth_Dst',25);
  ColWidth[18] := DruckIni.ReadInteger(Format,'ColWidth_Cat',25);
  ColWidth[19] := DruckIni.ReadInteger(Format,'ColWidth_Via',25);
  ColWidth[20] := DruckIni.ReadInteger(Format,'ColWidth_CTi',25);
  ColWidth[21] := DruckIni.ReadInteger(Format,'ColWidth_Con',25);
  ColWidth[22] := DruckIni.ReadInteger(Format,'ColWidth_Rem',25);

  { Hide unwanted Cols }
  if not CBPrintNr.checked then ColWidth[1] := 0;
  if not CBPrintArt.checked then ColWidth[7] := 0;
  if not CBPrintFlights.checked then ColWidth[14] := 0;
  if not CBPrintStr.checked then ColWidth[17] := 0;
  if not CBPrintKat.checked then ColWidth[18] := 0;
  if not CBPrintVia.checked then ColWidth[19] := 0;
  if not CBPrintCTi.checked then ColWidth[20] := 0;
  if not CBPrintCon.checked then ColWidth[21] := 0;
  if not CBPrintBem.checked then ColWidth[22] := 0;

  Shading := RGB(220,220,220);
  with Print do
  begin
    SetFontSize(6);
    SetTopOfPage;

    { First description line }
    ColPos := 0;
    ColNum := 1;
    SetColumnHeader(6.2,1,_('Nr.'));
    SetColumnHeader(6.2,1,_('Date'));
    SetColumnHeader(3.1,2,_('Aircraft'));
    SetColumnHeader(3.1,2,_('Pilot')+' / '+_('Passenger'));
    SetColumnHeader(6.2,1,_('Type'));
    SetColumnHeader(3.1,2,_('Time'));
    SetColumnHeader(6.2,1,_('Duration'));
    SetColumnHeader(3.1,2,_('BlockTime'));
    SetColumnHeader(6.2,1,_('Duration'));
    SetColumnHeader(6.2,1,_('Ld.'));
    SetColumnHeader(3.1,2,_('Airport'));
    SetColumnHeader(6.2,1,_('Distance'));
    SetColumnHeader(6.2,1,_('Categories'));
    SetColumnHeader(6.2,1,_('Via'));
    SetColumnHeader(6.2,1,_('Times'));
    SetColumnHeader(6.2,1,_('Contests'));
    SetColumnHeader(6.2,1,_('Remarks'));

    { selected timecategories }
    katRows := 0;
    if CTiCheckListBox.Items.Count > 0 then
    for i := 0 to CTiCheckListBox.Items.Count-1 do
    if CTiCheckListBox.Checked[i] then
    begin
      inc(katRows);
      ColWidth[numFixedCols+katRows] := 10;
      SetColumnHeader(6.2,1,CTiCheckListBox.Items.Strings[i]);
    end;

    { selected contests }
    if ConCheckListBox.Items.Count > 0 then
    for i := 0 to ConCheckListBox.Items.Count-1 do
    if ConCheckListBox.Checked[i] then
    begin
      inc(katRows);
      ColWidth[numFixedCols+katRows] := 10;
      SetColumnHeader(6.2,1,ConCheckListBox.Items.Strings[i]);
    end;

    { Row too wide? }
    PrintWidth := RightMargin-LeftMargin;
    if PrintWidth < 0 then PrintWidth := 0;
    TotalColWidth := 0;
    for i := 1 to numFixedCols+katRows do inc(TotalColWidth,ColWidth[i]);
    if PrintWidth < TotalColWidth then Result := False
    else Result := True;

    Drawbox(0,TopMargin+16.2,TotalColWidth,BottomMargin-3,1);

    { Second description line }
    NextLine;
    ColPos := 0;
    for i := 1 to 50 do SetColumn(i, ColWidth[i]);

    SetColumnHeader2(3,_('Type'));
    SetColumnHeader2(4,_('ID'));
    SetColumnHeader2(5,_('Pilot'));
    SetColumnHeader2(6,_('Copilot'));
    SetColumnHeader2(8,_('Dep.'));
    SetColumnHeader2(9,_('Arr.'));
    SetColumnHeader2(11,_('Block off'));
    SetColumnHeader2(12,_('Block on'));
    SetColumnHeader2(15,_('From'));
    SetColumnHeader2(16,_('To'));
    SetFontSize(9);

    NextLine;
    SetFontSize(6);
  end;
end;

{ beim Beginnen einer neuen Seite }
procedure TFPrint.PrintAfterNewPage(Sender: TObject);
begin
  CreateDescription;
end;

{ Anzeigen des richtigen Panels in der Detailauswahl }
procedure TFPrint.RBClick(Sender: TObject);
begin
  PanelJahre.visible := False;
  PanelStarts.visible := False;
  PanelSchein.visible := False;
  PanelDatum.visible := False;

  if RBJahre.checked then PanelJahre.visible := True;
  if RBStarts.checked then PanelStarts.visible := True;
  if RBDatum.checked then PanelDatum.visible := True;
  if RBSchein.checked then PanelSchein.visible := True;
end;

{ Anpassen der Jahreszahlen in der Detailauswahl }
procedure TFPrint.CBJFromChange(Sender: TObject);
var
  i: Integer;
begin
  CBJTo.Items.Clear;
  CBJTo.Items.Add('Ende');
  for i := 1 to (ExtractYear(GridActiveChild.Data['Dat',GridActiveChild.Grid.RowCount-1])
    -ExtractYear(GridActiveChild.Data['Dat',1])) do
  begin
    CBJTo.Items.Add(InttoStr(ExtractYear(GridActiveChild.Data['Dat',1])+i));
  end;
  if CBJFrom.ItemIndex <> 0 then for i := 1 to CBJFrom.ItemIndex do CBJTo.Items.Delete(1);
end;

{ Anpassen der Jahreszahlen in der Detailauswahl }
procedure TFPrint.CBJToChange(Sender: TObject);
var
  i: Integer;
begin
  CBJFrom.Items.Clear;
  CBJFrom.Items.Add('Anfang');
  for i := 1 to (ExtractYear(GridActiveChild.Data['Dat',GridActiveChild.Grid.RowCount-1])
    -ExtractYear(GridActiveChild.Data['Dat',1])) do
  begin
    CBJFrom.Items.Add(InttoStr(ExtractYear(GridActiveChild.Data['Dat',1])+i));
  end;
 if CBJTo.ItemIndex <> 0 then for i := 1 to (CBJTo.Items.Count-CBJTo.ItemIndex) do CBJFrom.Items.Delete(CBJFrom.Items.Count-1);
end;

procedure TFPrint.PrintNewPage(Sender: TObject);
var
 DruckIni : TiniFile;
 Format : String;
 SummZeile : integer;
begin
  DruckIni := Tinifile.create(GetActualDir(false)+'\PrinterFormats.Ini');
  Format := PrintFormatCB.Items.Strings[PrintFormatCB.ItemIndex];
  SummZeile := DruckIni.ReadInteger(Format,'SummenZeile',135);
  with Print do
  begin
    SetFontStyle([fsBold]);

    Drawbox(GetColumnLeft(10),BottomMargin-3,GetColumnRight(10), BottomMargin +1, 1);
    DrawboxShade(GetColumnLeft(13),BottomMargin-3,GetColumnRight(13), BottomMargin +1, 1, clLtGray);

    WriteLine(GetColumnLeft(10)-6,SummZeile,'Zeit:');
    WriteLineColumnAlign(10,SummZeile,ZFlGesamt,2);

    WriteLine(GetColumnLeft(13)-6,SummZeile,'Zeit:');
    WriteLineColumnAlign(13,SummZeile,ZBlGesamt,2);

    WriteLineColumnAlign(14,SummZeile,IntToStr(Fluege),2);

    WriteLineColumnAlign(17,SummZeile,IntToStr(Strecke),2);

    if CBDateTime.checked then WriteLineAlign(SummZeile, DateTimeToStr(now()), wtRight);
    if CBFileName.checked then WriteLineAlign(SummZeile,{ExtractFileName(}FlpFileName{)}, wtLeft);
  end;
end;

procedure TFPrint.LBFluClick(Sender: TObject);
{----------}
  procedure AddYears(Nr: Integer);
  var
    i: Integer;
  begin
    if GridChild(Nr).Data['Num',1] <> '' then
    for i := 1 to (ExtractYear(GridChild(Nr).Data['Dat',GridChild(Nr).Grid.RowCount-1])-ExtractYear(GridChild(Nr).Data['Dat',1])) do
    begin
      CBJFrom.Items.Add(InttoStr(ExtractYear(GridChild(Nr).Data['Dat',1])+i));
      CBJTo.Items.Add(InttoStr(ExtractYear(GridChild(Nr).Data['Dat',1])+i));
    end;
  end;
{----------}
begin
  CBJTo.Items.Clear;
  CBJTo.Items.Add('Ende');
  CBJFrom.Items.Clear;
  CBJFrom.Items.Add('Anfang');

  if LBFlu.SelCount = 1 then AddYears(LBFlu.ItemIndex);
  { else
  begin
    for SNr := 0 to FMain.MDIChildCount do
     if SNr < LBFlu.Items.Count then
     if LBFlu.Selected[SNr] then
     begin

     end;
  end; }
  CBJFrom.ItemIndex := 0;
  CBJTo.ItemIndex := 0;
end;

procedure TFPrint.CLBKatClickCheck(Sender: TObject);
begin
  with CLBKat do
  begin
    if State[ItemIndex] = cbChecked then State[ItemIndex] := cbUnchecked
    else if State[ItemIndex] = cbGrayed then State[ItemIndex] := cbChecked
    else if State[ItemIndex] = cbUnchecked then State[ItemIndex] := cbGrayed;
  end;
end;

// ----------------------------------------------------------------
// Load user print settings
// ----------------------------------------------------------------
procedure TFPrint.PrintSettingsCBChange(Sender: TObject);
var
  DruckIni: TIniFile;
  Setting: String;
  CTiRows, ConRows: TStrings;
  i: Word;
begin
  CTiRows := TStringList.Create;
  ConRows := TStringList.Create;
  DruckIni := Tinifile.create(GetActualDir(false)+'\PrinterSettings.Ini');
  Setting := PrintSettingsCB.Items.Strings[PrintSettingsCB.ItemIndex];

  PrintFormatCB.ItemIndex := DruckIni.ReadInteger(Setting,'PrintFormat',0);

  CBHeadLine.Checked :=  DruckIni.ReadBool(Setting,'ShowHeadLine', True);
  CBPageNumber.Checked :=  DruckIni.ReadBool(Setting,'ShowPCounter', False);
  CBFileName.Checked :=  DruckIni.ReadBool(Setting,'ShowFileName', False);
  CBDateTime.Checked :=  DruckIni.ReadBool(Setting,'ShowDateTime', False);

  CBPrintNr.Checked :=  DruckIni.ReadBool(Setting,'ShowNum', True);
  CBPrintArt.Checked :=  DruckIni.ReadBool(Setting,'ShowArt', False);
  CBPrintFlights.Checked :=  DruckIni.ReadBool(Setting,'ShowLoc', True);
  CBPrintStr.Checked :=  DruckIni.ReadBool(Setting,'ShowStr', False);
  CBPrintKat.Checked :=  DruckIni.ReadBool(Setting,'ShowKat', False);
  CBPrintVia.Checked :=  DruckIni.ReadBool(Setting,'ShowVia', False);
  CBPrintCTi.Checked :=  DruckIni.ReadBool(Setting,'ShowCTi', False);
  CBPrintBem.Checked :=  DruckIni.ReadBool(Setting,'ShowBem', False);
  CBPrintCon.Checked :=  DruckIni.ReadBool(Setting,'ShowCon', False);
  CTiRows.DelimitedText := DruckIni.ReadString(Setting,'CTiRows','');
  ConRows.DelimitedText := DruckIni.ReadString(Setting,'ConRows','');
  DruckIni.Free;

  { Select CTiRows in CTiCheckListBox }
  if CTiRows.Count > 0 then
  for i := 0 to CTiRows.Count-1 do
  if CTiCheckListBox.Items.IndexOf(CTIRows.Strings[i]) >= 0 then
  begin
    CTiCheckListBox.Items.Move(CTiCheckListBox.Items.IndexOf(CTIRows.Strings[i]),i);
    CTiCheckListBox.Checked[i] := True;
  end;
  CTiRows.Free;

  { Select ConRows in ConCheckListBox }
  if ConRows.Count > 0 then
  for i := 0 to ConRows.Count-1 do
  if ConCheckListBox.Items.IndexOf(ConRows.Strings[i]) > 0 then
  begin
    ConCheckListBox.Items.Move(ConCheckListBox.Items.IndexOf(ConRows.Strings[i]),i);
    ConCheckListBox.Checked[i] := True;
  end;
  ConRows.Free;
end;

// ----------------------------------------------------------------
// Save user print settings
// ----------------------------------------------------------------
procedure TFPrint.ButtonSpeichernClick(Sender: TObject);
var
  DruckIni: TIniFile;
  Setting: String;
  CTiRows, ConRows: TStrings;
  i: Word;
begin
  { write selcted CTi rows into CTiRows }
  CTiRows := TStringList.Create;
  if (CTiCheckListBox.Items.Count > 0) then
  for i := 0 to CTiCheckListBox.Items.Count-1 do
  if CTiCheckListBox.Checked[i] then CTiRows.Add(CTiCheckListBox.Items.Strings[i]);

  { write selcted Con rows into ConRows }
  ConRows := TStringList.Create;
  if (ConCheckListBox.Items.Count > 0) then
  for i := 0 to ConCheckListBox.Items.Count-1 do
  if ConCheckListBox.Checked[i] then ConRows.Add(ConCheckListBox.Items.Strings[i]);


  { write settings to "PrinterSettings.Ini" }
  Setting:= InputBox('Druckeinstellung speichern', 'Bitte den Namen der Druckeinstellung eingeben'
    , PrintSettingsCB.Items.Strings[PrintSettingsCB.ItemIndex]);
  DruckIni := Tinifile.create(GetActualDir(false)+'\PrinterSettings.Ini');

  DruckIni.WriteInteger(Setting,'PrintFormat',PrintFormatCB.ItemIndex);

  DruckIni.WriteBool(Setting,'ShowHeadLine', CBHeadLine.Checked);
  DruckIni.WriteBool(Setting,'ShowPCounter', CBPageNumber.Checked);
  DruckIni.WriteBool(Setting,'ShowFileName', CBFileName.Checked);
  DruckIni.WriteBool(Setting,'ShowDateTime', CBDateTime.Checked);

  DruckIni.WriteBool(Setting,'ShowNum', CBPrintNr.Checked);
  DruckIni.WriteBool(Setting,'ShowArt', CBPrintArt.Checked);
  DruckIni.WriteBool(Setting,'ShowLoc', CBPrintFlights.Checked);
  DruckIni.WriteBool(Setting,'ShowStr', CBPrintStr.Checked);
  DruckIni.WriteBool(Setting,'ShowKat', CBPrintKat.Checked);
  DruckIni.WriteBool(Setting,'ShowVia', CBPrintVia.Checked);
  DruckIni.WriteBool(Setting,'ShowCTi', CBPrintCTi.Checked);
  DruckIni.WriteBool(Setting,'ShowBem', CBPrintBem.Checked);
  DruckIni.WriteBool(Setting,'ShowCon', CBPrintCon.Checked);
  DruckIni.WriteString(Setting,'CTiRows', CTiRows.DelimitedText);
  DruckIni.WriteString(Setting,'ConRows', ConRows.DelimitedText);

  DruckIni.ReadSections(PrintSettingsCB.Items);
  PrintSettingsCB.ItemIndex := PrintSettingsCB.Items.IndexOf(Setting);
  CTiRows.Free;
  ConRows.Free;
  DruckIni.Free;
end;

// ----------------------------------------------------------------
// move entry up
// ----------------------------------------------------------------
procedure TFPrint.CTiUpButtonClick(Sender: TObject);
var
  ItemIndex: Integer;
  CLB: ^TCheckListBox;
begin
  if KatSelCTiRB.Checked then CLB := @CTiCheckListBox
  else CLB := @ConCheckListBox;

  ItemIndex := CLB^.ItemIndex;
  if not ((CLB.Items.Count > 2) and (ItemIndex > 0)) then Exit;
  CLB^.Items.Move(ItemIndex,ItemIndex-1);
  CLB^.Selected[ItemIndex-1] := True;
end;

// ----------------------------------------------------------------
// move entry down
// ----------------------------------------------------------------
procedure TFPrint.CTiDownButtonClick(Sender: TObject);
var
  ItemIndex: Integer;
  CLB: ^TCheckListBox;
begin
  if KatSelCTiRB.Checked then CLB := @CTiCheckListBox
  else CLB := @ConCheckListBox;

  ItemIndex := CLB^.ItemIndex;
  if not ((CLB^.Items.Count > 2) and (ItemIndex > -1) and (ItemIndex < CLB^.Items.Count-1)) then Exit;
  CLB^.Items.Move(ItemIndex,ItemIndex+1);
  CLB^.Selected[ItemIndex+1] := True;
end;

procedure TFPrint.KatSelCTiRBClick(Sender: TObject);
begin
  CTiCheckListBox.Visible := True;
  ConCheckListBox.Visible := False;
end;

procedure TFPrint.KatSelConRBClick(Sender: TObject);
begin
  CTiCheckListBox.Visible := False;
  ConCheckListBox.Visible := True;
end;

procedure TFPrint.FormCreate(Sender: TObject);
var x : string;
begin
  TranslateComponent(Self);

  // Notwendig für gettext, da diese "Ausdrücke" in
  // der RES-Datei der Druck-Komponente stehen...

  x := _('Cancel');
  x := _('close preview');
  x := _('&Print');
  x := _('print document');
  x := _('Zoom');
  x := _('first page');
  x := _('previous page');
  x := _('next page');
  x := _('last page');
  x := _('Printing Report.......');
  x := _('Preparing Report.......');
  x := _('of');
  x := _('page');
  x := _('pages');
end;

end.
