object FStatistics: TFStatistics
  Left = 1334
  Top = 69
  VertScrollBar.ButtonSize = 2
  VertScrollBar.Size = 5
  VertScrollBar.ThumbSize = 5
  VertScrollBar.Tracking = True
  BorderStyle = bsDialog
  Caption = 'Statistic'
  ClientHeight = 605
  ClientWidth = 656
  Color = clBtnFace
  TransparentColorValue = clBtnFace
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
  object Panel3: TPanel
    Left = 0
    Top = 113
    Width = 656
    Height = 433
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Bevel4: TBevel
      Left = 0
      Top = 130
      Width = 453
      Height = 302
      Hint = 'For detail view choose a dataset in the left panel.'
      Shape = bsFrame
    end
    object Bevel10: TBevel
      Left = 0
      Top = 130
      Width = 656
      Height = 302
      Shape = bsFrame
    end
    object Label15: TLabel
      Left = 461
      Top = 341
      Width = 92
      Height = 13
      Caption = 'Annual statistic:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel5: TBevel
      Left = 0
      Top = 22
      Width = 177
      Height = 106
      Shape = bsFrame
    end
    object Bevel9: TBevel
      Left = 0
      Top = 2
      Width = 656
      Height = 22
      Shape = bsFrame
    end
    object Bevel7: TBevel
      Left = 302
      Top = 22
      Width = 126
      Height = 106
      Shape = bsFrame
    end
    object Label1: TLabel
      Left = 10
      Top = 68
      Width = 43
      Height = 13
      Caption = 'Solo time'
    end
    object LabelAlleine: TLabel
      Left = 140
      Top = 68
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = '0:00'
    end
    object Label2: TLabel
      Left = 10
      Top = 83
      Width = 59
      Height = 13
      Caption = 'With copilot:'
    end
    object LabelBegleiter: TLabel
      Left = 140
      Top = 83
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = '0:00'
    end
    object Label8: TLabel
      Left = 10
      Top = 25
      Width = 65
      Height = 13
      Caption = 'Total Time:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelGesamt: TLabel
      Left = 140
      Top = 26
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = '0:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 10
      Top = 110
      Width = 90
      Height = 13
      Caption = 'Average flight time:'
    end
    object LabelDurchn: TLabel
      Left = 140
      Top = 110
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = '0:00'
    end
    object LabelGesamt2: TLabel
      Left = 137
      Top = 39
      Width = 27
      Height = 13
      Hint = 'Flight time including flights before FluPP'
      Alignment = taRightJustify
      Caption = '(0:00)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 238
      Top = 210
      Width = 90
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Average flight time:'
    end
    object LabelSDurchn: TLabel
      Left = 419
      Top = 210
      Width = 21
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0:00'
    end
    object LabelSGesZeit: TLabel
      Left = 408
      Top = 226
      Width = 32
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0.00 %'
    end
    object Label13: TLabel
      Left = 238
      Top = 226
      Width = 70
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = '% of flight time:'
    end
    object Label12: TLabel
      Left = 238
      Top = 242
      Width = 51
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = '% of starts:'
    end
    object LabelSGesStart: TLabel
      Left = 408
      Top = 242
      Width = 32
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0.00 %'
    end
    object Label14: TLabel
      Left = 237
      Top = 135
      Width = 63
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Details for:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelSName: TLabel
      Left = 308
      Top = 135
      Width = 141
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 238
      Top = 160
      Width = 59
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Winch starts'
    end
    object Label28: TLabel
      Left = 239
      Top = 175
      Width = 40
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Air tows:'
    end
    object LabelSW: TLabel
      Left = 334
      Top = 160
      Width = 6
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0'
    end
    object Label29: TLabel
      Left = 238
      Top = 190
      Width = 49
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Self starts:'
    end
    object LabelSF: TLabel
      Left = 334
      Top = 175
      Width = 6
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0'
    end
    object LabelSE: TLabel
      Left = 334
      Top = 190
      Width = 6
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0'
    end
    object Label30: TLabel
      Left = 238
      Top = 258
      Width = 45
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Distance:'
    end
    object LabelSStrecke: TLabel
      Left = 417
      Top = 258
      Width = 23
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0 km'
    end
    object Label31: TLabel
      Left = 310
      Top = 26
      Width = 55
      Height = 13
      Caption = 'Distance:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelGStrecke: TLabel
      Left = 400
      Top = 26
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = '0 km'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 238
      Top = 274
      Width = 45
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = #216'-Speed:'
    end
    object LabelSDGeschw: TLabel
      Left = 406
      Top = 274
      Width = 34
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0 km/h'
    end
    object LabelGDGeschw: TLabel
      Left = 388
      Top = 48
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = '0 km/h'
    end
    object Label33: TLabel
      Left = 310
      Top = 48
      Width = 43
      Height = 13
      Caption = #216'-speed:'
    end
    object Label26: TLabel
      Left = 96
      Top = 6
      Width = 78
      Height = 13
      Caption = 'Found flights:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 244
      Top = 6
      Width = 32
      Height = 13
      Caption = 'From:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelFrom: TLabel
      Left = 280
      Top = 6
      Width = 3
      Height = 13
      Alignment = taCenter
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 448
      Top = 6
      Width = 20
      Height = 13
      Caption = 'To:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelTo: TLabel
      Left = 471
      Top = 6
      Width = 3
      Height = 13
      Alignment = taCenter
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Bevel8: TBevel
      Left = 0
      Top = -5
      Width = 656
      Height = 9
      Shape = bsFrame
    end
    object Label18: TLabel
      Left = 348
      Top = 160
      Width = 62
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Car tow start:'
    end
    object LabelSA: TLabel
      Left = 433
      Top = 160
      Width = 6
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0'
    end
    object LabelSG: TLabel
      Left = 433
      Top = 175
      Width = 6
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0'
    end
    object Label20: TLabel
      Left = 348
      Top = 175
      Width = 62
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Rubberband:'
    end
    object Bevel11: TBevel
      Left = 228
      Top = 321
      Width = 220
      Height = 6
      Hint = 'For detail view choose a dataset in the left panel.'
      Shape = bsTopLine
    end
    object Bevel12: TBevel
      Left = 228
      Top = 208
      Width = 220
      Height = 5
      Hint = 'For detail view choose a dataset in the left panel.'
      Shape = bsTopLine
    end
    object Bevel13: TBevel
      Left = 228
      Top = 154
      Width = 220
      Height = 8
      Hint = 'For detail view choose a dataset in the left panel.'
      Shape = bsTopLine
    end
    object LabelCalcTime: TLabel
      Left = 15
      Top = 7
      Width = 57
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'LabelCalcTime'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMedGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Bevel6: TBevel
      Left = 175
      Top = 22
      Width = 129
      Height = 106
      Shape = bsFrame
    end
    object Label5: TLabel
      Left = 185
      Top = 53
      Width = 57
      Height = 13
      Caption = 'Winch start:'
    end
    object Label6: TLabel
      Left = 185
      Top = 68
      Width = 35
      Height = 13
      Caption = 'Air tow:'
    end
    object Label7: TLabel
      Left = 185
      Top = 83
      Width = 41
      Height = 13
      Caption = 'Selfstart:'
    end
    object LabelWinde: TLabel
      Left = 287
      Top = 53
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
    end
    object LabelFSch: TLabel
      Left = 287
      Top = 68
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
    end
    object LabelEigen: TLabel
      Left = 287
      Top = 83
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
    end
    object Label10: TLabel
      Left = 185
      Top = 26
      Width = 42
      Height = 13
      Caption = 'Flights:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelFluege: TLabel
      Left = 287
      Top = 26
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LabelFluege2: TLabel
      Left = 284
      Top = 39
      Width = 12
      Height = 13
      Hint = 'Flights including flights before FluPP'
      Alignment = taRightJustify
      Caption = '(0)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 185
      Top = 98
      Width = 62
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Car tow start:'
    end
    object LabelAuto: TLabel
      Left = 287
      Top = 98
      Width = 6
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = '0'
    end
    object LabelGummi: TLabel
      Left = 287
      Top = 113
      Width = 6
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = '0'
    end
    object Label35: TLabel
      Left = 185
      Top = 113
      Width = 62
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Rubberband:'
    end
    object Label17: TLabel
      Left = 10
      Top = 53
      Width = 20
      Height = 13
      Caption = 'PIC:'
    end
    object LabelPIC: TLabel
      Left = 140
      Top = 53
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = '0:00'
    end
    object Bevel19: TBevel
      Left = 426
      Top = 22
      Width = 230
      Height = 106
      Shape = bsFrame
    end
    object Label25: TLabel
      Left = 309
      Top = 78
      Width = 70
      Height = 13
      Caption = 'Passengers:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelPassengers: TLabel
      Left = 416
      Top = 78
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label36: TLabel
      Left = 309
      Top = 100
      Width = 69
      Height = 13
      Caption = #216'-Passengers:'
    end
    object LabelAvPassengers: TLabel
      Left = 416
      Top = 100
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
    end
    object Bevel14: TBevel
      Left = 303
      Top = 72
      Width = 123
      Height = 6
      Shape = bsTopLine
    end
    object Label39: TLabel
      Left = 10
      Top = 97
      Width = 82
      Height = 13
      Caption = 'With passengers:'
    end
    object LabelPassenger: TLabel
      Left = 140
      Top = 97
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = '0:00'
    end
    object Label34: TLabel
      Left = 238
      Top = 290
      Width = 58
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Passengers:'
    end
    object Label38: TLabel
      Left = 238
      Top = 306
      Width = 69
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = #216'-Passengers:'
    end
    object LabelSDPassengers: TLabel
      Left = 434
      Top = 290
      Width = 6
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0'
    end
    object LabelSDAvPassengers: TLabel
      Left = 434
      Top = 306
      Width = 6
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      Caption = '0'
    end
    object Bevel15: TBevel
      Left = 456
      Top = 337
      Width = 193
      Height = 6
      Hint = 'For detail view choose a dataset in the left panel.'
      Shape = bsTopLine
    end
    object Label40: TLabel
      Left = 461
      Top = 135
      Width = 55
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Costs for:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label51: TLabel
      Left = 461
      Top = 239
      Width = 69
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Total Costs:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label52: TLabel
      Left = 461
      Top = 256
      Width = 36
      Height = 13
      Caption = 'Aircraft:'
    end
    object Label53: TLabel
      Left = 461
      Top = 271
      Width = 27
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Crew:'
    end
    object Label54: TLabel
      Left = 461
      Top = 286
      Width = 46
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Landings:'
    end
    object Label55: TLabel
      Left = 461
      Top = 301
      Width = 44
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Earnings:'
    end
    object Label56: TLabel
      Left = 461
      Top = 316
      Width = 36
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Overall:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object TCSum: TLabel
      Left = 560
      Top = 316
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object TCEfF: TLabel
      Left = 560
      Top = 301
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
    end
    object TCLaF: TLabel
      Left = 560
      Top = 286
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
    end
    object TCCfC: TLabel
      Left = 560
      Top = 271
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
    end
    object TCCfF: TLabel
      Left = 560
      Top = 256
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
    end
    object LabelSName2: TLabel
      Left = 524
      Top = 135
      Width = 125
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel16: TBevel
      Left = 455
      Top = 233
      Width = 193
      Height = 6
      Hint = 'For detail view choose a dataset in the left panel.'
      Shape = bsTopLine
    end
    object Label41: TLabel
      Left = 461
      Top = 212
      Width = 36
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Overall:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label42: TLabel
      Left = 461
      Top = 197
      Width = 44
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Earnings:'
    end
    object Label43: TLabel
      Left = 461
      Top = 182
      Width = 46
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Landings:'
    end
    object Label44: TLabel
      Left = 461
      Top = 167
      Width = 27
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Caption = 'Crew:'
    end
    object Label45: TLabel
      Left = 461
      Top = 152
      Width = 36
      Height = 13
      Caption = 'Aircraft:'
    end
    object SCCfF: TLabel
      Left = 559
      Top = 152
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
    end
    object SCCfC: TLabel
      Left = 559
      Top = 167
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
    end
    object SCLaF: TLabel
      Left = 559
      Top = 182
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
    end
    object SCEfF: TLabel
      Left = 559
      Top = 197
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
    end
    object SCSum: TLabel
      Left = 559
      Top = 212
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object LastStart: TLabel
      Left = 348
      Top = 191
      Width = 93
      Height = 13
      Hint = 'For detail view choose a dataset in the left panel.'
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SGDetail: TJvStringGrid
      Left = 5
      Top = 160
      Width = 213
      Height = 267
      Hint = 'Detailed selection. Choose dataset for details'
      ColCount = 18
      DefaultRowHeight = 17
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
      TabOrder = 0
      OnSelectCell = SGDetailSelectCell
      HintColor = clInfoBk
      Alignment = taLeftJustify
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = []
      OnGetCellAlignment = SGDetailGetCellAlignment
    end
    object ButtonTabGesamt: TBitBtn
      Left = 561
      Top = 394
      Width = 80
      Height = 25
      Hint = 'Table of all flights'
      Caption = 'Over-all'
      Enabled = False
      TabOrder = 1
      OnClick = ButtonJVClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
        C8807FF7777777777FF700000000000000007777777777777777333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object ButtonGraphGesamt: TBitBtn
      Left = 561
      Top = 362
      Width = 80
      Height = 25
      Hint = 'Graph of all flights'
      Caption = 'Over-all'
      Enabled = False
      TabOrder = 2
      OnClick = ButtonJVClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
        0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
        0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
        CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
        CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
        CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
        CCC77777777777777377330333333333CCC3337F33333333737F370333333333
        0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
        7777777777777777777733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object ButtonTabDetail: TBitBtn
      Left = 474
      Top = 394
      Width = 80
      Height = 25
      Hint = 'Table of selected detailed category'
      Caption = 'Detail'
      Enabled = False
      TabOrder = 3
      OnClick = ButtonJVClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
        C8807FF7777777777FF700000000000000007777777777777777333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object ButtonGraphDetail: TBitBtn
      Left = 474
      Top = 362
      Width = 80
      Height = 25
      Hint = 'graph of selected detailed category'
      Caption = 'Detail'
      Enabled = False
      TabOrder = 4
      OnClick = ButtonJVClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
        0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
        0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
        CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
        CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
        CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
        CCC77777777777777377330333333333CCC3337F33333333737F370333333333
        0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
        7777777777777777777733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object CBKatGes: TComboBox
      Left = 430
      Top = 26
      Width = 220
      Height = 21
      Hint = 'Choose category'
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      TabOrder = 5
      Text = 'Categories'
      OnChange = CBKatGesChange
      Items.Strings = (
        'Categories'
        'Time categories'
        'Contest categories')
    end
    object GridKatG: TJvStringGrid
      Left = 430
      Top = 50
      Width = 220
      Height = 72
      Color = clInfoBk
      ColCount = 3
      Ctl3D = True
      DefaultColWidth = 50
      DefaultRowHeight = 17
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GridLineWidth = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = False
      TabOrder = 6
      OnDrawCell = GridKatDrawCell
      HintColor = clInfoBk
      Alignment = taLeftJustify
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = []
    end
    object CBKatDetail: TComboBox
      Left = 228
      Top = 329
      Width = 220
      Height = 21
      Hint = 'Choose category'
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      TabOrder = 7
      Text = 'Categories'
      OnChange = CBKatDetailChange
      Items.Strings = (
        'Categories'
        'Time categories'
        'Contest categories')
    end
    object GridKatDetail: TJvStringGrid
      Left = 228
      Top = 355
      Width = 220
      Height = 72
      Align = alCustom
      Color = clInfoBk
      ColCount = 3
      Ctl3D = True
      DefaultColWidth = 50
      DefaultRowHeight = 17
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GridLineWidth = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = False
      TabOrder = 8
      OnDrawCell = GridKatDrawCell
      HintColor = clInfoBk
      Alignment = taLeftJustify
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = []
    end
    object CBDetail: TComboBox
      Left = 45
      Top = 136
      Width = 140
      Height = 21
      Hint = 'Choose category'
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = 'Aircraft type'
      OnChange = DetailChange
      Items.Strings = (
        'Aircraft type'
        'Aircraft id'
        'Pilot'
        'Passenger'
        'Start'
        'Landing')
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 586
    Width = 656
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbNone
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 546
    Width = 656
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object BitBtn1: TJvImgBtn
      Left = 336
      Top = 8
      Width = 71
      Height = 25
      Cancel = True
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
    end
    object BitBtn2: TJvImgBtn
      Left = 248
      Top = 8
      Width = 71
      Height = 25
      Caption = 'Start'
      Default = True
      TabOrder = 1
      OnClick = ButtonStatStartClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 22
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 113
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Bevel1: TBevel
      Left = 136
      Top = 1
      Width = 9
      Height = 110
      Shape = bsLeftLine
    end
    object Label23: TLabel
      Left = 142
      Top = 7
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
      Top = 7
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
    object Bevel2: TBevel
      Left = 357
      Top = 1
      Width = 9
      Height = 111
      Shape = bsRightLine
    end
    object Label16: TLabel
      Left = 371
      Top = 7
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
    object Bevel18: TBevel
      Left = 241
      Top = 32
      Width = 8
      Height = 73
      Shape = bsRightLine
    end
    object Label24: TLabel
      Left = 534
      Top = 6
      Width = 24
      Height = 13
      Caption = '= not'
    end
    object Bevel3: TBevel
      Left = 565
      Top = 1
      Width = 9
      Height = 111
      Shape = bsRightLine
    end
    object Label4: TLabel
      Left = 256
      Top = 71
      Width = 16
      Height = 13
      Caption = 'To:'
    end
    object Label3: TLabel
      Left = 251
      Top = 39
      Width = 26
      Height = 13
      Caption = 'From:'
    end
    object PanelSchein: TPanel
      Left = 280
      Top = 35
      Width = 82
      Height = 57
      BevelOuter = bvNone
      TabOrder = 7
      Visible = False
    end
    object PanelJahre: TPanel
      Left = 280
      Top = 35
      Width = 82
      Height = 57
      BevelOuter = bvNone
      TabOrder = 6
      object CBJFrom: TComboBox
        Left = 0
        Top = 0
        Width = 80
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
        Width = 80
        Height = 21
        AutoComplete = False
        ItemHeight = 13
        TabOrder = 1
        OnChange = CBJToChange
        Items.Strings = (
          'End')
      end
    end
    object PanelStarts: TPanel
      Left = 280
      Top = 35
      Width = 82
      Height = 57
      BevelOuter = bvNone
      TabOrder = 5
      Visible = False
      object CBStFrom: TEdit
        Left = 0
        Top = 0
        Width = 80
        Height = 21
        TabOrder = 0
      end
      object CBStTo: TEdit
        Left = 0
        Top = 32
        Width = 80
        Height = 21
        TabOrder = 1
      end
    end
    object RBJahre: TRadioButton
      Left = 156
      Top = 30
      Width = 51
      Height = 17
      Caption = 'Years'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = RBClick
    end
    object RBStarts: TRadioButton
      Left = 156
      Top = 50
      Width = 59
      Height = 17
      Caption = 'Starts'
      TabOrder = 2
      OnClick = RBClick
    end
    object RBSchein: TRadioButton
      Left = 156
      Top = 90
      Width = 83
      Height = 17
      Caption = 'Since licence'
      TabOrder = 4
      OnClick = RBClick
    end
    object RBDatum: TRadioButton
      Left = 156
      Top = 70
      Width = 59
      Height = 17
      Caption = 'Date'
      TabOrder = 3
      OnClick = RBClick
    end
    object LBFlu: TListBox
      Left = 6
      Top = 24
      Width = 126
      Height = 83
      Hint = 'Select flight log. Hold '#39'CTRL'#39' for multiple selection'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      MultiSelect = True
      ParentFont = False
      TabOrder = 0
      OnClick = LBFluClick
    end
    object CLBKat: TCheckListBox
      Left = 369
      Top = 26
      Width = 200
      Height = 82
      Hint = 'Filter category'
      OnClickCheck = CLBKatClickCheck
      AllowGrayed = True
      BevelInner = bvNone
      Columns = 1
      ItemHeight = 13
      Sorted = True
      TabOrder = 9
    end
    object Panel4: TPanel
      Left = 430
      Top = 4
      Width = 86
      Height = 19
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 10
      object RBKatAnd: TRadioButton
        Left = 2
        Top = 2
        Width = 41
        Height = 15
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
        Caption = 'or'
        TabOrder = 1
      end
    end
    object RGDistUnit: TRadioGroup
      Left = 576
      Top = 2
      Width = 77
      Height = 60
      Caption = 'Units'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'km'
        'nm'
        'miles')
      ParentFont = False
      TabOrder = 11
    end
    object RGDefaultTime: TRadioGroup
      Left = 576
      Top = 62
      Width = 77
      Height = 46
      Caption = 'Default Time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Block'
        'Flight')
      ParentFont = False
      TabOrder = 12
    end
    object CheckBox1: TCheckBox
      Left = 519
      Top = 5
      Width = 15
      Height = 17
      Enabled = False
      State = cbGrayed
      TabOrder = 13
    end
    object PanelDatum: TPanel
      Left = 280
      Top = 35
      Width = 82
      Height = 57
      BevelOuter = bvNone
      TabOrder = 8
      Visible = False
      object CBDateFrom: TDateTimePicker
        Left = 0
        Top = 0
        Width = 80
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        Date = 38315.000000000000000000
        Time = 38315.000000000000000000
        TabOrder = 0
        OnExit = CBDateExit
      end
      object CBDateTo: TDateTimePicker
        Left = 0
        Top = 32
        Width = 80
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        Date = 38315.000000000000000000
        Time = 38315.000000000000000000
        TabOrder = 1
        OnExit = CBDateExit
      end
    end
  end
end
