object FormDelCounter: TFormDelCounter
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1089#1095#1077#1090#1095#1080#1082#1086#1074
  ClientHeight = 229
  ClientWidth = 426
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
  object sLabel1: TsLabel
    Left = 16
    Top = 32
    Width = 215
    Height = 16
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1095#1105#1090#1095#1080#1082#1080' '#1077#1089#1083#1080' '#8470' '#1082#1074#1072#1088#1090#1080#1088#1099
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sBevel1: TsBevel
    Left = 8
    Top = 128
    Width = 401
    Height = 9
    Shape = bsTopLine
  end
  object sLabel2: TsLabel
    Left = 8
    Top = 146
    Width = 191
    Height = 16
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1079#1098#1105#1084#1099' '#1073#1077#1079' '#1089#1095#1105#1090#1095#1080#1082#1086#1074
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sBevel2: TsBevel
    Left = 8
    Top = 179
    Width = 401
    Height = 9
    Shape = bsTopLine
  end
  object sRadioGroup1: TsRadioGroup
    Left = 238
    Top = 8
    Width = 83
    Height = 65
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    ItemIndex = 1
    Items.Strings = (
      #1088#1072#1074#1077#1085
      #1085#1077' '#1088#1072#1074#1077#1085)
  end
  object sEdit1: TsEdit
    Left = 328
    Top = 32
    Width = 81
    Height = 21
    TabOrder = 1
    SkinData.SkinSection = 'EDIT'
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
  object sBitBtn1: TsBitBtn
    Left = 334
    Top = 86
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
    OnClick = sBitBtn1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sBitBtn2: TsBitBtn
    Left = 334
    Top = 194
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
    OnClick = sBitBtn2Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sBitBtn3: TsBitBtn
    Left = 334
    Top = 143
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 4
    OnClick = sBitBtn3Click
    SkinData.SkinSection = 'BUTTON'
  end
end
