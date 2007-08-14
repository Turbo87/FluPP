object FTrainBaro: TFTrainBaro
  Left = 322
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Training Barometer'
  ClientHeight = 514
  ClientWidth = 506
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
  object Bevel1: TBevel
    Left = 165
    Top = 88
    Width = 334
    Height = 265
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 3
    Top = 28
    Width = 157
    Height = 395
    Shape = bsFrame
  end
  object DrawArea: TImage
    Left = 9
    Top = 48
    Width = 145
    Height = 371
  end
  object Label1: TLabel
    Left = 7
    Top = 32
    Width = 27
    Height = 13
    Caption = 'Starts'
  end
  object Label2: TLabel
    Left = 125
    Top = 32
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Hours'
  end
  object Label3: TLabel
    Left = 27
    Top = 7
    Width = 107
    Height = 16
    Caption = 'In the last 6 month:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 247
    Top = 358
    Width = 245
    Height = 13
    Alignment = taRightJustify
    Caption = 'Source: Office for aviation safety, German Aeroclub '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelText: TLabel
    Left = 172
    Top = 96
    Width = 318
    Height = 249
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 474
    Width = 506
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object BitBtn1: TJvImgBtn
      Left = 214
      Top = 8
      Width = 75
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
  object PanelFligtLogs: TPanel
    Left = 0
    Top = 434
    Width = 506
    Height = 40
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      506
      40)
    object LBFlu: TListBox
      Left = 6
      Top = 6
      Width = 494
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
end
