object Form_Export_TEM_104: TForm_Export_TEM_104
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1058#1069#1052'-104'
  ClientHeight = 379
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sBevel1: TsBevel
    Left = 8
    Top = 327
    Width = 542
    Height = 9
    Shape = bsTopLine
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 545
    Height = 313
    DataGrouping.GroupLevels = <>
    DataSource = DataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    RowDetailPanel.Color = clBtnFace
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TOWN'
        Footers = <>
        Title.Caption = #1043#1086#1088#1086#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'ADDR'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 294
      end
      item
        EditButtons = <>
        FieldName = 'NS'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1095#1080#1082#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 82
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object sBitBtn1: TsBitBtn
    Left = 339
    Top = 342
    Width = 102
    Height = 25
    Caption = #1069#1082#1089#1087#1086#1088#1090
    TabOrder = 1
    OnClick = sBitBtn1Click
    SkinData.SkinSection = 'BUTTON'
    ImageIndex = 11
    Images = Form1.ImageList2
  end
  object sBitBtn2: TsBitBtn
    Left = 455
    Top = 342
    Width = 95
    Height = 25
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
  object DataSource1: TDataSource
    DataSet = tmp
    Left = 520
    Top = 8
  end
  object tmp: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    KV_KONFIG.INC,'
      '    KV_KONFIG.COD,'
      '    KV_KONFIG.M7,'
      '    KV_KONFIG.M8,'
      '    KV_KONFIG.M9,'
      '    TMP.SDF,'
      '    TMP.NS,'
      '    TMP.COD_SCH,'
      '    ADDRES.STREET,'
      '    ADDRESMAIN.ADDR,'
      '    ADDRESMAIN.JEU,'
      '    TOWN.TOWN'
      '    '
      'FROM'
      '    KV_KONFIG '
      'LEFT OUTER JOIN TMP ON TMP.INC = KV_KONFIG.COD'
      'LEFT OUTER JOIN ADDRES ON ADDRES.INC = TMP.COD'
      'LEFT OUTER JOIN ADDRESMAIN ON ADDRESMAIN.INC = ADDRES.COD'
      'LEFT OUTER JOIN TOWN ON TOWN.INC = ADDRESMAIN.REZ'
      ''
      'where TMP.SDF = 5')
    Transaction = dm1.transact1
    Database = dm1.database
    UpdateTransaction = dm1.updateTransact
    Left = 488
    Top = 8
  end
  object sSaveDialog1: TsSaveDialog
    DefaultExt = 'dbf'
    Filter = #1060#1072#1081#1083#1099' '#1101#1082#1089#1087#1086#1088#1090#1072'|*.dbf'
    Left = 48
    Top = 144
  end
  object CDS_TEM_104: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'zavn'
        DataType = ftString
        Size = 28
      end
      item
        Name = 'kju'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'adr'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Kod_Ch'
        DataType = ftInteger
      end
      item
        Name = 'tipsh'
        DataType = ftString
        Size = 28
      end
      item
        Name = 'Uch'
        DataType = ftInteger
      end
      item
        Name = 'dat'
        DataType = ftCurrency
      end
      item
        Name = 'vrem'
        DataType = ftCurrency
      end
      item
        Name = 'Q1'
        DataType = ftFloat
      end
      item
        Name = 'V1'
        DataType = ftFloat
      end
      item
        Name = 'G1'
        DataType = ftFloat
      end
      item
        Name = 'tpod'
        DataType = ftFloat
      end
      item
        Name = 'Q2'
        DataType = ftFloat
      end
      item
        Name = 'V2'
        DataType = ftFloat
      end
      item
        Name = 'G2'
        DataType = ftFloat
      end
      item
        Name = 'tobr'
        DataType = ftFloat
      end
      item
        Name = 'txv'
        DataType = ftFloat
      end
      item
        Name = 'Trab'
        DataType = ftFloat
      end
      item
        Name = 'Trab_o'
        DataType = ftFloat
      end
      item
        Name = 'N_GrUch'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 173
    Top = 179
    object CDS_TEM_104zavn: TStringField
      FieldName = 'zavn'
      Size = 28
    end
    object CDS_TEM_104kju: TStringField
      FieldName = 'kju'
      Size = 16
    end
    object CDS_TEM_104adr: TStringField
      FieldName = 'adr'
      Size = 255
    end
    object CDS_TEM_104Kod_Ch: TIntegerField
      FieldName = 'Kod_Ch'
    end
    object CDS_TEM_104tipsh: TStringField
      FieldName = 'tipsh'
      Size = 28
    end
    object CDS_TEM_104Uch: TIntegerField
      FieldName = 'Uch'
    end
    object CDS_TEM_104dat: TCurrencyField
      FieldName = 'dat'
    end
    object CDS_TEM_104vrem: TCurrencyField
      FieldName = 'vrem'
    end
    object CDS_TEM_104Q1: TFloatField
      FieldName = 'Q1'
    end
    object CDS_TEM_104V1: TFloatField
      FieldName = 'V1'
    end
    object CDS_TEM_104G1: TFloatField
      FieldName = 'G1'
    end
    object CDS_TEM_104tpod: TFloatField
      FieldName = 'tpod'
    end
    object CDS_TEM_104Q2: TFloatField
      FieldName = 'Q2'
    end
    object CDS_TEM_104V2: TFloatField
      FieldName = 'V2'
    end
    object CDS_TEM_104G2: TFloatField
      FieldName = 'G2'
    end
    object CDS_TEM_104tobr: TFloatField
      FieldName = 'tobr'
    end
    object CDS_TEM_104txv: TFloatField
      FieldName = 'txv'
    end
    object CDS_TEM_104Trab: TFloatField
      FieldName = 'Trab'
    end
    object CDS_TEM_104Trab_o: TFloatField
      FieldName = 'Trab_o'
    end
    object CDS_TEM_104N_GrUch: TIntegerField
      FieldName = 'N_GrUch'
    end
  end
  object QExp_TEM_104: TQExport4DBF
    DataSet = CDS_TEM_104
    About = '(About EMS AdvancedExport)'
    _Version = '4.1.0.1'
    ExportTimeAsStr = False
    NullValue = 'null'
    Left = 134
    Top = 179
  end
end
