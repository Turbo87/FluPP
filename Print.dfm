object FPrint: TFPrint
  Left = 517
  Top = 309
  BorderStyle = bsDialog
  Caption = 'Print'
  ClientHeight = 284
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 159
    Width = 43
    Height = 13
    Caption = 'Format:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 8
    Top = 111
    Width = 587
    Height = 9
    Shape = bsTopLine
  end
  object Bevel1: TBevel
    Left = 148
    Top = 1
    Width = 9
    Height = 224
    Shape = bsLeftLine
  end
  object Label23: TLabel
    Left = 158
    Top = 9
    Width = 93
    Height = 13
    Caption = 'Choose data by:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label37: TLabel
    Left = 7
    Top = 9
    Width = 57
    Height = 13
    Caption = 'Flight log:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 268
    Top = 71
    Width = 16
    Height = 13
    Caption = 'To:'
  end
  object Label3: TLabel
    Left = 263
    Top = 39
    Width = 26
    Height = 13
    Caption = 'From:'
  end
  object Bevel18: TBevel
    Left = 253
    Top = 32
    Width = 8
    Height = 67
    Shape = bsLeftLine
  end
  object Label5: TLabel
    Left = 158
    Top = 117
    Width = 32
    Height = 13
    Caption = 'View:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 246
    Top = 117
    Width = 45
    Height = 13
    Caption = 'Colums:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 387
    Top = 9
    Width = 55
    Height = 13
    Caption = 'Category:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label24: TLabel
    Left = 557
    Top = 7
    Width = 24
    Height = 13
    Caption = '= not'
  end
  object Image1: TImage
    Left = 541
    Top = 9
    Width = 11
    Height = 11
    Picture.Data = {
      07544269746D6170CE000000424DCE0000000000000076000000280000000B00
      00000B000000010004000000000058000000230B0000230B0000100000001000
      000080808000C8D0D400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000002121212120000000121012121000000021000121200
      0000010000012100000002001000120000000101210001000000021212100200
      0000012121210100000002121212120000000000000000000000}
  end
  object Bevel4: TBevel
    Left = 372
    Top = 2
    Width = 9
    Height = 110
    Shape = bsLeftLine
  end
  object Label7: TLabel
    Left = 5
    Top = 117
    Width = 47
    Height = 13
    Caption = 'Settings'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel5: TBevel
    Left = 241
    Top = 133
    Width = 8
    Height = 86
    Shape = bsLeftLine
  end
  object Bevel2: TBevel
    Left = 425
    Top = 133
    Width = 5
    Height = 86
    Shape = bsLeftLine
  end
  object Label8: TLabel
    Left = 3
    Top = 198
    Width = 142
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = 'Change column width in "PrinterSettings.Ini"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object ButtonSpeichern: TJvImgBtn
    Left = 120
    Top = 135
    Width = 23
    Height = 23
    Hint = 'Save'
    TabOrder = 29
    OnClick = ButtonSpeichernClick
    Flat = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Images = FMain.ImageList
    ImageIndex = 2
  end
  object ConCheckListBox: TCheckListBox
    Left = 435
    Top = 138
    Width = 142
    Height = 82
    BevelInner = bvNone
    Columns = 1
    Ctl3D = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 30
  end
  object CTiCheckListBox: TCheckListBox
    Left = 435
    Top = 138
    Width = 142
    Height = 82
    Hint = 'Choose categories'
    BevelInner = bvNone
    Columns = 1
    Ctl3D = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 25
  end
  object PanelSchein: TPanel
    Left = 258
    Top = 35
    Width = 113
    Height = 76
    BevelOuter = bvNone
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 2
    Visible = False
  end
  object PanelDatum: TPanel
    Left = 291
    Top = 35
    Width = 77
    Height = 76
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object CBDateFrom: TMaskEdit
      Left = 0
      Top = 0
      Width = 62
      Height = 21
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  .  .    '
    end
    object CBDateTo: TMaskEdit
      Left = 0
      Top = 32
      Width = 62
      Height = 21
      EditMask = '!90/90/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  .  .    '
    end
  end
  object PanelStarts: TPanel
    Left = 291
    Top = 35
    Width = 77
    Height = 76
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    object CBStFrom: TEdit
      Left = 0
      Top = 0
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object CBStTo: TEdit
      Left = 0
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 1
    end
  end
  object PanelJahre: TPanel
    Left = 291
    Top = 35
    Width = 75
    Height = 76
    BevelOuter = bvNone
    TabOrder = 5
    object CBJFrom: TComboBox
      Left = 0
      Top = 0
      Width = 72
      Height = 21
      AutoComplete = False
      ItemHeight = 13
      TabOrder = 0
      OnChange = CBJFromChange
      Items.Strings = (
        'Beginning')
    end
    object CBJTo: TComboBox
      Left = 0
      Top = 32
      Width = 72
      Height = 21
      AutoComplete = False
      ItemHeight = 13
      TabOrder = 1
      OnChange = CBJToChange
      Items.Strings = (
        'End')
    end
    object Kummulieren: TCheckBox
      Left = 0
      Top = 56
      Width = 97
      Height = 17
      Caption = 'Carryover'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 225
    Width = 603
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object BitBtn1: TJvImgBtn
      Left = 338
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Exit'
      ModalResult = 3
      TabOrder = 0
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 8
      Kind = bkAbort
    end
    object ButtonVorschau: TJvImgBtn
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Preview'
      Default = True
      TabOrder = 1
      OnClick = ButtonVorschauClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 26
    end
    object ButtonPrint: TJvImgBtn
      Left = 160
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Print'
      Default = True
      TabOrder = 2
      OnClick = ButtonPrintClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 265
    Width = 603
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbNone
        Width = 50
      end>
  end
  object PrintFormatCB: TComboBox
    Left = 11
    Top = 175
    Width = 105
    Height = 21
    Style = csDropDownList
    Ctl3D = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 1
  end
  object RBJahre: TRadioButton
    Left = 162
    Top = 30
    Width = 51
    Height = 17
    Caption = 'Years'
    Checked = True
    TabOrder = 6
    TabStop = True
    OnClick = RBClick
  end
  object RBStarts: TRadioButton
    Left = 162
    Top = 50
    Width = 59
    Height = 17
    Caption = 'Starts'
    TabOrder = 7
    OnClick = RBClick
  end
  object RBSchein: TRadioButton
    Left = 162
    Top = 90
    Width = 83
    Height = 17
    Caption = 'Since licence'
    TabOrder = 8
    OnClick = RBClick
  end
  object RBDatum: TRadioButton
    Left = 162
    Top = 70
    Width = 59
    Height = 17
    Caption = 'Date'
    TabOrder = 9
    OnClick = RBClick
  end
  object LBFlu: TListBox
    Left = 12
    Top = 24
    Width = 126
    Height = 65
    Hint = 'Select licence. Hold '#39'CTRL'#39' for multiple selection'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    MultiSelect = True
    ParentFont = False
    TabOrder = 10
    OnClick = LBFluClick
  end
  object CBPageNumber: TCheckBox
    Left = 162
    Top = 158
    Width = 79
    Height = 17
    Caption = 'Pagecount'
    TabOrder = 11
  end
  object CBFileName: TCheckBox
    Left = 162
    Top = 178
    Width = 79
    Height = 17
    Caption = 'Filename'
    TabOrder = 12
  end
  object CBHeadLine: TCheckBox
    Left = 162
    Top = 138
    Width = 79
    Height = 17
    Caption = 'Header'
    Checked = True
    State = cbChecked
    TabOrder = 13
  end
  object CBPrintNr: TCheckBox
    Left = 250
    Top = 138
    Width = 87
    Height = 17
    Caption = 'Nr.'
    Checked = True
    State = cbChecked
    TabOrder = 14
  end
  object CBPrintArt: TCheckBox
    Left = 250
    Top = 158
    Width = 87
    Height = 17
    Caption = 'Kind'
    TabOrder = 15
  end
  object CBPrintFlights: TCheckBox
    Left = 250
    Top = 178
    Width = 87
    Height = 17
    Caption = 'Landing'
    Checked = True
    State = cbChecked
    TabOrder = 16
  end
  object CLBKat: TCheckListBox
    Left = 381
    Top = 26
    Width = 208
    Height = 82
    Hint = 'Filter category'
    OnClickCheck = CLBKatClickCheck
    AllowGrayed = True
    BevelInner = bvNone
    Columns = 2
    Ctl3D = True
    ItemHeight = 13
    ParentCtl3D = False
    Sorted = True
    TabOrder = 17
  end
  object Panel4: TPanel
    Left = 450
    Top = 6
    Width = 86
    Height = 19
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 18
    object RBKatAnd: TRadioButton
      Left = 2
      Top = 2
      Width = 41
      Height = 15
      Hint = '[Cat1] and [Cat2] and...'
      Caption = 'and'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RBKatOr: TRadioButton
      Left = 42
      Top = 2
      Width = 41
      Height = 15
      Hint = '[Cat1] or [Cat2] or...'
      Caption = 'or'
      TabOrder = 1
    end
  end
  object CBPrintKat: TCheckBox
    Left = 336
    Top = 138
    Width = 89
    Height = 17
    Caption = 'Category'
    TabOrder = 19
  end
  object CBPrintBem: TCheckBox
    Left = 250
    Top = 198
    Width = 87
    Height = 17
    Caption = 'Comment'
    Checked = True
    State = cbChecked
    TabOrder = 20
  end
  object CBPrintVia: TCheckBox
    Left = 336
    Top = 158
    Width = 89
    Height = 17
    Caption = 'Via'
    TabOrder = 21
  end
  object CBPrintCTi: TCheckBox
    Left = 336
    Top = 178
    Width = 89
    Height = 17
    Caption = 'Time category'
    TabOrder = 22
  end
  object PrintSettingsCB: TComboBox
    Left = 11
    Top = 135
    Width = 105
    Height = 21
    Style = csDropDownList
    Ctl3D = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 23
    OnChange = PrintSettingsCBChange
  end
  object CBPrintCon: TCheckBox
    Left = 336
    Top = 198
    Width = 89
    Height = 17
    Caption = 'Competition'
    TabOrder = 24
  end
  object CTiUpButton: TJvImgBtn
    Left = 578
    Top = 153
    Width = 22
    Height = 22
    Hint = 'move up'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 26
    OnClick = CTiUpButtonClick
    Flat = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Images = FMain.ImageList
    ImageIndex = 20
  end
  object CTiDownButton: TJvImgBtn
    Left = 578
    Top = 185
    Width = 22
    Height = 22
    Hint = 'move down'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 27
    OnClick = CTiDownButtonClick
    Flat = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Images = FMain.ImageList
    ImageIndex = 21
  end
  object KatSelPanel: TPanel
    Left = 437
    Top = 115
    Width = 84
    Height = 19
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 28
    object KatSelCTiRB: TRadioButton
      Left = 2
      Top = 2
      Width = 39
      Height = 15
      Hint = 'Time category'
      Caption = 'Tc'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = KatSelCTiRBClick
    end
    object KatSelConRB: TRadioButton
      Left = 41
      Top = 2
      Width = 40
      Height = 15
      Hint = 'Competition category'
      Caption = 'Wb'
      TabOrder = 1
      OnClick = KatSelConRBClick
    end
  end
  object CBPrintStr: TCheckBox
    Left = 336
    Top = 119
    Width = 89
    Height = 17
    Caption = 'Distance'
    TabOrder = 31
  end
  object CBDateTime: TCheckBox
    Left = 162
    Top = 198
    Width = 79
    Height = 17
    Caption = 'Date&&Time'
    TabOrder = 33
  end
  object PICOnly: TCheckBox
    Left = 12
    Top = 92
    Width = 125
    Height = 17
    Caption = 'Only PIC-entries'
    Checked = True
    State = cbChecked
    TabOrder = 34
  end
  object Print: TMWPrintObject
    AutomaticPaging = True
    AutoPageFeed = True
    ClipColumns = True
    Copies = 1
    DisplayPanel.BevelInner = bvLowered
    DisplayPanel.BevelOuter = bvRaised
    DisplayPanel.BevelWidth = 3
    DisplayPanel.DisplayMessage = 'Progress'
    DisplayPanel.LetterFont.Charset = DEFAULT_CHARSET
    DisplayPanel.LetterFont.Color = clYellow
    DisplayPanel.LetterFont.Height = -24
    DisplayPanel.LetterFont.Name = 'Arial'
    DisplayPanel.LetterFont.Style = [fsBold]
    DisplayPanel.MinPanelHeight = 100
    DisplayPanel.MinPanelWidth = 300
    DisplayPanel.PanelColor = clNavy
    DisplayPanel.ProgressColor = clWhite
    DisplayPanel.ProgressInc = 1
    DisplayPanel.ProgressMax = 100
    DisplayPanel.ProgressMin = 0
    DisplayPanel.ProgressPosition = 0
    DisplayPanel.ProgressStartColor = clGray
    DisplayPanel.ProgressStopColor = clGray
    DisplayPanel.ShowProgress = True
    DisplayPanel.ShowProgressPercent = True
    Measurement = mtMM
    Orientation = poLandscape
    PaperSize = PAPER_A5
    PaperSizeArea = '(210 X 149)'
    Preview = True
    PrintDirect = False
    PrintPageNumbers = True
    PrintQuality = pqHIGH
    ProgressBarInc = 1
    ProgressBarMax = 100
    ProgressBarMin = 0
    PromptOnCancel = False
    ShowDisplayProgress = True
    ShowDisplayProgressPercent = True
    ShowPrintDialog = True
    ShowProgress = True
    ShowProgressPercent = True
    ShowTotalPages = True
    StartPercent = P6_Full
    Transparent = True
    UseDisplayPanel = False
    UseLargeFontAdjust = True
    UseMarginOffset = True
    Version = 'Version 4.2'
    AfterNewPage = PrintAfterNewPage
    OnNewPage = PrintNewPage
    Left = 7
    Top = 231
  end
end
