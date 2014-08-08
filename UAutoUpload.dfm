object Form_AutoUpload: TForm_AutoUpload
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1072#1103' '#1074#1099#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 494
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    491
    494)
  PixelsPerInch = 96
  TextHeight = 13
  object sBevel3: TsBevel
    Left = 8
    Top = 450
    Width = 475
    Height = 17
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
    ExplicitTop = 502
  end
  object sGroupBox4: TsGroupBox
    Left = 8
    Top = 306
    Width = 475
    Height = 105
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
    TabOrder = 6
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel1: TsLabel
      Left = 16
      Top = 66
      Width = 99
      Height = 13
      Caption = #1052#1072#1089#1082#1072' '#1080#1084#1077#1085#1080' '#1092#1072#1081#1083#1072
    end
    object sDirectoryEdit1: TsDirectoryEdit
      Left = 186
      Top = 18
      Width = 273
      Height = 21
      AutoSize = False
      MaxLength = 255
      TabOrder = 0
      OnChange = sCheckBox1Click
      BoundLabel.Active = True
      BoundLabel.Caption = #1055#1091#1090#1100' '#1082#1072#1090#1072#1083#1086#1075#1072' '#1092#1072#1081#1083#1086#1074' '#1074#1099#1075#1088#1091#1079#1082#1080
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
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
      Root = 'rfDesktop'
    end
    object sEdit1: TsEdit
      Left = 273
      Top = 64
      Width = 99
      Height = 21
      Hint = 
        'y = '#1043#1086#1076' '#1080#1079' 2-'#1093' '#1087#1086#1089#1083#1077#1076#1085#1080#1093' '#1094#1080#1092#1088#13#10'yy = '#1043#1086#1076' '#1080#1079' 2-'#1093' '#1087#1086#1089#1083#1077#1076#1085#1080#1093' '#1094#1080#1092#1088#13#10'y' +
        'yyy = '#1043#1086#1076' '#1080#1079' 4-'#1093' '#1094#1080#1092#1088#9#13#10'm = '#1053#1086#1084#1077#1088' '#1084#1077#1089#1103#1094#1072' '#1073#1077#1079' 0'#13#10'mm = '#1053#1086#1084#1077#1088' '#1084#1077#1089#1103#1094 +
        #1072' '#1082#1072#1082' 2 '#1094#1080#1092#1088#1099#13#10'mmm = '#1052#1077#1089#1103#1094'  ('#1071#1085#1074')'#13#10'mmmm = '#1052#1077#1089#1103#1094'  ('#1071#1085#1074#1072#1088#1100')'#13#10'd = '#1063 +
        #1080#1089#1083#1086' '#1073#1077#1079' 0'#13#10'dd = '#1063#1080#1089#1083#1086' '#1082#1072#1082' 2 '#1094#1080#1092#1088#1099#13#10#13#10'h = '#1063#1072#1089' '#1073#1077#1079' 0'#13#10'hh = '#1063#1072#1089' '#1082#1072 +
        #1082' 2 '#1094#1080#1092#1088#1099#13#10'n   = '#1052#1080#1085#1091#1090#1099' '#1073#1077#1079' 0'#13#10'nn = '#1052#1080#1085#1091#1090#1099' '#1082#1072#1082' 2 '#1094#1080#1092#1088#1099#13#10's = '#1057#1077#1082#1091 +
        #1085#1076#1099' '#1073#1077#1079' 0'#13#10'ss = '#1057#1077#1082#1091#1085#1076#1099' '#1082#1072#1082' 2 '#1094#1080#1092#1088#1099
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'dd/mm/yy'
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103
      BoundLabel.Indent = 3
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sEdit2: TsEdit
      Left = 186
      Top = 63
      Width = 81
      Height = 21
      TabOrder = 2
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1055#1088#1077#1092#1080#1082#1089
      BoundLabel.Indent = 2
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sEdit3: TsEdit
      Left = 378
      Top = 64
      Width = 81
      Height = 21
      TabOrder = 3
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1055#1086#1089#1090#1092#1080#1082#1089
      BoundLabel.Indent = 2
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
  end
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 34
    Width = 475
    Height = 183
    Anchors = [akLeft, akTop, akRight]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1088#1077#1084#1077#1085#1080' '#1074#1099#1075#1088#1091#1079#1082#1080
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    DesignSize = (
      475
      183)
    object sBevel1: TsBevel
      Left = 16
      Top = 64
      Width = 443
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
      ExplicitWidth = 374
    end
    object sBevel2: TsBevel
      Left = 16
      Top = 144
      Width = 443
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
      ExplicitWidth = 374
    end
    object sBevel4: TsBevel
      Left = 16
      Top = 104
      Width = 443
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
      ExplicitWidth = 374
    end
    object sRadioButton1: TsRadioButton
      Left = 16
      Top = 32
      Width = 77
      Height = 20
      Caption = #1077#1078#1077#1076#1085#1077#1074#1085#1086
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = sCheckBox1Click
      SkinData.SkinSection = 'RADIOBUTTON'
    end
    object sRadioButton2: TsRadioButton
      Left = 16
      Top = 112
      Width = 81
      Height = 20
      Caption = #1077#1078#1077#1084#1077#1089#1103#1095#1085#1086
      TabOrder = 1
      OnClick = sCheckBox1Click
      SkinData.SkinSection = 'RADIOBUTTON'
    end
    object sRadioButton3: TsRadioButton
      Left = 16
      Top = 152
      Width = 81
      Height = 20
      Caption = #1086#1076#1085#1086#1082#1088#1072#1090#1085#1086
      TabOrder = 2
      OnClick = sCheckBox1Click
      SkinData.SkinSection = 'RADIOBUTTON'
    end
    object sTimePicker1: TsTimePicker
      Left = 370
      Top = 31
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1042#1088#1077#1084#1103
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sSpinEdit1: TsSpinEdit
      Left = 172
      Top = 112
      Width = 45
      Height = 21
      TabOrder = 4
      Text = '1'
      OnClick = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1063#1080#1089#1083#1086
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      MaxValue = 30
      MinValue = 1
      Value = 1
    end
    object sTimePicker2: TsTimePicker
      Left = 370
      Top = 112
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
      Text = '00:00:00'
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1042#1088#1077#1084#1103
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sTimePicker3: TsTimePicker
      Left = 370
      Top = 152
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 6
      Text = '00:00:00'
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1042#1088#1077#1084#1103
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sRadioButton4: TsRadioButton
      Left = 16
      Top = 72
      Width = 89
      Height = 20
      Caption = #1077#1078#1077#1085#1077#1076#1077#1083#1100#1085#1086
      TabOrder = 7
      OnClick = sCheckBox1Click
      SkinData.SkinSection = 'RADIOBUTTON'
    end
    object sTimePicker4: TsTimePicker
      Left = 370
      Top = 71
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 8
      Text = '00:00:00'
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1042#1088#1077#1084#1103
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sComboBox1: TsComboBox
      Left = 142
      Top = 71
      Width = 107
      Height = 21
      Alignment = taLeftJustify
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
      ItemHeight = 0
      ItemIndex = 0
      TabOrder = 9
      Text = #1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
      OnChange = sCheckBox1Click
      Items.Strings = (
        #1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
        #1074#1090#1086#1088#1085#1080#1082
        #1089#1088#1077#1076#1072
        #1095#1077#1090#1074#1077#1088#1075
        #1087#1103#1090#1085#1080#1094#1072
        #1089#1091#1073#1073#1086#1090#1072
        #1074#1086#1089#1082#1088#1077#1089#1077#1085#1100#1077)
    end
  end
  object sCheckBox1: TsCheckBox
    Left = 8
    Top = 8
    Width = 332
    Height = 20
    Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1091#1102' '#1074#1099#1075#1088#1091#1079#1082#1091' '#1076#1072#1085#1085#1099#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = sCheckBox1Click
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object sBitBtn1: TsBitBtn
    Left = 267
    Top = 461
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = sBitBtn1Click
    SkinData.SkinSection = 'BUTTON'
    ImageIndex = 17
    Images = Form1.ImageList2
  end
  object sBitBtn2: TsBitBtn
    Left = 378
    Top = 461
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
    OnClick = sBitBtn2Click
    SkinData.SkinSection = 'BUTTON'
    ImageIndex = 5
    Images = Form1.ImageList2
  end
  object sGroupBox2: TsGroupBox
    Left = 8
    Top = 223
    Width = 475
    Height = 77
    Anchors = [akLeft, akTop, akRight]
    Caption = #1042#1080#1076' '#1074#1099#1075#1088#1091#1079#1082#1080
    TabOrder = 4
    SkinData.SkinSection = 'GROUPBOX'
    object sRadioButton5: TsRadioButton
      Left = 16
      Top = 22
      Width = 157
      Height = 20
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1085#1072' '#1089#1077#1088#1074#1077#1088' MySQL'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = sRadioButton5Click
      SkinData.SkinSection = 'RADIOBUTTON'
    end
    object sRadioButton6: TsRadioButton
      Left = 16
      Top = 48
      Width = 175
      Height = 20
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' '#1092#1072#1081#1083' '#1074' '#1092#1086#1084#1072#1090#1080' dbf'
      TabOrder = 1
      OnClick = sRadioButton5Click
      SkinData.SkinSection = 'RADIOBUTTON'
    end
  end
  object sGroupBox3: TsGroupBox
    Left = 8
    Top = 306
    Width = 475
    Height = 138
    Caption = 'H'#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1089#1077#1088#1074#1077#1088#1072' MySQL'
    TabOrder = 5
    SkinData.SkinSection = 'GROUPBOX'
    object sEdit4: TsEdit
      Left = 85
      Top = 17
      Width = 132
      Height = 21
      TabOrder = 0
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1048#1084#1103' '#1089#1077#1088#1074#1077#1088#1072
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sEdit5: TsEdit
      Left = 85
      Top = 44
      Width = 132
      Height = 21
      TabOrder = 1
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1055#1086#1088#1090
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sEdit6: TsEdit
      Left = 85
      Top = 71
      Width = 132
      Height = 21
      TabOrder = 2
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1048#1084#1103' '#1041#1044
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sEdit7: TsEdit
      Left = 327
      Top = 17
      Width = 132
      Height = 21
      TabOrder = 3
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sEdit8: TsEdit
      Left = 327
      Top = 45
      Width = 132
      Height = 21
      PasswordChar = '*'
      TabOrder = 4
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1055#1072#1088#1086#1083#1100
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sBitBtn4: TsBitBtn
      Left = 327
      Top = 72
      Width = 132
      Height = 51
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
      TabOrder = 5
      OnClick = sBitBtn4Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sEdit9: TsEdit
      Left = 85
      Top = 98
      Width = 132
      Height = 21
      TabOrder = 6
      OnChange = sCheckBox1Click
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1053#1072#1079#1074'. '#1090#1072#1073#1083'.'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
  end
  object sBitBtn3: TsBitBtn
    Left = 8
    Top = 461
    Width = 191
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 7
    OnClick = sBitBtn3Click
    SkinData.SkinSection = 'BUTTON'
    ImageIndex = 32
    Images = Form1.ImageList2
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 255
    Top = 8
  end
  object ExportEnergo: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EXPORTENERGO'
      'SET '
      '    COD = :COD,'
      '    LIC_CH = :LIC_CH,'
      '    REGISTR_NOMER = :REGISTR_NOMER,'
      '    FIO = :FIO,'
      '    NAM_PUNK = :NAM_PUNK,'
      '    NAS_STR = :NAS_STR,'
      '    DOM = :DOM,'
      '    KORP = :KORP,'
      '    KVAR = :KVAR,'
      '    STAMP = :STAMP,'
      '    NOM_SCH = :NOM_SCH,'
      '    D1 = :D1,'
      '    D2 = :D2,'
      '    VAL_K1 = :VAL_K1,'
      '    VAL_MAX1 = :VAL_MAX1,'
      '    VAL_MIN1 = :VAL_MIN1,'
      '    VAL_K2 = :VAL_K2,'
      '    VAL_MAX2 = :VAL_MAX2,'
      '    VAL_MIN2 = :VAL_MIN2,'
      '    R_MAX = :R_MAX,'
      '    R_MIN = :R_MIN,'
      '    R_ALL = :R_ALL,'
      '    POK_T3 = :POK_T3,'
      '    POK_T4 = :POK_T4,'
      '    POK_T5 = :POK_T5,'
      '    POK_HOUSE = :POK_HOUSE,'
      '    POK_ALL = :POK_ALL,'
      '    DATE_TIME = :DATE_TIME,'
      '    FLAG = :FLAG'
      'WHERE'
      '    COD = :COD'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EXPORTENERGO'
      'WHERE'
      '        COD = :COD'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO EXPORTENERGO('
      '    COD,'
      '    LIC_CH,'
      '    REGISTR_NOMER,'
      '    FIO,'
      '    NAM_PUNK,'
      '    NAS_STR,'
      '    DOM,'
      '    KORP,'
      '    KVAR,'
      '    STAMP,'
      '    NOM_SCH,'
      '    D1,'
      '    D2,'
      '    VAL_K1,'
      '    VAL_MAX1,'
      '    VAL_MIN1,'
      '    VAL_K2,'
      '    VAL_MAX2,'
      '    VAL_MIN2,'
      '    R_MAX,'
      '    R_MIN,'
      '    R_ALL,'
      '    POK_T3,'
      '    POK_T4,'
      '    POK_T5,'
      '    POK_HOUSE,'
      '    POK_ALL,'
      '    DATE_TIME,'
      '    FLAG'
      ')'
      'VALUES('
      '    :COD,'
      '    :LIC_CH,'
      '    :REGISTR_NOMER,'
      '    :FIO,'
      '    :NAM_PUNK,'
      '    :NAS_STR,'
      '    :DOM,'
      '    :KORP,'
      '    :KVAR,'
      '    :STAMP,'
      '    :NOM_SCH,'
      '    :D1,'
      '    :D2,'
      '    :VAL_K1,'
      '    :VAL_MAX1,'
      '    :VAL_MIN1,'
      '    :VAL_K2,'
      '    :VAL_MAX2,'
      '    :VAL_MIN2,'
      '    :R_MAX,'
      '    :R_MIN,'
      '    :R_ALL,'
      '    :POK_T3,'
      '    :POK_T4,'
      '    :POK_T5,'
      '    :POK_HOUSE,'
      '    :POK_ALL,'
      '    :DATE_TIME,'
      '    :FLAG'
      ')')
    RefreshSQL.Strings = (
      'select *'
      '       FROM ExportEnergo'
      ''
      ' WHERE '
      '        COD = :COD'
      '    ')
    SelectSQL.Strings = (
      'select *'
      '       FROM ExportEnergo'
      'order by LIC_CH')
    Transaction = dm1.transact1
    Database = dm1.database
    UpdateTransaction = dm1.updateTransact
    Left = 287
    Top = 8
    poAskRecordCount = True
  end
  object addresmain_exp: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    addresmain.INC,'
      '    ADDR,'
      '    REZ,'
      '    REZ1,'
      '    REZ2,'
      '    CHEC,'
      '    CHECKED,'
      '    PIC,'
      '    DESCRIPTION,'
      '    TOWN'
      'FROM'
      '    ADDRESMAIN, town'
      'where chec = 1 and town.inc = rez'
      'order by addr'
      '')
    Transaction = dm1.transact1
    Database = dm1.database
    UpdateTransaction = dm1.updateTransact
    SQLScreenCursor = crSQLWait
    Left = 319
    Top = 7
    poAskRecordCount = True
    object addresmain_expINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object addresmain_expADDR: TFIBStringField
      FieldName = 'ADDR'
      Size = 40
      EmptyStrToNull = True
    end
    object addresmain_expREZ1: TFIBStringField
      FieldName = 'REZ1'
      Size = 40
      EmptyStrToNull = True
    end
    object addresmain_expREZ: TFIBIntegerField
      FieldName = 'REZ'
    end
    object addresmain_expREZ2: TFIBStringField
      FieldName = 'REZ2'
      Size = 40
      EmptyStrToNull = True
    end
    object addresmain_expCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
    object addresmain_expCHECKED: TFIBIntegerField
      FieldName = 'CHECKED'
    end
    object addresmain_expPIC: TFIBBlobField
      FieldName = 'PIC'
      Size = 8
    end
    object addresmain_expDESCRIPTION: TFIBMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object addresmain_expTOWN: TFIBStringField
      FieldName = 'TOWN'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object Export_1: TQExport4DBF
    DataSet = ExportEnergo
    ExportedFields.Strings = (
      'LIC_CH'
      'NOM_SCH'
      'STAMP'
      'REGISTR_NOMER'
      'FIO'
      'FLAG'
      'POK_ALL')
    About = '(About EMS AdvancedExport)'
    _Version = '4.1.0.1'
    FileName = 'E:\sektor\Project\ASCUE 4\As290109.dbf'
    Captions.Strings = (
      'REGISTR_NOMER=REZ1  '
      'FIO=TYPE'
      'FLAG=REZ2'
      'POK_ALL=POK ')
    DefaultFloatSize = 11
    DefaultFloatDecimal = 2
    ExportTimeAsStr = False
    NullValue = 'null'
    Left = 355
    Top = 7
  end
end
