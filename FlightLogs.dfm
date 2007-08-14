object FFlightLogs: TFFlightLogs
  Left = 528
  Top = 313
  BorderStyle = bsDialog
  Caption = 'Manage flight logs'
  ClientHeight = 223
  ClientWidth = 212
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
  object Label12: TLabel
    Left = 0
    Top = 155
    Width = 212
    Height = 28
    Align = alBottom
    Alignment = taCenter
    AutoSize = False
    Caption = 'You can add or remove fllight logs here.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 183
    Width = 212
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      212
      40)
    object ButtonOK: TJvImgBtn
      Left = 67
      Top = 9
      Width = 79
      Height = 25
      Anchors = [akTop]
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
  end
  object ButtonNew: TJvImgBtn
    Left = 67
    Top = 126
    Width = 25
    Height = 25
    Hint = 'add'
    TabOrder = 1
    OnClick = ButtonNewClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Images = FMain.ImageList
    ImageIndex = 18
  end
  object ButtonDelete: TJvImgBtn
    Left = 94
    Top = 126
    Width = 25
    Height = 25
    Hint = 'remove'
    TabOrder = 2
    OnClick = ButtonDeleteClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Images = FMain.ImageList
    ImageIndex = 19
  end
  object ButtonEdit: TJvImgBtn
    Left = 121
    Top = 126
    Width = 25
    Height = 25
    Hint = 'edit'
    TabOrder = 3
    OnClick = ButtonEditClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Images = FMain.ImageList
    ImageIndex = 14
  end
  object LBFlu: TListBox
    Left = 0
    Top = 0
    Width = 212
    Height = 120
    Hint = 'Select flight log'
    Style = lbOwnerDrawFixed
    Align = alTop
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 23
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    OnDrawItem = LBFluDrawItem
  end
end
