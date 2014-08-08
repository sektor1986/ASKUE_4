object FormNaznVarTar: TFormNaznVarTar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1074#1072#1088#1080#1072#1085#1090#1072' '#1090#1072#1088#1080#1092#1080#1082#1072#1094#1080#1080
  ClientHeight = 112
  ClientWidth = 261
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
    Width = 261
    Height = 112
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Bevel1: TBevel
      Left = 24
      Top = 57
      Width = 207
      Height = 33
      Shape = bsTopLine
    end
    object sComboBox1: TsComboBox
      Left = 182
      Top = 24
      Width = 49
      Height = 27
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = #8470' '#1074#1072#1088#1080#1072#1085#1090#1072' '#1090#1072#1088#1080#1082#1072#1094#1080#1080
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -13
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = [fsBold]
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'COMBOBOX'
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 19
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = '1'
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
        '10')
    end
    object sButton1: TsButton
      Left = 64
      Top = 72
      Width = 75
      Height = 25
      Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100
      TabOrder = 1
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton2: TsButton
      Left = 156
      Top = 72
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = sButton2Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
