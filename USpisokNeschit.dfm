object FormSpisokNeschit: TFormSpisokNeschit
  Left = 277
  Top = 206
  BorderStyle = bsToolWindow
  Caption = #1057#1087#1080#1089#1086#1082' '#1085#1077#1089#1095#1080#1090#1072#1085#1085#1099#1093' '#1089#1095#1105#1090#1095#1080#1082#1086#1074
  ClientHeight = 361
  ClientWidth = 462
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
    Width = 462
    Height = 361
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 460
      Height = 312
      Align = alTop
      AutoFitColWidths = True
      DataGrouping.GroupLevels = <>
      DataSource = DSneschit
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'KV'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1082#1074#1072#1088#1090#1080#1088#1099
          Width = 72
        end
        item
          Alignment = taCenter
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'NS'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1089#1095#1077#1090#1095#1080#1082#1072
          Width = 68
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'NDOG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1083#1080#1094'. '#1089#1095#1105#1090#1072
          Width = 106
        end
        item
          EditButtons = <>
          FieldName = 'FIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1060#1048#1054
          Width = 190
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object sBitBtn1: TsBitBtn
      Left = 328
      Top = 319
      Width = 121
      Height = 33
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
      Left = 208
      Top = 319
      Width = 114
      Height = 33
      Caption = #1069#1082#1089#1087#1086#1088#1090
      TabOrder = 2
      OnClick = sBitBtn2Click
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 3
      Images = Form1.ImageList1
    end
  end
  object neschit: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    KV,'
      '    NS,'
      '    FIO,'
      '    NDOG'
      'FROM'
      '    TMP'
      'where hashr = 0 and cod in '
      '  (select inc from addres where cod in '
      '   (select inc from addresmain where inc = :inc)) '
      'order by kv')
    Transaction = dm1.transact1
    Database = dm1.database
    DataSource = dm1.DSaddresmain
    Left = 48
    Top = 320
    poAskRecordCount = True
  end
  object DSneschit: TDataSource
    DataSet = neschit
    Left = 16
    Top = 320
  end
  object sSaveDialog1: TsSaveDialog
    DefaultExt = 'htm'
    Filter = 'HTML - '#1092#1072#1081#1083'|*.htm|'#1044#1086#1082#1091#1084#1077#1085#1090' Word|*.doc|'#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt'
    Left = 144
    Top = 320
  end
end
