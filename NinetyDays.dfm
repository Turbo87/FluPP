object FNinetyDays: TFNinetyDays
  Left = 630
  Top = 217
  BorderStyle = bsDialog
  Caption = '90 Day Regulation'
  ClientHeight = 387
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 4
    Width = 131
    Height = 16
    Caption = 'Within the last 90 days'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 2
    Top = 30
    Width = 56
    Height = 13
    Caption = 'Licences:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 2
    Top = 158
    Width = 33
    Height = 13
    Caption = 'Type:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GridNinetyDaysFlz: TJvStringGrid
    Left = 2
    Top = 176
    Width = 290
    Height = 145
    ColCount = 3
    DefaultRowHeight = 17
    Enabled = False
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
    ScrollBars = ssVertical
    TabOrder = 0
    OnDrawCell = GridNinetyDaysFlzDrawCell
    OnSelectCell = GridNinetyDaysSelectCell
    HintColor = clInfoBk
    Alignment = taLeftJustify
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = []
    ColWidths = (
      64
      268
      64)
  end
  object Panel1: TPanel
    Left = 0
    Top = 328
    Width = 294
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object BitBtn1: TJvImgBtn
      Left = 116
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 368
    Width = 294
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbNone
        Width = 50
      end>
  end
  object GridNinetyDaysLic: TJvStringGrid
    Left = 2
    Top = 48
    Width = 290
    Height = 97
    ColCount = 3
    DefaultRowHeight = 17
    Enabled = False
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
    ScrollBars = ssVertical
    TabOrder = 3
    OnDrawCell = GridNinetyDaysFlzDrawCell
    OnSelectCell = GridNinetyDaysSelectCell
    HintColor = clInfoBk
    Alignment = taLeftJustify
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = []
    ColWidths = (
      64
      268
      64)
  end
end
