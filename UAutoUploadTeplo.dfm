object Form_AutoUploadTeplo: TForm_AutoUploadTeplo
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1072#1103' '#1074#1099#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1087#1086' '#1090#1077#1087#1083#1086#1089#1095#1077#1090#1095#1080#1082#1072#1084
  ClientHeight = 373
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    491
    373)
  PixelsPerInch = 96
  TextHeight = 13
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
    TabOrder = 0
    OnClick = sCheckBox1Click
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 34
    Width = 475
    Height = 183
    Anchors = [akLeft, akTop, akRight]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1088#1077#1084#1077#1085#1080' '#1074#1099#1075#1088#1091#1079#1082#1080
    TabOrder = 1
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
      Top = 160
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
      OnChange = sCheckBox1Click
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
  object sGroupBox4: TsGroupBox
    Left = 8
    Top = 223
    Width = 475
    Height = 105
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
    TabOrder = 2
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
  object sBitBtn3: TsBitBtn
    Left = 8
    Top = 340
    Width = 191
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 3
    OnClick = sBitBtn3Click
    SkinData.SkinSection = 'BUTTON'
    ImageIndex = 32
    Images = Form1.ImageList2
    ExplicitTop = 433
  end
  object sBitBtn1: TsBitBtn
    Left = 267
    Top = 340
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = sBitBtn1Click
    SkinData.SkinSection = 'BUTTON'
    ImageIndex = 17
    Images = Form1.ImageList2
    ExplicitTop = 433
  end
  object sBitBtn2: TsBitBtn
    Left = 378
    Top = 340
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 5
    OnClick = sBitBtn2Click
    SkinData.SkinSection = 'BUTTON'
    ImageIndex = 5
    Images = Form1.ImageList2
    ExplicitTop = 433
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 373
    Top = 3
  end
end
