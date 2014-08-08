object FormPassSchit: TFormPassSchit
  Left = 363
  Top = 303
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1087#1072#1088#1086#1083#1103' '#1076#1083#1103' '#1089#1095#1080#1090#1099#1074#1072#1090#1077#1083#1103
  ClientHeight = 118
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 333
    Height = 118
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sBevel1: TsBevel
      Left = 16
      Top = 56
      Width = 289
      Height = 25
      Shape = bsTopLine
    end
    object sEdit1: TsEdit
      Left = 256
      Top = 22
      Width = 57
      Height = 24
      Color = 14013951
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      OnChange = sEdit1Change
      OnKeyPress = sEdit1KeyPress
      SkinData.CustomColor = True
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1076#1083#1103' '#1089#1095#1080#1090#1099#1074#1072#1090#1077#1083#1103
      BoundLabel.Indent = 5
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -13
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = [fsBold]
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sBitBtn1: TsBitBtn
      Left = 48
      Top = 72
      Width = 75
      Height = 25
      TabOrder = 1
      OnClick = sBitBtn1Click
      Kind = bkOK
      SkinData.SkinSection = 'BUTTON'
    end
    object sBitBtn2: TsBitBtn
      Left = 192
      Top = 72
      Width = 75
      Height = 25
      TabOrder = 2
      Kind = bkCancel
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
