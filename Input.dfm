object FInput: TFInput
  Left = 552
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Input'
  ClientHeight = 519
  ClientWidth = 461
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 459
    Width = 461
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object ButtonCancel: TJvImgBtn
      Left = 229
      Top = 8
      Width = 82
      Height = 25
      Cancel = True
      Caption = 'Abort'
      ModalResult = 2
      TabOrder = 2
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 23
    end
    object ButtonOK: TJvImgBtn
      Left = 150
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
      OnClick = ButtonOKClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 22
    end
    object ButtonNext: TJvImgBtn
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Next flight. Or just press RETURN!'
      Caption = 'Next'
      Default = True
      TabOrder = 0
      OnClick = ButtonNextClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = FMain.ImageList
      ImageIndex = 24
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 500
    Width = 461
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbNone
        Width = 50
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 33
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 29
      Top = 8
      Width = 77
      Height = 19
      Alignment = taRightJustify
      Caption = 'Flight no.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelFlugNr: TLabel
      Left = 113
      Top = 8
      Width = 94
      Height = 19
      Caption = 'LabelFlugNr'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object LabelFlbArt: TLabel
      Left = 261
      Top = 8
      Width = 170
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = 'LabelFlbArt'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 230
      Top = 2
      Width = 5
      Height = 29
      Shape = bsLeftLine
    end
  end
  object TabControl: TPageControl
    Left = 0
    Top = 33
    Width = 461
    Height = 425
    ActivePage = TSFlugdaten
    Align = alTop
    HotTrack = True
    TabOrder = 3
    OnChange = TabControlChange
    object TSFlugdaten: TTabSheet
      Caption = 'Flightdata'
      DesignSize = (
        453
        397)
      object Bevel5: TBevel
        Left = 6
        Top = 4
        Width = 446
        Height = 33
        Shape = bsFrame
      end
      object BevelPilot: TBevel
        Left = 6
        Top = 66
        Width = 446
        Height = 33
        Shape = bsFrame
      end
      object Bevel6: TBevel
        Left = 6
        Top = 35
        Width = 446
        Height = 33
        Shape = bsFrame
      end
      object Label2: TLabel
        Left = 12
        Top = 14
        Width = 26
        Height = 13
        Caption = 'Date:'
      end
      object Label3: TLabel
        Left = 199
        Top = 45
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'Aircraft type:'
      end
      object Label5: TLabel
        Left = 12
        Top = 45
        Width = 50
        Height = 13
        Caption = 'Aircraft ID:'
      end
      object Label6: TLabel
        Left = 178
        Top = 76
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Copilot:'
      end
      object Label25: TLabel
        Left = 12
        Top = 76
        Width = 23
        Height = 13
        Caption = 'Pilot:'
      end
      object Label26: TLabel
        Left = 42
        Top = 380
        Width = 385
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '<TAB> is the fastest way to get to the next data field!'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label28: TLabel
        Left = 323
        Top = 76
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Passengers:'
      end
      object PanelAC: TPanel
        Left = 293
        Top = 278
        Width = 159
        Height = 99
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 13
        object Label11: TLabel
          Left = 8
          Top = 6
          Width = 69
          Height = 13
          Caption = 'AutoComplete:'
        end
        object ButtonNeuFlugzeug: TJvImgBtn
          Left = 5
          Top = 24
          Width = 140
          Height = 22
          Hint = 'Add to AutoComplete (Makes input easier)'
          Caption = 'Aircraft'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = ButtonNeuFlugzeugClick
          Color = 11063257
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object ButtonNeuPilot: TJvImgBtn
          Left = 4
          Top = 48
          Width = 69
          Height = 22
          Hint = 'Add to AutoComplete (Makes input easier)'
          Caption = 'Pilot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = ButtonNeuBegleiterClick
          Color = 11063257
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object ButtonNeuBegleiter: TJvImgBtn
          Left = 76
          Top = 48
          Width = 69
          Height = 22
          Hint = 'Add to AutoComplete (Makes input easier)'
          Caption = 'Copilot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = ButtonNeuBegleiterClick
          Color = 11063257
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object ButtonNeuLandeOrt: TJvImgBtn
          Left = 76
          Top = 72
          Width = 69
          Height = 22
          Hint = 'Add to AutoComplete (Makes input easier)'
          Caption = 'To'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = ButtonNeuOrtClick
          Color = 11063257
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object ButtonNeuStartOrt: TJvImgBtn
          Left = 4
          Top = 72
          Width = 69
          Height = 22
          Hint = 'Add to AutoComplete (Makes input easier)'
          Caption = 'From'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = ButtonNeuOrtClick
          Color = 11063257
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
      end
      object CBAircraftID: TComboBox
        Left = 72
        Top = 41
        Width = 90
        Height = 21
        Hint = 'Enter manually, by AutoComplete, drop-down list or arrow keys'
        ItemHeight = 13
        Sorted = True
        TabOrder = 1
        OnEnter = CBAircraftIDEnter
        OnExit = CBAircraftIDExit
      end
      object CBCoPilot: TComboBox
        Left = 222
        Top = 72
        Width = 90
        Height = 21
        Hint = 'Enter manually, by AutoComplete, drop-down list or arrow keys'
        ItemHeight = 13
        Sorted = True
        TabOrder = 4
        OnExit = CBCrewExit
      end
      object CBAircraftType: TEdit
        Left = 266
        Top = 41
        Width = 120
        Height = 21
        TabOrder = 2
        OnExit = CBAircraftIDExit
      end
      object CBPilot: TComboBox
        Left = 72
        Top = 72
        Width = 90
        Height = 21
        Hint = 'Enter manually, by AutoComplete, drop-down list or arrow keys'
        ItemHeight = 13
        Sorted = True
        TabOrder = 3
        TabStop = False
        OnExit = CBCrewExit
      end
      object PanelLandings: TPanel
        Left = 6
        Top = 97
        Width = 126
        Height = 64
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 6
        DesignSize = (
          126
          64)
        object Label30: TLabel
          Left = 6
          Top = 25
          Width = 46
          Height = 13
          Anchors = [akLeft]
          Caption = 'Landings:'
        end
        object EditLandings: TEdit
          Left = 66
          Top = 21
          Width = 33
          Height = 21
          Hint = 'Enter number of takeoffs and landings for collective entries.'
          Anchors = [akLeft]
          TabOrder = 0
          Text = '1'
          OnExit = EditPassLandingsExit
        end
        object LandingsUpDown: TUpDown
          Left = 99
          Top = 21
          Width = 16
          Height = 21
          Anchors = [akLeft]
          Associate = EditLandings
          Min = 1
          Max = 99
          Position = 1
          TabOrder = 1
        end
      end
      object PanelFlightTime: TPanel
        Left = 130
        Top = 97
        Width = 322
        Height = 33
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 7
        object Label8: TLabel
          Left = 6
          Top = 10
          Width = 54
          Height = 13
          Caption = 'Flight Time:'
        end
        object Label29: TLabel
          Left = 120
          Top = 9
          Width = 4
          Height = 16
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 198
          Top = 10
          Width = 43
          Height = 13
          Caption = 'Duration:'
        end
        object MEFlightTimeDep: TMaskEdit
          Left = 79
          Top = 6
          Width = 39
          Height = 21
          Hint = 'Enter start time'
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 0
          Text = '  :  '
          OnExit = METimeExit
          OnKeyUp = MEFlightTimeDepKeyUp
        end
        object MEFlightTimeArr: TMaskEdit
          Left = 127
          Top = 6
          Width = 40
          Height = 21
          Hint = 'Enter landing time'
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 1
          Text = '  :  '
          OnExit = METimeExit
          OnKeyUp = MEFlightTimeArrKeyUp
        end
        object MEFlightTime: TMaskEdit
          Left = 261
          Top = 6
          Width = 41
          Height = 21
          Hint = 'Enter flight time for cumulative entries'
          TabStop = False
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 2
          Text = '  :  '
          OnKeyUp = MEFlightTimeKeyUp
        end
      end
      object PanelBlockTime: TPanel
        Left = 130
        Top = 128
        Width = 322
        Height = 33
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 8
        object Label15: TLabel
          Left = 6
          Top = 10
          Width = 56
          Height = 13
          Caption = 'Block Time:'
        end
        object Label19: TLabel
          Left = 198
          Top = 10
          Width = 43
          Height = 13
          Caption = 'Duration:'
        end
        object Label20: TLabel
          Left = 120
          Top = 9
          Width = 4
          Height = 16
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object MEBlockTimeDep: TMaskEdit
          Left = 79
          Top = 6
          Width = 39
          Height = 21
          Hint = 'Enter start time'
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 0
          Text = '  :  '
          OnExit = METimeExit
          OnKeyUp = MEBlockTimeDepKeyUp
        end
        object MEBlockTimeArr: TMaskEdit
          Left = 127
          Top = 6
          Width = 40
          Height = 21
          Hint = 'Enter landing time'
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 1
          Text = '  :  '
          OnExit = METimeExit
          OnKeyUp = MEBlockTimeArrKeyUp
        end
        object MEBlockTime: TMaskEdit
          Left = 261
          Top = 6
          Width = 41
          Height = 21
          Hint = 'Enter flight time for cumulative entries'
          TabStop = False
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 2
          Text = '  :  '
          OnKeyUp = MEFlightTimeKeyUp
        end
      end
      object PanelFromTo: TPanel
        Left = 6
        Top = 159
        Width = 446
        Height = 64
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 9
        object Label12: TLabel
          Left = 6
          Top = 11
          Width = 26
          Height = 13
          Caption = 'From:'
        end
        object Label13: TLabel
          Left = 6
          Top = 39
          Width = 16
          Height = 13
          Caption = 'To:'
        end
        object LabelStO: TLabel
          Left = 230
          Top = 10
          Width = 200
          Height = 13
          Hint = 'Airport name or -position'
          AutoSize = False
          Caption = 'StO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelDist: TLabel
          Left = 381
          Top = 24
          Width = 60
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0 km'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelLaO: TLabel
          Left = 230
          Top = 43
          Width = 200
          Height = 13
          Hint = 'Airport name or -position'
          AutoSize = False
          Caption = 'LaO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 353
          Top = 24
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Leg:'
        end
        object ImageAccNotDist: TImage
          Left = 306
          Top = 24
          Width = 16
          Height = 16
          Hint = 
            'Distance will NOT be taken over as leg, because leg as been chan' +
            'ged manually. (see distance flight)'
          Picture.Data = {
            0B544A76474946496D6167658F04000047494638396116001600F70000B1B4B0
            C4CAC1DDE1DBDCE0DADADED8E9EBE8E4E6E3D4D9D1D3D8D0CFD4CCCAD0C6C6CC
            C29B9E9994979291948FE1E4DFE0E3DEDFE2DDC3C7C0C2C6BFBDC1BAD5D9D2C3
            C8BFCED3CAC2C8BDB9BFB48E928A6F716D7D7F7B7C7E7A7A7C78797B77747672
            73757171736F70726ED7DAD48F918D8C8E8A898B878587837F817DA0A29E9FA1
            9D9C9E9A9B9D99939591C6C8C4AFB1ADE9EBE7D3D5D1A3A79EFAFAF9F8F2B0FD
            F9CEDDC700D9C300DFC801E3CD02E0CA06E5CF07E2CC0BE7D10CE5CF0FE9D410
            E7D113EBD615E9D418EDD91AEAD51DE2CD1DEFDB1FECD721E2CF20DCC920F2DD
            24EED925F4E028EFDC28F0DB2AF6E22DF2DD2EDECB2AE5D22CE2D02CDECC2BF8
            E432E3D12EF4E033E4D130E4D230E8D632FAE737E8D734F6E238F3E038FCE93C
            E9D638E5D438EAD83AE5D439EAD93DE7D640ECDB43E7D742F5E448ECDC46EAD9
            45EAD948D9C943EEDE4BEEDF4DDBCC47EBDB4DE7D74CECDD50E0D14CECDD51EB
            DB50F0E053F7E757EEDE54F0E156EDDE56EFE057E1D252FCEC5EF2E35AFBEB5F
            F9E95EF1E25BEDDE59F2E45EEDDF5DEFE05FF3E561DED059EEDF60F2E565F1E2
            64F0E164F4E666F6E768DFD25FF2E468F1E369DFD361F7EA6DF6E86DF5E76FF4
            E76EF1E46DE4D867F3E56FE4D868F6E871F9EB73EBDF6DF7EA73F4E673FAED77
            F3E674F6E977F5E876FBEF7AF9EC7AFDF07DEFE377F5E87BF4E77AFAEE7FFDF0
            82FBEF81F8EC7FF9EE87F1E682FBF090F3E98DFCF297F4EB95FDF49FF6ED9FFF
            F6A9F8F0A8FFF8BBFAF3B7FCF6BBFBF5BFFCF6C5FDF8CEEAD847F0E167F4E56B
            F7E877F7E97AFBF097F9EEA0F9F1BBFFF9CBFFF9CDFDF7CCF9F1BFF9F1C0B28E
            00A98700A382009F7F00997A009577009174008F72008D71008B6F008B70008A
            6E00866B00856A008268007F66007D64006E5900C19B04B28F04BD9600BA9400
            B89200B79100B59000B38E00B08C00AF8B00AB8800A78500A58300A180009D7D
            009B7B009778009375007E6400FFFFFFFEFEFEFFFFFF00000000000000000000
            000000000000000000000000000000000000000000000000000000000021F904
            010000F2002C00000000160016000008FF00E5091C48B0208B06254CA028C890
            E00A00122C04A0C0C043C386306228485081000415202E126C6160C00417275E
            14901142E4C00634043810C82102890D2E059A88F7A0834011082EE0CC89025E
            8190F2462CC830D4650A7811868EC030A3A9C80FF00E48C5A06143B76F60C189
            2367EE1CBA66CED8B573278D5AB50D70377CD365A317325EBB72D5B8556B56AC
            57A73A21C246F09B3261A85285BAF42BD1203B6CD090D1524552B6C2C756B152
            55CA13A54684F4BC5153A6CB154DDA0A270B36EA53A6488C0AEDB1E3CB8C982C
            52246D2B6CCC1429509C26393AF4E78E9B3363B650C1B47B20B8629B2A0183B4
            C8D0A03A6BC24C496244C9A3E602C3E16CF20328109E345F9C101102C4070F1D
            37FA8097378E98172C519E3041526448901F3DEC90030E70CCB78C2D60706105
            144D2C71C47AEDBD77031DF395330C2DB2C0E24A2BA258A288207CE431471C72
            B4319F37CCA4A3CE3ACF4013CD34D65C93CD3BDBD4B80D3739E5385040003B}
          Stretch = True
          Transparent = True
          Visible = False
        end
        object ImageAccDist: TImage
          Left = 306
          Top = 24
          Width = 16
          Height = 16
          Hint = 'Distance will be taken over as leg.'
          Picture.Data = {
            0B544A76474946496D6167659604000047494638396116001600F70000E9ECE9
            EFF1EFC6C9C5EAEDE9E1E4E0DDE1DBDADED8B3B5B2E9EBE8E8EAE7E6E8E5D6DB
            D3D4D9D1D2D7CFCBD1C7757873878A857D807B9A9D98929590E0E3DEDDE0DBDC
            DFDAD8DBD6B9BDB6A8ADA4CDD2C9C2C8BDC5CBC0BDC2B8A7ABA381847E6F716D
            7A7C78787A7676787475777374767273757171736F70726ECDD0CA8E908C8789
            8586888481837FA0A29E9FA19D9B9D999A9C98969894C4C6C2E6E8E4E5E7E3D1
            D3CFCBCDC9DCDDDBC8C9C7737570B5B6B3F2F2F1F8F2B0FDF9CEDDC700D9C300
            DFC801E3CD02E0CA06E5CF07E2CC0BE7D10CE5CF0FE9D410E7D113EBD615E9D4
            18EDD91AEAD51DE2CD1DEFDB1FECD721E2CF20DCC920F2DD24EED925F4E028EF
            DC28F0DB2AF6E22DF2DD2EDECB2AE5D22CE2D02CDECC2BF8E432E3D12EF4E033
            E4D130E4D230E8D632FAE737E8D734F6E238F3E038FCE93CE9D638E5D438EAD8
            3AE5D439EAD93DE7D640ECDB43E7D742F5E448ECDC46EAD945EAD948DACA43EE
            DE4BEEDF4DDBCC47EBDB4DE7D74CECDD50E0D14CECDD51EBDB50F0E053EBDB51
            F7E757EEDE54F0E156EDDE56EFE057E1D252FCEC5EF2E35AFBEB5FF9E95EF1E2
            5BEDDE59F2E45EEDDF5DEFE05FF3E561DED159EEDF60F2E565F1E264F0E164F4
            E666F6E768DFD25FF2E468F1E369DFD361F7EA6DF6E86DF5E76FF4E76EF1E46D
            E4D867F3E56FE4D868F6E871F9EB73EBDF6DF7EA73F4E673FAED77F3E674F6E9
            77F5E876FBEF7AF9EC7AFDF07DEFE377F5E87BF4E77AFAEE7FFDF082FBEF81F8
            EC7FF9EE87F1E682FBF090F3E98DFCF297FBF197F4EB95FDF49FF6ED9FFFF6A9
            F8F0A8FFF8BBFAF3B7FDF6BBFBF5BFFCF6C5FDF8CEEAD847F0E167F4E56BF7E8
            77F7E97AF9EEA0F9F1BBFFF9CBFFF9CDFDF7CCF9F1BFF9F1C0B28E00A382009F
            7F00997A009577009174008F72008D71008C72008B70008A6E00866B00856B00
            8268007F66007D64007D6500755E00A78703C19B05BD9600BA9400B89200B791
            00B59000B38E00AF8B00AB8800A78500A58300A180009D7D009B7B0097780093
            75007E6400B18C01A98601FFFFFFFDFDFDFFFFFF00000000000000000021F904
            010000FC002C00000000160016000008FF00F9091C28D0850C1622469020C890
            E18B1D02525CB060E34088070D1DE2485080000D04352818905022E3C01C0108
            DC88D122C2040C0D344030C90F060F00334C10D4E1814386921957EC53A0A2E1
            070E1D4E9824A1AF82528628166C406112843E06201A821830B5AA3E0759195A
            EDCAF01CBAB3E9D6B573F70E5E356BF4EAD9D3D68D1B4174C47C1C8B66ACD8B0
            1EC17EF5D2850B96A948E0EE4E63164B962A50C924310244070E1B315D3685BB
            0B8D56AD59AE4E75B2D468D01D396DCA7C1925EEAEB465AC5089D254C911213F
            C8DCA809A365D3B8BBCF5EB54A558AD3254888FED879B3660C9750BF07A67346
            CA93B24C941E31EA3327CD96284EA460738A2E509DB0438914058A73C60A1325
            488C1011F2C310797EEC9A990193E50A15284D2C91C411450C11041078DC470D
            306890E10516554CF1C47BF1CDF7031FF7E1C38B2FBBE4728B2DAB7C32C92285
            08B2471E7AD4410E41E6E4138F3CF35C834D36DB78F34D38F78CA3E338E5D0E4
            23430101003B}
          Stretch = True
          Transparent = True
          Visible = False
        end
        object ButtonFindLandeOrt: TJvImgBtn
          Left = 201
          Top = 34
          Width = 25
          Height = 25
          Hint = 'search airport in database'
          TabOrder = 2
          TabStop = False
          OnClick = ButtonFindOrtClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 17
        end
        object ButtonFindStartOrt: TJvImgBtn
          Left = 201
          Top = 6
          Width = 25
          Height = 25
          Hint = 'search airport in database'
          TabOrder = 3
          TabStop = False
          OnClick = ButtonFindOrtClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 17
        end
        object CBAPFrom: TComboBox
          Left = 66
          Top = 7
          Width = 135
          Height = 21
          Hint = 'Enter manually, by AutoComplete, drop-down list or arrow keys'
          ItemHeight = 13
          Sorted = True
          TabOrder = 0
          OnExit = CBOrtExit
        end
        object CBAPTo: TComboBox
          Left = 66
          Top = 35
          Width = 135
          Height = 21
          Hint = 'Enter manually, by AutoComplete, drop-down list or arrow keys'
          ItemHeight = 13
          Sorted = True
          TabOrder = 1
          OnExit = CBOrtExit
        end
      end
      object PanelStartType: TPanel
        Left = 6
        Top = 221
        Width = 446
        Height = 28
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 10
        object Label7: TLabel
          Left = 6
          Top = 6
          Width = 48
          Height = 13
          Caption = 'Start type:'
        end
        object RBW: TRadioButton
          Left = 80
          Top = 6
          Width = 74
          Height = 17
          Caption = 'Winch'
          TabOrder = 0
        end
        object RBF: TRadioButton
          Left = 153
          Top = 6
          Width = 74
          Height = 17
          Caption = 'Airtow'
          TabOrder = 1
        end
        object RBE: TRadioButton
          Left = 226
          Top = 6
          Width = 74
          Height = 17
          Caption = 'Self start'
          TabOrder = 2
        end
        object RBA: TRadioButton
          Left = 299
          Top = 6
          Width = 74
          Height = 17
          Caption = 'Car start'
          TabOrder = 3
        end
        object RBG: TRadioButton
          Left = 364
          Top = 6
          Width = 80
          Height = 17
          Caption = 'Rubberband'
          TabOrder = 4
        end
      end
      object PanelRemarks: TPanel
        Left = 6
        Top = 247
        Width = 446
        Height = 33
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 11
        object Label14: TLabel
          Left = 6
          Top = 10
          Width = 45
          Height = 13
          Caption = 'Remarks:'
        end
        object EditRemarks: TEdit
          Left = 66
          Top = 6
          Width = 215
          Height = 21
          MaxLength = 64
          TabOrder = 0
        end
        object CBStartType: TComboBox
          Left = 301
          Top = 6
          Width = 135
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          Sorted = True
          TabOrder = 1
          Text = 'Airtow'
          Visible = False
          Items.Strings = (
            'Airtow'
            'Car start'
            'Rubberband'
            'Self start'
            'Winch')
        end
      end
      object PanelCat: TPanel
        Left = 6
        Top = 278
        Width = 289
        Height = 99
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 12
        object Label9: TLabel
          Left = 6
          Top = 6
          Width = 45
          Height = 13
          Caption = 'Category:'
        end
        object ButtonKatAdd: TJvImgBtn
          Left = 36
          Top = 38
          Width = 25
          Height = 25
          Hint = 'Add new category (e.g. instruction, student time, air-tow)'
          TabOrder = 0
          TabStop = False
          OnClick = ButtonKatAddClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 18
        end
        object CLBKat: TCheckListBox
          Left = 66
          Top = 8
          Width = 215
          Height = 83
          BevelInner = bvNone
          BevelOuter = bvNone
          Columns = 2
          ItemHeight = 13
          Sorted = True
          TabOrder = 1
        end
      end
      object EditPassengers: TEdit
        Left = 391
        Top = 72
        Width = 33
        Height = 21
        Hint = 'Enter number of takeoffs and landings for collective entries.'
        Anchors = [akLeft]
        TabOrder = 5
        Text = '1'
        OnExit = EditPassLandingsExit
      end
      object PassengersUpDown: TUpDown
        Left = 424
        Top = 72
        Width = 16
        Height = 21
        Anchors = [akLeft]
        Associate = EditPassengers
        Max = 999
        Position = 1
        TabOrder = 14
      end
      object DTPDate: TDateTimePicker
        Left = 72
        Top = 9
        Width = 83
        Height = 21
        Date = 38746.336874976850000000
        Time = 38746.336874976850000000
        TabOrder = 0
        OnExit = DTPDateExit
      end
    end
    object TSStreckenflug: TTabSheet
      Caption = 'Distance flight'
      ImageIndex = 1
      object Panel7: TPanel
        Left = 6
        Top = 4
        Width = 446
        Height = 44
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        object Label17: TLabel
          Left = 9
          Top = 16
          Width = 45
          Height = 13
          Caption = 'Distance:'
        end
        object Label18: TLabel
          Left = 162
          Top = 16
          Width = 3
          Height = 13
          Caption = '-'
        end
        object Label24: TLabel
          Left = 308
          Top = 16
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Speed:'
        end
        object LabelAvSpeed: TLabel
          Left = 386
          Top = 16
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = '0 km/h'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object EditDistance: TEdit
          Left = 82
          Top = 12
          Width = 69
          Height = 21
          Hint = 'Enter a distance manually and overwrite leg'
          TabOrder = 0
          OnExit = EditDistanceExit
        end
      end
      object Panel2: TPanel
        Left = 6
        Top = 46
        Width = 446
        Height = 137
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label16: TLabel
          Left = 9
          Top = 6
          Width = 26
          Height = 13
          Caption = 'Legs:'
        end
        object Label27: TLabel
          Left = 235
          Top = 117
          Width = 82
          Height = 13
          Caption = 'Over-all distance:'
        end
        object LabelViaDist: TLabel
          Left = 370
          Top = 117
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelViaDistUnit: TLabel
          Left = 386
          Top = 117
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = 'km'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelViaOrt: TLabel
          Left = 25
          Top = 76
          Width = 168
          Height = 13
          Hint = 'Airport name or -position'
          AutoSize = False
          Caption = 'StO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object ButtonFindViaOrt: TJvImgBtn
          Left = 159
          Top = 43
          Width = 25
          Height = 25
          Hint = 'search airport in database'
          TabOrder = 2
          OnClick = ButtonFindOrtClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 17
        end
        object ButtonWPAdd: TJvImgBtn
          Left = 200
          Top = 34
          Width = 25
          Height = 25
          Hint = 'add'
          TabOrder = 3
          OnClick = ButtonWPAddClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 18
        end
        object ButtonWPRem: TJvImgBtn
          Left = 200
          Top = 66
          Width = 25
          Height = 25
          Hint = 'remove'
          TabOrder = 4
          OnClick = ButtonWPRemClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 19
        end
        object ButtonViaUp: TJvImgBtn
          Left = 415
          Top = 34
          Width = 25
          Height = 25
          Hint = 'move up'
          TabOrder = 5
          OnClick = ButtonViaUpClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 20
        end
        object ButtonViaDown: TJvImgBtn
          Left = 415
          Top = 66
          Width = 25
          Height = 25
          Hint = 'move down'
          TabOrder = 6
          OnClick = ButtonViaDownClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 21
        end
        object CBViaOrt: TComboBox
          Left = 22
          Top = 44
          Width = 135
          Height = 21
          Hint = 'Enter manually, by AutoComplete, drop-down list or arrow keys'
          AutoComplete = False
          ItemHeight = 13
          Sorted = True
          TabOrder = 0
          OnExit = CBOrtExit
        end
        object GridVia: TJvStringGrid
          Left = 248
          Top = 9
          Width = 162
          Height = 105
          Align = alCustom
          Color = clWhite
          ColCount = 3
          DefaultColWidth = 50
          DefaultRowHeight = 17
          FixedCols = 0
          RowCount = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = False
          TabOrder = 1
          HintColor = clInfoBk
          Alignment = taLeftJustify
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = []
          OnGetCellAlignment = GridGetCellAlignment
          ColWidths = (
            50
            50
            71)
        end
      end
      object Panel6: TPanel
        Left = 6
        Top = 181
        Width = 446
        Height = 115
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object Label31: TLabel
          Left = 9
          Top = 3
          Width = 44
          Height = 13
          Caption = 'Contests:'
        end
        object ButtonContestAdd: TJvImgBtn
          Left = 200
          Top = 41
          Width = 25
          Height = 25
          Hint = 'Add new Category (e.g. OLC)'
          TabOrder = 2
          OnClick = ButtonContestAddClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 18
        end
        object CLBContest: TCheckListBox
          Left = 22
          Top = 20
          Width = 170
          Height = 70
          OnClickCheck = CLBContestClickCheck
          BevelInner = bvNone
          BevelOuter = bvNone
          Columns = 2
          ItemHeight = 13
          Sorted = True
          TabOrder = 1
        end
        object GridContest: TJvStringGrid
          Left = 248
          Top = 6
          Width = 173
          Height = 103
          Align = alCustom
          Color = clWhite
          ColCount = 4
          DefaultColWidth = 50
          DefaultRowHeight = 17
          Enabled = False
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = False
          TabOrder = 0
          OnSelectCell = NoRowSelect
          HintColor = clInfoBk
          Alignment = taLeftJustify
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = []
        end
      end
      object Panel5: TPanel
        Left = 6
        Top = 294
        Width = 446
        Height = 97
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label23: TLabel
          Left = 9
          Top = 3
          Width = 24
          Height = 13
          Caption = 'Files:'
        end
        object ButtonFileAdd: TJvImgBtn
          Left = 399
          Top = 28
          Width = 25
          Height = 25
          Hint = 'Add file'
          TabOrder = 1
          OnClick = ButtonFileAddClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 1
        end
        object ButtonFileRem: TJvImgBtn
          Left = 399
          Top = 62
          Width = 25
          Height = 25
          Hint = 'Remove file'
          Enabled = False
          TabOrder = 2
          OnClick = ButtonFileRemClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 19
        end
        object LBFiles: TListBox
          Left = 22
          Top = 20
          Width = 363
          Height = 70
          Hint = 'Save files with flight (e.g. igc-files, pics)'
          Columns = 2
          ItemHeight = 13
          TabOrder = 0
          OnDblClick = LBFilesDblClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Categories'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 6
        Top = 4
        Width = 446
        Height = 137
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label32: TLabel
          Left = 9
          Top = 16
          Width = 78
          Height = 13
          Caption = 'Time categories:'
        end
        object ButtonKatTimeAdd: TJvImgBtn
          Left = 199
          Top = 62
          Width = 25
          Height = 25
          Hint = 'Add new category (e.g. engine time, night, IFR)'
          TabOrder = 2
          OnClick = ButtonKatTimeAddClick
          Flat = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Images = FMain.ImageList
          ImageIndex = 18
        end
        object CLBKatTime: TCheckListBox
          Left = 22
          Top = 42
          Width = 170
          Height = 65
          OnClickCheck = CLBKatTimeClickCheck
          BevelInner = bvNone
          BevelOuter = bvNone
          Columns = 2
          ItemHeight = 13
          Sorted = True
          TabOrder = 0
        end
        object GridKatTime: TJvStringGrid
          Left = 248
          Top = 18
          Width = 153
          Height = 103
          Align = alCustom
          Color = clWhite
          ColCount = 3
          DefaultColWidth = 50
          DefaultRowHeight = 17
          Enabled = False
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = False
          TabOrder = 1
          OnSelectCell = NoRowSelect
          HintColor = clInfoBk
          Alignment = taLeftJustify
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = []
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Weather'
      ImageIndex = 3
      object Panel9: TPanel
        Left = 6
        Top = 4
        Width = 446
        Height = 213
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label33: TLabel
          Left = 8
          Top = 32
          Width = 44
          Height = 13
          Caption = 'Weather:'
        end
        object Label35: TLabel
          Left = 8
          Top = 80
          Width = 35
          Height = 13
          Caption = 'Clouds:'
        end
        object Label37: TLabel
          Left = 168
          Top = 100
          Width = 18
          Height = 13
          Caption = 'feet'
        end
        object Bevel1: TBevel
          Left = 8
          Top = 128
          Width = 430
          Height = 9
          Shape = bsTopLine
        end
        object CAVOK: TCheckBox
          Left = 8
          Top = 8
          Width = 97
          Height = 17
          Caption = 'CAVOK'
          TabOrder = 0
          OnClick = CAVOKClick
        end
        object INTENSITY: TComboBox
          Left = 8
          Top = 48
          Width = 41
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          OnChange = WeatherChange
          Items.Strings = (
            ''
            '-'
            '+')
        end
        object DESCRIPTOR: TComboBox
          Left = 56
          Top = 48
          Width = 65
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          OnChange = WeatherChange
          Items.Strings = (
            ''
            'MI'
            'BC'
            'PR'
            'DR'
            'BL'
            'SH'
            'TS'
            'FZ')
        end
        object PRECIPITATION: TComboBox
          Left = 128
          Top = 48
          Width = 65
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          OnChange = WeatherChange
          Items.Strings = (
            ''
            'DZ'
            'RA'
            'SN'
            'SG'
            'IC'
            'PL'
            'GR'
            'GS')
        end
        object OBSCURATION1: TComboBox
          Left = 213
          Top = 48
          Width = 65
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 4
          OnChange = WeatherChange
          Items.Strings = (
            ''
            'FG'
            'BR')
        end
        object OBSCURATION2: TComboBox
          Left = 301
          Top = 48
          Width = 65
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 5
          OnChange = WeatherChange
          Items.Strings = (
            ''
            'FU'
            'VA'
            'DU'
            'SA'
            'HZ')
        end
        object OTHER: TComboBox
          Left = 373
          Top = 48
          Width = 65
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 6
          OnChange = WeatherChange
          Items.Strings = (
            ''
            'PO'
            'SQ'
            'FC'
            'SS'
            'DS')
        end
        object CLOUDS: TComboBox
          Left = 8
          Top = 96
          Width = 65
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 7
          Text = 'SKC'
          OnChange = WeatherChange
          Items.Strings = (
            'SKC'
            'FEW'
            'SCT'
            'BKN'
            'OVC')
        end
        object CLOUDBASE: TEdit
          Left = 80
          Top = 96
          Width = 81
          Height = 21
          TabOrder = 8
          OnChange = WeatherChange
        end
        object WeatherText: TMemo
          Left = 8
          Top = 136
          Width = 430
          Height = 45
          Enabled = False
          TabOrder = 11
        end
        object CLOUDTYPE: TComboBox
          Left = 213
          Top = 96
          Width = 65
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 9
          OnChange = WeatherChange
          Items.Strings = (
            ''
            'CB')
        end
        object OWNWEATHER: TEdit
          Left = 301
          Top = 96
          Width = 137
          Height = 21
          TabOrder = 10
          OnChange = WeatherChange
        end
        object Metar: TEdit
          Left = 8
          Top = 184
          Width = 430
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 12
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Budget'
      ImageIndex = 4
      object Panel8: TPanel
        Left = 6
        Top = 4
        Width = 446
        Height = 116
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label21: TLabel
          Left = 9
          Top = 16
          Width = 69
          Height = 13
          Caption = 'Costs for flight:'
        end
        object CurLabel1: TLabel
          Left = 115
          Top = 37
          Width = 3
          Height = 13
          Caption = '-'
        end
        object Label22: TLabel
          Left = 9
          Top = 64
          Width = 64
          Height = 13
          Caption = 'Landing fees:'
        end
        object CurLabel3: TLabel
          Left = 115
          Top = 85
          Width = 3
          Height = 13
          Caption = '-'
        end
        object Label34: TLabel
          Left = 249
          Top = 16
          Width = 70
          Height = 13
          Caption = 'Costs for crew:'
        end
        object CurLabel2: TLabel
          Left = 355
          Top = 37
          Width = 3
          Height = 13
          Caption = '-'
        end
        object Label36: TLabel
          Left = 249
          Top = 64
          Width = 84
          Height = 13
          Caption = 'Earnings for flight:'
        end
        object CurLabel4: TLabel
          Left = 355
          Top = 85
          Width = 3
          Height = 13
          Caption = '-'
        end
        object CfF: TJvValidateEdit
          Left = 22
          Top = 33
          Width = 89
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
          OnDblClick = CfFDblClick
        end
        object LaF: TJvValidateEdit
          Left = 22
          Top = 81
          Width = 89
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
        object CfC: TJvValidateEdit
          Left = 262
          Top = 33
          Width = 89
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object EfF: TJvValidateEdit
          Left = 262
          Top = 81
          Width = 89
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 3
        end
      end
    end
  end
  object TimerKennung: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerKennungTimer
    Left = 8
    Top = 467
  end
  object FileDrop: TscFileDrop
    AllowedFileExtensions.Strings = (
      'igc'
      'olc')
    OnDrop = onFileDrop
    Left = 40
    Top = 466
  end
  object OpenDialogFiles: TOpenDialog
    Left = 72
    Top = 466
  end
end
