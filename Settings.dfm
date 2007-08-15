object FSettings: TFSettings
  Left = 495
  Top = 266
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Settings'
  ClientHeight = 445
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 426
    Width = 512
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
    Top = 386
    Width = 512
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      512
      40)
    object ButtonNext: TJvImgBtn
      Left = 346
      Top = 9
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Next'
      Default = True
      TabOrder = 2
      OnClick = ButtonNextClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 24
    end
    object ButtonOK: TJvImgBtn
      Left = 174
      Top = 9
      Width = 80
      Height = 25
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = ButtonOKClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 22
      Kind = bkOK
    end
    object ButtonExit: TJvImgBtn
      Left = 258
      Top = 9
      Width = 80
      Height = 25
      Cancel = True
      Caption = 'Abort'
      ModalResult = 2
      TabOrder = 1
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 23
      Kind = bkCancel
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 512
    Height = 345
    ActivePage = TabSheetGeneral
    Align = alTop
    HotTrack = True
    MultiLine = True
    TabOrder = 1
    object TabSheetGeneral: TTabSheet
      Caption = 'General'
      ImageIndex = 3
      OnHide = TabSheetGeneralHide
      OnShow = TabSheetGeneralShow
      object GroupBox17: TGroupBox
        Left = 43
        Top = 70
        Width = 417
        Height = 177
        TabOrder = 0
        object GroupBox4: TGroupBox
          Left = 13
          Top = 16
          Width = 190
          Height = 144
          Caption = 'Personal data'
          TabOrder = 0
          object Label3: TLabel
            Left = 21
            Top = 62
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Name:'
          end
          object Label4: TLabel
            Left = 17
            Top = 89
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Adress:'
          end
          object Label5: TLabel
            Left = 32
            Top = 116
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'City:'
          end
          object Label7: TLabel
            Left = 29
            Top = 21
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pilot:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label19: TLabel
            Left = 64
            Top = 43
            Width = 103
            Height = 13
            Alignment = taCenter
            Caption = '(Default entry for pilot)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object GEName: TEdit
            Left = 57
            Top = 61
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object GERoad: TEdit
            Left = 57
            Top = 87
            Width = 121
            Height = 21
            TabOrder = 2
          end
          object GELocation: TEdit
            Left = 57
            Top = 114
            Width = 121
            Height = 21
            TabOrder = 3
          end
          object GEPilotName: TEdit
            Left = 57
            Top = 19
            Width = 121
            Height = 21
            Hint = 'Enter pilot name'
            TabOrder = 0
          end
        end
        object GroupBox7: TGroupBox
          Left = 213
          Top = 16
          Width = 190
          Height = 69
          Caption = 'Warning'
          TabOrder = 1
          object Label21: TLabel
            Left = 7
            Top = 13
            Width = 128
            Height = 51
            AutoSize = False
            Caption = 'months warning before licence or medical extension:'
            WordWrap = True
          end
          object GEWarningMonth: TMaskEdit
            Left = 144
            Top = 21
            Width = 32
            Height = 21
            EditMask = '!0;1; '
            MaxLength = 1
            TabOrder = 0
            Text = '-'
          end
        end
        object GroupBox11: TGroupBox
          Left = 213
          Top = 108
          Width = 190
          Height = 52
          Caption = 'General'
          TabOrder = 2
          object CBExportICal: TCheckBox
            Left = 8
            Top = 15
            Width = 129
            Height = 17
            Caption = 'Export iCalendar'
            TabOrder = 0
          end
        end
      end
    end
    object TabSheetFlightLog: TTabSheet
      Caption = 'Flight Log'
      ImageIndex = 5
      object GroupBox12: TGroupBox
        Left = 43
        Top = 42
        Width = 418
        Height = 233
        TabOrder = 0
        object RGNumeration: TRadioGroup
          Left = 273
          Top = 15
          Width = 128
          Height = 55
          Caption = 'Numbering'
          ItemIndex = 0
          Items.Strings = (
            'Continuous'
            'Start number')
          TabOrder = 2
          OnExit = GEExit
        end
        object GroupBox1: TGroupBox
          Left = 137
          Top = 16
          Width = 127
          Height = 55
          Caption = 'General'
          TabOrder = 1
          OnExit = GEExit
          object Label31: TLabel
            Left = 8
            Top = 15
            Width = 42
            Height = 13
            Caption = 'ID prefix:'
          end
          object GEKPrae: TEdit
            Left = 8
            Top = 28
            Width = 113
            Height = 21
            Hint = 'Part of aircraft id always staying identical'
            TabOrder = 0
            OnExit = GEExit
          end
        end
        object RGDistUnit: TRadioGroup
          Left = 17
          Top = 80
          Width = 108
          Height = 70
          Caption = 'Unit'
          ItemIndex = 0
          Items.Strings = (
            'km'
            'nm'
            'miles')
          TabOrder = 3
          OnExit = GEExit
        end
        object GroupBox6: TGroupBox
          Left = 137
          Top = 80
          Width = 264
          Height = 70
          Caption = 'Input'
          TabOrder = 4
          OnExit = GEExit
          object Bevel6: TBevel
            Left = 96
            Top = 39
            Width = 11
            Height = 9
            Shape = bsTopLine
          end
          object Bevel7: TBevel
            Left = 96
            Top = 56
            Width = 11
            Height = 9
            Shape = bsTopLine
          end
          object CBStartType: TCheckBox
            Left = 8
            Top = 15
            Width = 129
            Height = 17
            Caption = 'Type of start'
            TabOrder = 0
          end
          object CBBlockTime: TCheckBox
            Left = 8
            Top = 32
            Width = 85
            Height = 17
            Caption = 'Block time'
            TabOrder = 1
            OnClick = CBTimeClick
          end
          object CBFlightTime: TCheckBox
            Left = 8
            Top = 49
            Width = 85
            Height = 17
            Caption = 'Flight time'
            TabOrder = 2
            OnClick = CBTimeClick
          end
          object GroupBox8: TGroupBox
            Left = 105
            Top = 24
            Width = 77
            Height = 43
            TabOrder = 3
            object LabelDefTime: TLabel
              Left = 18
              Top = 16
              Width = 34
              Height = 13
              Caption = 'Default'
            end
            object RBDefTimeBlock: TRadioButton
              Left = 2
              Top = 8
              Width = 15
              Height = 17
              TabOrder = 0
            end
            object RBDefTimeFlight: TRadioButton
              Left = 2
              Top = 24
              Width = 15
              Height = 17
              Checked = True
              TabOrder = 1
              TabStop = True
            end
          end
        end
        object RGDefPosition: TRadioGroup
          Left = 17
          Top = 16
          Width = 108
          Height = 55
          Caption = 'Default position'
          ItemIndex = 0
          Items.Strings = (
            'Pilot'
            'Copilot')
          TabOrder = 0
          OnExit = GEExit
        end
        object GroupBox16: TGroupBox
          Left = 17
          Top = 160
          Width = 384
          Height = 55
          Caption = 'JAR-FCL (History)'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 5
          OnExit = GEExit
          object DisallowChange: TCheckBox
            Left = 8
            Top = 15
            Width = 233
            Height = 17
            Caption = 'Disallow change / deletion (strikeout)'
            TabOrder = 0
            OnClick = DisallowChangeClick
          end
          object AllowLastEdit: TCheckBox
            Left = 26
            Top = 31
            Width = 215
            Height = 17
            Caption = 'except changing of last visible row'
            TabOrder = 1
          end
        end
      end
    end
    object TabSheetLicenses: TTabSheet
      Caption = 'Licences'
      ImageIndex = 2
      object LabelGetAirports: TLabel
        Left = 59
        Top = 302
        Width = 385
        Height = 13
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Caption = 'Get more licenses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = LabelGetAirportsClick
      end
      object GroupBox2: TGroupBox
        Left = 203
        Top = 0
        Width = 177
        Height = 75
        Caption = 'Flight data before FliPS'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
        object Label8: TLabel
          Left = 9
          Top = 23
          Width = 46
          Height = 13
          Caption = 'Landings:'
        end
        object Label9: TLabel
          Left = 11
          Top = 50
          Width = 54
          Height = 13
          Caption = 'Flight Time:'
        end
        object GEStarts: TEdit
          Left = 95
          Top = 20
          Width = 60
          Height = 21
          TabOrder = 0
          Text = '0'
          OnExit = GEExit
        end
        object GEStunden: TMaskEdit
          Left = 95
          Top = 47
          Width = 60
          Height = 21
          BiDiMode = bdLeftToRight
          EditMask = '00000:00;1;_'
          MaxLength = 8
          ParentBiDiMode = False
          TabOrder = 1
          Text = '00000:00'
          OnExit = GEExit
        end
      end
      object GroupBox9: TGroupBox
        Left = 5
        Top = 80
        Width = 498
        Height = 217
        Caption = 'Licences'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
        object PageControlLicenses: TPageControl
          Left = 168
          Top = 21
          Width = 323
          Height = 180
          ActivePage = TSLInfo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MultiLine = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          object TSLInfo: TTabSheet
            Caption = 'Info'
            ImageIndex = 5
            object MemoLicInfo: TMemo
              Left = 20
              Top = 8
              Width = 270
              Height = 100
              ReadOnly = True
              TabOrder = 0
            end
          end
          object TSLDate: TTabSheet
            Caption = 'Date'
            object Label12: TLabel
              Left = 18
              Top = 112
              Width = 273
              Height = 26
              AutoSize = False
              Caption = 'Here you can enter dates'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object VLEDate: TValueListEditor
              Left = 20
              Top = 8
              Width = 270
              Height = 100
              DefaultColWidth = 130
              TabOrder = 0
              TitleCaptions.Strings = (
                'Name'
                'Date (Valid to)')
              OnExit = VLEExit
              OnGetEditMask = VLEGetDateEditMask
              ColWidths = (
                130
                134)
            end
          end
          object TSLCat: TTabSheet
            Caption = 'Categories'
            ImageIndex = 1
            object Label2: TLabel
              Left = 18
              Top = 112
              Width = 273
              Height = 26
              AutoSize = False
              Caption = 'Here you can assign categories.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object VLECat: TValueListEditor
              Left = 20
              Top = 8
              Width = 270
              Height = 100
              DefaultColWidth = 130
              TabOrder = 0
              TitleCaptions.Strings = (
                'Name'
                'Category')
              OnExit = VLEExit
              ColWidths = (
                130
                134)
            end
          end
          object TSLTimeCat: TTabSheet
            Caption = 'Time Cat'
            ImageIndex = 4
            object Label13: TLabel
              Left = 18
              Top = 112
              Width = 273
              Height = 26
              AutoSize = False
              Caption = 'Here you can assign time categories.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object VLETimeCat: TValueListEditor
              Left = 20
              Top = 8
              Width = 270
              Height = 100
              DefaultColWidth = 130
              TabOrder = 0
              TitleCaptions.Strings = (
                'Name'
                'Category')
              OnExit = VLEExit
              ColWidths = (
                130
                134)
            end
          end
          object TSLAccLic: TTabSheet
            Caption = 'Flight logs'
            ImageIndex = 2
            object Label11: TLabel
              Left = 18
              Top = 112
              Width = 273
              Height = 26
              AutoSize = False
              Caption = 
                'If flights from other flight logs are accepted, then they can be' +
                ' selected here.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object VLEAccLic: TValueListEditor
              Left = 20
              Top = 8
              Width = 270
              Height = 100
              DefaultColWidth = 130
              TabOrder = 0
              TitleCaptions.Strings = (
                'Name'
                'Flight log')
              OnExit = VLEExit
              ColWidths = (
                130
                134)
            end
          end
          object TSLOptCon: TTabSheet
            Caption = 'Ratings'
            ImageIndex = 3
            object Label18: TLabel
              Left = 18
              Top = 112
              Width = 273
              Height = 26
              AutoSize = False
              Caption = 'Here you can select additional ratings.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object CLBOptCond: TCheckListBox
              Left = 20
              Top = 8
              Width = 270
              Height = 100
              ItemHeight = 13
              TabOrder = 0
              OnExit = CLBOptCondExit
            end
          end
        end
        object VSTLicFiles: TVirtualStringTree
          Left = 13
          Top = 21
          Width = 148
          Height = 180
          CheckImageKind = ckSystem
          DefaultNodeHeight = 16
          Header.AutoSizeIndex = -1
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Header.Height = 20
          Header.MainColumn = -1
          Header.Options = [hoColumnResize, hoDrag]
          Header.Style = hsPlates
          Indent = 10
          Margin = 0
          TabOrder = 1
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
          TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedImages]
          TreeOptions.SelectionOptions = [toDisableDrawSelection]
          OnChecked = VSTLicFilesChecked
          OnGetText = VSTLicFilesGetText
          Columns = <>
        end
      end
      object GroupBox3: TGroupBox
        Left = 5
        Top = 0
        Width = 185
        Height = 75
        Caption = 'General'
        TabOrder = 0
        object Label6: TLabel
          Left = 10
          Top = 24
          Width = 85
          Height = 13
          Caption = 'Licence received:'
        end
        object GEScheinSeit: TMaskEdit
          Left = 115
          Top = 21
          Width = 60
          Height = 21
          Hint = 'Date since obtaining your licence'
          EditMask = '!90/90/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  .  .    '
          OnExit = GEExit
        end
      end
    end
    object TabSheetMedicals: TTabSheet
      Caption = 'Medicals'
      ImageIndex = 6
      object GroupBox10: TGroupBox
        Left = 8
        Top = 8
        Width = 489
        Height = 305
        Caption = 'Medicals'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Label20: TLabel
          Left = 7
          Top = 264
          Width = 474
          Height = 32
          Alignment = taCenter
          AutoSize = False
          Caption = 'Medicals are loaded by selecting a license on the license tab.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Bevel9: TBevel
          Left = 8
          Top = 248
          Width = 473
          Height = 9
          Shape = bsTopLine
        end
        object CLBMedicals: TCheckListBox
          Left = 8
          Top = 19
          Width = 125
          Height = 214
          OnClickCheck = CLBMedicalsClickCheck
          ItemHeight = 13
          TabOrder = 0
        end
        object VLEMedicals: TValueListEditor
          Left = 145
          Top = 19
          Width = 336
          Height = 214
          DefaultColWidth = 120
          TabOrder = 1
          TitleCaptions.Strings = (
            'Medical'
            'Date (Valid to)')
          OnExit = VLEMedicalsExit
          OnGetEditMask = VLEGetDateEditMask
          ColWidths = (
            151
            179)
        end
      end
    end
    object TabSheetAutoComplete: TTabSheet
      Caption = 'AutoComplete'
      object GroupBox5: TGroupBox
        Left = 8
        Top = 8
        Width = 489
        Height = 305
        Caption = 'AutoComplete'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object LabelAC: TLabel
          Left = 224
          Top = 199
          Width = 3
          Height = 13
          Caption = '-'
        end
        object Label16: TLabel
          Left = 7
          Top = 264
          Width = 474
          Height = 32
          Alignment = taCenter
          AutoSize = False
          Caption = 'AutoComplete helps you by completing a parts of known words'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Bevel8: TBevel
          Left = 8
          Top = 248
          Width = 473
          Height = 9
          Shape = bsTopLine
        end
        object Bevel5: TBevel
          Left = 8
          Top = 192
          Width = 473
          Height = 9
          Shape = bsTopLine
        end
        object ButtonAdd: TJvImgBtn
          Left = 436
          Top = 218
          Width = 21
          Height = 21
          Hint = 'add'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = ButtonAddClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 18
        end
        object ButtonRem: TJvImgBtn
          Left = 460
          Top = 218
          Width = 21
          Height = 21
          Hint = 'remove'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = ButtonRemClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 19
        end
        object PanelFlugz: TPanel
          Left = 5
          Top = 196
          Width = 204
          Height = 49
          BevelOuter = bvNone
          TabOrder = 2
          object LabelTyp: TLabel
            Left = 3
            Top = 2
            Width = 59
            Height = 13
            Caption = 'Aircraft type:'
          end
          object EditTyp: TEdit
            Left = 3
            Top = 22
            Width = 193
            Height = 21
            TabOrder = 0
          end
        end
        object LBKatDetail: TListBox
          Left = 8
          Top = 19
          Width = 345
          Height = 158
          Columns = 2
          ItemHeight = 13
          TabOrder = 0
          OnClick = LBKatDetailClick
        end
        object EditAC: TEdit
          Left = 224
          Top = 218
          Width = 193
          Height = 21
          TabOrder = 3
        end
        object LBKatAC: TListBox
          Left = 364
          Top = 19
          Width = 117
          Height = 158
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 16
          Items.Strings = (
            'Aircraft'
            'Passenger'
            'Airport')
          ParentFont = False
          TabOrder = 1
          OnClick = LBKatACClick
        end
      end
    end
    object TabSheetCat: TTabSheet
      Caption = 'Categories'
      ImageIndex = 3
      object PageControl1: TPageControl
        Left = 9
        Top = 10
        Width = 488
        Height = 303
        ActivePage = TabSheet1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Categories'
          object Bevel3: TBevel
            Left = 5
            Top = 7
            Width = 468
            Height = 266
            Shape = bsFrame
          end
          object Label14: TLabel
            Left = 10
            Top = 236
            Width = 455
            Height = 32
            Alignment = taCenter
            AutoSize = False
            Caption = 
              'Here you can add categories (e.g. air tow, instruction, student ' +
              'time)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object ButtonKatAdd: TJvImgBtn
            Left = 434
            Top = 88
            Width = 25
            Height = 25
            Hint = 'Add category'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = ButtonKatAddClick
            Flat = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
            Images = FMain.ImageList
            ImageIndex = 18
          end
          object ButtonKatRem: TJvImgBtn
            Left = 434
            Top = 119
            Width = 25
            Height = 25
            Hint = 'Remove category'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = ButtonKatRemClick
            Flat = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
            Images = FMain.ImageList
            ImageIndex = 19
          end
          object CLBKat: TListBox
            Left = 11
            Top = 11
            Width = 414
            Height = 214
            Columns = 2
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Time categories'
          ImageIndex = 1
          object Bevel2: TBevel
            Left = 5
            Top = 7
            Width = 468
            Height = 266
            Shape = bsFrame
          end
          object Label15: TLabel
            Left = 83
            Top = 236
            Width = 315
            Height = 32
            Alignment = taCenter
            AutoSize = False
            Caption = 
              'Here you can add time categories (e.g. engine time, IFR, Night).' +
              ' Times can be assigned to these categories in the data entry fie' +
              'ld.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object ButtonCTiAdd: TJvImgBtn
            Left = 434
            Top = 88
            Width = 25
            Height = 25
            Hint = 'Add category'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = ButtonCTiAddClick
            Flat = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
            Images = FMain.ImageList
            ImageIndex = 18
          end
          object ButtonCTiRem: TJvImgBtn
            Left = 434
            Top = 119
            Width = 25
            Height = 25
            Hint = 'Remove category'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = ButtonCTiRemClick
            Flat = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
            Images = FMain.ImageList
            ImageIndex = 19
          end
          object LBCTi: TListBox
            Left = 11
            Top = 11
            Width = 414
            Height = 214
            Columns = 2
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Competition categories'
          ImageIndex = 2
          object Bevel1: TBevel
            Left = 5
            Top = 7
            Width = 468
            Height = 266
            Shape = bsFrame
          end
          object Label17: TLabel
            Left = 82
            Top = 236
            Width = 315
            Height = 32
            Alignment = taCenter
            AutoSize = False
            Caption = 'Here you can add contest categories (e.g. OLC)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object ButtonContestAdd: TJvImgBtn
            Left = 434
            Top = 88
            Width = 25
            Height = 25
            Hint = 'Add category'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = ButtonContestAddClick
            Flat = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
            Images = FMain.ImageList
            ImageIndex = 18
          end
          object ButtonContestRem: TJvImgBtn
            Left = 434
            Top = 119
            Width = 25
            Height = 25
            Hint = 'Remove category'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = ButtonContestRemClick
            Flat = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
            Images = FMain.ImageList
            ImageIndex = 19
          end
          object LBContest: TListBox
            Left = 11
            Top = 11
            Width = 414
            Height = 214
            Columns = 2
            ItemHeight = 13
            TabOrder = 0
          end
        end
      end
    end
    object TabSheetCosts: TTabSheet
      Caption = 'Aircraft / Costs'
      ImageIndex = 6
      object GroupBox14: TGroupBox
        Left = 8
        Top = 8
        Width = 489
        Height = 305
        Caption = 'Aircraft'
        TabOrder = 0
        object AircraftList: TListBox
          Left = 8
          Top = 19
          Width = 121
          Height = 278
          Columns = 2
          ItemHeight = 13
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnClick = AircraftListClick
        end
        object GroupBox13: TGroupBox
          Left = 144
          Top = 14
          Width = 281
          Height = 131
          Caption = 'Costs'
          TabOrder = 1
          object Bevel4: TBevel
            Left = 8
            Top = 40
            Width = 265
            Height = 9
            Shape = bsTopLine
          end
          object CurLabel2: TLabel
            Left = 264
            Top = 76
            Width = 3
            Height = 13
            Caption = '-'
          end
          object CurLabel1: TLabel
            Left = 264
            Top = 52
            Width = 3
            Height = 13
            Caption = '-'
          end
          object Label24: TLabel
            Left = 8
            Top = 52
            Width = 44
            Height = 13
            Caption = 'per Hour:'
          end
          object Label25: TLabel
            Left = 8
            Top = 76
            Width = 46
            Height = 13
            Caption = 'per Flight:'
          end
          object Label10: TLabel
            Left = 8
            Top = 102
            Width = 45
            Height = 13
            Caption = 'Currency:'
          end
          object Label1: TLabel
            Left = 8
            Top = 17
            Width = 69
            Height = 13
            Caption = 'Calculation by:'
          end
          object CalcByBT: TRadioButton
            Left = 88
            Top = 16
            Width = 89
            Height = 17
            Caption = 'Block time'
            TabOrder = 0
            TabStop = True
            OnExit = AcCostsCalcByExit
          end
          object CalcByFT: TRadioButton
            Left = 184
            Top = 16
            Width = 89
            Height = 17
            Caption = 'Flight time'
            TabOrder = 1
            OnExit = AcCostsCalcByExit
          end
          object CpF: TJvValidateEdit
            Left = 72
            Top = 72
            Width = 185
            Height = 21
            DisplayFormat = dfFloat
            DecimalPlaces = 2
            TabOrder = 3
            OnExit = AcCostsEditExit
          end
          object CpH: TJvValidateEdit
            Left = 72
            Top = 48
            Width = 185
            Height = 21
            DisplayFormat = dfFloat
            DecimalPlaces = 2
            TabOrder = 2
            OnExit = AcCostsEditExit
          end
          object GECurrency: TJvEdit
            Left = 72
            Top = 98
            Width = 201
            Height = 21
            Alignment = taRightJustify
            Modified = False
            MaxLength = 2
            TabOrder = 4
            Text = 'GECurrency'
            OnChange = GECurrencyChange
          end
        end
        object GroupBox15: TGroupBox
          Left = 144
          Top = 160
          Width = 281
          Height = 137
          Caption = 'Spezification (for personal information only)'
          TabOrder = 2
          object Label22: TLabel
            Left = 8
            Top = 20
            Width = 45
            Height = 13
            Caption = 'Category:'
          end
          object Label23: TLabel
            Left = 8
            Top = 44
            Width = 28
            Height = 13
            Caption = 'Class:'
          end
          object Label26: TLabel
            Left = 8
            Top = 68
            Width = 36
            Height = 13
            Caption = 'Engine:'
          end
          object Label27: TLabel
            Left = 8
            Top = 92
            Width = 37
            Height = 13
            Caption = 'Weight:'
          end
          object Label28: TLabel
            Left = 8
            Top = 116
            Width = 34
            Height = 13
            Caption = 'Usage:'
          end
          object Cat: TComboBox
            Left = 72
            Top = 16
            Width = 201
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 0
            Text = 'aircraft (land)'
            OnExit = AcCostsComboExit
            Items.Strings = (
              'aircraft (land)'
              'aircraft (water)'
              'helicopter (land)'
              'helicopter (water)'
              'glider'
              'power glider'
              'microlight'
              'simulator')
          end
          object Cls: TComboBox
            Left = 72
            Top = 40
            Width = 201
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 1
            Text = '<not available>'
            OnExit = AcCostsComboExit
            Items.Strings = (
              '<not available>'
              'single engine'
              'multi engine')
          end
          object Eng: TComboBox
            Left = 72
            Top = 64
            Width = 201
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 2
            Text = '<not available>'
            OnExit = AcCostsComboExit
            Items.Strings = (
              '<not available>'
              'piston'
              'turbine'
              'turboprop')
          end
          object Wgt: TComboBox
            Left = 72
            Top = 88
            Width = 201
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 3
            Text = '< 2 t'
            OnExit = AcCostsComboExit
            Items.Strings = (
              '< 2 t'
              '2 bis 5,7 t'
              '5,7 bis 14,5 t'
              '14,5 bis 20 t'
              '> 20 t')
          end
          object Use: TComboBox
            Left = 72
            Top = 112
            Width = 201
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 4
            Text = 'private'
            OnExit = AcCostsComboExit
            Items.Strings = (
              'private'
              'simulation'
              'military usage'
              'Airline (JAR 25)')
          end
        end
      end
    end
  end
  object PanelFligtLogs: TPanel
    Left = 0
    Top = 346
    Width = 512
    Height = 40
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    DesignSize = (
      512
      40)
    object LBFlu: TListBox
      Left = 8
      Top = 6
      Width = 496
      Height = 27
      Hint = 'Select flight log'
      Style = lbOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Columns = 2
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 31
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnClick = LBFluClick
      OnDrawItem = LBFluDrawItem
    end
  end
  object JvSimpleXML: TJvSimpleXML
    IndentString = '  '
    Left = 424
    Top = 568
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 4
    Top = 392
    object CleanXMLdata1: TMenuItem
      Caption = '&Clean XML data'
      OnClick = CleanXMLdata1Click
    end
  end
end
