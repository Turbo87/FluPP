object FStatistics: TFStatistics
  Left = 286
  Top = 234
  VertScrollBar.ButtonSize = 2
  VertScrollBar.Size = 5
  VertScrollBar.ThumbSize = 5
  VertScrollBar.Tracking = True
  BorderStyle = bsDialog
  Caption = 'Statistic'
  ClientHeight = 556
  ClientWidth = 924
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 537
    Width = 924
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
    Top = 497
    Width = 924
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object BitBtn1: TJvImgBtn
      Left = 440
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
  end
  object PageControlStat: TPageControl
    Left = 0
    Top = 0
    Width = 924
    Height = 497
    ActivePage = TsStart
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object TsStart: TTabSheet
      Caption = 'Start'
      ImageIndex = 3
      object BitBtn2: TJvImgBtn
        Left = 406
        Top = 224
        Width = 105
        Height = 41
        Caption = 'Start'
        Default = True
        TabOrder = 0
        OnClick = ButtonStatStartClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        Images = FMain.ImageList
        ImageIndex = 22
      end
      object PanelFoundFlights: TPanel
        Left = 323
        Top = 319
        Width = 269
        Height = 58
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label26: TLabel
          Left = 12
          Top = 6
          Width = 63
          Height = 13
          Caption = 'Found flights:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 12
          Top = 22
          Width = 22
          Height = 13
          Caption = 'First:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelFrom: TLabel
          Left = 255
          Top = 22
          Width = 3
          Height = 13
          Alignment = taRightJustify
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 12
          Top = 38
          Width = 23
          Height = 13
          Caption = 'Last:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelTo: TLabel
          Left = 255
          Top = 38
          Width = 3
          Height = 13
          Alignment = taRightJustify
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelFoundFlights: TLabel
          Left = 100
          Top = 6
          Width = 3
          Height = 13
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelCalcTime: TLabel
          Left = 172
          Top = 6
          Width = 57
          Height = 13
          AutoSize = False
          Caption = 'LabelCalcTime'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 156
          Top = 6
          Width = 11
          Height = 13
          Caption = 'in:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
      object RGDistUnit: TRadioGroup
        Left = 529
        Top = 56
        Width = 80
        Height = 69
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
        TabOrder = 2
      end
      object RGDefaultTime: TRadioGroup
        Left = 529
        Top = 128
        Width = 81
        Height = 58
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
        TabOrder = 3
      end
      object GroupBox15: TGroupBox
        Left = 81
        Top = 56
        Width = 185
        Height = 130
        Caption = 'Flight log'
        TabOrder = 4
        object LBFlu: TListBox
          Left = 7
          Top = 20
          Width = 171
          Height = 103
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
      end
      object GroupBox16: TGroupBox
        Left = 274
        Top = 56
        Width = 248
        Height = 130
        Caption = 'Filter'
        TabOrder = 5
        object Bevel18: TBevel
          Left = 105
          Top = 30
          Width = 8
          Height = 73
          Shape = bsRightLine
        end
        object Label4: TLabel
          Left = 120
          Top = 78
          Width = 16
          Height = 13
          Caption = 'To:'
        end
        object Label3: TLabel
          Left = 115
          Top = 46
          Width = 26
          Height = 13
          Caption = 'From:'
        end
        object PanelSchein: TPanel
          Left = 144
          Top = 33
          Width = 82
          Height = 57
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
        end
        object PanelJahre: TPanel
          Left = 152
          Top = 41
          Width = 82
          Height = 57
          BevelOuter = bvNone
          TabOrder = 1
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
          Left = 152
          Top = 40
          Width = 82
          Height = 57
          BevelOuter = bvNone
          TabOrder = 2
          Visible = False
          object CBStFrom: TEdit
            Left = 0
            Top = 1
            Width = 80
            Height = 21
            TabOrder = 0
          end
          object CBStTo: TEdit
            Left = 0
            Top = 33
            Width = 80
            Height = 21
            TabOrder = 1
          end
        end
        object RBJahre: TRadioButton
          Left = 20
          Top = 28
          Width = 51
          Height = 17
          Caption = 'Years'
          Checked = True
          TabOrder = 3
          TabStop = True
          OnClick = RBClick
        end
        object RBStarts: TRadioButton
          Left = 20
          Top = 48
          Width = 59
          Height = 17
          Caption = 'Starts'
          TabOrder = 4
          OnClick = RBClick
        end
        object RBSchein: TRadioButton
          Left = 20
          Top = 88
          Width = 83
          Height = 17
          Caption = 'Since licence'
          TabOrder = 5
          OnClick = RBClick
        end
        object RBDatum: TRadioButton
          Left = 20
          Top = 68
          Width = 59
          Height = 17
          Caption = 'Date'
          TabOrder = 6
          OnClick = RBClick
        end
        object PanelDatum: TPanel
          Left = 152
          Top = 41
          Width = 82
          Height = 57
          BevelOuter = bvNone
          TabOrder = 7
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
      object GroupBox17: TGroupBox
        Left = 617
        Top = 56
        Width = 217
        Height = 130
        Caption = 'Category'
        TabOrder = 6
        object Label24: TLabel
          Left = 164
          Top = 12
          Width = 24
          Height = 13
          Caption = '= not'
        end
        object CLBKat: TCheckListBox
          Left = 7
          Top = 32
          Width = 200
          Height = 91
          Hint = 'Filter category'
          OnClickCheck = CLBKatClickCheck
          AllowGrayed = True
          BevelInner = bvNone
          Columns = 1
          ItemHeight = 13
          Sorted = True
          TabOrder = 0
        end
        object Panel4: TPanel
          Left = 60
          Top = 10
          Width = 86
          Height = 19
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
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
        object CheckBox1: TCheckBox
          Left = 149
          Top = 11
          Width = 15
          Height = 17
          Enabled = False
          State = cbGrayed
          TabOrder = 2
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'General'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 58
        Top = 25
        Width = 200
        Height = 133
        Caption = 'Time'
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 34
          Width = 43
          Height = 13
          Caption = 'Solo time'
        end
        object LabelAlleine: TLabel
          Left = 105
          Top = 35
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0:00'
        end
        object Label2: TLabel
          Left = 10
          Top = 50
          Width = 59
          Height = 13
          Caption = 'With copilot:'
        end
        object LabelBegleiter: TLabel
          Left = 105
          Top = 50
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0:00'
        end
        object Label8: TLabel
          Left = 10
          Top = 102
          Width = 34
          Height = 13
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelGesamt: TLabel
          Left = 105
          Top = 102
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
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
          Top = 82
          Width = 90
          Height = 13
          Caption = 'Average flight time:'
        end
        object LabelDurchn: TLabel
          Left = 105
          Top = 82
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0:00'
        end
        object LabelGesamt2: TLabel
          Left = 105
          Top = 115
          Width = 90
          Height = 13
          Hint = 'Flight time including flights before FluPP'
          Alignment = taRightJustify
          AutoSize = False
          Caption = '(0:00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 10
          Top = 18
          Width = 20
          Height = 13
          Caption = 'PIC:'
        end
        object LabelPIC: TLabel
          Left = 105
          Top = 18
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0:00'
        end
        object Label39: TLabel
          Left = 10
          Top = 66
          Width = 82
          Height = 13
          Caption = 'With passengers:'
        end
        object LabelPassenger: TLabel
          Left = 105
          Top = 66
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0:00'
        end
      end
      object GroupBox2: TGroupBox
        Left = 58
        Top = 167
        Width = 200
        Height = 139
        Caption = 'Flights'
        TabOrder = 1
        object Label5: TLabel
          Left = 10
          Top = 18
          Width = 57
          Height = 13
          Caption = 'Winch start:'
        end
        object Label6: TLabel
          Left = 10
          Top = 34
          Width = 35
          Height = 13
          Caption = 'Air tow:'
        end
        object Label7: TLabel
          Left = 10
          Top = 50
          Width = 41
          Height = 13
          Caption = 'Selfstart:'
        end
        object LabelWinde: TLabel
          Left = 105
          Top = 18
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
        end
        object LabelFSch: TLabel
          Left = 105
          Top = 34
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
        end
        object LabelEigen: TLabel
          Left = 105
          Top = 50
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
        end
        object Label10: TLabel
          Left = 10
          Top = 107
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
          Left = 105
          Top = 107
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelFluege2: TLabel
          Left = 105
          Top = 121
          Width = 90
          Height = 13
          Hint = 'Flights including flights before FluPP'
          Alignment = taRightJustify
          AutoSize = False
          Caption = '(0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 10
          Top = 66
          Width = 62
          Height = 13
          Caption = 'Car tow start:'
        end
        object LabelAuto: TLabel
          Left = 105
          Top = 66
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
        end
        object LabelGummi: TLabel
          Left = 105
          Top = 82
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
        end
        object Label35: TLabel
          Left = 10
          Top = 82
          Width = 62
          Height = 13
          Caption = 'Rubberband:'
        end
      end
      object GroupBox3: TGroupBox
        Left = 475
        Top = 25
        Width = 250
        Height = 377
        Caption = 'Categories'
        TabOrder = 2
        object CBKatGen: TComboBox
          Left = 9
          Top = 18
          Width = 230
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
          TabOrder = 0
          Text = 'Categories'
          OnChange = CBKatGenChange
          Items.Strings = (
            'Categories'
            'Time categories'
            'Contest categories')
        end
        object GridKatG: TJvStringGrid
          Left = 9
          Top = 46
          Width = 230
          Height = 323
          BorderStyle = bsNone
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
          TabOrder = 1
          OnDrawCell = GridKatDrawCell
          HintColor = clInfoBk
          Alignment = taLeftJustify
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = []
        end
      end
      object GroupBox4: TGroupBox
        Left = 266
        Top = 25
        Width = 200
        Height = 106
        Caption = 'Costs'
        TabOrder = 3
        object Label51: TLabel
          Left = 10
          Top = 86
          Width = 34
          Height = 13
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label52: TLabel
          Left = 10
          Top = 18
          Width = 36
          Height = 13
          Caption = 'Aircraft:'
        end
        object Label53: TLabel
          Left = 10
          Top = 34
          Width = 27
          Height = 13
          Caption = 'Crew:'
        end
        object Label54: TLabel
          Left = 10
          Top = 50
          Width = 46
          Height = 13
          Caption = 'Landings:'
        end
        object Label55: TLabel
          Left = 10
          Top = 66
          Width = 44
          Height = 13
          Caption = 'Earnings:'
        end
        object TCSum: TLabel
          Left = 104
          Top = 86
          Width = 89
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TCEfF: TLabel
          Left = 103
          Top = 63
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
        end
        object TCLaF: TLabel
          Left = 103
          Top = 48
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
        end
        object TCCfC: TLabel
          Left = 103
          Top = 33
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
        end
        object TCCfF: TLabel
          Left = 103
          Top = 18
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
        end
      end
      object GroupBox5: TGroupBox
        Left = 59
        Top = 311
        Width = 200
        Height = 114
        Caption = 'Misc'
        TabOrder = 4
        object Label31: TLabel
          Left = 10
          Top = 71
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
          Left = 104
          Top = 71
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0 km'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelGDGeschw: TLabel
          Left = 104
          Top = 87
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0 km/h'
        end
        object Label33: TLabel
          Left = 10
          Top = 87
          Width = 43
          Height = 13
          Caption = #216'-speed:'
        end
        object Label25: TLabel
          Left = 10
          Top = 23
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
          Left = 104
          Top = 23
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 10
          Top = 39
          Width = 69
          Height = 13
          Caption = #216'-Passengers:'
        end
        object LabelAvPassengers: TLabel
          Left = 104
          Top = 40
          Width = 90
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
        end
      end
      object GroupBox7: TGroupBox
        Left = 267
        Top = 367
        Width = 200
        Height = 58
        Caption = 'Trend'
        TabOrder = 5
        object ButtonGraphGesamt: TBitBtn
          Left = 111
          Top = 19
          Width = 30
          Height = 30
          Hint = 'Graph of all flights'
          Enabled = False
          TabOrder = 0
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
        object ButtonTabGesamt: TBitBtn
          Left = 151
          Top = 19
          Width = 30
          Height = 30
          Hint = 'Table of all flights'
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
        object CBTrendGen: TComboBox
          Left = 14
          Top = 23
          Width = 86
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
          TabOrder = 2
          Text = 'Year'
          OnChange = CBKatDetailChange
          Items.Strings = (
            'Year'
            'Month'
            'Week')
        end
      end
      object GroupBox14: TGroupBox
        Left = 264
        Top = 136
        Width = 200
        Height = 225
        Caption = 'Top Lists'
        TabOrder = 6
        object CBTopListGen: TComboBox
          Left = 7
          Top = 18
          Width = 183
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
          TabOrder = 0
          Text = 'Flights'
          OnChange = CBKatDetailChange
          Items.Strings = (
            'Flights'
            'Flight duration'
            'Distance'
            'Contest')
        end
        object GridTopG: TJvStringGrid
          Left = 7
          Top = 46
          Width = 183
          Height = 171
          Align = alCustom
          BorderStyle = bsNone
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
          TabOrder = 1
          OnDrawCell = GridKatDrawCell
          HintColor = clInfoBk
          Alignment = taLeftJustify
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = []
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Details'
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 225
        Height = 469
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object SGDetail: TJvStringGrid
          Left = 5
          Top = 45
          Width = 215
          Height = 418
          Hint = 'Detailed selection. Choose dataset for details'
          BorderStyle = bsNone
          ColCount = 18
          DefaultRowHeight = 17
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
          ScrollBars = ssVertical
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
        object CBDetail: TComboBox
          Left = 5
          Top = 13
          Width = 215
          Height = 21
          Hint = 'Choose category'
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
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
      object Panel3: TPanel
        Left = 225
        Top = 0
        Width = 691
        Height = 469
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Bevel13: TBevel
          Left = 2
          Top = 2
          Width = 687
          Height = 31
          Align = alTop
          Shape = bsBottomLine
        end
        object Label14: TLabel
          Left = 245
          Top = 6
          Width = 101
          Height = 22
          Caption = 'Details for:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSName: TLabel
          Left = 356
          Top = 6
          Width = 6
          Height = 22
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox6: TGroupBox
          Left = 224
          Top = 368
          Width = 200
          Height = 58
          Caption = 'Trend'
          TabOrder = 0
          object ButtonTabDetail: TBitBtn
            Left = 153
            Top = 18
            Width = 30
            Height = 30
            Hint = 'Table of selected detailed category'
            Enabled = False
            TabOrder = 0
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
            Left = 113
            Top = 18
            Width = 30
            Height = 30
            Hint = 'graph of selected detailed category'
            Enabled = False
            TabOrder = 1
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
          object CBTrendDetail: TComboBox
            Left = 14
            Top = 23
            Width = 86
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
            TabOrder = 2
            Text = 'Year'
            OnChange = CBKatDetailChange
            Items.Strings = (
              'Year'
              'Month'
              'Week')
          end
        end
        object GroupBox8: TGroupBox
          Left = 16
          Top = 155
          Width = 200
          Height = 137
          Caption = 'Flights'
          TabOrder = 1
          object Label27: TLabel
            Left = 10
            Top = 56
            Width = 59
            Height = 13
            Caption = 'Winch starts'
          end
          object Label28: TLabel
            Left = 10
            Top = 71
            Width = 40
            Height = 13
            Caption = 'Air tows:'
          end
          object LabelSW: TLabel
            Left = 105
            Top = 56
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
          end
          object Label29: TLabel
            Left = 10
            Top = 86
            Width = 49
            Height = 13
            Caption = 'Self starts:'
          end
          object LabelSF: TLabel
            Left = 105
            Top = 71
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
          end
          object LabelSE: TLabel
            Left = 105
            Top = 86
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
          end
          object Label18: TLabel
            Left = 10
            Top = 101
            Width = 62
            Height = 13
            Caption = 'Car tow start:'
          end
          object LabelSA: TLabel
            Left = 105
            Top = 101
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
          end
          object LabelSG: TLabel
            Left = 105
            Top = 116
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
          end
          object Label20: TLabel
            Left = 10
            Top = 116
            Width = 62
            Height = 13
            Caption = 'Rubberband:'
          end
          object Label12: TLabel
            Left = 10
            Top = 20
            Width = 51
            Height = 13
            Caption = '% of starts:'
          end
          object LabelSGesStart: TLabel
            Left = 105
            Top = 20
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0.00 %'
          end
        end
        object GroupBox9: TGroupBox
          Left = 16
          Top = 46
          Width = 200
          Height = 105
          Caption = 'Time'
          TabOrder = 2
          object Label11: TLabel
            Left = 10
            Top = 18
            Width = 90
            Height = 13
            Caption = 'Average flight time:'
          end
          object Label13: TLabel
            Left = 10
            Top = 34
            Width = 70
            Height = 13
            Caption = '% of flight time:'
          end
          object LabelSDurchn: TLabel
            Left = 105
            Top = 18
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0:00'
          end
          object LabelSGesZeit: TLabel
            Left = 105
            Top = 34
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0.00 %'
          end
        end
        object GroupBox10: TGroupBox
          Left = 224
          Top = 46
          Width = 200
          Height = 105
          Caption = 'Costs'
          TabOrder = 3
          object Label42: TLabel
            Left = 10
            Top = 66
            Width = 44
            Height = 13
            Caption = 'Earnings:'
          end
          object Label43: TLabel
            Left = 10
            Top = 50
            Width = 46
            Height = 13
            Caption = 'Landings:'
          end
          object Label44: TLabel
            Left = 10
            Top = 34
            Width = 27
            Height = 13
            Caption = 'Crew:'
          end
          object Label45: TLabel
            Left = 10
            Top = 18
            Width = 36
            Height = 13
            Caption = 'Aircraft:'
          end
          object SCCfF: TLabel
            Left = 105
            Top = 18
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
          end
          object SCCfC: TLabel
            Left = 105
            Top = 34
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
          end
          object SCLaF: TLabel
            Left = 105
            Top = 50
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
          end
          object SCEfF: TLabel
            Left = 105
            Top = 66
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
          end
          object SCSum: TLabel
            Left = 105
            Top = 86
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label40: TLabel
            Left = 10
            Top = 86
            Width = 69
            Height = 13
            Caption = 'Total Costs:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object GroupBox11: TGroupBox
          Left = 16
          Top = 297
          Width = 200
          Height = 129
          Caption = 'Misc'
          TabOrder = 4
          object Label30: TLabel
            Left = 10
            Top = 26
            Width = 45
            Height = 13
            Caption = 'Distance:'
          end
          object LabelSStrecke: TLabel
            Left = 105
            Top = 26
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0 km'
          end
          object Label32: TLabel
            Left = 10
            Top = 42
            Width = 45
            Height = 13
            Caption = #216'-Speed:'
          end
          object LabelSDGeschw: TLabel
            Left = 105
            Top = 42
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0 km/h'
          end
          object Label34: TLabel
            Left = 10
            Top = 58
            Width = 58
            Height = 13
            Caption = 'Passengers:'
          end
          object Label38: TLabel
            Left = 10
            Top = 74
            Width = 69
            Height = 13
            Caption = #216'-Passengers:'
          end
          object LabelSDPassengers: TLabel
            Left = 105
            Top = 58
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
          end
          object LabelSDAvPassengers: TLabel
            Left = 105
            Top = 74
            Width = 90
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0'
          end
          object LastStart: TLabel
            Left = 52
            Top = 100
            Width = 93
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Last Start'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object GroupBox12: TGroupBox
          Left = 432
          Top = 46
          Width = 250
          Height = 380
          Caption = 'Categories'
          TabOrder = 5
          object CBKatDetail: TComboBox
            Left = 9
            Top = 18
            Width = 230
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
            TabOrder = 0
            Text = 'Categories'
            OnChange = CBKatDetailChange
            Items.Strings = (
              'Categories'
              'Time categories'
              'Contest categories')
          end
          object GridKatDetail: TJvStringGrid
            Left = 9
            Top = 46
            Width = 230
            Height = 320
            Align = alCustom
            BorderStyle = bsNone
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
            TabOrder = 1
            OnDrawCell = GridKatDrawCell
            HintColor = clInfoBk
            Alignment = taLeftJustify
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = []
          end
        end
        object GroupBox13: TGroupBox
          Left = 224
          Top = 160
          Width = 200
          Height = 201
          Caption = 'Top Lists'
          TabOrder = 6
          object CBTopListDetail: TComboBox
            Left = 7
            Top = 18
            Width = 183
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
            TabOrder = 0
            Text = 'Flights'
            OnChange = CBKatDetailChange
            Items.Strings = (
              'Flights'
              'Flight duration'
              'Distance'
              'Contest')
          end
          object GridTopDetail: TJvStringGrid
            Left = 7
            Top = 46
            Width = 183
            Height = 147
            Align = alCustom
            BorderStyle = bsNone
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
            TabOrder = 1
            OnDrawCell = GridKatDrawCell
            HintColor = clInfoBk
            Alignment = taLeftJustify
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = []
          end
        end
      end
    end
  end
end
