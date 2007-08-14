object FAirports: TFAirports
  Left = 664
  Top = 327
  BorderStyle = bsDialog
  Caption = 'Airports'
  ClientHeight = 527
  ClientWidth = 353
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
  object ButtonFlp: TSpeedButton
    Left = 177
    Top = 2
    Width = 170
    Height = 33
    GroupIndex = 1
    Caption = 'Airport database'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    OnClick = ButtonFlpClick
  end
  object ButtonOwnFlp: TSpeedButton
    Left = 7
    Top = 2
    Width = 170
    Height = 33
    GroupIndex = 1
    Caption = 'Custom airports'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    OnClick = ButtonOwnFlpClick
  end
  object Bevel1: TBevel
    Left = 4
    Top = 417
    Width = 343
    Height = 7
    Shape = bsTopLine
  end
  object LabelGetAirports: TLabel
    Left = 8
    Top = 392
    Width = 337
    Height = 13
    Cursor = crHandPoint
    Alignment = taCenter
    AutoSize = False
    Caption = 'Get more airports or report missing or wrong airports'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = LabelGetAirportsClick
  end
  object Label4: TLabel
    Left = 4
    Top = 428
    Width = 84
    Height = 13
    Caption = 'Search for airport:'
  end
  object GridFlp: TJvStringGrid
    Left = 4
    Top = 41
    Width = 343
    Height = 342
    ColCount = 4
    Ctl3D = False
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
    ParentCtl3D = False
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
    OnDrawCell = GridFlpDrawCell
    HintColor = clInfoBk
    Alignment = taLeftJustify
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = []
    ColWidths = (
      64
      64
      64
      147)
  end
  object PanelOwnFlp: TPanel
    Left = 8
    Top = 324
    Width = 337
    Height = 86
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 14
      Top = 1
      Width = 59
      Height = 13
      Caption = 'Airport name'
    end
    object Label3: TLabel
      Left = 14
      Top = 41
      Width = 53
      Height = 13
      Caption = 'ICAO Code'
    end
    object Label1: TLabel
      Left = 172
      Top = 1
      Width = 40
      Height = 13
      Caption = 'Position:'
    end
    object ButtonChange: TJvImgBtn
      Left = 297
      Top = 61
      Width = 25
      Height = 25
      Hint = 'edit'
      TabOrder = 0
      OnClick = ButtonChangeClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 14
    end
    object ButtonDelete: TJvImgBtn
      Left = 297
      Top = 35
      Width = 25
      Height = 25
      Hint = 'remove'
      TabOrder = 1
      OnClick = ButtonDeleteClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 19
    end
    object ButtonNeu: TJvImgBtn
      Left = 297
      Top = 9
      Width = 25
      Height = 25
      Hint = 'add'
      TabOrder = 2
      OnClick = ButtonNeuClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 18
    end
    object EditName: TEdit
      Left = 19
      Top = 18
      Width = 121
      Height = 21
      Hint = 'Name of the airport'
      TabOrder = 3
    end
    object EditICAO: TEdit
      Left = 19
      Top = 57
      Width = 121
      Height = 21
      Hint = 'ICAO Code'
      TabOrder = 4
    end
    object MEBreit: TMaskEdit
      Left = 204
      Top = 18
      Width = 62
      Height = 21
      Hint = 'Latitude'
      EditMask = '90\'#176'00\'#39'00\";1;_'
      MaxLength = 9
      TabOrder = 5
      Text = '  '#176'  '#39'  "'
    end
    object RBBreitN: TRadioButton
      Left = 169
      Top = 16
      Width = 33
      Height = 12
      Caption = 'N'
      Checked = True
      TabOrder = 6
      TabStop = True
    end
    object RBBreitS: TRadioButton
      Left = 169
      Top = 29
      Width = 33
      Height = 17
      Caption = 'S'
      TabOrder = 7
    end
    object Panel3: TPanel
      Left = 169
      Top = 50
      Width = 33
      Height = 33
      BevelOuter = bvNone
      TabOrder = 8
      object RBLaengO: TRadioButton
        Left = 0
        Top = 5
        Width = 33
        Height = 12
        Caption = 'O'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RBLaengW: TRadioButton
        Left = 0
        Top = 16
        Width = 33
        Height = 17
        Caption = 'W'
        TabOrder = 1
      end
    end
    object MELaeng: TMaskEdit
      Left = 204
      Top = 57
      Width = 60
      Height = 21
      Hint = 'Longitude'
      EditMask = '990\'#176'00\'#39'00\";1;_'
      MaxLength = 10
      TabOrder = 9
      Text = '   '#176'  '#39'  "'
    end
  end
  object GridOwnFlp: TJvStringGrid
    Left = 4
    Top = 41
    Width = 343
    Height = 274
    ColCount = 4
    Ctl3D = True
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
    ParentCtl3D = False
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
    OnClick = GridOwnFlpClick
    OnDrawCell = GridFlpDrawCell
    HintColor = clInfoBk
    Alignment = taLeftJustify
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = []
    ColWidths = (
      64
      64
      64
      147)
  end
  object Panel1: TPanel
    Left = 0
    Top = 468
    Width = 353
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object ButtonOK: TJvImgBtn
      Left = 92
      Top = 9
      Width = 79
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = ButtonOKClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 22
    end
    object ButtonBeenden: TJvImgBtn
      Left = 184
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
    Top = 508
    Width = 353
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbNone
        Width = 50
      end>
  end
  object PanelFindEingabe: TPanel
    Left = 0
    Top = 450
    Width = 353
    Height = 16
    BevelOuter = bvNone
    TabOrder = 5
    object RBName: TRadioButton
      Left = 186
      Top = 1
      Width = 160
      Height = 13
      Caption = 'Inherit airport name'
      TabOrder = 0
    end
    object RBKennung: TRadioButton
      Left = 10
      Top = 0
      Width = 160
      Height = 14
      Caption = 'Inherit ICAO code'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
  end
  object EditFind: TEdit
    Left = 97
    Top = 424
    Width = 250
    Height = 21
    Hint = 'Name of the airport'
    TabOrder = 6
    OnChange = EditFindChange
  end
end
