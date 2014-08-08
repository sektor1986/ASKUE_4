object FormTarNak: TFormTarNak
  Left = 224
  Top = 292
  BorderStyle = bsToolWindow
  Caption = #1058#1072#1088#1080#1092#1085#1099#1077' '#1085#1072#1082#1086#1087#1080#1090#1077#1083#1080
  ClientHeight = 256
  ClientWidth = 558
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
  object sPageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 558
    Height = 256
    ActivePage = sTabSheet1
    Align = alClient
    MultiLine = True
    Style = tsButtons
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabSheet1: TsTabSheet
      Caption = 
        '                              '#1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1090#1077#1085#1080#1077': '#1085#1077#1090'             ' +
        '                 '
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      inline frameTarNak1: TframeTarNak
        Left = 0
        Top = 0
        Width = 550
        Height = 177
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 550
        ExplicitHeight = 177
        inherited sPanel1: TsPanel
          Width = 550
          Height = 177
          ExplicitWidth = 550
          ExplicitHeight = 177
          inherited sBitBtn1: TsBitBtn
            OnClick = frameTarNak1sBitBtn1Click
          end
        end
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = 
        '                              '#1055#1088#1077#1076#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1090#1077#1085#1080#1077': '#1085#1077#1090'         ' +
        '                     '
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inline frameTarNak2: TframeTarNak
        Left = 0
        Top = 0
        Width = 550
        Height = 177
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 550
        ExplicitHeight = 177
        inherited sPanel1: TsPanel
          Width = 550
          Height = 177
          ExplicitWidth = 550
          ExplicitHeight = 177
          inherited sBitBtn1: TsBitBtn
            OnClick = frameTarNak2sBitBtn1Click
          end
        end
      end
    end
    object sTabSheet3: TsTabSheet
      Caption = 
        '                              '#1056#1072#1079#1085#1080#1094#1072'                           ' +
        '  '
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inline frameTarNak3: TframeTarNak
        Left = 0
        Top = 0
        Width = 550
        Height = 177
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 550
        ExplicitHeight = 177
        inherited sPanel1: TsPanel
          Width = 550
          Height = 177
          ExplicitWidth = 550
          ExplicitHeight = 177
          inherited sBitBtn1: TsBitBtn
            OnClick = frameTarNak3sBitBtn1Click
          end
        end
      end
    end
  end
  object sCheckBox1: TsCheckBox
    Left = 24
    Top = 214
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
