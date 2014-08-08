object frameVartar: TframeVartar
  Left = 0
  Top = 0
  Width = 570
  Height = 406
  TabOrder = 0
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 147
    Height = 406
    Align = alLeft
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sPanel4: TsPanel
      Left = 1
      Top = 1
      Width = 145
      Height = 160
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sLabel1: TsLabel
        Left = 16
        Top = 123
        Width = 55
        Height = 26
        Caption = #1050#1086#1088#1088#1077#1082#1094#1080#1103#13#10#1095#1072#1089#1086#1074
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
      end
      object sLabel2: TsLabel
        Left = 28
        Top = 3
        Width = 84
        Height = 13
        Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        UseSkinColor = False
      end
      object sComboBox1: TsComboBox
        Left = 77
        Top = 22
        Width = 44
        Height = 19
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = #1057#1077#1079#1086#1085#1086#1074
        BoundLabel.Indent = 15
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        ReadOnly = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = '1'
        OnChange = sComboBox1Change
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12')
      end
      object sComboBox2: TsComboBox
        Tag = 2
        Left = 77
        Top = 49
        Width = 44
        Height = 19
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = #1058#1072#1088#1080#1092#1086#1074
        BoundLabel.Indent = 13
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        ReadOnly = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = '1'
        Items.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
      object sComboBox3: TsComboBox
        Tag = 13
        Left = 77
        Top = 76
        Width = 44
        Height = 19
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = #1060#1080#1082#1089'. '#1076#1072#1090
        BoundLabel.Indent = 6
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        ReadOnly = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = '0'
        OnChange = sComboBox3Change
        Items.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25')
      end
      object sCheckBox1: TsCheckBox
        Tag = 14
        Left = 8
        Top = 103
        Width = 72
        Height = 20
        Caption = #1051#1077#1090#1086'-'#1079#1080#1084#1072
        TabOrder = 3
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        ReadOnly = True
      end
      object sMaskEdit1: TsMaskEdit
        Tag = 16
        Left = 77
        Top = 128
        Width = 44
        Height = 21
        BiDiMode = bdLeftToRight
        Color = clWhite
        EditMask = '!#\ 90:00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '+ 10:21'
        BoundLabel.Caption = #1050#1086#1088#1088#1077
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
    end
    object sPanel5: TsPanel
      Left = 1
      Top = 161
      Width = 145
      Height = 98
      Align = alTop
      ParentBackground = False
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object sLabel3: TsLabel
        Left = 36
        Top = 6
        Width = 74
        Height = 26
        Alignment = taCenter
        Caption = #1054#1090#1082#1083#1102#1095#1077#1085#1080#1077#13#10#1085#1072#1075#1088#1091#1079#1082#1080
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        UseSkinColor = False
      end
      object sLabel4: TsLabel
        Left = 16
        Top = 38
        Width = 42
        Height = 26
        Caption = #1055#1088#1080#1079#1085#1072#1082#13#10#1086#1090#1082#1083'.'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
      end
      object sComboBox4: TsComboBox
        Tag = 15
        Left = 77
        Top = 38
        Width = 44
        Height = 19
        Alignment = taLeftJustify
        BoundLabel.Caption = #1055#1088#1080#1079#1085#1072#1082' '#1086#1090#1082#1083'.'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        ReadOnly = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = '1'
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5')
      end
      object sMaskEdit2: TsMaskEdit
        Tag = 12
        Left = 77
        Top = 65
        Width = 44
        Height = 21
        Color = clWhite
        EditMask = '!90,00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '12,25'
        BoundLabel.Active = True
        BoundLabel.Caption = #1051#1080#1084#1080#1090', '#1082#1042#1090
        BoundLabel.Indent = 2
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
    end
    object sPanel6: TsPanel
      Left = 1
      Top = 259
      Width = 145
      Height = 146
      Align = alClient
      ParentBackground = False
      TabOrder = 2
      SkinData.SkinSection = 'PANEL'
      object sLabel5: TsLabel
        Left = 16
        Top = 24
        Width = 79
        Height = 26
        Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#13#10#1090#1088#1072#1085#1089#1092#1086#1088#1084#1072#1094#1080#1080
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
      end
      object sMaskEdit3: TsMaskEdit
        Tag = 17
        Left = 101
        Top = 24
        Width = 30
        Height = 26
        Align = alCustom
        BiDiMode = bdLeftToRight
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '1'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object sMaskEdit4: TsMaskEdit
        Tag = 19
        Left = 33
        Top = 72
        Width = 54
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        BoundLabel.Active = True
        BoundLabel.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
        BoundLabel.Indent = 2
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclTopCenter
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
    end
  end
  object sPanel2: TsPanel
    Left = 147
    Top = 0
    Width = 279
    Height = 406
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sPanel7: TsPanel
      Left = 1
      Top = 1
      Width = 277
      Height = 136
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sLabel6: TsLabel
        Left = 72
        Top = 3
        Width = 124
        Height = 13
        Alignment = taCenter
        Caption = #1058#1072#1088#1080#1092#1085#1099#1077' '#1087#1077#1088#1077#1093#1086#1076#1099
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        UseSkinColor = False
      end
      object sez1: TsSpeedButton
        Left = 10
        Top = 24
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 1'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sez2: TsSpeedButton
        Tag = 1
        Left = 98
        Top = 24
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 2'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sez3: TsSpeedButton
        Tag = 2
        Left = 186
        Top = 24
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 3'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sez4: TsSpeedButton
        Tag = 3
        Left = 10
        Top = 52
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 4'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sez5: TsSpeedButton
        Tag = 4
        Left = 98
        Top = 52
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 5'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sez6: TsSpeedButton
        Tag = 5
        Left = 186
        Top = 52
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 6'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sez7: TsSpeedButton
        Tag = 6
        Left = 10
        Top = 80
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 7'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sez8: TsSpeedButton
        Tag = 7
        Left = 98
        Top = 80
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 8'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sez9: TsSpeedButton
        Tag = 8
        Left = 186
        Top = 80
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 9'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sez10: TsSpeedButton
        Tag = 9
        Left = 10
        Top = 108
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 10'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sez11: TsSpeedButton
        Tag = 10
        Left = 98
        Top = 108
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 11'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sez12: TsSpeedButton
        Tag = 11
        Left = 186
        Top = 108
        Width = 79
        Height = 22
        Caption = #1057#1077#1079#1086#1085' 12'
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
    end
    object sPanel8: TsPanel
      Left = 1
      Top = 137
      Width = 277
      Height = 215
      Align = alTop
      ParentBackground = False
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object sLabel7: TsLabel
        Left = 72
        Top = 6
        Width = 129
        Height = 13
        Caption = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1076#1072#1090#1099
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        UseSkinColor = False
      end
      object fd1: TsMaskEdit
        Tag = 360
        Left = 20
        Top = 25
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = ' 1'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd7: TsMaskEdit
        Tag = 366
        Left = 87
        Top = 25
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '7'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd13: TsMaskEdit
        Tag = 372
        Left = 154
        Top = 25
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '13'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd19: TsMaskEdit
        Tag = 378
        Left = 220
        Top = 25
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '19'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd2: TsMaskEdit
        Tag = 361
        Left = 20
        Top = 52
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '2'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd8: TsMaskEdit
        Tag = 367
        Left = 87
        Top = 52
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '8'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd14: TsMaskEdit
        Tag = 373
        Left = 154
        Top = 52
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '14'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd20: TsMaskEdit
        Tag = 379
        Left = 220
        Top = 52
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '20'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd3: TsMaskEdit
        Tag = 362
        Left = 20
        Top = 79
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '3'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd9: TsMaskEdit
        Tag = 368
        Left = 87
        Top = 79
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '9'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd15: TsMaskEdit
        Tag = 374
        Left = 154
        Top = 79
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '15'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd21: TsMaskEdit
        Tag = 380
        Left = 220
        Top = 79
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '21'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd4: TsMaskEdit
        Tag = 363
        Left = 20
        Top = 106
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '4'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd10: TsMaskEdit
        Tag = 369
        Left = 87
        Top = 106
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '10'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd16: TsMaskEdit
        Tag = 375
        Left = 154
        Top = 106
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '16'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd22: TsMaskEdit
        Tag = 381
        Left = 220
        Top = 106
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '22'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd5: TsMaskEdit
        Tag = 364
        Left = 20
        Top = 133
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '5'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd11: TsMaskEdit
        Tag = 370
        Left = 87
        Top = 133
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '11'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd17: TsMaskEdit
        Tag = 376
        Left = 154
        Top = 133
        Width = 43
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '17'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd23: TsMaskEdit
        Tag = 382
        Left = 220
        Top = 133
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '23'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd6: TsMaskEdit
        Tag = 365
        Left = 20
        Top = 160
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '6'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd12: TsMaskEdit
        Tag = 371
        Left = 87
        Top = 160
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 21
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '12'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd18: TsMaskEdit
        Tag = 377
        Left = 154
        Top = 160
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 22
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '18'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd24: TsMaskEdit
        Tag = 383
        Left = 219
        Top = 160
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 23
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '24'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object fd25: TsMaskEdit
        Tag = 384
        Left = 220
        Top = 186
        Width = 45
        Height = 21
        Color = clWhite
        EditMask = '!>L\ 00\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 24
        Text = #1042' 01-01'
        BoundLabel.Active = True
        BoundLabel.Caption = '25'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
    end
    object sPanel9: TsPanel
      Left = 1
      Top = 352
      Width = 277
      Height = 53
      Align = alClient
      ParentBackground = False
      TabOrder = 2
      SkinData.SkinSection = 'PANEL'
      object sLabel8: TsLabel
        Left = 20
        Top = 6
        Width = 157
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1074#1072#1088#1080#1072#1085#1090#1072' '#1090#1072#1088#1080#1092#1080#1082#1072#1094#1080#1080':'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
      end
      object sLabel9: TsLabel
        Left = 189
        Top = 6
        Width = 6
        Height = 13
        Alignment = taRightJustify
        Caption = '1'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
      end
      object sCheckBox2: TsCheckBox
        Tag = 21
        Left = 15
        Top = 25
        Width = 156
        Height = 20
        Caption = #1063#1090#1077#1085#1080#1077' '#1087#1088#1086#1092#1080#1083#1103' '#1085#1072#1075#1088#1091#1079#1082#1080' '
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        ReadOnly = True
      end
    end
  end
  object sPanel3: TsPanel
    Left = 426
    Top = 0
    Width = 144
    Height = 406
    Align = alRight
    ParentBackground = False
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object sPanel10: TsPanel
      Left = 1
      Top = 1
      Width = 142
      Height = 308
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sLabel10: TsLabel
        Left = 48
        Top = 3
        Width = 49
        Height = 13
        Caption = #1044#1080#1089#1087#1083#1077#1081
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        UseSkinColor = False
      end
      object sCheckBox3: TsCheckBox
        Tag = 3
        Left = 20
        Top = 22
        Width = 50
        Height = 20
        Caption = #1042#1088#1077#1084#1103
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        ReadOnly = True
      end
      object sCheckBox4: TsCheckBox
        Tag = 4
        Left = 20
        Top = 42
        Width = 61
        Height = 20
        Caption = #1058#1072#1088#1080#1092' 1'
        TabOrder = 1
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        ReadOnly = True
      end
      object sCheckBox5: TsCheckBox
        Tag = 5
        Left = 20
        Top = 62
        Width = 58
        Height = 20
        Caption = #1058#1072#1088#1080#1092'2'
        TabOrder = 2
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        ReadOnly = True
      end
      object sCheckBox6: TsCheckBox
        Tag = 6
        Left = 20
        Top = 82
        Width = 61
        Height = 20
        Caption = #1058#1072#1088#1080#1092' 3'
        TabOrder = 3
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        ReadOnly = True
      end
      object sCheckBox7: TsCheckBox
        Tag = 7
        Left = 20
        Top = 102
        Width = 61
        Height = 20
        Caption = #1058#1072#1088#1080#1092' 4'
        TabOrder = 4
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        ReadOnly = True
      end
      object sCheckBox8: TsCheckBox
        Tag = 9
        Left = 20
        Top = 122
        Width = 72
        Height = 20
        Caption = #1052#1086#1097#1085#1086#1089#1090#1100
        TabOrder = 5
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        ReadOnly = True
      end
      object sCheckBox9: TsCheckBox
        Tag = 11
        Left = 20
        Top = 152
        Width = 46
        Height = 20
        Caption = #1044#1072#1090#1072
        TabOrder = 6
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        ReadOnly = True
      end
      object sCheckBox10: TsCheckBox
        Tag = 8
        Left = 20
        Top = 172
        Width = 98
        Height = 20
        Caption = #1042#1099#1074'. '#1089#1091#1084'. '#1101#1085#1077#1088'.'
        TabOrder = 7
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        ReadOnly = True
      end
      object sSpinEdit1: TsSpinEdit
        Left = 84
        Top = 269
        Width = 37
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = '4'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = #1042#1088#1077#1084#1103' '#1074#1099#1074'.'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        MaxValue = 10
        MinValue = 0
        Value = 4
      end
    end
    object sPanel11: TsPanel
      Left = 1
      Top = 309
      Width = 142
      Height = 96
      Align = alClient
      ParentBackground = False
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object sBitBtn1: TsBitBtn
        Left = 13
        Top = 42
        Width = 116
        Height = 35
        Caption = 'OK'
        Default = True
        TabOrder = 0
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
end
