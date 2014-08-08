object FormPereimAdr: TFormPereimAdr
  Left = 384
  Top = 325
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1072#1076#1088#1077#1089
  ClientHeight = 202
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 304
    Height = 202
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    ExplicitHeight = 176
    DesignSize = (
      304
      202)
    object sBevel1: TsBevel
      Left = 16
      Top = 160
      Width = 281
      Height = 2
      Anchors = [akLeft, akBottom]
      Shape = bsTopLine
      ExplicitTop = 136
    end
    object sLabel1: TsLabel
      Left = 60
      Top = 24
      Width = 31
      Height = 13
      Caption = #1043#1086#1088#1086#1076
    end
    object sLabel2: TsLabel
      Left = 62
      Top = 132
      Width = 24
      Height = 13
      Caption = #1046#1069#1059
    end
    object sComboBox1: TsComboBox
      Left = 16
      Top = 48
      Width = 81
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
      TabOrder = 0
      Text = #1091#1083#1080#1094#1072
      Items.Strings = (
        #1091#1083#1080#1094#1072
        #1087#1088#1086#1089#1087#1077#1082#1090
        #1087#1077#1088#1077#1091#1083#1086#1082
        #1087#1088#1086#1077#1079#1076
        #1090#1088#1072#1082#1090
        #1073#1091#1083#1100#1074#1072#1088
        #1090#1091#1087#1080#1082
        #1087#1083#1086#1097#1072#1076#1100
        #1082#1086#1083#1100#1094#1086
        #1085#1072#1073#1077#1088#1077#1078#1085#1072#1103
        #1087#1086#1089#1105#1083#1086#1082
        #1096#1086#1089#1089#1077
        #1090#1077#1088#1088#1080#1090#1086#1088#1080#1103
        #1087#1072#1088#1082
        #1089#1090#1072#1085#1094#1080#1103
        #1084#1080#1082#1088#1086#1088#1072#1081#1086#1085
        #1074#1072#1083
        #1082#1074#1072#1088#1090#1072#1083
        #1091#1088#1086#1095#1080#1097#1077
        #1074#1086#1077#1085#1085#1099#1081' '#1075#1086#1088#1086#1076#1086#1082
        #1074#1086#1077#1085#1085#1072#1103' '#1095#1072#1089#1090#1100)
    end
    object sEdit1: TsEdit
      Left = 103
      Top = 48
      Width = 194
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
    object sEdit2: TsEdit
      Left = 103
      Top = 75
      Width = 58
      Height = 21
      TabOrder = 2
      OnKeyPress = sEdit2KeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1044#1086#1084
      BoundLabel.Indent = 16
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sEdit3: TsEdit
      Left = 103
      Top = 102
      Width = 58
      Height = 21
      TabOrder = 3
      OnKeyPress = sEdit2KeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1050#1086#1088#1087#1091#1089
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
      Left = 128
      Top = 168
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      Default = True
      TabOrder = 4
      OnClick = sBitBtn1Click
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
      ExplicitTop = 144
    end
    object sBitBtn2: TsBitBtn
      Left = 222
      Top = 168
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      TabOrder = 5
      Kind = bkCancel
      SkinData.SkinSection = 'BUTTON'
      ExplicitTop = 144
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 103
      Top = 21
      Width = 121
      Height = 21
      EditButtons = <>
      KeyField = 'INC'
      ListField = 'TOWN'
      ListFieldIndex = 1
      ListSource = dm1.DStownAdd
      TabOrder = 6
      Visible = True
    end
    object DBEditEh1: TDBEditEh
      Left = 103
      Top = 129
      Width = 58
      Height = 21
      DataField = 'JEU'
      DataSource = dm1.DSaddresmain
      EditButtons = <>
      TabOrder = 7
      Visible = True
    end
  end
end
