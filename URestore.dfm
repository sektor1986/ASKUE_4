object FormRestore: TFormRestore
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1073#1072#1079#1099' '#1080#1079' '#1088#1077#1079#1077#1088#1074#1085#1086#1081'  '#1082#1086#1087#1080#1080
  ClientHeight = 327
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 556
    Height = 327
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sBevel1: TsBevel
      Left = 8
      Top = 271
      Width = 529
      Height = 18
      Shape = bsTopLine
    end
    object sGroupBox1: TsGroupBox
      Left = 8
      Top = 8
      Width = 529
      Height = 97
      ParentBackground = False
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object sSpeedButton1: TsSpeedButton
        Left = 399
        Top = 15
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = sSpeedButton1Click
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sSpeedButton2: TsSpeedButton
        Left = 399
        Top = 43
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = sSpeedButton2Click
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sEdit1: TsEdit
        Left = 176
        Top = 16
        Width = 217
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = #1060#1072#1081#1083' '#1088#1077#1079#1077#1088#1074#1085#1086#1081' '#1082#1086#1087#1080#1080' '#1041#1044
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sEdit2: TsEdit
        Left = 176
        Top = 43
        Width = 217
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1103' '#1076#1083#1103' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sBitBtn1: TsBitBtn
        Left = 440
        Top = 43
        Width = 75
        Height = 21
        Caption = #1053#1072#1095#1072#1090#1100
        TabOrder = 2
        OnClick = sBitBtn1Click
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 31
        Images = Form1.ImageList2
      end
      object sRadioButton1: TsRadioButton
        Left = 16
        Top = 70
        Width = 122
        Height = 19
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1041#1044
        Checked = True
        TabOrder = 3
        TabStop = True
        SkinData.SkinSection = 'RADIOBUTTON'
      end
      object sRadioButton2: TsRadioButton
        Left = 160
        Top = 70
        Width = 159
        Height = 19
        Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1091#1102
        TabOrder = 4
        SkinData.SkinSection = 'RADIOBUTTON'
      end
      object sComboBox1: TsComboBox
        Left = 441
        Top = 70
        Width = 74
        Height = 21
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = #1056#1072#1079#1084#1077#1088' '#1089#1090#1088#1072#1085#1080#1094#1099
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        Style = csDropDownList
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        TabOrder = 5
        Text = '1024'
        Items.Strings = (
          '1024'
          '2048'
          '4096')
      end
    end
    object sMemo1: TsMemo
      Left = 8
      Top = 112
      Width = 529
      Height = 153
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.CustomFont = True
      SkinData.SkinSection = 'EDIT'
    end
    object sBitBtn2: TsBitBtn
      Left = 462
      Top = 285
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
      OnClick = sBitBtn2Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object FIBRestore: TpFIBRestoreService
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    PageBuffers = 0
    Left = 48
    Top = 136
  end
  object sOpenDialog: TsOpenDialog
    Filter = #1060#1072#1081#1083' '#1088#1077#1079#1077#1088#1074#1085#1086#1081' '#1082#1086#1087#1080#1080'|*.gbk'
    Left = 120
    Top = 136
  end
  object sSaveDialog: TsSaveDialog
    Filter = #1060#1072#1081#1083' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093' FireBird|*.fdb'
    Left = 192
    Top = 136
  end
end
