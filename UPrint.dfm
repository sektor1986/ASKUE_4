object FormPrint: TFormPrint
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1077#1095#1072#1090#1100
  ClientHeight = 204
  ClientWidth = 350
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
    Width = 350
    Height = 204
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      350
      204)
    object sGauge1: TsGauge
      Left = 8
      Top = 149
      Width = 335
      Height = 17
      Anchors = [akLeft, akRight, akBottom]
      SkinData.SkinSection = 'GAUGE'
      ForeColor = clBlack
      Progress = 0
      Suffix = '%'
      ExplicitTop = 147
      ExplicitWidth = 265
    end
    object sBitBtn1: TsBitBtn
      Left = 215
      Top = 172
      Width = 128
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1095#1105#1090
      TabOrder = 0
      OnClick = sBitBtn1Click
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 36
      Images = Form1.ImageList2
    end
    object sRadioGroup1: TsRadioGroup
      Left = 194
      Top = 8
      Width = 149
      Height = 131
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      ParentBackground = False
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      ItemIndex = 0
      Items.Strings = (
        #1042#1077#1089#1100' '#1072#1076#1088#1077#1089
        #1055#1086#1088#1072#1079#1098#1105#1084#1085#1086
        #1054#1076#1080#1085' '#1088#1072#1079#1098#1105#1084)
    end
    object sRadioGroup2: TsRadioGroup
      Left = 8
      Top = 8
      Width = 180
      Height = 131
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1042#1080#1076' '#1086#1090#1095#1105#1090#1072
      ParentBackground = False
      TabOrder = 2
      OnClick = sRadioGroup2Click
      SkinData.SkinSection = 'GROUPBOX'
      ItemIndex = 0
      Items.Strings = (
        #1057#1090#1088#1091#1082#1090#1091#1088#1072
        #1053#1086#1084#1077#1088#1072' SIM'
        #1054#1090#1095#1105#1090' '#1086#1087#1088#1086#1089#1072
        #1043#1086#1076#1086#1074#1086#1081' '#1087#1086' '#1089#1091#1084#1084#1080#1088#1091#1102#1097#1080#1084)
    end
  end
end
