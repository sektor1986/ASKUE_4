object Form_AutoRead: TForm_AutoRead
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1095#1090#1077#1085#1080#1077
  ClientHeight = 353
  ClientWidth = 423
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
    423
    353)
  PixelsPerInch = 96
  TextHeight = 13
  object sBevel3: TsBevel
    Left = 8
    Top = 306
    Width = 407
    Height = 17
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
    ExplicitTop = 193
    ExplicitWidth = 393
  end
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 34
    Width = 407
    Height = 183
    Anchors = [akLeft, akTop, akRight]
    Caption = #1047#1072#1087#1091#1089#1082#1072#1090#1100' '#1089#1095#1080#1090#1099#1074#1072#1085#1080#1077' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    DesignSize = (
      407
      183)
    object sBevel1: TsBevel
      Left = 16
      Top = 64
      Width = 375
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
      ExplicitWidth = 374
    end
    object sBevel2: TsBevel
      Left = 16
      Top = 144
      Width = 375
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
      ExplicitWidth = 374
    end
    object sBevel4: TsBevel
      Left = 16
      Top = 104
      Width = 375
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
      Left = 302
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
      Left = 302
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
      Left = 302
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
      Left = 302
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
      ItemHeight = 15
      ItemIndex = 0
      TabOrder = 9
      Text = #1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
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
    Width = 229
    Height = 20
    Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1074#1099#1087#1086#1083#1077#1085#1080#1077' '#1079#1072#1076#1072#1085#1080#1103
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
    Left = 199
    Top = 321
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
    Left = 310
    Top = 321
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
    Width = 407
    Height = 77
    Caption = #1056#1077#1078#1080#1084' '#1086#1087#1088#1086#1089#1072
    TabOrder = 4
    SkinData.SkinSection = 'GROUPBOX'
    object sRadioButton5: TsRadioButton
      Left = 16
      Top = 21
      Width = 340
      Height = 20
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1072' '#1095#1090#1077#1085#1080#1077' '#1089' '#1087#1086#1089#1083#1077#1076#1091#1102#1097#1080#1084' '#1095#1090#1077#1085#1080#1077#1084' '#1076#1072#1085#1085#1099#1093
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = sCheckBox1Click
      SkinData.SkinSection = 'RADIOBUTTON'
    end
    object sRadioButton6: TsRadioButton
      Left = 16
      Top = 48
      Width = 169
      Height = 20
      Caption = #1063#1090#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093' '#1089#1086' '#1089#1095#1077#1090#1095#1080#1082#1086#1074
      TabOrder = 1
      OnClick = sCheckBox1Click
      SkinData.SkinSection = 'RADIOBUTTON'
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 312
    Top = 8
  end
end
