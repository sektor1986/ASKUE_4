object FormFormirOprChtenie: TFormFormirOprChtenie
  Left = 299
  Top = 184
  BorderStyle = bsSizeToolWin
  Caption = #1057#1087#1080#1089#1086#1082' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1086#1073#1077#1082#1090#1086#1074
  ClientHeight = 391
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 391
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sLabel2: TsLabel
      Left = 80
      Top = 295
      Width = 244
      Height = 16
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1076#1083#1103' '#1082#1086#1085#1094#1077#1085#1090#1088#1072#1090#1086#1088#1072
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object sBevel1: TsBevel
      Left = 16
      Top = 336
      Width = 433
      Height = 43
      Shape = bsTopLine
    end
    object sBevel2: TsBevel
      Left = 16
      Top = 287
      Width = 433
      Height = 43
      Shape = bsTopLine
    end
    object DBGridEh1: TDBGridEh
      Left = 16
      Top = 16
      Width = 433
      Height = 265
      AutoFitColWidths = True
      DataGrouping.GroupLevels = <>
      DataSource = dm2.DSaddresmain
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      HorzScrollBar.Visible = False
      PopupMenu = PopupMenu1
      RowDetailPanel.Color = clBtnFace
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ADDR'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089
        end
        item
          EditButtons = <>
          FieldName = 'TOWN'
          Footers = <>
          Title.Caption = #1043#1086#1088#1086#1076
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'PHONE'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1076#1083#1103' '#1076#1086#1079#1074#1086#1085#1072
          Width = 92
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object sBitBtn1: TsBitBtn
      Left = 64
      Top = 345
      Width = 105
      Height = 34
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
    object sBitBtn2: TsBitBtn
      Left = 304
      Top = 345
      Width = 105
      Height = 34
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = sBitBtn2Click
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
    object sEdit1: TsEdit
      Left = 338
      Top = 292
      Width = 57
      Height = 24
      Color = 14013951
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      OnChange = sEdit1Change
      OnKeyPress = sEdit1KeyPress
      SkinData.CustomColor = True
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sCheckBox1: TsCheckBox
      Left = 80
      Top = 317
      Width = 174
      Height = 20
      Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1074#1074#1077#1076#1105#1085#1085#1099#1077' '#1087#1072#1088#1086#1083#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      SkinData.CustomFont = True
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 224
    Top = 192
    object N1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
      OnClick = N1Click
    end
  end
end
