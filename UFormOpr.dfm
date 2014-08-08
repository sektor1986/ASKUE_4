object FormOpr: TFormOpr
  Left = 245
  Top = 130
  BorderStyle = bsToolWindow
  Caption = #1057#1087#1080#1089#1086#1082' '#1086#1087#1088#1072#1096#1080#1074#1072#1077#1084#1099#1093' '#1086#1073#1100#1077#1082#1090#1086#1074
  ClientHeight = 507
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 507
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sBevel1: TsBevel
      Left = 16
      Top = 440
      Width = 545
      Height = 50
      Shape = bsTopLine
    end
    object DBGridEh1: TDBGridEh
      Left = 16
      Top = 16
      Width = 385
      Height = 257
      AutoFitColWidths = True
      DataGrouping.GroupLevels = <>
      DataSource = dm2.DSaddresmain
      EvenRowColor = clWindow
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      HorzScrollBar.Visible = False
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ADDR'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1040#1076#1088#1077#1089
          Width = 197
        end
        item
          EditButtons = <>
          FieldName = 'TOWN'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1043#1086#1088#1086#1076
          Width = 65
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'PHONE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1053#1086#1084#1077#1088' '#1076#1083#1103' '#1076#1086#1079#1074#1086#1085#1072
          Width = 86
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object DBGridEh2: TDBGridEh
      Left = 16
      Top = 279
      Width = 385
      Height = 146
      DataGrouping.GroupLevels = <>
      DataSource = dm2.DSaddres
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      HorzScrollBar.Visible = False
      OddRowColor = clWindow
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu2
      RowDetailPanel.Color = clBtnFace
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'STREET'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1056#1072#1079#1098#1105#1084
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object DBGridEh3: TDBGridEh
      Left = 407
      Top = 16
      Width = 154
      Height = 409
      DataGrouping.GroupLevels = <>
      DataSource = dm2.DStmp
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      HorzScrollBar.Visible = False
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu3
      RowDetailPanel.Color = clBtnFace
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      Columns = <
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'NS'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1095#1080#1082#1072
          Width = 62
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'KV'
          Footers = <>
          Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1072
          Width = 73
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object sBitBtn2: TsBitBtn
      Left = 126
      Top = 454
      Width = 115
      Height = 36
      Caption = 'OK'
      Default = True
      TabOrder = 3
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
    object sBitBtn1: TsBitBtn
      Left = 342
      Top = 454
      Width = 115
      Height = 36
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 4
      OnClick = sBitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 192
    Top = 120
    object N1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
      OnClick = N1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 144
    Top = 360
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
      OnClick = N2Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 456
    Top = 176
    object MenuItem1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
      OnClick = MenuItem1Click
    end
  end
end
