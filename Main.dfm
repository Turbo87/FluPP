object FMain: TFMain
  Left = 333
  Top = 261
  Width = 886
  Height = 415
  Caption = 'FluPP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ActionToolBar: TActionToolBar
    Left = 0
    Top = 24
    Width = 878
    Height = 28
    ActionManager = ActionManager
    Caption = 'Main'
    ColorMap.HighlightColor = 15921906
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 15921906
    Spacing = 4
    VertMargin = 2
  end
  object ActionMainMenuBar: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 878
    Height = 24
    UseSystemFont = False
    ActionManager = ActionManager
    AnimationStyle = asNone
    Caption = 'ActionMainMenuBar'
    ColorMap.HighlightColor = 15921906
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 15921906
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Spacing = 0
  end
  object Panel1: TPanel
    Left = 361
    Top = 58
    Width = 0
    Height = 36
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
  end
  object PanelSButtons: TPanel
    Left = 567
    Top = 0
    Width = 61
    Height = 52
    BevelOuter = bvNone
    TabOrder = 3
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 362
    Width = 878
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 325
      end
      item
        Alignment = taCenter
        Width = 325
      end
      item
        Alignment = taCenter
        Bevel = pbNone
        Width = 10
      end
      item
        Width = 0
      end>
    ParentFont = True
    UseSystemFont = False
  end
  object PanelScheduler: TPanel
    Left = 394
    Top = 2
    Width = 164
    Height = 48
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    object GridSched: TJvStringGrid
      Left = 2
      Top = 2
      Width = 160
      Height = 44
      Hint = 'Scheduler'
      BorderStyle = bsNone
      Color = clBtnFace
      ColCount = 4
      Ctl3D = True
      DefaultColWidth = 50
      DefaultRowHeight = 11
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 11
      Font.Name = 'Small Fonts'
      Font.Style = []
      GridLineWidth = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssNone
      ShowHint = False
      TabOrder = 0
      OnDblClick = SchedulerClick
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
        71
        50)
    end
  end
  object OpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist]
    Left = 10
    Top = 65
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'flp'
    Options = [ofOverwritePrompt, ofHideReadOnly]
    Left = 10
    Top = 97
  end
  object StartTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = StartTimerTimer
    Left = 9
    Top = 130
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionFileNew
            ImageIndex = 0
            ShowCaption = False
            ShortCut = 16462
          end
          item
            Action = ActionFileOpen
            ImageIndex = 1
            ShowCaption = False
            ShortCut = 16463
          end
          item
            Action = ActionFileSave
            ImageIndex = 2
            ShowCaption = False
            ShortCut = 16467
          end
          item
            Caption = '-'
          end
          item
            Action = ActionFlightNew
            ImageIndex = 5
            ShowCaption = False
            ShortCut = 113
          end
          item
            Caption = '-'
          end
          item
            Action = ActionSettings
            ImageIndex = 4
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ActionScheduler
            ImageIndex = 11
            ShowCaption = False
            ShortCut = 118
          end
          item
            Action = ActionNinetyDays
            ImageIndex = 9
            ShowCaption = False
            ShortCut = 119
          end
          item
            Action = ActionStatistic
            ImageIndex = 10
            ShowCaption = False
            ShortCut = 120
          end
          item
            Action = ActionLicense
            ImageIndex = 27
            ShowCaption = False
            ShortCut = 121
          end
          item
            Action = ActionTrainBaro
            ImageIndex = 12
            ShowCaption = False
            ShortCut = 122
          end
          item
            Caption = '-'
          end
          item
            Action = ActionExit
            ImageIndex = 8
            ShowCaption = False
            ShortCut = 16472
          end>
        ActionBar = ActionToolBar
      end
      item
        Items.CaptionOptions = coNone
        Items = <
          item
            Items = <
              item
                Action = ActionFileNew
                Caption = '&New'
                ImageIndex = 0
                ShortCut = 16462
              end
              item
                Action = ActionFileOpen
                Caption = '&Open...'
                ImageIndex = 1
                ShortCut = 16463
              end
              item
                Action = ActionFileSave
                ImageIndex = 2
                ShortCut = 16467
              end
              item
                Action = ActionFileSaveAs
                Caption = 'S&ave as...'
              end
              item
                Caption = '-'
              end
              item
                Action = ActionFileImport
                Caption = '&Import...'
              end
              item
                Action = ActionFileExport
              end
              item
                Caption = '-'
              end
              item
                Action = ActionPrint
                Caption = '&Print...'
                ImageIndex = 3
                ShortCut = 16464
              end
              item
                Caption = '-'
              end
              item
                Action = ActionFlightLogs
                Caption = '&Flight logs...'
              end
              item
                Action = ActionBasicSettings
                Caption = '&Basic settings...'
                ImageIndex = 26
              end
              item
                Action = ActionSettings
                Caption = 'Se&ttings...'
                ImageIndex = 4
              end
              item
                Caption = '-'
              end
              item
                Action = ActionClose
                Caption = '&Close'
                ShortCut = 16471
              end
              item
                Action = ActionExit
                Caption = 'E&xit'
                ImageIndex = 8
                ShortCut = 16472
              end
              item
                Caption = '-'
              end
              item
                Visible = False
                Action = LF1
                ShortCut = 24688
              end
              item
                Visible = False
                Action = LF2
                ShortCut = 24689
              end
              item
                Visible = False
                Action = LF3
                ShortCut = 24690
              end
              item
                Visible = False
                Action = LF4
                ShortCut = 24691
              end
              item
                Visible = False
                Action = LF5
                ShortCut = 24692
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = ActionFlightNew
                Caption = '&New'
                ImageIndex = 5
                ShortCut = 113
              end
              item
                Action = ActionFlightEdit
                Caption = '&Edit...'
                ImageIndex = 14
                ShortCut = 114
              end
              item
                Action = ActionFlightInsert
                Caption = '&Insert'
                ImageIndex = 7
              end
              item
                Action = ActionFlightDelete
                Caption = '&Delete'
                ImageIndex = 15
              end
              item
                Action = ActionFlightDeleteUndo
                Caption = '&Undo delete'
                ImageIndex = 6
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = ActionExportGoogleMap
                    Caption = 'Vi&ew flights in Google Maps'
                    ImageIndex = 32
                  end
                  item
                    Action = ActionExportGoogleEarth
                    Caption = '&View flights in Google Earth'
                    ImageIndex = 32
                  end>
                Caption = '&Google'
                UsageCount = 1
              end>
            Caption = 'F&light'
          end
          item
            Items = <
              item
                Action = ActionScheduler
                Caption = '&Scheduler...'
                ImageIndex = 11
                ShortCut = 118
              end
              item
                Action = ActionNinetyDays
                Caption = '&90 Day Regulation...'
                ImageIndex = 9
                ShortCut = 119
              end
              item
                Action = ActionStatistic
                Caption = 'S&tatistic...'
                ImageIndex = 10
                ShortCut = 120
              end
              item
                Action = ActionLicense
                Caption = '&Licenceextension...'
                ImageIndex = 27
                ShortCut = 121
              end
              item
                Action = ActionTrainBaro
                Caption = 'T&raining barometer...'
                ImageIndex = 12
                ShortCut = 122
              end
              item
                Caption = '-'
              end
              item
                Action = ActionAirports
                Caption = '&Airports...'
                ShortCut = 123
              end
              item
                Caption = '-'
              end
              item
                Action = ActionSortFlights
                Caption = 'S&ort all flights'
              end
              item
                Action = ActionResetColumns
              end>
            Caption = 'T&ools'
          end
          item
            Items = <
              item
                Items = <
                  item
                    Action = ActionHP
                    Caption = '&Homepage'
                  end
                  item
                    Caption = '-'
                  end
                  item
                    Action = ActionHPLanguages
                    Caption = 'La&nguages'
                  end
                  item
                    Action = ActionHPLicenses
                    Caption = '&Licenses'
                  end
                  item
                    Action = ActionHPAirports
                    Caption = '&Airports'
                  end
                  item
                    Caption = '-'
                  end
                  item
                    Action = ActionHPRFE
                    Caption = '&Feature Requests'
                  end
                  item
                    Action = ActionHPBugs
                    Caption = '&Bugs'
                  end
                  item
                    Action = ActionHPSupport
                    Caption = '&Support'
                  end>
                Caption = '&Online'
                ImageIndex = 29
              end
              item
                Action = ActionInfo
                Caption = '&About'
                ImageIndex = 13
                ShortCut = 112
              end>
            Caption = '&Help'
          end>
        ActionBar = ActionMainMenuBar
      end>
    Images = ImageList
    Left = 9
    Top = 163
    StyleName = 'XP Style'
    object ActionFileNew: TAction
      Category = 'File'
      Caption = 'New...'
      Hint = 'New'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = FileNew
    end
    object ActionFileOpen: TAction
      Category = 'File'
      Caption = 'Open...'
      Hint = 'Open'
      ImageIndex = 1
      ShortCut = 16463
      OnExecute = FileOpen
    end
    object ActionFileSave: TAction
      Category = 'File'
      Caption = '&Save'
      Hint = 'Save'
      ImageIndex = 2
      ShortCut = 16467
      OnExecute = FileSave
    end
    object ActionFileSaveAs: TAction
      Category = 'File'
      Caption = 'Save as...'
      Hint = 'Save as'
      OnExecute = FileSaveAsClick
    end
    object ActionFileImport: TAction
      Category = 'File'
      Caption = 'Import...'
      Hint = 'Import'
      OnExecute = ActionFileImportExecute
    end
    object ActionFileExport: TAction
      Category = 'File'
      Caption = 'Export...'
      Hint = 'Export'
      OnExecute = ActionFileExportExecute
    end
    object ActionPrint: TAction
      Category = 'File'
      Caption = 'Print...'
      Hint = 'Print'
      ImageIndex = 3
      ShortCut = 16464
      OnExecute = Print
    end
    object ActionFlightLogs: TAction
      Category = 'File'
      Caption = 'Flight logs...'
      Hint = 'Manage flight logs'
      OnExecute = FlightLogsClick
    end
    object ActionBasicSettings: TAction
      Category = 'File'
      Caption = 'Basic settings...'
      Hint = 'Basic settings'
      ImageIndex = 26
      OnExecute = BasicSettingsClick
    end
    object ActionSettings: TAction
      Category = 'File'
      Caption = 'Settings...'
      Hint = 'Settings'
      ImageIndex = 4
      OnExecute = SettingsClick
    end
    object ActionClose: TAction
      Category = 'File'
      Caption = 'Close'
      Hint = 'Close'
      ShortCut = 16471
      OnExecute = CloseClick
    end
    object ActionExit: TAction
      Category = 'File'
      Caption = 'Exit'
      Hint = 'Exit'
      ImageIndex = 8
      ShortCut = 16472
      OnExecute = ExitClick
    end
    object LF1: TAction
      Category = 'File'
      ShortCut = 24688
      Visible = False
      OnExecute = LastFifeClick
    end
    object LF2: TAction
      Category = 'File'
      ShortCut = 24689
      Visible = False
      OnExecute = LastFifeClick
    end
    object LF3: TAction
      Category = 'File'
      ShortCut = 24690
      Visible = False
      OnExecute = LastFifeClick
    end
    object LF4: TAction
      Category = 'File'
      ShortCut = 24691
      Visible = False
      OnExecute = LastFifeClick
    end
    object LF5: TAction
      Category = 'File'
      ShortCut = 24692
      Visible = False
      OnExecute = LastFifeClick
    end
    object ActionFlightNew: TAction
      Category = 'Flight'
      Caption = 'New'
      Hint = 'Enter new flight'
      ImageIndex = 5
      ShortCut = 113
      OnExecute = FlightNew
    end
    object ActionFlightEdit: TAction
      Category = 'Flight'
      Caption = 'Edit...'
      Hint = 'Edit flight'
      ImageIndex = 14
      ShortCut = 114
      OnExecute = FlightEdit
    end
    object ActionFlightInsert: TAction
      Category = 'Flight'
      Caption = 'Insert'
      Hint = 'Insert flight'
      ImageIndex = 7
      OnExecute = FlightInsert
    end
    object ActionFlightDelete: TAction
      Category = 'Flight'
      Caption = 'Delete'
      Hint = 'Delete flight'
      ImageIndex = 15
      OnExecute = FlightDelete
    end
    object ActionFlightDeleteUndo: TAction
      Category = 'Flight'
      Caption = 'Undo delete'
      Hint = 'Undo delete'
      ImageIndex = 6
      OnExecute = FlightDeleteUndo
    end
    object ActionScheduler: TAction
      Category = 'Tools'
      Caption = 'Scheduler...'
      Hint = 'Scheduler'
      ImageIndex = 11
      ShortCut = 118
      OnExecute = SchedulerClick
    end
    object ActionNinetyDays: TAction
      Category = 'Tools'
      Caption = '90 Day Regulation...'
      Hint = '90 Day Regulation'
      ImageIndex = 9
      ShortCut = 119
      OnExecute = MMNinetyDaysClick
    end
    object ActionStatistic: TAction
      Category = 'Tools'
      Caption = 'Statistic...'
      Hint = 'Statistic'
      ImageIndex = 10
      ShortCut = 120
      OnExecute = MMStatisticsClick
    end
    object ActionLicense: TAction
      Category = 'Tools'
      Caption = 'Licenceextension...'
      Hint = 'Licenseextension'
      ImageIndex = 27
      ShortCut = 121
      OnExecute = LicenseClick
    end
    object ActionTrainBaro: TAction
      Category = 'Tools'
      Caption = 'Training barometer...'
      Hint = 'Training barometer'
      ImageIndex = 12
      ShortCut = 122
      OnExecute = MMTrainBaroClick
    end
    object ActionAirports: TAction
      Category = 'Tools'
      Caption = 'Airports...'
      Hint = 'Airports'
      ShortCut = 123
      OnExecute = AirportsClick
    end
    object ActionSortFlights: TAction
      Category = 'Tools'
      Caption = 'Sort all flights'
      Hint = 'Sort all flights'
      OnExecute = SortAllFlightsClick
    end
    object ActionInfo: TAction
      Category = 'Help'
      Caption = 'About'
      ImageIndex = 13
      ShortCut = 112
      OnExecute = InfoClick
    end
    object ActionHelpOnline: TAction
      Category = 'Help'
      Caption = 'Online'
      ImageIndex = 29
    end
    object ActionHP: TAction
      Category = 'Help'
      Caption = 'Homepage'
      ImageIndex = 29
      OnExecute = ActionHPExecute
    end
    object ActionHPAirports: TAction
      Category = 'Help'
      Caption = 'Airports'
      OnExecute = ActionHPAirportsExecute
    end
    object ActionHPLicenses: TAction
      Category = 'Help'
      Caption = 'Licenses'
      ImageIndex = 27
      OnExecute = ActionHPLicensesExecute
    end
    object ActionHPLanguages: TAction
      Category = 'Help'
      Caption = 'Languages'
      OnExecute = ActionHPLanguagesExecute
    end
    object ActionHPRFE: TAction
      Category = 'Help'
      Caption = 'Feature Requests'
      OnExecute = ActionHPRFEExecute
    end
    object ActionHPBugs: TAction
      Category = 'Help'
      Caption = 'Bugs'
      OnExecute = ActionHPBugsExecute
    end
    object ActionHPSupport: TAction
      Category = 'Help'
      Caption = 'Support'
      OnExecute = ActionHPSupportExecute
    end
    object ActionExportGoogleMap: TAction
      Category = 'Google'
      Caption = 'View flights in Google Maps'
      Hint = 'View flights in Google Maps'
      ImageIndex = 32
      OnExecute = ActionExportGoogleMapExecute
    end
    object ActionExportGoogleEarth: TAction
      Category = 'Google'
      Caption = 'View flights in Google Earth'
      Hint = 'View flights online'
      ImageIndex = 32
      OnExecute = ActionExportGoogleEarthExecute
    end
    object ActionResetColumns: TAction
      Category = 'Tools'
      Caption = 'Reset columns'
      Hint = 'Reset columns'
      OnExecute = ActionResetColumnsExecute
    end
  end
  object ImageList: TImageList
    Left = 9
    Top = 195
    Bitmap = {
      494C010121002200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      0000000000000000000000000000000000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      00008080000080800000808000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000000000000000
      000000000000808080008000000080000000FF00000080000000FF0000008080
      00008080800000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000000000000000
      00008000000080000000C0C0C00000000000000000000000000000000000C0C0
      C00080000000C0C0C000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0000000000000000000000FF00
      000080000000C0C0C00000000000000000000000000000000000000000000000
      000080000000C0C0C000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000C0C0C0008000
      00008080800000000000000000000000000000000000C0C0C000800000008000
      000080000000C0C0C000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000808080008000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      000000000000C0C0C000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000808000008080
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000808000008080
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000C0C0C0008000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000C0C0C0008000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000000000008080
      800080000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000000000000000
      0000808080008000000000000000000000000000000000000000000000008000
      00008000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      000000000000C0C0C0008080800080000000FF0000008000000080800000C0C0
      C000C0C0C00000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000080808000008080008080
      8000808080008080800000808000808080008080800080800000008080008080
      8000008080000080000080800000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000087B7300087B7300087B7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000A4000000A40000000000000000000000
      0000000000000000000000000000000000005357555C828282FF777878FF7778
      78FF777878FF777878FF777878FF777878FF777878FF777878FF777878FF7778
      78FF777878FF777878FF777878FF5357555C0000000000000000000000000000
      00000000000000000000087B7300087B730063BDB500087B7300000000000000
      0000000000000000000000000000000000000000000000000000000000002112
      1006956F57A69F765AEEA3795AFEA4795AFFA27859FB9D7458D99F7557670000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000A4000000A4000001A4000304A600000000000000
      000000000000000000000000000000000000828282FFC4C4C4FFB7B7B7FFB7B7
      B7FFB8B8B8FFB9B9B9FFBABABAFFBABABAFFBBBBBBFFBBBBBBFFBBBBBBFFBBBB
      BBFFBDBDBDFFBDBDBDFFC4C4C4FF777878FF0000000000000000000000000000
      000000000000087B7300087B730073BDAD006BC6BD00087B7300000000000000
      000000000000000000000000000000000000000000000000000089614B59A683
      69F9B69277FFCEB49FFFDCC8B7FFE1CFBEFFDCC7B4FFCCB29BFFB49175FFA077
      59D6A47A5A2E0000000000000000000000000000000000000000000000000000
      0000000000000000A4000000A4006D75DA00666FD9000001A4000406A7000000
      000000000000000000000000000000000000878888FFF1F1F1FF808080FF8181
      81FF818181FF828282FF838383FF848484FF848484FF858585FF868686FF8787
      87FF878787FF888888FFB1B1B1FF777878FF0000000000000000000000000000
      0000087B7300087B730073BDAD0031AD9C005ABDB500087B7300000000000000
      0000000000000000000000000000000000000000000094695150A67D5DFFCBB0
      9AFFE2D7CCFFB7906DFFBD8A5CFFBA8656FFB6804FFFB78556FFD0C1B3FFC7AB
      93FFA37959EEA47A5A2E00000000000000000000000000000000000000000000
      00000000A4000000A400525BD5000718C7001F2ECC00525DD5000002A4000406
      A70000000000000000000000000000000000878888FFFFFFFFFFF9F9F9FFF7F7
      F7FFF7F7F7FFF4F4F4FFF4F4F4FFF0F0F0FFF1F1F1FFF3F3F3FFF2F2F2FFF3F3
      F3FFF3F3F3FFF3F3F3FFFFFFFFFF777878FF000000000000000000000000087B
      7300087B730073BDAD0039AD9C0029AD9C005ABDB500087B7300087B7300087B
      7300087B7300087B7300087B7300087B730000000000A87F61F3CBB29CFFE9E3
      DCFFF6F6F6FFC6BFB8FFC99B71FFC6966BFFC18F62FFBC8859FFD1D1D1FFCCC4
      BCFFC8AC94FFA47A5AC700000000000000000000000000000000000000000000
      A4000000A4004855D5000718C7000718C7000718C7000718C7005961D4002727
      B2000508A800000000000000000000000000878888FFFFFFFFFFE6E6E6FFEAEA
      EAFFECECECFFEDEDEDFFF1F1F1FFEFEFEFFFF2F2F2FFF3F3F3FFF3F3F3FFF6F6
      F6FFFAFAFAFFFBFBFBFFFFFFFFFF777878FF0000000000000000087B7300087B
      730073BDAD0039AD9C0021A5940021A5940042B5A5005ABDAD005ABDAD005AB5
      AD005AB5AD005AB5A5005AB5A500087B7300A57C6293B7957AFFE9DFD6FFFEFE
      FEFFFEFEFEFFEFEEEDFFCEA783FFD1A780FFCB9F75FFC5966CFFE0E0E0FFD3D3
      D3FFC9B7A5FFB59175FFA47A5A610000000000000000000000000000A4002F2F
      B4005460D8000718C7000718C7000718C7000718C7000718C7000718C7005761
      D600383BBA000406A7000000000000000000878888FFFFFFFFFFE5E5E5FF5151
      51FF181818FF111111FF6A6A6AFFECECECFFF1F1F1FF0E0E0EFF3C3C3CFFA1A1
      A1FFEEEEEEFFF9F9F9FFFFFFFFFF777878FF00000000087B7300087B730073BD
      AD0031AD9C0021A58C0021A5940021A5940021A5940021A5940021A59400219C
      8C00219C8C00219C8C00299C8C00087B7300A87F63E5D3BDABFFE5E1DCFFFEFE
      FEFFE3E1DFFFDABDA2FFE0BD9CFFDCB693FFCAA684FFC7A78BFFF5F5F5FFE2E2
      E2FFAEA69DFFCDB39DFFA47A5AB600000000000000000000A4000000A4006F77
      DD000718C7000718C7000718C7000718C7000718C7000718C7000718C7000718
      C7004750CB00090CAB000000A40000000000878888FFFFFFFFFFE5E5E5FFDADA
      DAFFE6E6E6FF8C8C8CFF030303FFE4E4E4FFEAEAEAFFB5B5B5FF000000FFE8E8
      E8FFF2F2F2FFF9F9F9FFFFFFFFFF777878FF00000000087B730073BDAD0031AD
      9C0021A58C0021A5940021A5940021A5940021A5940021A59400219C8C00219C
      8C00219C8C00299C8C00299C8C00087B7300A67D5EFDE7D9CCFFCDC2B7FFD4CE
      C8FFE8CCB3FFEED1B5FFECCEB1FFD1BCA9FFF9F9F8FFF3F2F1FFFEFEFEFFEFEF
      EFFFD1D0CEFFDDC9B8FFA47A5AEA000000000000A4000000A400474EC6003D4C
      D300091AC7000718C7000718C7000718C7000718C7000718C7000718C7000718
      C7003441CC003D45C4000B0CA9000000A400878888FFFFFFFFFFE5E5E5FFB6B6
      B6FF171717FF000000FF6D6D6DFFE7E7E7FFE7E7E7FFB3B3B3FF000000FFE4E4
      E4FFF3F3F3FFF4F4F4FFFFFFFFFF777878FF00000000087B730073BDAD005AB5
      A50052ADA5005AB5A5005AB5A5005AB5AD0063B5AD0063B5AD005AB5AD005AB5
      A5005AB5A5005AB5A5005AB5A500087B7300A47A5BFFEFE4DBFFE9CAACFFF2D7
      BCFFF9E1C9FFFCE8D5FFF9E5D2FFD5CFC8FFFEFEFEFFFEFEFEFFFEFEFEFFF9F9
      F9FFBCB5AEFFE3D2C3FFA47A5AFC000000000000A4001C23BB005C6CDA002239
      CF002138CF00172BCC00091AC8000718C7000718C7000718C7000718C7000718
      C7000718C7003D49CD002126B5000000A400878888FFFFFFFFFFE4E4E4FFDFDF
      DFFFE5E5E5FF8D8D8DFF090909FFE4E4E4FFE7E7E7FFADADADFF000000FFE3E3
      E3FFF1F1F1FFF1F1F1FFFFFFFFFF777878FF00000000087B7300087B730073BD
      AD0073BDB5005AB5A50063B5AD0063B5AD006BBDAD006BB5AD0063B5AD0063B5
      AD0063B5AD0063B5AD0063B5A500087B7300A88063FDE9DDD4FFD3BEAAFFFAE3
      CCFFFFEEDEFFFFEFDFFFFFEFDFFFEADBCEFFFDFDFDFFFEFEFEFFFDFDFDFFE6E4
      E2FFDFDDDCFFDFCDBCFFA47A5AEA000000000000A400454EC6003C51D400273E
      D000263ED000253DD000233BCF001124CA000718C7000718C7000718C7000718
      C7000718C7000718C7004147C4000101A400878888FFFFFFFFFFE3E3E3FF7B7B
      7BFF1C1C1CFF0C0C0CFF525252FFE6E6E6FFE7E7E7FF1A1A1AFF000000FFDFDF
      DFFFEBEBEBFFEEEEEEFFFFFFFFFF777878FF0000000000000000087B7300087B
      730073BDAD0084C6BD006BBDAD006BBDAD007BC6BD0094CEC60094CEC6008CCE
      C6008CCEC6008CC6BD008CC6BD00087B7300AD8A70E8D8C5B5FFE4E3E0FFEFDD
      CCFFFFEFE0FFFFF0E1FFFFF0E1FFFCEBDAFFD2CDC7FFD0C7BEFFC9B5A4FFC8BE
      B5FFE8E6E4FFD0B8A3FFA47A5AB6000000000000A4006070D9002C45D1002B44
      D1002B43D1002A43D1002A42D1002942D1001D33CD00091BC8000718C7000718
      C7000718C7000718C7002E3BCC000001A400878888FFFFFFFFFFE2E2E2FFE3E3
      E3FFE4E4E4FFE4E4E4FFE5E5E5FFE6E6E6FFE6E6E6FFE7E7E7FFE7E7E7FFE7E7
      E7FFEAEAEAFFF1F1F1FFFFFFFFFF777878FF000000000000000000000000087B
      7300087B730073BDAD008CCEBD0073BDB50094CEC600087B7300087B7300087B
      7300087B7300087B7300087B7300087B7300A37B6284BA9A81FFF8F4F0FFE5E4
      E3FFDFD5CAFFFFF1E2FFFFF1E3FFFAEADAFFD8CFC6FFDBD9D7FFF5F4F4FFFBFB
      FBFFE9DFD5FFB69479FFA47A5A61000000000000A4006779DD00314BD300304A
      D3002F49D3002F49D3002F48D3002E48D3002E47D2002C45D200192DCC000F22
      C9000718C7000718C7003442D1000000A400878888FFFFFFFFFFE2E2E2FFE2E2
      E2FFE3E3E3FFE3E3E3FFE4E4E4FFE5E5E5FFE5E5E5FFE6E6E6FFE7E7E7FFE7E7
      E7FFE7E7E7FFEFEFEFFFFFFFFFFF7F7F7FFF0000000000000000000000000000
      0000087B7300087B730073BDAD0094CEC6009CCECE00087B7300000000000000
      00000000000000000000000000000000000000000000A98469F1D4BFAFFFE7E2
      DEFFD3D1CEFFFEEFE2FFFBEDDEFFF6E5D4FFD4C8BCFFCEC6C0FFE0DEDBFFF0EB
      E6FFCDB4A0FFA47A5AC700000000000000000000A4004F5ED0004861D800354F
      D400344FD400344ED400334ED400334DD400324DD300324CD400324CD300314B
      D300314AD3002B44D2004250CC000000A400535755FFD3D3D3FFBBBBBBFFBCBC
      BCFFBCBCBCFFBCBCBCFFBCBCBCFFBDBDBDFFBEBEBEFFBEBEBEFFBEBEBEFFBEBE
      BEFFBFBFBFFFC3C3C3FFC5C5C5FF535755FF0000000000000000000000000000
      000000000000087B7300087B730073BDAD00ADD6D600087B7300000000000000
      000000000000000000000000000000000000000000009D715635A67F61FED5C0
      B1FFEBE5E0FFE2D9CFFFC4BFBAFFDACBBEFFEBD4BEFFD6CABEFFE9E1D9FFCEB6
      A3FFA3795AECA47A5A2E00000000000000000000A4001620B4005467D5004C65
      D9003855D5003854D5003854D5005E74DD006176DD005A71DC003651D5003651
      D4003550D4004761D800323BBD000000A400535755FFBCBCBCFF8D8D8DFF8D8D
      8DFF8E8E8EFF8E8E8EFF8E8E8EFF8E8E8EFF8E8E8EFF8E8E8EFF8E8E8EFF8E8E
      8EFF8E8E8EFF8E8E8EFFC7C7C7FF535755FF0000000000000000000000000000
      00000000000000000000087B7300087B730084C6BD00087B7300000000000000
      0000000000000000000000000000000000000000000000000000A1775830A37A
      5EE8BB9B83FFDAC9BBFFEDE4DCFFF4EBE6FFEBDFD5FFD6C2B1FFB9977EFFA379
      59CAA47A5A2E0000000000000000000000000000A4000000A4002738C2005B71
      DA006178DD006179DD005363D0001919AC000000A400556CDA006076DD004D67
      DA00485FD5003741C2000000A4000000A400535755FFBCBCBCFFBCBCBCFFBCBC
      BCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBC
      BCFFBCBCBCFFBCBCBCFFC7C7C7FF535755FF0000000000000000000000000000
      0000000000000000000000000000087B7300087B7300087B7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A0765867A07658CDA47A5BF7A47A5AFEA27859F3A27758BDA47A5A610000
      000000000000000000000000000000000000000000000000A4000000A4000000
      A4000000A4001919AC000000A4000000A4000000A4000000A4000000A4000000
      A4000000A4000000A4000000A40000000000535755AC535755FF535755FF5357
      55FF535755FF535755FF535755FF535755FF535755FF535755FF535755FF5357
      55FF535755FF535755FF535755FF535755970000000000000000000000000000
      00000000000000000000087B7300087B7300087B730000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B0000000000D6C6B500844A2100844A
      2100844A2100DECEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000087B730063BDB500087B7300087B7300000000000000
      000000000000000000000000000000000000000000007B7B7B00EFEFEF00D6D6
      D600DEDEDE00D6D6D600CECECE00D6D6D600D6D6D600D6D6D600ADADAD006B6B
      6B006B6B6B00B5B5B500D6D6D6007B7B7B0000000000844A2100BDA59400BD9C
      8400BD9C8400844A2100DECEC600000000000000000000000000000000000000
      0000C6C6C6009C9C9C00C6C6C600000000009494940084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484009494940000000000000000000000000000000000000000000000
      00000000000000000000087B73006BC6BD0073BDAD00087B7300087B73000000
      000000000000000000000000000000000000000000007B7B7B00F7F7F700BDBD
      BD00BDBDBD00A5A5A5008C8C8C00A5A5A500B5BDBD008C8C8C006B6B6B00CECE
      CE00D6D6D6006B6B6B00C6C6C6007B7B7B0000000000844A2100CEBDAD00A594
      7B00B5947B00AD8C7300844A2100DECEC600000000000000000000000000DEDE
      DE00848C8C009CA5A500848C8C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      00000000000000000000087B73005ABDB50031AD9C0073BDAD00087B7300087B
      730000000000000000000000000000000000000000007B7B7B00F7F7F700B5B5
      B5006B6B6B007B7B7B008C8C8C00636363006B6B6B006B6B6B00B5B5B5008C8C
      8C00C6C6C6006B6B6B00C6C6C6007B7B7B0000000000844A2100CEBDAD00A58C
      7B00A58C7300B5947B00B5947B00844A21000000000000000000DEDEDE00848C
      8C00D6D6D600C6C6C600848C8C000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF00848484000000000000000000087B7300087B7300087B7300087B
      7300087B7300087B7300087B73005ABDB50029AD9C0039AD9C0073BDAD00087B
      7300087B7300000000000000000000000000000000007B7B7B00DEDEDE006B73
      6B009C9C9C00EFE7DE00D6B59400E7DED6006B6B6B00B5BDBD00848484007373
      73006B736B0084848400C6C6C6007B7B7B0000000000EFDED600844A2100D6CE
      BD00A58C7B00A58C7B00BDA59400844A210000000000DEDEDE00848C8C00E7E7
      E700C6C6C600848C8C00C6C6C6000000000084848400FFFFFF00EFEFEF00C6C6
      C600C6C6C600C6C6C600CECECE00CECECE00CECECE00F7F7F700F7F7F700F7F7
      F700FFFFFF00848484000000000000000000087B73005AB5A5005AB5A5005AB5
      AD005AB5AD005ABDAD005ABDAD0042B5A50021A5940021A5940039AD9C0073BD
      AD00087B7300087B73000000000000000000000000007B7B7B00737B7300ADAD
      AD00DECEBD00CE9C7300B5846300CE9C7300D6CEC600949494008C8C8C006B6B
      6B00CECECE009C9C9C00CECECE007B7B7B000000000000000000F7EFEF00844A
      2100CEBDAD00CEBDAD00B5947B00844A2100C6C6C600848C8C00D6D6D600BDBD
      BD00848C8C00DEDEDE00FFFFFF000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF00848484000000000000000000087B7300299C8C00219C8C00219C
      8C00219C8C0021A5940021A5940021A5940021A5940021A5940021A58C0031AD
      9C0073BDAD00087B7300087B730000000000000000007B8484008C948C00E7DE
      D600CE9C7300DEBDA500DEBD9C00DEC6B500CE9C7300E7DED60073737300B5B5
      B500F7F7F700E7E7E700EFEFEF007B7B7B00000000000000000000000000F7EF
      EF00844A2100844A2100844A210084847B00ADADAD00CECECE00BDBDBD00848C
      8C00DEDEDE0000000000000000000000000084848400FFFFFF00EFEFEF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600CECECE00CECECE00CECECE00F7F7
      F700FFFFFF00848484000000000000000000087B7300299C8C00299C8C00219C
      8C00219C8C00219C8C0021A5940021A5940021A5940021A5940021A5940021A5
      8C0031AD9C0073BDAD00087B730000000000000000007B848400C6C6C600CEA5
      8400BD9C7B00BDA58C00C6A58400BDA59400B5947300CEAD8C00C6CECE008C8C
      8C00ADADAD00848484007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000B5B5BD00848C8C00B5BDBD00848C8C00DEDE
      DE00FFFFFF0000000000000000000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700FFFFFF00848484000000000000000000087B73005AB5A5005AB5A5005AB5
      A5005AB5A5005AB5AD0063B5AD0063B5AD005AB5AD005AB5A5005AB5A50052AD
      A5005AB5A50073BDAD00087B73000000000000000000636B6B00DEDEDE00BD94
      6300E7C6AD00EFE7DE00F7EFDE00CEA58400CE9C7300CEA58400DEDEDE00636B
      6B00F7F7F700ADADAD0000000000000000000000000000000000DEDEDE00848C
      8C00848C8C00848C8C00848C8C00D6D6D600A5A5A500848C8C00C6C6C6000000
      00000000000000000000000000000000000084848400FFFFFF00EFEFEF00C6C6
      C600C6C6C600C6C6C600C6C6C600EFEFEF00EFEFEF00E7EFEF00EFEFEF00F7F7
      F700FFFFFF00848484000000000000000000087B730063B5A50063B5AD0063B5
      AD0063B5AD0063B5AD006BB5AD006BBDAD0063B5AD0063B5AD005AB5A50073BD
      B50073BDAD00087B7300087B730000000000000000007B7B7B00A5ADA500C6AD
      9C00CE9C7300EFE7D600F7EFE700DEC6AD00CE9C7300CEBDAD00A5A5A500BDBD
      BD00F7F7F700ADADAD00000000000000000000000000DEDEDE00848C8C00F7F7
      F700EFF7F700EFEFEF00EFEFEF00B5BDBD00848C8C00DEDEDE00848C8C00DEDE
      DE000000000000000000000000000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7EFEF00EFEFEF00EFEFEF00F7F7
      F700FFFFFF00848484000000000000000000087B73008CC6BD008CC6BD008CCE
      C6008CCEC60094CEC60094CEC6007BC6BD006BBDAD006BBDAD0084C6BD0073BD
      AD00087B7300087B7300000000000000000000000000000000006B6B6B00DEDE
      DE00C6A58C00CE9C7300EFD6C600CE9C7300C6AD8C00DEDEDE006B736B00C6C6
      C600FFFFFF00ADADAD00000000000000000000000000848C8C00F7F7F700ADAD
      AD00848C8C00F7F7F700E7E7E700ADADAD00F7F7F70000000000DEDEDE00848C
      8C00DEDEDE0000000000000000000000000084848400FFFFFF00EFEFEF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600F7F7
      F700FFFFFF00848484000000000000000000087B7300087B7300087B7300087B
      7300087B7300087B7300087B730094CEC60073BDB5008CCEBD0073BDAD00087B
      7300087B730000000000000000000000000000000000000000007B847B006B73
      6B00DEDEDE00C6AD9C00C6946B00C6AD9C00DEDEDE006B736B00DEDEDE00F7F7
      F700F7F7F700ADADAD00000000000000000000000000DEDEDE00848C8C000000
      0000DEDEDE00848C8C00FFFFFF00848C8C00000000000000000000000000DEDE
      DE00848C8C00848C8C00B5B5B5000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700FFFFFF008484840000000000000000000000000000000000000000000000
      00000000000000000000087B73009CCECE0094CEC60073BDAD00087B7300087B
      7300000000000000000000000000000000000000000000000000000000009C9C
      9C006B737300CECECE00DEDEDE00CECECE006B736B00B5B5B500C6C6C600C6C6
      C600FFFFFF00ADADAD0000000000000000000000000000000000000000000000
      000000000000848C8C00EFF7F700848C8C000000000000000000000000000000
      0000848C8C00F7F7F700848C8C00B5B5B50084848400FFFFFF00EFEFEF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600F7F7
      F700FFFFFF008484840000000000000000000000000000000000000000000000
      00000000000000000000087B7300ADD6D60073BDAD00087B7300087B73000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD00FFFFFF00A5A5A5006B6B6B00ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ADADAD0000000000000000000000000000000000000000000000
      0000848C8C00EFEFEF00848C8C00DEDEDE000000000000000000000000000000
      0000B5B5B500848C8C00EFEFEF00848C8C0084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700FFFFFF008484840000000000000000000000000000000000000000000000
      00000000000000000000087B730084C6BD00087B7300087B7300000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD0000000000000000000000000000000000000000000000
      0000DEDEDE00848C8C00DEDEDE00000000000000000000000000000000000000
      000000000000B5B5B500848C8C00DEDEDE0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      00000000000000000000087B7300087B7300087B730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C0084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000087B7300087B7300087B7300087B7300087B7300087B7300087B7300087B
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000087B730094CEC6008CCEC60073BDB50063B5AD0063B5AD0063B5AD00087B
      7300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000087B73000884730008847300087B7300000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000008400000084000084000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400000084008484840000000000000000000000000000000000000000000000
      FF00848484000000000000000000000000000000000000000000000000000000
      0000087B730094CEC6005AB5AD004AAD9C00219C8C00219484005AADA500087B
      7300000000000000000000000000000000000000000000000000000000000000
      000000000000087B7300108473006BBDAD006BBDAD0010847B00087B73000000
      0000000000000000000000000000000000000000000000000000840000000084
      0000008400000084000000840000840000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      84000000840000008400848484000000000000000000000000000000FF000000
      8400000084008484840000000000000000000000000000000000000000000000
      0000087B730094CEC60063BDAD0039AD9C00219C8C00219C8C005AADA500087B
      7300000000000000000000000000000000000000000000000000000000000000
      0000087B73000884730063B5AD004AAD9C0042AD9C0063B5AD0008847300087B
      7300000000000000000000000000000000000000000084000000008400000084
      0000008400000084000000840000008400008400000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      840000008400000084000000840084848400000000000000FF00000084000000
      8400000084000000840084848400000000000000000000000000000000000000
      0000087B730094D6CE0063BDB50039AD9C00219C8C00219C8C005AADA500087B
      730000000000000000000000000000000000000000000000000000000000087B
      7300087B730052B5A5005AB5AD00219C8C00219C8C0052ADA5005AB5A500087B
      7300087B73000000000000000000000000008400000000840000008400000084
      000000FF00000084000000840000008400000084000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000084000000840000008400000084008484840000008400000084000000
      84000000840000008400848484000000000008847300087B7300087B7300087B
      73000884730094D6CE0063BDB50042AD9C00219C8C00219C8C005AADA5000884
      7300087B7300087B7300087B7300087B73000000000000000000087B73000884
      73004AAD9C006BBDB50029A5940021A58C00219C8C00219C8C0063B5AD0042A5
      9400087B7300087B7300000000000000000000840000008400000084000000FF
      00000000000000FF000000840000008400000084000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000840000008400000084000000840000008400000084000000
      840000008400848484000000000000000000087B7300218C84007BC6BD0084CE
      BD009CD6CE0094D6CE0063BDB50052B5A500219C8C00219C8C005AADA5005AAD
      A5005AADA50052AD9C0018847B00087B7300000000000000000008847300429C
      94008CCEC6005ABDAD0029A5940021A59400219C8C00219C8C00299C8C006BBD
      AD0031948C00087B7300000000000000000000FF00000084000000FF00000000
      0000000000000000000000FF0000008400000084000000840000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000008400000084000000840000008400000084000000
      84008484840000000000000000000000000000000000087B7300399C940094D6
      CE006BC6B5006BC6B50063BDB5005AB5AD0029A59400219C8C00219C8C00319C
      8C006BBDAD0021948400087B73000000000000000000087B730029948C0094D6
      CE0063C6B50063C6B5004AB5A50029A5940021A58C00219C8C00219C8C00319C
      8C0073BDB500218C8400087B7300000000000000000000FF0000000000000000
      000000000000000000000000000000FF00000084000000840000008400008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000008400000084008484
      84000000000000000000000000000000000000000000000000000884730052AD
      9C008CCEC6006BC6B5005ABDAD0052B5AD0031A59400219C8C00299C8C006BBD
      AD00319C8C00087B73000000000000000000087B7300188C7B007BC6BD0084CE
      C60084CEBD007BCEBD005ABDB50052B5AD0039AD9C00219C8C0063BDAD0063BD
      AD0063BDAD0063B5AD0010847300087B73000000000000000000000000000000
      00000000000000000000000000000000000000FF000000840000008400000084
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000084000000840000008400000084008484
      8400000000000000000000000000000000000000000000000000087B7300087B
      73006BB5AD0084C6BD005AB5AD0052B5A50039A59C00219C8C0073BDB50042A5
      9C00087B7300087B73000000000000000000087B7300087B7300087B7300087B
      7300088473007BCEBD0063BDB5005AB5AD004AB5A50039A5940063BDAD000884
      7300087B7300087B7300087B7300087B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF0000008400000084
      0000008400008400000000000000000000000000000000000000000000000000
      0000000000000000FF0000008400000084000000840000008400000084008484
      840000000000000000000000000000000000000000000000000000000000087B
      7300087B73006BBDAD0073BDB5004AAD9C0039A5940063B5AD0052ADA500087B
      7300087B73000000000000000000000000000000000000000000000000000000
      0000087B730084C6BD0063BDAD005AB5AD004AADA50042AD9C006BBDB500087B
      7300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF00000084
      0000008400000084000084000000000000000000000000000000000000000000
      00000000FF000000840000008400000084008484840000008400000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      0000087B73001084730073BDB50063B5AD005AB5A50063B5AD0010847300087B
      7300000000000000000000000000000000000000000000000000000000000000
      0000087B730084C6BD0063BDAD005AB5A5004AAD9C0042A59C006BBDB500087B
      7300087B73000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000008400000084000000840000840000000000000000000000000000000000
      FF0000008400000084000000840084848400000000000000FF00000084000000
      8400000084008484840000000000000000000000000000000000000000000000
      000000000000087B730018847B007BBDB50073BDB500188C7B00087B73000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000087B730084C6BD0063B5AD005AB5A5004AAD9C0042A59C006BBDB5000884
      7300087B73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF00000084000000840000840000000000000000000000000000000000
      FF000000840000008400848484000000000000000000000000000000FF000000
      8400000084000000840084848400000000000000000000000000000000000000
      00000000000000000000087B73002994840029948400087B7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000087B730084C6BD007BC6BD007BC6B50073BDB50073BDB5006BBDB5000884
      7300087B73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000840000008400000000000000000000000000000000
      00000000FF000000840000000000000000000000000000000000000000000000
      FF00000084000000840000008400000000000000000000000000000000000000
      0000000000000000000000000000087B7300087B730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000087B7300087B7300087B7300087B7300087B7300087B7300087B7300087B
      7300087B73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000084000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000028C8E8DFF8C8E8DFF828484FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000525252008C848400848484008484
      84008C8C8C0084848400848484008C8C840084848400848484008C8C84006B6B
      6B0073737300737B7B0073737300525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C8E8DFFB7B8B8FFA3A4A3FF828484FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000525252008C848400525252005252
      52006363630052525200525252006363630052525200525252005A5A5A005A5A
      5A008C8C8C009C9C9C008C8C8C00525252000000000000000000000000000000
      000000000000000000006A6E6C89808381FF808381FF808381FF808381FF8C8E
      8DFFB7B8B8FFA3A4A3FFA3A4A3FF828484FF0000000000000000000000000000
      00000000000000000000A46534CCA46534FFA46534FFA46534CC000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000525252006B6B6B00848484007B7B
      7B00525252008484840084848400525252008484840084848400525252005A5A
      5A008C8C8C008C8C8C008C8C8C0052525200898E8CA3868B89FF858A88FF858A
      88FF858A88FF7B807EFF808381FFDCC8B3FFCFAC8BFFD1A880FFD0B399FF8083
      81FFA3A4A3FFA3A4A3FF6A6E6CD8000000000000000000000000000000000000
      00000000000000000000A46534FFE6CEB7FFE6CEB7FFA46534FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000525252006B6B6B00848484007B7B
      7B00525252007B7B7B0084848400525252008484840084848400525252005A5A
      5A00848484008C8C8C008C8C8C0052525200868B89FBFFFFFFFFFFFFFFFFFFFF
      FFFFCDCFCFFF808381FFD1B89FFFD6B391FFDFC5AFFFE3CAB2FFD6BAA0FFD3B4
      97FF808381FF737675E200000000000000000000000000000000000000000000
      00000000000000000000A46534FFE6CEB7FFD9AD86FFA46534FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000525252008C8C8400525252005252
      5200636363005252520052525200636363005252520052525200636363006363
      63005A5A5A005A5A5A005A5A5A0052525200868B89FBF9FAFAFFEFF0F0FFEFF0
      F0FF808381FFC3B5A7FFD0AB89FFE5CAB3FFEBD7C3FFEAD4C1FFEEDDCFFFDABD
      A3FFCEAF93FB808381FF00000000000000000000000000000000000000000000
      00000000000000000000A46534FFE6CEB7FFD9AD86FFA46534FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000525252006B6B6B007B7B7B007B7B
      7B00525252007B7B7B007B7B7B00525252007B7B7B007B7B7B00525252005252
      5200848484008C8C8C008484840052525200868B89FDFDFEFEFFEFF0F0FFEFF0
      F0FF808381FFD6BFA9FFE0C1A5FFEEDED0FFF2E5DAFFEDDCCDFFECD9C8FFE8D0
      BCFFD1A780FD808381FF00000000000000000000000000000000A46534CCA465
      34FFA46534FFA46534FFA46534FFD9AD86FFD9AD86FFA46534FFA46534FFA465
      34FFA46534FFA46534CC00000000000000000000000000000000A46534CCA465
      34FFA46534FFA46534FFA46534FFA46534FFA46534FFA46534FFA46534FFA465
      34FFA46534FFA46534CC00000000000000005A635A006B6B6B00848484007B7B
      7B00525252007B7B7B0084848400525252007B7B7B0084848400525252005A52
      5200848484008C8C8C008484840052525200878C8AFDFFFFFFFFEFF0F0FFEFF0
      F0FF808381FFD0B8A2FFDFC0A5FFF1E4D9FFF3EAE0FFF2E7DDFFE9D4C1FFDFBE
      A0FFD0A681FE808381FF00000000000000000000000000000000A46534FFE5CC
      B4FFDBB795FFDBB694FFDAB492FFDAB390FFD9AD86FFD8AA83FFD7A87FFFD7A6
      7DFFE0BE9FFFA46534FF00000000000000000000000000000000A46534FFE5CC
      B4FFDBB795FFDBB694FFDAB492FFDAB390FFD9AD86FFD8AA83FFD7A87FFFD7A6
      7DFFE0BE9FFFA46534FF000000000000000052525200A59C9C005A5A5A005A5A
      5A007B7373005A5A5A005A5A5A006B6B63005A5A5A005A5A5A00636363006363
      630052525200525252005252520052525200878C8AFDFFFFFFFFEFF0F0FFC6C7
      C7FF808381FFBBAEA3FFCFA985FFF2E6DCFFF7EEE8FFF5ECE4FFECDACAFFD8B2
      8EFFCBAF97FD808381FF00000000000000000000000000000000A46534FFE8D3
      C0FFE7D1BBFFE7D1BCFFE6CEB7FFE6CEB7FFE6CEB7FFE6CEB7FFE6CDB6FFE6CC
      B5FFE6CCB6FFA46534FF00000000000000000000000000000000A46534FFE8D3
      C0FFE7D1BBFFE7D1BCFFE6CEB7FFE6CEB7FFE6CEB7FFE6CEB7FFE6CDB6FFE6CC
      B5FFE6CCB6FFA46534FF00000000000000005252520042423900393939003931
      3100393131003131310031312900313129003131290031312900313129003131
      290031312900313129003931310052525200868B89FDFFFFFFFFEFF0F0FFEFF0
      F0FFD5D7D6FF808381FFC8B7A8FFD2AC8AFFE7D3BFFFEAD7C5FFD9BA9CFFCBAD
      90FF808381FF6B6F6D3100000000000000000000000000000000A46534CCA465
      34FFA46534FFA46534FFA46534FFE6CEB7FFE6CEB7FFA46534FFA46534FFA465
      34FFA46534FFA46534CC00000000000000000000000000000000A46534CCA465
      34FFA46534FFA46534FFA46534FFA46534FFA46534FFA46534FFA46534FFA465
      34FFA46534FFA46534CC0000000000000000525252004A4A4200B5BDBD00B5BD
      BD00B5BDBD00B5BDBD00B5BDBD00B5BDBD00B5BDBD00B5BDBD00B5BDBD00B5BD
      BD00B5BDBD00B5BDBD004242390052525200878C8AFDFFFFFFFFEFF0F0FFC6C7
      C7FFC6C7C7FFA6A9A8FF808381FFC8BAAEFFD2BCA6FFD4BAA2FFCDB9A8FF8083
      81FF7074735C0000000000000000000000000000000000000000000000000000
      00000000000000000000A46534FFE6CEB7FFE6CEB7FFA46534FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000052525200B5BDBD008C9C9C008C9C
      9C008C9C9C008C9C9C008C9C9C008C9C9C008C9C9C008C9C94008C9C94008C9C
      94008C9C94008C9C9C00B5BDBD0052525200868B89FDFFFFFFFFEFF0F0FFEFF0
      F0FFEFF0F0FFEFF0F0FFD5D6D6FF808381FF808381FF808381FF808381FF8084
      82FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A46534FFE6CEB7FFE6CEB7FFA46534FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000052525200B5BDBD005A7B73005A7B
      73005A7B73005A7B73005A7B73005A7B73005A7B7300425A5200425A5A00394A
      4200293939005A737300B5BDBD0052525200878C8AFDFFFFFFFFEFF0F0FFC6C7
      C7FFC6C7C7FFC6C7C7FFC6C7C7FFC6C7C7FFC6C7C7FFEFF0F0FFFFFFFFFF858A
      88FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A46534FFE6CEB7FFE6CEB7FFA46534FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000052525200B5BDBD00738C8400738C
      8400738C8400738C8400738C8400738C8400738C8400637B7B006B8484006B7B
      7B006B847B00738C8400B5BDBD0052525200868B89FDFFFFFFFFEFF0F0FFEFF0
      F0FFEFF0F0FFEFF0F0FFEFF0F0FFEFF0F0FFEFF0F0FFEFF0F0FFFFFFFFFF858A
      88FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A46534CCA46534FFA46534FFA46534CC000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000052525200B5BDBD00B5BDBD00B5BD
      BD00B5BDBD00B5BDBD00B5BDBD00B5BDBD00B5BDBD00B5BDBD00B5BDBD00B5BD
      BD00B5BDBD00B5BDBD00B5BDBD0052525200878C8AFDFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF858A
      88FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      520052525200525252005252520052525200979B9AD0858A88FF858A88FF858A
      88FF858A88FF858A88FF858A88FF858A88FF858A88FF858A88FF858A88FF8A8F
      8DAB000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006E6D
      6E00696969006868680067666700646465006464640063636300636363006363
      6300646464006666660000000000000000000000000000000000000000000000
      00000000000000000000395A5A00313939004242420031313100395A5A000000
      00000000000000000000000000000000000000000000848C8C00848C8C00848C
      8C00848C8C00848C8C00848C8C00848C8C00848C8C00848C8C00848C8C00848C
      8C00848C8C00848C8C0000000000000000000000000018524A00215A5200215A
      5200215A5200215A5200215A5200215A5200215A5200215A5200215A5200215A
      5200215A5200215A520018524A00000000000000000000000000000000006E6D
      6E000000CC000000CC000000CC000000CC000000CC000000CC000000CC000000
      CC000000CC006666660000000000000000000000000000000000000000000000
      00000000000000000000395A5A00BDE7E700CEF7F700B5D6D600395A5A000000
      00000000000000000000000000000000000000000000848C8C00EFEFEF00B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500848C8C00000000000000000000000000215A52007BB5AD008CD6
      CE008CD6CE008CCEC6008CCEC60084C6BD0084C6BD0084BDBD0084BDB50084BD
      B5007BB5AD0063948C00215A5200000000000000000000000000000000007574
      75000000CC000000CC000000CC000000CC000000CC000000CC000000CC000000
      CC000000CC006969690000000000000000000000000000000000000000000000
      000000000000425A5A00395A5A005A84840084ADAD00638C8C00395A5A000000
      00000000000000000000000000000000000000000000848C8C00FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00B5B5B500848C8C00000000000000000000000000215A520094D6CE005AC6
      BD005AC6BD005ABDB50052B5AD0052B5AD009CCEC6004AA59C004A9C9400429C
      9400429484006BA5A500215A5200000000000000000000000000000000007978
      79000000CC000000CC000000CC000000CC000000CC000000CC000000CC000000
      CC000000CC006E6D6E0000000000000000000000000000000000000000000000
      000000000000425A5A00395A5A00C6EFEF00CEFFF700ADDEDE00395A5A000000
      00000000000000000000000000000000000000000000848C8C00FFFFFF00DEDE
      DE00CECECE00C6C6C60000000000005A8C00636363008C8C8C00CECECE00DEDE
      DE00B5B5B500848C8C00000000000000000000000000215A520094D6D60063C6
      BD0063C6BD006BC6BD00A5D6CE009CCEC600BDDED600BDDED60063ADA5004A9C
      940042948C0073ADA500215A5200000000000000000000000000000000007E7D
      7E000000CC000000CC000000CC000000CC000000CC000000CC000000CC000000
      CC000000CC007372730000000000000000000000000000000000000000000000
      00007363630084635A00845A4A009CADA5009CADA5009CB5AD00846B5A007363
      63000000000000000000000000000000000000000000848C8C00FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00005A8C0021424A0031526B00005A8C009C9C9C00D6D6
      D600ADADAD00848C8C00000000000000000000000000215A520094D6D60063C6
      BD0063C6BD00BDDED60073C6BD005AB5AD00A5CECE0063B5AD00BDD6D6004AA5
      94004A948C0073ADAD00215A5200000000000000000000000000000000008583
      85007A787A007877780077757700747374007371740071707100706E70006E6D
      6E0072717200777677000000000000000000000000000000000000000000735A
      4A0084524200BD9C8C00E7D6C600EFDECE00E7D6C600DEC6B500B5947B00845A
      4A007B635A0000000000000000000000000000000000848C8C00FFFFFF00DEDE
      DE00CECECE00CECECE0073737300395A73008CADC6005284A500005A8C008C8C
      8C0084848400848C8C00000000000000000000000000215A520084D6CE0052C6
      BD0063C6BD00BDDED600CEDED6005AB5AD005AB5AD0063B5AD0084BDB50052A5
      9C004A9C940073ADA500215A5200000000000000000000000000000000008583
      850000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4
      ED0000D4ED007C7B7C0000000000000000000000000000000000736363008452
      4200D6C6B500E7D6C600C69C7300FFFFFF00B5845200BD8C5A00DEC6AD00CEAD
      9C00845A4A0073636300000000000000000000000000848C8C00FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00005A8C00C6E7EF00639CCE005284A500005A
      8C0073737300848C8C00000000000000000000000000215A520084D6CE0052C6
      B50052C6B5009CD6CE006BC6BD0063BDB5009CD6CE00A5D6CE0052AD9C0052A5
      9C004A9C94006BA59C00215A5200000000000000000000000000000000008D8A
      8D0000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4
      ED0000D4ED00817F8100000000000000000000000000000000007B524A00BDA5
      9C00EFE7D600DEBDA500FFFFFF00DEBDA500CEAD8400BD8C5A00B57B4A00DEC6
      AD00B5947B0084635200000000000000000000000000848C8C00FFFFFF00DEDE
      DE00CECECE00CECECE00CECECE00B5B5B500005A8C00C6E7EF006BA5CE005284
      A500005A8C00848C8C00000000000000000000000000215A52007BD6C60052C6
      B50052C6B50052BDB50063C6BD00CEDED600CEDED6009CD6CE0052ADA5004A9C
      94004A948C005A948C00215A520000000000000000000000000000000000928F
      920000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4
      ED0000D4ED0086848600000000000000000000000000000000007B524200EFE7
      E700EFDECE00EFD6CE00FFFFFF00E7D6C600E7CEB500D6BD9C00BD8C5A00BD8C
      6300DEC6B500845A4A00000000000000000000000000848C8C00FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6D6D600005A8C00C6EFEF006BAD
      CE005284A500005A8C00005A8C000000000000000000215A52007BD6C60052C6
      B50052C6B50052BDB5004AADA50052ADA50063B5AD0042A59C0039948C00398C
      840031847B005A948C00215A5200000000000000000000000000000000009693
      960000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4ED0000D4
      ED0000D4ED008B888B00000000000000000000000000000000007B4A3900FFF7
      F700EFE7D600F7E7DE00FFFFFF00F7F7EF00EFE7E700E7DED600CEAD9400B584
      5200E7D6CE007B4A3900736363000000000000000000848C8C00FFFFFF00DEDE
      DE00CECECE00CECECE00CECECE00CECECE00CECECE00B5B5B500005A8C00C6EF
      EF006BADD6005284A500005A8C00005A8C00215A5200215A52005A9C94003184
      7B0031847B00317B7300317B730031736B0029736B00296B6300296B63002963
      5A0029635A00215A5200215A5200215A52000000000000000000000000009996
      990089888A00878687008583860082818100808080007F7E7E007E7C7E007B7B
      7C00848284008F8D8F00000000000000000000000000000000007B4A3900FFFF
      FF00F7EFE700FFF7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6CEC600BD8C
      5A00EFDECE007B4A3900736363000000000000000000848C8C00FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6D6D600005A
      8C00C6EFEF006BADD6005284A500005A8C00215A5200A5BDB500D6E7DE00D6E7
      DE00D6E7DE00D6E7DE00D6E7DE00D6E7DE00D6E7DE00D6E7DE00D6E7DE00D6E7
      DE00D6E7DE00D6E7DE0094ADAD00215A52000000000000000000000000009894
      980016D2730016D2730016D2730016D2730016D2730016D2730016D2730016D2
      730016D2730094929400000000000000000000000000000000007B524200F7EF
      EF00F7EFEF00FFF7F700FFFFFF00F7F7EF00F7E7DE00EFDED600E7D6C600C69C
      7B00E7D6C6007B524200000000000000000000000000848C8C00EFEFEF0000A5
      C600BDBDBD0000A5C600BDBDBD0000A5C600BDBDBD0000A5C600BDBDBD0000A5
      C600005A8C00C6EFEF0073ADCE00005A8C00215A5200D6E7DE004A4A4A005A63
      630063636300636B6B006B6B6B006B6B6B006B7373007373730073737300737B
      7B00737B7B00949C9C00D6E7DE00215A5200000000000000000000000000A29E
      A20016D2730016D2730016D2730016D2730016D2730016D2730016D2730016D2
      730016D273009996990000000000000000000000000000000000734A3900C6AD
      A500FFFFF700F7F7EF00FFF7F700F7F7EF00F7EFDE00EFE7D600E7D6C600E7D6
      C600BD9C8C0073524200000000000000000000000000848C8C0000A5C60039B5
      EF0000A5C60039B5EF0000A5C60039B5EF0000A5C60039B5EF0000A5C60039B5
      EF0000A5C600005A8C00005A8C00005A8C00215A5200D6E7DE00737B73005A5A
      5A005A635A005A63630063636300636B6300636B6B006B6B6B006B6B6B006B73
      730073737300ADB5B500D6E7DE00215A5200000000000000000000000000A6A3
      A60016D2730016D2730016D2730016D2730016D2730016D2730016D2730016D2
      730016D273009E9B9E0000000000000000000000000000000000000000007B4A
      3900E7D6D600FFFFF700F7EFEF00F7EFE700EFE7DE00EFDED600EFE7DE00D6C6
      BD007B52420000000000000000000000000000000000848C8C0000A5C600C6EF
      FF0000A5C600C6EFFF0000A5C600C6EFFF0000A5C600C6EFFF0000A5C600C6EF
      FF0000A5C600000000000000000000000000215A52005A847B00D6E7DE00D6E7
      DE00D6E7DE00D6E7DE00D6E7DE00D6E7DE00D6E7DE00D6E7DE00D6E7DE00D6E7
      DE00D6E7DE00D6E7DE006B8C8C00215A5200000000000000000000000000A7A4
      A70016D2730016D2730016D2730016D2730016D2730016D2730016D2730016D2
      730016D27300A39FA3000000000000000000000000000000000000000000734A
      39007B4A3900C6ADA500F7EFEF00FFFFFF00FFFFF700EFE7E700BDA59C007B4A
      3900734A3900000000000000000000000000000000000000000000A5C60000A5
      C60000A5C60000A5C60000A5C60000A5C60000A5C60000A5C60000A5C60000A5
      C60000A5C60000000000000000000000000000000000215A5200215A5200215A
      5200215A5200215A5200215A5200215A5200215A5200215A5200215A5200215A
      5200215A5200215A5200215A520000000000000000000000000000000000ACA8
      AC00ACA8AC00ACA8AC00ACA8AC00ACA8AC00ACA8AC00ACA8AC00ACA8AC00AAA7
      AA00A9A5A900A8A4A80000000000000000000000000000000000000000000000
      000000000000734A3900734A39007B4A39007B4A3900734A3900734A39000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000313129000000A5000000
      A500313129003131290031312900313129003131290031312900313129003131
      2900313129003131290031312900313129000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004242A50018189C000808A5000000A5000000A5000808
      A5002121A5006B6BC60000000000000000000000000000000000000000000000
      0000000000006B525A006B525A006B4A5A00634A5200634A5200634A52000000
      00000000000000000000000000000000000000000000313129000000A5005252
      DE000000A5003131290031312900005A8C00005A8C00005A8C00005A8C00005A
      8C00005A8C00005A8C00005A8C00313129009595950081818100818181008181
      8100818181008181810081818100818181008181810081818100818181008181
      8100818181009595950000000000000000009494940084848400848484008484
      8400848484004242940000009C0039429C004A639C004AA5A5004A9C9C00428C
      940042394A0000009C002929A500000000000000000000000000000000007352
      5A0073525A0073525A0073525A006B525A006B525A006B525A006B4A5A00634A
      5200634A52000000000000000000000000000000A5000000A5000000A5000000
      CE005252DE000000A500B5B5B5003131290031312900004A7300004A7300004A
      7300004A7300004A7300004A73003129290081818100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0081818100000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF007B7BBD0018189C006B7BBD00737BBD007384BD0084C6CE008CD6CE008CB5
      B500A5945A006B63420018107B002929A5000000000000000000735A6300735A
      63007B5A6300A59C9C00C6BDC600D6D6D600D6D6D600C6BDC600A59C9C006B52
      5A00634A5200634A520000000000000000000000A5005252DE005252DE000000
      CE000000CE005252DE000000A500A5A5A500949C9C0031312900313129000039
      5A0000395A0000395A0000395A003131290081818100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0081818100000000000000000084848400FFFFFF00BDBDBD00C6C6
      C60010109C006B7BCE004A5ABD00314AAD00314AA500428CB50052BDBD008484
      3100AD9C520094842100736B4A0008089400000000007B5A63007B6363008C73
      7B00CECECE00DEE7E700DEE7E700D6D6D600CED6D600DEDEDE00DEDEDE00CEC6
      CE00846B73006B4A5A00634A5200000000000000A5008C8CE7003939DE004242
      DE003939DE003939DE008C8CE7000000A5008C8C8C009C9C9C00949C9C003131
      2900424A4200424A4200424A42003131290081818100FFFFFF00FFFFFF005357
      550053575500FFFFFF00F9F9F900FCFCFC00FFFFFF005357550053575500FFFF
      FF00FFFFFF0081818100000000000000000084848400FFFFFF00B5B5B500BDBD
      BD000000A500526BC6003152BD00314AB500314AAD003963AD005A9C9400A584
      18009C7B1000A5943900A58C39000000A500000000007B636B00846B6B00D6CE
      CE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEE7E700DEDE
      DE00CECECE00735A6300634A5200000000000000A5008C8CE7008C8CE7008C8C
      E7005252DE008C8CE7000000A50094949400848484007B7B7B00949C9C003131
      29003139310031393100313931003131290081818100FFFFFF0053575500FFFF
      FF00FFFFFF0053575500FFFFFF00FFFFFF0053575500FFFFFF00FFFFFF005357
      5500FFFFFF0081818100000000000000000084848400FFFFFF00BDBDBD00C6C6
      C6001010A5005A6BCE003952BD003152BD00314AB500314AAD0052638C005A5A
      7300525A7300525A6B005A63730008089C0084636B00846B6B00B5ADAD00E7E7
      E700E7E7E700E7EFEF009CA5A500C6CECE00E7EFEF00E7E7E700E7E7E700DEE7
      E700DEDEDE00B5ADAD006B525A00634A52000000A5000000A5000000A5008C8C
      E7008C8CE7000000A5009494940094949400848484007B7B7B00949C94003131
      29002129210021292100212921003131290081818100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0053575500FFFFFF0053575500FFFFFF00FFFFFF005357
      5500FFFFFF0081818100000000000000000084848400FFFFFF00B5B5B500BDBD
      BD005A5AA5001021AD005A73CE004A63C6003952BD003152B500314AB500425A
      B500425AAD004252AD002929AD0021219C00846B73008C6B7300D6D6D600E7EF
      EF00EFEFEF00EFEFEF009C9C9C0039393900EFEFEF00EFEFEF00E7E7E700E7E7
      E700DEE7E700D6D6D6006B525A006B525A0000000000313129000000A5008C8C
      E7000000A5009C9C9C009494940094949400848484007B7B7B009C9C9C003131
      29000000000000000000000000003131290081818100FFFFFF00FBFBFB00FFFF
      FF00FFFFFF00FFFFFF0053575500FFFFFF0053575500FFFFFF00FFFFFF005357
      5500FFFFFF0081818100000000000000000084848400FFFFFF00BDBDBD00C6C6
      C600C6C6C60039429C000008A5005263C6005A73CE005A73CE005A73C6005A6B
      BD00636BC6001821AD003131A500FFFFFF008C73730094737B00E7E7E700E7E7
      E700EFEFEF00EFF7F700F7F7F700424A4A0063636300EFEFEF00EFEFEF00E7E7
      E700DEDEDE00DEDEDE007B636B006B525A0000000000313129000000A5000000
      A5009C9C9C009C9C9C009494940094949400BDC6BD00848484009C9C9C003131
      29000000000000000000000000003131290081818100FFFFFF00FFFFFF005357
      5500535755005357550053575500FFFFFF0053575500FFFFFF00FFFFFF005357
      5500FFFFFF0081818100000000000000000084848400FFFFFF00B5B5B500BDBD
      BD00BDBDBD009C9C9C00A5A5CE003139AD000808A5000000A5000000A5000808
      A5003139B5006B6B8C0000000000000000008C7373009C848400DEE7E700D6DE
      DE00F7F7F700F7F7F700F7F7F7006B6B6B005A5A5A00EFF7F700EFEFEF00E7EF
      EF00D6D6D600D6DED600847373006B525A000000000031312900B5B5B5009C9C
      A5009C9C9C0094949400949494008C8C8C008C8C8C00C6C6C600949494003131
      29000000000000000000000000003131290081818100FFFFFF0053575500FFFF
      FF00FFFFFF00FFFFFF0053575500FFFFFF0053575500FFFFFF00FFFFFF005357
      5500FFFFFF0081818100000000000000000084848400FFFFFF00BDBDBD00C6C6
      C600C6C6C6009C9C9C00EFEFEF00EFEFEF00C6C6C600EFEFEF00EFEFF700C6C6
      C600FFFFFF00848484000000000000000000947B7B009C7B7B00E7DEDE00EFF7
      F700F7F7F700EFEFEF007B7B7B00DEDEDE00F7F7F700F7F7F700EFEFEF00EFEF
      EF00E7E7E700DEDEDE00735A630073525A000000000031312900B5B5B500A5A5
      A5009C9C9C00949494008C8C8C008C8C8C00B5B5B500CECECE00949494003131
      29000000000000000000000000003131290081818100FFFFFF0053575500FFFF
      FF00FFFFFF00FFFFFF0053575500FFFFFF0053575500FFFFFF00FFFFFF005357
      5500FFFFFF0081818100000000000000000084848400FFFFFF00B5B5B500BDBD
      BD00BDBDBD009C9C9C00E7E7E700E7E7E700C6C6C600E7E7E700E7E7E700C6C6
      C600FFFFFF00848484000000000000000000947B7B009C848400CEC6C600EFF7
      F700D6D6D6007B7B7B00F7F7F700FFFFFF00F7F7F700F7F7F700EFEFEF00EFEF
      EF00E7E7E700C6C6C6007B5A6300735A63000000000031312900B5B5B500A5A5
      A500949494008C8C8C00848484007B7B7B0073737300737373008C9494003131
      29000000000000000000000000003131290081818100FFFFFF0053575500FFFF
      FF00FFFFFF00FFFFFF0053575500FFFFFF0053575500FFFFFF00FFFFFF005357
      5500FFFFFF0081818100000000000000000084848400FFFFFF00B5BDB500C6C6
      C600C6C6C6009C9C9C00EFEFEF00EFEFEF00C6C6C600EFEFEF00EFEFEF00C6C6
      C600FFFFFF00848484000000000000000000000000009C848400AD948C00EFEF
      E700ADADAD00F7F7F700FFFFFF00F7FFFF00F7F7F700F7F7F700EFEFEF00EFEF
      EF00E7E7E7008C737B007B5A6300735A63000000000031312900ADB5B5009494
      94008C8C8C00848484007B7B7B00737373006B6B6B006B6B6B008C9494003131
      29000000000000000000000000003131290081818100FFFFFF00FFFFFF005357
      55005357550053575500FFFFFF00FAFAFA00FFFFFF005357550053575500FFFF
      FF00FFFFFF0081818100000000000000000084848400FFFFFF009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C00FFFFFF00848484000000000000000000000000009C848400A58C8C00BDAD
      AD00EFEFEF00F7F7F700F7F7F700E7EFEF00E7EFEF00EFF7F700EFEFEF00E7E7
      E700A5949C007B636B007B5A6300000000000000000031312900ADADAD008C8C
      8C00848484007B7B7B00737373006B6B6B0063636300636363008C9494003131
      29000000000000000000000000003131290081818100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0081818100000000000000000084848400FFFFFF00B5B5B500B5B5
      B500BDB5B5009C9C9C00BDBDBD00BDBDBD009C9C9C00BDBDBD00BDBDBD009C9C
      9C00FFFFFF008484840000000000000000000000000000000000A58C8C00AD8C
      8C00B59C9C00DED6D600EFF7F700E7E7E700E7E7E700EFEFEF00D6CED6009C84
      8400846B6B007B636B0000000000000000000000000031312900ADB5B5009C9C
      9C00949494008C948C008C8C8C00848484007B8484007B7B7B00A5A5A5003131
      29000000000000000000000000003131290081818100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0081818100000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00848484000000000000000000000000000000000000000000A58C
      8C00A58C8C00A58C8C00A58C8C00AD9C9C00AD9C9C009C7B84008C7373008C6B
      7300846B6B000000000000000000000000000000000031312900313129003131
      2900313129003131290031312900313129003131290031312900313129003131
      2900313129003131290031312900313129009999990081818100818181008181
      8100818181008181810081818100818181008181810081818100818181008181
      8100818181008181810000000000000000009C9C9C0084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000AD9494009C8484009C848400947B7B0094737B008C7373008C6B
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000A5C60000A5C60000A5C60000A5
      C60000A5C6000000000000000000000000000000000000426B0000426B000042
      6B0000426B0000426B0000426B0000426B0000426B0000426B0000426B000042
      6B0000426B0000426B0000426B00000000000000000094949400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840094949400000000009F9F9F0081818100818181008181
      8100818181008181810081818100818181008181810081818100818181008181
      8100818181009F9F9F0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000A5C60000A5C60000A5C60018A5
      C60018A5C60000A5C600000000000000000000426B0000426B00217BBD00397B
      A500636B73006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B00397BA500397B
      A500397BA500217BB50000426B0000426B000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00848484000000000081818100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00F7F7F700FEFEFE00FFFFFF00FFFF
      FF00FFFFFF008181810000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A5C60000A5
      C60018C6DE0010A5C600000000000000000000426B0000426B002184C600636B
      7300EFEFEF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00FFFFFF00636B63002184
      C6002184C6002184C60000426B0000426B000000000084848400FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700E7E7E700ADAD
      AD00BDBDBD00FFFFFF00848484000000000081818100FFFFFF00EDEDED00ECEC
      EC00EEEEEE00EFEFEF00EEEEEE008888880086868600F0F0F000F2F2F200F2F2
      F200FFFFFF008181810000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A5
      C60010B5CE0010B5CE0021A5C6000000000000426B0000426B002184C600636B
      6300FFFFFF00E7E7E700D6DEDE00BDC6C600B5B5B500FFFFFF00FFFFFF00636B
      63002184C6002984C60000426B0000426B000000000084848400FFFFFF00EFEF
      EF00C6C6C600C6C6C600C6C6C600CECECE00CECECE00B5B5B500949494009C9C
      9C00ADADAD00FFFFFF00848484000000000081818100FAFAFA00DCDCDC00D3D3
      D300EDEDED00EEEEEE00EDEDED007171710069696900EEEEEE00F1F1F100F2F2
      F200FFFFFF008181810000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008ADCE0008C6DE0021A5C6000000000000426B0000426B002184C600636B
      6300FFFFFF00E7EFEF00E7E7E700D6DEDE00B5BDBD00FFFFFF00FFFFFF00FFFF
      FF00636B63002984C60000426B0000426B000000000084848400FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6D6D60073737300848484009494
      94009C9C9C00FFFFFF00848484000000000081818100F7F7F7009F9F9F007F7F
      7F00EDEDED00EEEEEE00EDEDED00646464005E5E5E00C2C2C200F1F1F100F1F1
      F100FFFFFF008181810000000000000000000000000000000000000000000000
      00000000000000A5C60000A5C60000000000000000000000000000000000009C
      C60000ADCE0018CEDE0010A5C6000000000000426B0000426B002184C600636B
      6300FFFFFF00EFEFEF00EFEFEF00E7EFEF00CECECE00B5BDBD00B5BDBD00FFFF
      FF00636B63002984C60000426B0000426B000000000084848400FFFFFF00EFEF
      EF00B5B5B5005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A00636363006B6B
      6B00DEDEDE00FFFFFF00848484000000000081818100E1E1E1006B6B6B006C6C
      6C009B9B9B00C3C3C300C5C5C5005E5E5E005E5E5E00ABABAB00F0F0F000F0F0
      F000FFFFFF00818181000000000000000000000000000000000000000000007B
      7B0000A5C60021E7FF0000A5C600000000000000000000A5C600009CBD0000A5
      C60008D6EF0008C6DE0018A5C6000000000000426B0000426B002184C600636B
      6300FFFFFF00EFEFEF00EFEFEF00EFEFEF00E7EFEF00DEDEDE00CECECE00FFFF
      FF00636B63002984C60000426B0000426B000000000084848400FFFFFF00EFEF
      EF006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B00D6D6
      D600F7F7F700FFFFFF008484840000000000818181009B9B9B005E5E5E007676
      76005E5E5E0060606000737373005E5E5E005E5E5E009B9B9B00EEEEEE00F0F0
      F000FFFFFF008181810000000000000000000000000000000000007B7B0000A5
      C60021E7FF0021E7FF0000A5C60000A5C60000A5C60000A5C60000ADC60010C6
      DE0008CEDE0000CEE70018A5C6000000000000426B0000426B002184C600636B
      6300FFFFFF00EFF7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00FFFF
      FF00636B63002984C60000426B0000426B000000000084848400FFFFFF00EFEF
      EF005A5A5A005A5A5A00B5B5B5005A5A5A006B6B6B006B6B6B00CED6D600EFEF
      EF00F7F7F700FFFFFF0084848400000000007E7F7F009D9D9D009B9B9B00E5E5
      E5009B9B9B00858585005E5E5E005E5E5E005E5E5E007F7F7F009F9F9F009FEE
      F200A6EEF3007F9D9D00000000000000000000000000007B7B0000A5C60021E7
      FF0000C6DE0021E7FF0000DEF70000DEF70000DEF70000DEF70000DEF70008CE
      DE0000C6DE0010BDD60018A5BD000000000000426B0000426B002184C600636B
      6300FFFFFF00EFF7F700B5B5B500B5B5B500B5B5B500B5B5B500EFEFEF00FFFF
      FF00636B63002984C60000426B0000426B000000000084848400FFFFFF00EFEF
      EF006B6B6B00D6D6D600EFEFEF00D6D6D6006B6B6B00636B6B00EFEFEF00EFEF
      EF00F7F7F700FFFFFF00848484000000000080808000FAFAFA00EAEAEA00EBEB
      EB00E8E8E8009C9C9C005E5E5E005E5E5E00616161005F5F5F005E5E5E007279
      7A00879A9B005EE6ED0036DDE60003F3FF00007B7B0000A5C60029E7FF0031E7
      FF0029DEF70000C6D60000C6D60000C6D60018D6EF0018D6EF0018D6EF0008CE
      DE0000D6EF0018ADC60010A5BD000000000000426B0000426B002184C600636B
      6300FFFFFF00EFF7F700EFF7F700EFF7F700EFF7F700EFEFEF00EFEFEF00FFFF
      FF00636B63002984C60000426B0000426B000000000084848400FFFFFF00EFEF
      EF00C6C6C600C6C6C600B5B5B5005A5A5A005A5A5A005A5A5A00C6C6C600C6C6
      C600F7F7F700FFFFFF00848484000000000081818100FFFFFF00EBEBEB00E7E7
      E7009E9E9E00636363005E5E5E0075757500AEAEAE00B7B7B70074999B006CE8
      EC0072F7FD0043F3FC0024ECF6000AF3FF0000A5C60029E7FF0029E7F70031E7
      FF0031E7F70031E7F70029E7F70029DEF70018D6EF0018D6EF0018D6EF0000CE
      E70010BDD60010A5BD00007B7B000000000000426B0000426B002184C600636B
      6300FFFFFF00EFF7F700B5B5B500B5B5B500B5B5B500B5B5B500EFEFEF00FFFF
      FF00636B63002984C60000426B0000426B000000000084848400FFFFFF00EFEF
      EF00EFEFEF00EFEFEF006B6B6B006B6B6B006B6B6B00D6D6D600EFEFEF00EFEF
      EF00F7F7F700FFFFFF00848484000000000081818100FFFFFF00E9E9E900ACAC
      AC00676767005F5F5F0096969600D7D7D700ABEDF0004EF2FA006AF6FD00BBFA
      FE00BFFBFE006EF6FD0022F0FA000DF3FF00007B7B0000A5C60029E7FF0029E7
      F70031E7F70029DEF70029E7F70029DEF70010CEE70000CEE70000D6F70010BD
      DE0010A5C600007B7B00000000000000000000426B0000426B00218CC600636B
      6300FFFFFF00EFF7F700EFF7F700EFF7F700EFF7F700EFF7F700EFF7F700FFFF
      FF00636B63002984C60000426B0000426B000000000084848400FFFFFF00EFEF
      EF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600F7F7F700FFFFFF00848484000000000081818100FFFFFF00E9E9E9008484
      84006D6D6D009C9C9C00EBEBEB00EBEBEB009CEEF2004EF2FA0067F6FD00B5FA
      FE00B8FAFE006BF5FD0022EFFA000DF3FF0000000000007B7B0000A5C60021E7
      FF0031E7F70021E7FF0018E7FF0010E7FF0010DEF70000D6F70010A5BD0010A5
      C600007B7B0000000000000000000000000000426B0000426B00218CC600636B
      7300F7F7F700E7E7E700BDBDBD00BDBDBD00BDBDBD00BDBDBD00E7E7E700F7F7
      F700636B6B002184C60000426B0000426B000000000084848400FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00F7F7F700FFFFFF00848484000000000081818100FFFFFF00EBEBEB00E9E9
      E900EAEAEA00EBEBEB00EBEBEB00EBEBEB00B4EDF0006AF0F7003AF4FC0068F6
      FD006AF6FD003CF2FB001EEFF90009F3FF000000000000000000007B7B0000A5
      C60021E7FF0021E7FF0000A5C60000A5C60010A5BD00109CBD0018A5BD00007B
      7B000000000000000000000000000000000000426B0000426B002184C600397B
      A500636B73005A5A5A007B7B7B007B8484007B8484007B7B7B005A5A5A00636B
      6B00427BA500217BBD0000426B0000426B000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00848484000000000081818100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009BEEF20069F0F7004DF2
      FA0046EFF70028EBF4000DF3FF0002F3FF00000000000000000000000000007B
      7B0000A5C60029E7FF0000A5C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000426B0000426B000042
      6B0000426B005A5A5A008C9494008C9494008C9494008C9494005A5A5A000042
      6B0000426B0000426B0000426B0000000000000000009C9C9C00848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000009F9F9F0081818100818181008181
      810081818100818181008181810081818100818181008D9B9B00729F9F006AAE
      AF0036E4ED0009F3FF0002F3FF00000000000000000000000000000000000000
      0000009CBD0000A5C60000A5C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B736B006B736B006B736B006B73
      6B006B736B006B736B006B736B006B736B006B736B006B736B006B736B006B73
      6B006B736B006B736B006B736B006B736B00000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B009C9C9C0084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484009C9C9C0000000000000000008C633900A5633100A5633100A563
      3100A5633100A5633100A5633100A5633100A5633100A5633100A5633100A563
      3100A5633100A563310084633900000000006B736B00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00D6D6D600D6D6D600CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE006B736B00000000007B7B7B00EFEFEF00D6D6
      D600DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D6007B7B7B0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084848400000000000000000052525200ADADAD00D6AD8C00CE9C
      6B00CE9C6B00CE9C6B00CE9C6B00CE9C6B00CE9C6300CE9C6300CE946300CE94
      6300CE946300DEBD9C00947352007B5A42006B736B00CECECE00C6C6C600ADAD
      AD00B5B5B500C6C6C600C6C6C600CECECE00CECECE00ADA5AD00D6D6D600A5A5
      AD00D6D6D600B5B5B500CECECE006B736B00000000007B7B7B00F7F7F700BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00B5BDBD00B5B5B500B5B5B500B5B5
      B500B5B5B500BDBDBD00C6C6C6007B7B7B0084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF0084848400000000000000000052525200BDC6C6009C735A00DEBD
      9C00CE9C7300CE9C7300CE9C6B00CE9C6B00CE9C6B00CE9C6B00CE9C6B00CE9C
      6B00CE9C6B00CE9C6B00DEB59400A56331006B736B00CECECE00C6C6C6009C9C
      9C00ADADAD00BDBDBD00C6C6C600CECECE00D6D6D600ADADAD00D6D6D600ADAD
      AD00D6D6D600BDBDBD00CECECE006B736B00000000007B7B7B00F7F7F700BDBD
      BD00848484007B7B7B007B7B7B007373730073737B00737373006B7373007373
      730073737B00B5B5B500C6C6C6007B7B7B0084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF0084848400000000000000000052525200CECECE00A5633100E7C6
      AD00D6B58C00DEB58C00D6B58C00D6AD8C00D6AD8C00D6AD8400D6AD8400D6A5
      7B00D6A57300CE9C7300DEBD9C00A56331006B736B00CECECE00CECECE00CECE
      CE00CECECE00CECECE00C6C6C600CECECE00CECECE00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600D6D6D6006B736B00000000007B7B7B00F7F7F700CECE
      CE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE008C8C8C00C6C6C6007B7B7B0084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF0084848400000000000000000052525200BDC6C600A5633100E7C6
      AD00DEB58C00DEB58C00DEB58C00DEB58C00DEB58C00DEB58C00DEB58C00DEB5
      8C00DEB58C00D6AD8C00E7C6A500A56331006B736B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEF
      EF00EFEFEF00E7E7E700F7F7F7006B736B00000000007B7B7B00FFFFFF00D6D6
      D600EFEFEF00ADADAD00F7F7F700DEDEDE00E7E7E700E7E7E700E7E7E700E7E7
      E700DEDEDE009C9C9C00CECECE007B7B7B0084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7
      F700FFFFFF0084848400000000000000000052525200CECECE00A5633100EFDE
      C600EFD6BD00EFD6BD00EFD6BD00EFD6BD00EFD6BD00EFD6BD00EFD6BD00EFD6
      BD00EFD6BD00EFD6BD00EFDEC600A56331006B736B00F7F7F700E7E7E700EFEF
      EF00FFFFFF00FFFFFF00CED6CE008C6B39008C633900B5AD9C00FFFFFF00FFFF
      FF00EFEFEF00E7E7E700F7F7F7006B736B00000000007B7B7B00FFFFFF00FFFF
      FF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700E7E7E700EFEFEF007B7B7B0084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700FFFFFF0084848400000000000000000052525200BDC6C6009C7B6300A563
      3100A5633100A5633100A5633100A5633100A5633100A5633100A5633100A563
      3100A5633100A5633100A56331009C6B42006B736B00FFFFFF00EFEFEF00FFFF
      FF00E7E7E700BDCEC6008C633900E7CEAD00DEBD9C008C6B3900ADA59400E7E7
      E700FFFFFF00EFEFEF00F7F7F7006B736B00000000007B7B7B007B7B7B008484
      8400ADADAD00ADADAD00ADADA500ADADAD00ADADAD00ADADAD00ADA5A500ADAD
      AD00ADADAD00848484007B7B7B007B7B7B0084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7EFEF00B5F7F70094F7
      F7009CF7F700739494000000000000000000525A5A00CECECE00A5A5A500A5A5
      A500A5ADA500FFFFFF00F7F7F700CECECE00CECECE00CECECE00D6DEDE00F7F7
      F700F7F7F700FFFFFF00A5ADA500000000006B736B00FFFFFF00FFFFFF00E7E7
      E700BDCEC6008C633900DEBD9C00C69C7300C69C7300DECEAD008C633900ADA5
      9400E7E7E700F7F7F700F7F7F7006B736B00000000000000000000000000ADAD
      AD00F7F7F700F7F7F700F7EFEF00F7F7F700F7F7F700F7F7F700F7EFEF00F7F7
      F700F7F7F700ADADAD00000000000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7EFEF0094EFF70063F7FF0042F7
      FF0042F7FF005AEFF70031DEE70000F7FF005A5A5A00BDC6C600949494009494
      9400A5ADA500FFFFFF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700FFFFFF00A5ADA500000000006B736B00FFFFFF00EFEFEF00C6CE
      CE008C633900DEBD9C00BD9C7300BD9C7300BD9C7300C69C7300DEBD94008C63
      3900ADAD9400EFEFEF00F7F7F7006B736B00000000000000000000000000ADAD
      AD00F7F7F700E7E7E700D6C6B500E7E7DE00DED6CE00E7E7DE00D6CEBD00E7E7
      E700F7F7F700ADADAD00000000000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00B5EFF70063F7FF0042F7FF0073F7
      FF0073F7FF0042F7FF0021EFF70008F7FF005A5A5A00CECECE00A5A5A500A5A5
      A500A5ADA500FFFFFF00F7F7F700CECECE00CECECE00CECECE00CECECE00CECE
      CE00F7F7F700FFFFFF00A5ADA500000000006B736B00FFFFFF00EFEFEF008C63
      39008C6339008C6339008C633900CEA57B00BD945A008C6339008C6339008C63
      39008C633900EFEFEF00F7F7F7006B736B00000000000000000000000000ADAD
      AD00D6BDAD00B59C8400B59C8400D6CEC600CEB59C00D6CEC600BD9C8C00B59C
      8400CEAD9400ADADAD00000000000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009CEFF7004AF7FF006BF7FF00BDFF
      FF00BDFFFF006BF7FF0021F7FF0008F7FF005A636300BDC6C600949494009494
      9400A5ADA500FFFFFF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700FFFFFF00A5ADA500000000006B737300FFFFFF00EFEFEF00EFEF
      EF00DEE7DE00B59C73008C633900CEA57B00CEB58C008C6B3900C6BDAD00EFEF
      EF00EFEFEF00EFEFEF00F7F7F7006B736B00000000000000000000000000ADAD
      AD00B57B5200EFDECE00EFDECE00EFDECE00D6AD8C00EFDECE00EFDECE00EFDE
      CE00B5845A00ADADAD00000000000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009CEFF7004AF7FF0063F7FF00B5FF
      FF00BDFFFF006BF7FF0021EFFF0008F7FF00636B6300CECECE00A5A5A500A5A5
      A500A5ADA500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A5ADA500000000006B736B00DEE7E700FFFFFF00D6E7
      DE00DED6CE00B59C6B008C633900E7CEAD00D6B594009C7B5200E7DED600FFFF
      FF00FFFFFF00FFFFFF00F7F7F7006B736B00000000000000000000000000ADAD
      AD00EFDED600A5633100EFDEC600CE9C7300CE9C7300CE9C7300EFDEC600A563
      3100E7DED600ADADAD00000000000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00B5EFF7006BF7F70039F7FF006BF7
      FF006BF7FF0039F7FF0018EFFF0008F7FF006B6B6B00BDC6C600949494009494
      94009C9C9C00A5ADA500A5ADA500A5ADA500A5ADA500A5ADA500A5ADA500A5AD
      A500A5ADA500A5ADA500949C9400000000008C7B6B007373630073736300846B
      4A009C7342009C7B4200DEBD9C00EFDEC600AD8452007B6B4A006B736B006B73
      6B006B736B006B736B006B736B006B736B00000000000000000000000000ADAD
      AD00FFFFFF00EFDED600A5633100EFDEC600CE9C7300EFDEC600A5633100EFDE
      D600FFFFFF00ADADAD00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CEFF7006BF7F7004AF7
      FF0042EFF70029EFF70008F7FF0000F7FF006B6B6B00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00C6C6C6006363630052525200000000000000
      00000000000000000000000000000000000094734200BD946300D6AD8400E7CE
      B500EFDED600EFDEC600DEC69C00A58C6B008C6B42005A7B6B00000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD00AD9C9400A5633100EFDEC600A5633100AD9C9400ADAD
      AD00ADADAD00ADADAD0000000000000000009C9C9C0084848400848484008484
      840084848400848484008484840084848400848484007B8C8C00739C9C006BAD
      AD0031E7EF0008F7FF0000F7FF0000000000525252006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B00636B6300636B63005A63630000000000000000000000
      00000000000000000000000000000000000073846B00947B4A008C6339008C63
      39008C6339008C6339008C6B390084734A007B7B5A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5633100A5633100A5633100000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000007FFE000000000000
      780600000000000071E200000000000063F20000000000004782000000000000
      4FDA0000000000004FFE0000000000004FFE0000000000004FFE000000000000
      4FFE00000000000067E600000000000073E60000000000007806000000000000
      7FFE0000000000000000000000000000FE3FFFFFFE7F0000FC3FE01FFC3F0000
      F83FC007F81F0000F03F8003F00F0000E0008003E0070000C0000001C0030000
      8000000180010000800000010000000080000001000000008000000100000000
      C000000100000000E000000100000000F03F800300000000F83F800300000000
      FC3FC00700000000FE3FF01F80010000FC7F800083FFFFFFFC3F800081F10003
      FC1F800080E10003FC0F800080C10003000780008081000300038000C0010003
      00018000E007000300018000FE07000300018003C01F000300018003800F0003
      0003C003804700030007C00390E10003FC0FE003F8F00003FC1FE003F0F00003
      FC3FE003F1F80003FC7FFFFFFFFF0003F00FFFFFF3FFE7FFF00FFC3FE1FFC3E7
      F00FF81FC0FFC1C3F00FF00F807FC081F00FE007003FE0010000C003083FF003
      0000C0031C1FF80780018001BE0FFC0FC0030000FF07FC0FC0030000FF83F80F
      E007F00FFFC1F007F00FF007FFE0E083F81FF007FFF0E1C1FC3FF007FFF8F3E1
      FE7FF007FFFDFFF1FFFFFFFFFFFFFFFF0000FFF0FFFFFFFF0000FFF0FFFFFFFF
      0000FC00FC3FFFFF00000001FC3FFFFF00000003FC3FFFFF00000003FC3FFFFF
      00000003C003C00300000003C003C00300000003C003C00300000003C003C003
      00000007FC3FFFFF0000000FFC3FFFFF0000000FFC3FFFFF0000000FFC3FFFFF
      0000000FFFFFFFFF0000000FFFFFFFFFE003FC1F80030000E003FC1F80030000
      E003F81F80038001E003F81F80018001E003F00F80038001E003E00780018001
      E003C00380028001E003C00380028001E003C00380018001E003C00180000000
      E003C00180000000E003C00380000000E003C00380000000E003E00780070000
      E003E007C0078001E003F81FFFFFFFFF8000FFFFFC03F81F800000030001E007
      000000030000C003000000030000800100000003000080010000000300000000
      0000000300000000800000030000000080000003000300008000000300030000
      800000030003000080000003000380008000000300038001800000030003C003
      800000030003E007800000030003F80FFFFFFFFFFF07800180010003FF030000
      80010003FFC3000080010003FFE1000080010003FFF1000080010003F9E10000
      80010003E181000080010003C001000080010003800100008001000000010000
      80010000000100008001000000030000800100008007000080010000C00F0000
      80010000E1FF800180010001F1FFF00FFFFFFFFF000080000003000100008000
      0003000000008000000300000000800000030000000080000003000000008000
      00030000000080000003000000008000000300010000E003000000010000E003
      000000010000E003000000010000E003000000010000E003000000010000E003
      0000003F0000E0030001007F0000FE3F00000000000000000000000000000000
      000000000000}
  end
  object XPManifest: TXPManifest
    Left = 9
    Top = 227
  end
  object JvZlib: TJvZlibMultiple
    OnProgress = JvZlibProgress
    Left = 9
    Top = 259
  end
end
