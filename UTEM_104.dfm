object FormTEM_104: TFormTEM_104
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1072#1085#1085#1099#1077' '#1090#1077#1087#1083#1086#1089#1095#1077#1090#1095#1080#1082#1072
  ClientHeight = 558
  ClientWidth = 506
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
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 558
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Tabl: TStringGrid
      Left = 16
      Top = 71
      Width = 473
      Height = 446
      DefaultColWidth = 80
      DefaultRowHeight = 16
      RowCount = 25
      ScrollBars = ssVertical
      TabOrder = 0
      ColWidths = (
        144
        80
        80
        80
        80)
    end
    object sGroupBox1: TsGroupBox
      Left = 16
      Top = 8
      Width = 473
      Height = 57
      ParentBackground = False
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel1: TsLabel
        Left = 16
        Top = 16
        Width = 153
        Height = 13
        Caption = #1047#1072#1074#1086#1076#1089#1082#1086#1081' '#1085#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sLabel2: TsLabel
        Left = 183
        Top = 16
        Width = 36
        Height = 13
        Caption = 'sLabel2'
      end
      object sLabel3: TsLabel
        Left = 269
        Top = 16
        Width = 127
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072' '#1074' '#1089#1077#1090#1080
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sLabel4: TsLabel
        Left = 410
        Top = 16
        Width = 3
        Height = 13
      end
      object sLabel5: TsLabel
        Left = 16
        Top = 35
        Width = 133
        Height = 13
        Caption = #1058#1080#1087' '#1076#1072#1090#1095#1080#1082#1086#1074' '#1088#1072#1089#1093#1086#1076#1072
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sLabel6: TsLabel
        Left = 183
        Top = 35
        Width = 3
        Height = 13
      end
      object sLabel7: TsLabel
        Left = 269
        Top = 35
        Width = 114
        Height = 13
        Caption = #1058#1080#1087' '#1077#1076#1080#1085#1080#1094' '#1101#1085#1077#1088#1075#1080#1080
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sLabel8: TsLabel
        Left = 410
        Top = 35
        Width = 3
        Height = 13
      end
    end
    object sBitBtn1: TsBitBtn
      Left = 392
      Top = 523
      Width = 97
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
      Kind = bkCancel
      SkinData.SkinSection = 'BUTTON'
    end
    object sBitBtn2: TsBitBtn
      Left = 224
      Top = 523
      Width = 145
      Height = 25
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      TabOrder = 3
      OnClick = sBitBtn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object QExp_TEM_104: TQExport4DBF
    DataSet = CDS_TEM_104
    About = '(About EMS AdvancedExport)'
    _Version = '4.1.0.1'
    ExportTimeAsStr = False
    NullValue = 'null'
    Left = 113
    Top = 520
  end
  object CDS_TEM_104: TClientDataSet
    Active = True
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
    Left = 152
    Top = 520
    Data = {
      6D0100009619E0BD0100000018000000140000000000030000006D01047A6176
      6E0100490000000100055749445448020002001C00036B6A7501004900000001
      0005574944544802000200100003616472020049000000010005574944544802
      000200FF00064B6F645F43680400010000000000057469707368010049000000
      0100055749445448020002001C00035563680400010000000000036461740800
      04000000010007535542545950450200490006004D6F6E657900047672656D08
      0004000000010007535542545950450200490006004D6F6E6579000251310800
      040000000000025631080004000000000002473108000400000000000474706F
      6408000400000000000251320800040000000000025632080004000000000002
      4732080004000000000004746F62720800040000000000037478760800040000
      0000000454726162080004000000000006547261625F6F080004000000000007
      4E5F477255636804000100000000000000}
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
  object sSaveDialog1: TsSaveDialog
    DefaultExt = 'dbf'
    Left = 40
    Top = 528
  end
end
