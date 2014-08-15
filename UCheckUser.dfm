object FormCheckUser: TFormCheckUser
  Left = 395
  Top = 249
  BorderStyle = bsNone
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  ClientHeight = 361
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 361
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    ExplicitWidth = 718
    ExplicitHeight = 435
    DesignSize = (
      341
      361)
    object sRadioGroup1: TsRadioGroup
      Left = 22
      Top = 16
      Width = 297
      Height = 105
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ParentBackground = False
      TabOrder = 3
      CaptionLayout = clTopCenter
      SkinData.SkinSection = 'GROUPBOX'
      ItemIndex = 0
      Items.Strings = (
        #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
        #1054#1087#1099#1090#1085#1099#1081' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        #1057' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1085#1099#1084#1080' '#1087#1088#1072#1074#1072#1084#1080)
    end
    object sBitBtn1: TsBitBtn
      Left = 22
      Top = 322
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      TabOrder = 2
      OnClick = sBitBtn1Click
      Kind = bkCancel
      SkinData.SkinSection = 'BUTTON'
      ExplicitTop = 282
    end
    object sBitBtn2: TsBitBtn
      Left = 244
      Top = 322
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      Default = True
      TabOrder = 1
      OnClick = sBitBtn2Click
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
    object sEdit1: TsEdit
      Left = 102
      Top = 136
      Width = 121
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1055#1072#1088#1086#1083#1100
      BoundLabel.Indent = 2
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clBlack
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopCenter
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object rgb1: TsRadioGroup
      Left = 24
      Top = 163
      Width = 295
      Height = 42
      Caption = #1057#1077#1088#1074#1077#1088
      ParentBackground = False
      TabOrder = 4
      OnClick = rgb1Click
      SkinData.SkinSection = 'GROUPBOX'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #1051#1086#1082#1072#1083#1100#1085#1099#1081
        #1059#1076#1072#1083#1077#1085#1085#1099#1081)
    end
    object grp1: TsGroupBox
      Left = 22
      Top = 211
      Width = 297
      Height = 100
      Caption = #1055#1091#1090#1100' '#1089#1077#1088#1074#1077#1088#1072
      ParentBackground = False
      TabOrder = 5
      Visible = False
      SkinData.SkinSection = 'GROUPBOX'
      object edt1: TsEdit
        Left = 112
        Top = 16
        Width = 145
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
        BoundLabel.Caption = #1048#1084#1103' '#1089#1077#1088#1074#1077#1088#1072' '#1041#1044
        BoundLabel.Indent = 15
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object edt2: TsEdit
        Left = 112
        Top = 43
        Width = 145
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '3050'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = #1055#1086#1088#1090' '#1089#1077#1088#1074#1077#1088#1072' '#1041#1044
        BoundLabel.Indent = 10
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object edt3: TsEdit
        Left = 112
        Top = 70
        Width = 145
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = #1060#1072#1081#1083' '#1073#1072#1079#1099
        BoundLabel.Indent = 42
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
    end
    object grp2: TsGroupBox
      Left = 22
      Top = 210
      Width = 297
      Height = 100
      Caption = #1055#1091#1090#1100' '#1082' '#1073#1072#1079#1077
      ParentBackground = False
      TabOrder = 6
      SkinData.SkinSection = 'GROUPBOX'
      object btnSBFileBase: TsSpeedButton
        Left = 261
        Top = 44
        Width = 23
        Height = 25
        Caption = '...'
        OnClick = btnSBFileBaseClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object edtFileBase: TsEdit
        Left = 17
        Top = 44
        Width = 238
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
        BoundLabel.Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1103' '#1041#1044
        BoundLabel.Indent = 5
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
    end
  end
  object dlg1: TsOpenDialog
    Filter = #1060#1072#1081#1083' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093' FireBird|*.fdb'
    Left = 289
    Top = 12
  end
end
