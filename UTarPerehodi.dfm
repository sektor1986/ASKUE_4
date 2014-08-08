object FormTarPerehodi: TFormTarPerehodi
  Left = 373
  Top = 195
  BorderStyle = bsToolWindow
  Caption = #1058#1072#1088#1080#1092#1085#1099#1077' '#1087#1077#1088#1077#1093#1086#1076#1099
  ClientHeight = 437
  ClientWidth = 311
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
    Width = 311
    Height = 437
    ActivePage = sTabSheet1
    Align = alClient
    MultiLine = True
    Style = tsButtons
    TabOrder = 0
    OnChange = sPageControl1Change
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabSheet1: TsTabSheet
      Caption = #1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1090#1077#1085#1080#1077': '#1044#1072#1090#1072' - 00.00.00 '#1042#1088#1077#1084#1103' - 00.00.00'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      inline FrameTarPerehodi1: TFrameTarPerehodi
        Left = 0
        Top = 0
        Width = 303
        Height = 382
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 303
        ExplicitHeight = 382
        inherited sPanel1: TsPanel
          Width = 303
          Height = 382
          ExplicitTop = 0
          ExplicitWidth = 303
          ExplicitHeight = 382
          inherited sComboBox1: TsComboBox
            Style = csOwnerDrawFixed
            ExplicitHeight = 19
          end
          inherited sComboBox2: TsComboBox
            Style = csOwnerDrawFixed
            ExplicitHeight = 19
          end
          inherited sComboBox3: TsComboBox
            Style = csOwnerDrawFixed
            ExplicitHeight = 19
          end
          inherited sComboBox4: TsComboBox
            OnChange = FrameTarPerehodi2sComboBox4Change
          end
        end
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = #1055#1088#1077#1076#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1090#1077#1085#1080#1077': '#1044#1072#1090#1072' - 00.00.00 '#1042#1088#1077#1084#1103' - 00.00.00'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      inline FrameTarPerehodi2: TFrameTarPerehodi
        Left = 0
        Top = 0
        Width = 303
        Height = 382
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 303
        ExplicitHeight = 382
        inherited sPanel1: TsPanel
          Width = 303
          Height = 382
          ExplicitTop = 0
          ExplicitWidth = 303
          ExplicitHeight = 382
          inherited sComboBox1: TsComboBox
            Style = csOwnerDrawFixed
            ExplicitHeight = 19
          end
          inherited sComboBox2: TsComboBox
            Style = csOwnerDrawFixed
            ExplicitHeight = 19
          end
          inherited sComboBox3: TsComboBox
            Style = csOwnerDrawFixed
            ExplicitHeight = 19
          end
        end
      end
    end
  end
  object sBitBtn1: TsBitBtn
    Left = 173
    Top = 387
    Width = 104
    Height = 30
    Caption = 'OK'
    Default = True
    TabOrder = 1
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
