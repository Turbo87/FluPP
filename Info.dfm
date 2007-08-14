object FInfo: TFInfo
  Left = 1385
  Top = 271
  AlphaBlend = True
  AlphaBlendValue = 230
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Infos about FliPS'
  ClientHeight = 504
  ClientWidth = 442
  Color = 9868950
  TransparentColorValue = clMaroon
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelBugs: TLabel
    Left = 21
    Top = 401
    Width = 400
    Height = 16
    Cursor = crHandPoint
    Alignment = taCenter
    AutoSize = False
    Caption = 'Please report bugs here'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
    OnClick = LabelBugsClick
  end
  object LabelVersionDate: TLabel
    Left = 21
    Top = 149
    Width = 400
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = 'Date'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelLizenz: TLabel
    Left = 19
    Top = 215
    Width = 404
    Height = 34
    Alignment = taCenter
    AutoSize = False
    Caption = 
      '  FliPS is based on FluPP 1.0.9 Alpha 3 (http://flupp.sourceforg' +
      'e.net).   Both programs are Open Source and licenced under the G' +
      'NU-GPL'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object LabelHomepage: TLabel
    Left = 16
    Top = 186
    Width = 409
    Height = 16
    Cursor = crHandPoint
    Alignment = taCenter
    AutoSize = False
    Caption = 'http://flips.unpoint.de'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
    OnClick = HomepageClick
  end
  object LabelFeature: TLabel
    Left = 21
    Top = 425
    Width = 400
    Height = 16
    Cursor = crHandPoint
    Alignment = taCenter
    AutoSize = False
    Caption = 'Please report feature requests here'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
    OnClick = LabelFeatureClick
  end
  object LabelVersion: TLabel
    Left = 21
    Top = 126
    Width = 400
    Height = 24
    Alignment = taCenter
    AutoSize = False
    Caption = 'Version'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelPrgName: TLabel
    Left = 109
    Top = 16
    Width = 223
    Height = 104
    Alignment = taCenter
    Caption = 'FliPS'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -93
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 21
    Top = 101
    Width = 400
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = '(Fli)ght (P)rotocol (S)oftware'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object ButtonExit: TJvImgBtn
    Left = 175
    Top = 460
    Width = 93
    Height = 33
    Cancel = True
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    Flat = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Images = FMain.ImageList
    ImageIndex = 8
  end
  object PanelCredits: TPanel
    Left = 71
    Top = 254
    Width = 300
    Height = 137
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = 9868950
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object LabelCredits: TLabel
      Left = 12
      Top = 11
      Width = 4
      Height = 16
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = 16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object TimerCredits: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerCreditsTimer
    Left = 408
    Top = 472
  end
end
