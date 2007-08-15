object FCalendarAdd: TFCalendarAdd
  Left = 445
  Top = 643
  Width = 304
  Height = 220
  Caption = 'Add Event/Schedule'
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
  object Panel1: TPanel
    Left = 0
    Top = 145
    Width = 296
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      296
      41)
    object ButtonCancel: TJvImgBtn
      Left = 172
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
      Left = 47
      Top = 8
      Width = 77
      Height = 25
      Hint = 'Accept data'
      Anchors = []
      Caption = 'OK'
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
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 296
    Height = 145
    ActivePage = tsEvent
    Align = alClient
    TabOrder = 1
    object tsEvent: TTabSheet
      Caption = 'Event'
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 23
        Height = 13
        Caption = 'Date'
      end
      object Label4: TLabel
        Left = 112
        Top = 8
        Width = 50
        Height = 13
        Caption = 'Floght Log'
      end
      object Label5: TLabel
        Left = 112
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Event'
      end
      object DtpEvent: TDateTimePicker
        Left = 8
        Top = 40
        Width = 90
        Height = 21
        Date = 39054.265504664350000000
        Time = 39054.265504664350000000
        TabOrder = 0
      end
      object cbFlightLog: TComboBox
        Left = 112
        Top = 24
        Width = 120
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbFlightLogChange
      end
      object cbEvent: TComboBox
        Left = 112
        Top = 72
        Width = 120
        Height = 21
        ItemHeight = 13
        TabOrder = 2
      end
    end
    object tsSchedule: TTabSheet
      Caption = 'Schedule'
      ImageIndex = 1
      object Label2: TLabel
        Left = 8
        Top = 24
        Width = 23
        Height = 13
        Caption = 'Date'
      end
      object Label3: TLabel
        Left = 112
        Top = 24
        Width = 53
        Height = 13
        Caption = 'Description'
      end
      object DtpSchedule: TDateTimePicker
        Left = 8
        Top = 40
        Width = 90
        Height = 21
        Date = 39054.265504664350000000
        Time = 39054.265504664350000000
        TabOrder = 0
      end
      object EditDesc: TEdit
        Left = 112
        Top = 40
        Width = 120
        Height = 21
        TabOrder = 1
      end
    end
  end
end
