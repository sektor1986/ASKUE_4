object FormPomesPotr: TFormPomesPotr
  Left = 352
  Top = 184
  BorderStyle = bsToolWindow
  Caption = #1055#1086#1084#1077#1089#1103#1095#1085#1086#1077' '#1087#1086#1090#1088#1077#1073#1083#1077#1085#1080#1077
  ClientHeight = 520
  ClientWidth = 502
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
    Width = 502
    Height = 520
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
      inline framePomesPotr1: TframePomesPotr
        Left = 0
        Top = 0
        Width = 494
        Height = 465
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 494
        ExplicitHeight = 465
        inherited sPanel1: TsPanel
          Width = 494
          Height = 465
          ExplicitWidth = 494
          ExplicitHeight = 465
          inherited sEdit1: TsEdit
            AutoSize = True
          end
          inherited sBitBtn1: TsBitBtn
            OnClick = framePomesPotr1sBitBtn1Click
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
      inline framePomesPotr2: TframePomesPotr
        Left = 0
        Top = 0
        Width = 494
        Height = 465
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 494
        ExplicitHeight = 465
        inherited sPanel1: TsPanel
          Width = 494
          Height = 465
          ExplicitWidth = 494
          ExplicitHeight = 465
          inherited sBitBtn1: TsBitBtn
            OnClick = framePomesPotr2sBitBtn1Click
          end
        end
      end
    end
  end
  object sCheckBox1: TsCheckBox
    Left = 19
    Top = 473
    Width = 297
    Height = 20
    Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1090#1088#1072#1085#1089#1092#1086#1088#1084#1072#1094#1080#1080
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 1
    Visible = False
    OnClick = sCheckBox1Click
    SkinData.CustomFont = True
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
end
