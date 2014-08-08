object FormPower: TFormPower
  Left = 373
  Top = 270
  BorderStyle = bsToolWindow
  Caption = #1052#1086#1097#1085#1086#1089#1090#1100
  ClientHeight = 230
  ClientWidth = 341
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
  object sMemo1: TsMemo
    Left = 172
    Top = 8
    Width = 130
    Height = 25
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'sMemo1')
    ParentFont = False
    TabOrder = 0
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
  object sPageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 341
    Height = 230
    ActivePage = sTabSheet1
    Align = alClient
    MultiLine = True
    Style = tsButtons
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabSheet1: TsTabSheet
      Caption = '          '#1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1090#1077#1085#1080#1077': '#1085#1077#1090'          '
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      inline FramePower1: TFramePower
        Left = 0
        Top = 0
        Width = 333
        Height = 175
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 333
        ExplicitHeight = 175
        inherited sPanel1: TsPanel
          Width = 333
          Height = 175
          ExplicitWidth = 333
          ExplicitHeight = 175
          inherited sLabel1: TsLabel
            Width = 331
          end
        end
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = '          '#1055#1088#1077#1076#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1090#1077#1085#1080#1077': '#1085#1077#1090'          '
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inline FramePower2: TFramePower
        Left = 0
        Top = 0
        Width = 333
        Height = 175
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 333
        ExplicitHeight = 175
        inherited sPanel1: TsPanel
          Width = 333
          Height = 175
          ExplicitWidth = 333
          ExplicitHeight = 175
        end
      end
    end
  end
  object sBitBtn1: TsBitBtn
    Left = 96
    Top = 182
    Width = 134
    Height = 32
    Caption = 'OK'
    Default = True
    TabOrder = 2
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
  end
end
