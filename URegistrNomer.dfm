object FormRegistrNomer: TFormRegistrNomer
  Left = 405
  Top = 389
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1086#1075#1086' '#1085#1086#1084#1077#1088#1072
  ClientHeight = 167
  ClientWidth = 249
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
    Width = 249
    Height = 167
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sBevel1: TsBevel
      Left = 20
      Top = 108
      Width = 213
      Height = 13
      Shape = bsTopLine
    end
    object sComboBox1: TsComboBox
      Left = 72
      Top = 20
      Width = 153
      Height = 19
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = #1054#1073#1083#1072#1089#1090#1100
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
      TabOrder = 0
      Text = #1041#1088#1077#1089#1090#1089#1082#1072#1103
      OnChange = sComboBox1Change
      Items.Strings = (
        #1041#1088#1077#1089#1090#1089#1082#1072#1103
        #1042#1080#1090#1077#1073#1089#1082#1072#1103
        #1043#1086#1084#1077#1083#1100#1089#1082#1072#1103
        #1043#1088#1086#1076#1085#1077#1085#1089#1082#1072#1103
        #1052#1080#1085#1089#1082#1072#1103
        '4 - '#1052#1086#1075#1080#1083#1077#1074#1089#1082#1072#1103)
    end
    object sComboBox2: TsComboBox
      Left = 72
      Top = 47
      Width = 153
      Height = 22
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = #1056#1072#1081#1086#1085
      BoundLabel.Indent = 12
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
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
      ItemHeight = 16
      ItemIndex = -1
      ParentFont = False
      TabOrder = 1
    end
    object sComboBox3: TsComboBox
      Left = 72
      Top = 74
      Width = 153
      Height = 19
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = #1058#1080#1087
      BoundLabel.Indent = 25
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
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
      TabOrder = 2
      Text = #1043#1086#1088#1086#1076
      Items.Strings = (
        #1043#1086#1088#1086#1076
        #1057#1077#1083#1086)
    end
    object sBitBtn1: TsBitBtn
      Left = 158
      Top = 124
      Width = 75
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
      TabOrder = 3
      OnClick = sBitBtn1Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
