object FGrid: TFGrid
  Left = 528
  Top = 298
  HorzScrollBar.Visible = False
  BorderStyle = bsNone
  Caption = 'FGrid'
  ClientHeight = 453
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TJvStringGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Align = alClient
    ColCount = 2
    Ctl3D = False
    DefaultRowHeight = 17
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goColMoving, goRowSelect, goThumbTracking]
    ParentCtl3D = False
    TabOrder = 0
    OnColumnMoved = GridColumnMoved
    OnDrawCell = GridDrawCell
    OnMouseDown = GridMouseDown
    OnMouseUp = GridMouseUp
    HintColor = clInfoBk
    Alignment = taLeftJustify
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = []
  end
  object PopupMenu: TPopupMenu
    AutoPopup = False
    Images = FMain.ImageList
    Left = 40
    Top = 422
    object PUFlightNew: TMenuItem
      Action = FMain.ActionFlightNew
    end
    object PUFlightEdit: TMenuItem
      Action = FMain.ActionFlightEdit
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Default = True
    end
    object PUFlugEinfuegen: TMenuItem
      Action = FMain.ActionFlightInsert
    end
    object PUFlugloeschen: TMenuItem
      Action = FMain.ActionFlightDelete
    end
    object PUloeschrueck: TMenuItem
      Action = FMain.ActionFlightDeleteUndo
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object PUKategorieZuordnen: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Categories'
      object KatAdd: TMenuItem
        Caption = 'Add'
        ImageIndex = 18
      end
      object KatRem: TMenuItem
        Caption = 'Remove'
        ImageIndex = 19
      end
    end
    object PUSepFiles: TMenuItem
      Caption = '-'
    end
    object PUFiles: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Files'
      Hint = 'Attached files'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PUGoogleMap: TMenuItem
      Action = FMain.ActionExportGoogleMap
    end
    object PUGoogleEarth: TMenuItem
      Action = FMain.ActionExportGoogleEarth
    end
  end
  object PopupMenuCols: TPopupMenu
    Left = 8
    Top = 422
  end
end
