object FormNa1Chislo: TFormNa1Chislo
  Left = 277
  Top = 141
  BorderStyle = bsToolWindow
  Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1085#1072' 1-'#1086#1077' '#1095#1080#1089#1083#1086' '#1084#1077#1089#1103#1094#1072
  ClientHeight = 501
  ClientWidth = 502
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
  object sPageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 502
    Height = 501
    ActivePage = sTabSheet1
    Align = alClient
    MultiLine = True
    Style = tsButtons
    TabOrder = 0
    OnChange = sPageControl1Change
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabSheet1: TsTabSheet
      Caption = '                    '#1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1090#1077#1085#1080#1077': '#1085#1077#1090'                    '
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      inline frameNa1Chislo1: TframeNa1Chislo
        Left = 0
        Top = 0
        Width = 494
        Height = 446
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 494
        ExplicitHeight = 446
        inherited sPanel1: TsPanel
          Width = 494
          Height = 446
          ExplicitWidth = 494
          ExplicitHeight = 446
          inherited sBitBtn1: TsBitBtn
            OnClick = frameNa1Chislo1sBitBtn1Click
          end
        end
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = 
        '                    '#1055#1088#1077#1076#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1090#1077#1085#1080#1077': '#1085#1077#1090'                   ' +
        ' '
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inline frameNa1Chislo2: TframeNa1Chislo
        Left = 0
        Top = 0
        Width = 494
        Height = 446
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 494
        ExplicitHeight = 446
        inherited sPanel1: TsPanel
          Width = 494
          Height = 446
          ExplicitWidth = 494
          ExplicitHeight = 446
          inherited sBitBtn1: TsBitBtn
            OnClick = frameNa1Chislo2sBitBtn1Click
          end
        end
      end
    end
  end
  object sCheckBox1: TsCheckBox
    Left = 19
    Top = 449
    Width = 297
    Height = 20
    Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1090#1088#1072#1085#1089#1092#1086#1088#1084#1072#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
end
