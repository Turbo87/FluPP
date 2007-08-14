object FInputBox: TFInputBox
  Left = 396
  Top = 320
  BorderStyle = bsDialog
  Caption = 'Time category'
  ClientHeight = 121
  ClientWidth = 192
  Color = clBtnFace
  Constraints.MinWidth = 200
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 80
    Width = 192
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      192
      41)
    object ButtonCancel: TJvImgBtn
      Left = 97
      Top = 8
      Width = 82
      Height = 25
      Hint = 'Abort'
      Anchors = []
      Cancel = True
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
    object ButtonOK: TJvImgBtn
      Left = 17
      Top = 8
      Width = 77
      Height = 25
      Hint = 'Accept data'
      Anchors = []
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 22
    end
  end
end
