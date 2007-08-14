object FCalendar: TFCalendar
  Left = 472
  Top = 280
  BorderStyle = bsDialog
  Caption = 'Calendar'
  ClientHeight = 321
  ClientWidth = 592
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
    Top = 262
    Width = 592
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object ButtonOK: TJvImgBtn
      Left = 215
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
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
    end
    object ButtonCancel: TJvImgBtn
      Left = 294
      Top = 8
      Width = 82
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
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 302
    Width = 592
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbNone
        Width = 50
      end>
  end
  object GridSched: TJvStringGrid
    Left = 0
    Top = 60
    Width = 592
    Height = 160
    Align = alTop
    Color = clWhite
    ColCount = 3
    DefaultColWidth = 50
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
    ParentFont = False
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = False
    TabOrder = 2
    OnClick = GridSchedClick
    OnDrawCell = GridSchedDrawCell
    HintColor = clInfoBk
    Alignment = taLeftJustify
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = []
    ColWidths = (
      50
      50
      71)
  end
  object ButtonDelete: TJvImgBtn
    Left = 284
    Top = 226
    Width = 25
    Height = 25
    Hint = 'Remove event/schedule'
    TabOrder = 3
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
  object ButtonNew: TJvImgBtn
    Left = 257
    Top = 226
    Width = 25
    Height = 25
    Hint = 'Add event/schedule'
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
  object JvTMTimeline: TJvTMTimeline
    Left = 0
    Top = 0
    Width = 592
    Height = 60
    BorderStyle = bsSingle
    ButtonWidth = 15
    SelDate = 38003.000000000000000000
    DayWidth = 13
    Images = FMain.ImageList
    Date = 38004.000000000000000000
    MonthFont.Charset = DEFAULT_CHARSET
    MonthFont.Color = clWindowText
    MonthFont.Height = -19
    MonthFont.Name = 'Times New Roman'
    MonthFont.Style = [fsBold, fsItalic]
    ReadOnly = False
    RightClickSelect = False
    Selection.Pen.Width = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = JvTMTimelineClick
  end
  object ButtonExtend: TJvImgBtn
    Left = 312
    Top = 226
    Width = 24
    Height = 25
    Hint = 'Extend schedule'
    TabOrder = 5
    OnClick = ButtonExtendClick
    Flat = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Images = FMain.ImageList
    ImageIndex = 24
  end
  object CBViewSchedules: TCheckBox
    Left = 6
    Top = 224
    Width = 147
    Height = 17
    Caption = 'Schedules'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 7
    OnClick = CBViewClick
  end
  object CBViewEvents: TCheckBox
    Left = 6
    Top = 242
    Width = 147
    Height = 17
    Caption = 'Events'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 8
    OnClick = CBViewClick
  end
end
