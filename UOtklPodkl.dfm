object FormOtklPodkl: TFormOtklPodkl
  Left = 427
  Top = 119
  BorderStyle = bsToolWindow
  Caption = #1054#1090#1082#1083#1102#1095#1077#1085#1080#1103' - '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
  ClientHeight = 564
  ClientWidth = 271
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
    Width = 271
    Height = 564
    ActivePage = sTabSheet1
    Align = alClient
    MultiLine = True
    Style = tsButtons
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabSheet1: TsTabSheet
      Caption = #1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1090#1077#1085#1080#1077': '#1085#1077#1090
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      inline frameOtklPodkl1: TfarmeOtklPodkl
        Left = 0
        Top = 0
        Width = 263
        Height = 509
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 263
        ExplicitHeight = 509
        inherited sPanel1: TsPanel
          Width = 263
          Height = 509
          ExplicitWidth = 263
          ExplicitHeight = 509
          inherited sPanel2: TsPanel
            Width = 261
            ExplicitWidth = 261
          end
          inherited sPanel3: TsPanel
            Width = 261
            ExplicitWidth = 261
          end
          inherited sPanel4: TsPanel
            Width = 261
            Height = 163
            ExplicitWidth = 261
            ExplicitHeight = 163
          end
        end
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = #1055#1088#1077#1076#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1090#1077#1085#1080#1077': '#1085#1077#1090
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inline frameOtklPodkl2: TfarmeOtklPodkl
        Left = 0
        Top = 0
        Width = 263
        Height = 509
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 263
        ExplicitHeight = 509
        inherited sPanel1: TsPanel
          Width = 263
          Height = 509
          ExplicitWidth = 263
          ExplicitHeight = 509
          inherited sPanel2: TsPanel
            Width = 261
            ExplicitWidth = 261
          end
          inherited sPanel3: TsPanel
            Width = 261
            ExplicitWidth = 261
          end
          inherited sPanel4: TsPanel
            Width = 261
            Height = 163
            ExplicitWidth = 261
            ExplicitHeight = 163
          end
        end
      end
    end
  end
  object sMemo1: TsMemo
    Left = 94
    Top = 8
    Width = 169
    Height = 17
    Lines.Strings = (
      'sMemo1')
    TabOrder = 1
    Visible = False
    Text = 'sMemo1'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
  end
end
