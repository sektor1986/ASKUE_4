object FormProgress: TFormProgress
  Left = 320
  Top = 389
  BorderStyle = bsToolWindow
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077
  ClientHeight = 85
  ClientWidth = 386
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 386
    Height = 85
    Align = alClient
    TabOrder = 0
    object sGauge1: TsGauge
      Left = 24
      Top = 32
      Width = 337
      Height = 17
      SkinData.SkinSection = 'GAUGE'
      ForeColor = clNavy
      Progress = 40
      Suffix = '%'
    end
    object sLabel1: TsLabel
      Left = 24
      Top = 13
      Width = 337
      Height = 13
      AutoSize = False
      SkinSection = 'none'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5391682
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      UseSkinColor = False
    end
  end
end