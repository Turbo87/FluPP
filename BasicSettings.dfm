object FBasicSettings: TFBasicSettings
  Left = 449
  Top = 308
  BorderStyle = bsDialog
  Caption = 'Basic settings'
  ClientHeight = 367
  ClientWidth = 441
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
  object Panel1: TPanel
    Left = 0
    Top = 308
    Width = 441
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object ButtonOK: TJvImgBtn
      Left = 152
      Top = 9
      Width = 78
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
    object ButtonBeenden: TJvImgBtn
      Left = 243
      Top = 9
      Width = 83
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 348
    Width = 441
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbNone
        Width = 50
      end>
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 441
    Height = 308
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'General'
      object Label1: TLabel
        Left = 64
        Top = 62
        Width = 3
        Height = 13
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Bevel2: TBevel
        Left = 64
        Top = 115
        Width = 300
        Height = 6
        Shape = bsTopLine
      end
      object CBAutoLoad: TCheckBox
        Left = 16
        Top = 13
        Width = 297
        Height = 17
        Caption = 'Load flightlog at startup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Button1: TButton
        Left = 112
        Top = 39
        Width = 73
        Height = 22
        Caption = 'Browse [...]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 24
        Top = 40
        Width = 73
        Height = 22
        Caption = 'Current'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button2Click
      end
      object Panel2: TPanel
        Left = 16
        Top = 74
        Width = 385
        Height = 22
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object LabelAutoload: TLabel
          Left = 5
          Top = 5
          Width = 372
          Height = 13
          AutoSize = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 128
        Width = 123
        Height = 84
        Caption = 'Shortcut'
        TabOrder = 4
        object BitBtn1: TJvImgBtn
          Left = 21
          Top = 24
          Width = 86
          Height = 25
          Caption = 'Add'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = ButtonAddRegClick
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 18
        end
        object BitBtn2: TJvImgBtn
          Left = 21
          Top = 48
          Width = 86
          Height = 25
          Caption = 'Remove'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = ButtonRemRegClick
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 19
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Languages'
      ImageIndex = 2
      object Label3: TLabel
        Left = 18
        Top = 16
        Width = 68
        Height = 16
        Caption = 'Languages'
      end
      object LabelTranslator: TLabel
        Left = 112
        Top = 42
        Width = 95
        Height = 16
        Caption = 'LabelTranslator'
      end
      object LabelTransDate: TLabel
        Left = 112
        Top = 58
        Width = 133
        Height = 16
        Caption = 'LabelTranslation Date'
      end
      object Label5: TLabel
        Left = 114
        Top = 16
        Width = 61
        Height = 16
        Caption = 'Translator'
      end
      object LBLanguages: TListBox
        Left = 18
        Top = 40
        Width = 79
        Height = 209
        ItemHeight = 16
        TabOrder = 0
        OnClick = LBLanguagesClick
      end
    end
  end
end
