object FStat_Graph: TFStat_Graph
  Left = 365
  Top = 230
  Width = 768
  Height = 553
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'FStat_Graph'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    760
    519)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 460
    Width = 760
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      760
      40)
    object ButtonExit: TJvImgBtn
      Left = 359
      Top = 8
      Width = 89
      Height = 25
      Anchors = []
      Cancel = True
      Caption = 'Exit'
      ModalResult = 1
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
    Top = 500
    Width = 760
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbNone
        Width = 50
      end>
  end
  object PanelGraph: TPanel
    Left = 97
    Top = 402
    Width = 561
    Height = 57
    Anchors = [akBottom]
    BevelOuter = bvNone
    TabOrder = 2
    object ShapeRed: TShape
      Left = 7
      Top = 22
      Width = 152
      Height = 29
      Brush.Color = clRed
    end
    object ShapeBlue: TShape
      Left = 401
      Top = 22
      Width = 153
      Height = 29
      Brush.Color = clBlue
    end
    object Label1: TLabel
      Left = 267
      Top = -1
      Width = 22
      Height = 13
      Caption = 'Year'
    end
    object RBBalken: TRadioButton
      Left = 214
      Top = 19
      Width = 145
      Height = 17
      Caption = 'Bar chart'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = Redraw
    end
    object RBLinien: TRadioButton
      Left = 214
      Top = 38
      Width = 113
      Height = 17
      Caption = 'Line chart'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Redraw
    end
    object CBY1: TComboBox
      Left = 10
      Top = 26
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = Redraw
      Items.Strings = (
        'Starts'
        'Time'
        #216'-Flight Time:'
        'Distance'
        #216'-speed')
    end
    object CBY2: TComboBox
      Left = 405
      Top = 26
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = Redraw
      Items.Strings = (
        'Starts'
        'Time'
        #216'-Flight Time:'
        'Distance'
        #216'-speed')
    end
  end
end
