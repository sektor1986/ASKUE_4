object dmPrint: TdmPrint
  OldCreateOrder = False
  Height = 349
  Width = 521
  object SIM: TpFIBDataSet
    SelectSQL.Strings = (
      'select town,'
      '       addresmain.addr,'
      '       koncen.phone,'
      '       addresmain.balans'
      'from addresmain, koncen, town'
      'where (koncen.cod = addresmain.inc)'
      ' and  (town.inc = addresmain.rez)'
      ' and  (town.inc = :inc)'
      'order by addresmain.addr       ')
    Transaction = dm1.transact1
    Database = dm1.database
    UpdateTransaction = dm1.updateTransact
    SQLScreenCursor = crSQLWait
    DataSource = dm1.DStown
    Left = 32
    Top = 144
    object SIMTOWN: TFIBStringField
      FieldName = 'TOWN'
      Size = 30
      EmptyStrToNull = True
    end
    object SIMADDR: TFIBStringField
      FieldName = 'ADDR'
      Size = 100
      EmptyStrToNull = True
    end
    object SIMPHONE: TFIBStringField
      FieldName = 'PHONE'
      EmptyStrToNull = True
    end
  end
  object frxReport1: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = 'options_report'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40009.556624710650000000
    ReportOptions.LastChange = 40009.556624710650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 112
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frDSetSim: TfrxDBDataset
    UserName = 'sim'
    CloseDataSource = False
    DataSet = SIM
    BCDToCurrency = False
    Left = 32
    Top = 72
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 192
    Top = 8
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Print = False
    PictureType = gpPNG
    Left = 272
    Top = 8
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 344
    Top = 8
  end
  object tmp: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    tmp.KV,'
      '    tmp.NS,'
      '    tmp.PPLAT,'
      '    tmp.LSCHET,'
      '    kv_konfig.date_poverka'
      'FROM'
      '    TMP, kv_konfig'
      'where tmp.cod in (select inc from addres'
      '              where addres.cod = :inc)'
      'and (kv_konfig.COD = tmp.inc)')
    Transaction = dm1.transact1
    Database = dm1.database
    UpdateTransaction = dm1.updateTransact
    SQLScreenCursor = crSQLWait
    DataSource = dm1.DSaddresmain
    Left = 112
    Top = 144
    object tmpKV: TFIBIntegerField
      FieldName = 'KV'
    end
    object tmpNS: TFIBStringField
      FieldName = 'NS'
      Size = 9
      EmptyStrToNull = True
    end
    object tmpPPLAT: TFIBStringField
      FieldName = 'PPLAT'
      Size = 40
      EmptyStrToNull = True
    end
    object tmpDATE_POVERKA: TFIBDateField
      FieldName = 'DATE_POVERKA'
    end
    object tmpLSCHET: TFIBStringField
      FieldName = 'LSCHET'
      EmptyStrToNull = True
    end
  end
  object frDsetTMP: TfrxDBDataset
    UserName = 'tmp'
    CloseDataSource = False
    DataSet = tmp
    BCDToCurrency = False
    Left = 112
    Top = 72
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    Left = 424
    Top = 8
  end
end
