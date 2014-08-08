object FormBackUp: TFormBackUp
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1079#1077#1088#1074#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099
  ClientHeight = 268
  ClientWidth = 531
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
    Width = 531
    Height = 268
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sSpeedButton1: TsSpeedButton
      Left = 399
      Top = 16
      Width = 23
      Height = 21
      Caption = '...'
      OnClick = sSpeedButton1Click
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object sBevel1: TsBevel
      Left = 8
      Top = 223
      Width = 513
      Height = 18
      Shape = bsTopLine
    end
    object sEdit1: TsEdit
      Left = 80
      Top = 16
      Width = 305
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
      BoundLabel.Caption = #1055#1091#1090#1100' '#1082' '#1073#1072#1079#1077
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
      Left = 428
      Top = 16
      Width = 93
      Height = 21
      Caption = #1053#1072#1095#1072#1090#1100
      TabOrder = 1
      OnClick = sBitBtn1Click
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 31
      Images = Form1.ImageList2
    end
    object sMemo1: TsMemo
      Left = 8
      Top = 56
      Width = 513
      Height = 161
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 2
      Text = #13#10
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
      Left = 446
      Top = 230
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
      OnClick = sBitBtn2Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object FIBBackup: TpFIBBackupService
    LibraryName = 'fbclient.dll'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    BlockingFactor = 0
    Options = []
    Left = 40
    Top = 72
  end
  object sOpenDialog: TsOpenDialog
    Filter = #1060#1072#1081#1083' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093' FireBird|*.fdb'
    Left = 112
    Top = 72
  end
end
