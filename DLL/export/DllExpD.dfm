object exportD: TexportD
  OldCreateOrder = False
  Height = 279
  Width = 400
  object ImpExp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'INC'
        DataType = ftInteger
      end
      item
        Name = 'CHEC'
        DataType = ftInteger
      end
      item
        Name = 'STREET'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'KV'
        DataType = ftMemo
      end
      item
        Name = 'NS'
        DataType = ftMemo
      end
      item
        Name = 'SDF'
        DataType = ftMemo
      end
      item
        Name = 'VARTAR'
        DataType = ftMemo
      end
      item
        Name = 'DESCRIPTION'
        DataType = ftMemo
      end
      item
        Name = 'ADDINFORM'
        DataType = ftMemo
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 92
    Top = 20
    object ImpExpINC: TIntegerField
      FieldName = 'INC'
    end
    object ImpExpCHEC: TIntegerField
      FieldName = 'CHEC'
    end
    object ImpExpSTREET: TStringField
      FieldName = 'STREET'
      Size = 100
    end
    object ImpExpKV: TMemoField
      FieldName = 'KV'
      BlobType = ftMemo
    end
    object ImpExpNS: TMemoField
      FieldName = 'NS'
      BlobType = ftMemo
    end
    object ImpExpSDF: TMemoField
      FieldName = 'SDF'
      BlobType = ftMemo
    end
    object ImpExpVARTAR: TMemoField
      FieldName = 'VARTAR'
      BlobType = ftMemo
    end
    object ImpExpDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
    end
    object ImpExpADDINFORM: TMemoField
      FieldName = 'ADDINFORM'
      BlobType = ftMemo
    end
  end
  object EXPDMAIN: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'INC'
        DataType = ftInteger
      end
      item
        Name = 'COD'
        DataType = ftInteger
      end
      item
        Name = 'KV'
        DataType = ftInteger
      end
      item
        Name = 'NS'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SDF'
        DataType = ftInteger
      end
      item
        Name = 'PHONE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DESCRIPTION'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'LSCHET'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UBANK'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VAR_TAR'
        DataType = ftMemo
      end
      item
        Name = 'VAR_TAR1'
        DataType = ftMemo
      end
      item
        Name = 'MES_POT'
        DataType = ftMemo
      end
      item
        Name = 'MES_POT1'
        DataType = ftMemo
      end
      item
        Name = 'POWER'
        DataType = ftMemo
      end
      item
        Name = 'POWER1'
        DataType = ftMemo
      end
      item
        Name = 'POT_OTK'
        DataType = ftMemo
      end
      item
        Name = 'POT_OTK1'
        DataType = ftMemo
      end
      item
        Name = 'TAR_NAK'
        DataType = ftMemo
      end
      item
        Name = 'TAR_NAK1'
        DataType = ftMemo
      end
      item
        Name = 'TIME0'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'TIME1'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'TIMES'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'TIMEC'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'VAR_TAR_TIME'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'VAR_TAR_TIME1'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'TAR_NAK_TIME'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'TAR_NAK_TIME1'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'POWER_TIME'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'POWER_TIME1'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'MES_POT_TIME'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'MES_POT_TIME1'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'POT_OTK_TIME'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'POT_OTK_TIME1'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'TIME_SCH'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'FDT'
        DataType = ftMemo
      end
      item
        Name = 'FDP'
        DataType = ftMemo
      end
      item
        Name = 'MES'
        DataType = ftInteger
      end
      item
        Name = 'PROF_NAGR'
        DataType = ftMemo
      end
      item
        Name = 'PROF_NAGR1'
        DataType = ftMemo
      end
      item
        Name = 'PROF_NAGR_TIME'
        DataType = ftString
        Size = 33
      end
      item
        Name = 'PROF_NAGR_TIME1'
        DataType = ftString
        Size = 33
      end>
    IndexDefs = <>
    IndexFieldNames = 'COD'
    MasterFields = 'INC'
    MasterSource = DataSource1
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 92
    Top = 76
    Data = {
      DA0400009619E0BD010000001800000029000000000003000000DA0403494E43
      040001000000000003434F440400010000000000024B56040001000000000002
      4E53010049000000010005574944544802000200320003534446040001000000
      00000550484F4E4501004900000001000557494454480200020005000B444553
      4352495054494F4E010049000000010005574944544802000200C800064C5343
      4845540100490000000100055749445448020002001E00055542414E4B010049
      0000000100055749445448020002001E00075641525F54415204004B00000001
      0007535542545950450200490005005465787400085641525F5441523104004B
      000000010007535542545950450200490005005465787400074D45535F504F54
      04004B000000010007535542545950450200490005005465787400084D45535F
      504F543104004B00000001000753554254595045020049000500546578740005
      504F57455204004B000000010007535542545950450200490005005465787400
      06504F5745523104004B00000001000753554254595045020049000500546578
      740007504F545F4F544B04004B00000001000753554254595045020049000500
      546578740008504F545F4F544B3104004B000000010007535542545950450200
      490005005465787400075441525F4E414B04004B000000010007535542545950
      450200490005005465787400085441525F4E414B3104004B0000000100075355
      425459504502004900050054657874000554494D453001004900000001000557
      494454480200020021000554494D453101004900000001000557494454480200
      020021000554494D455301004900000001000557494454480200020021000554
      494D454301004900000001000557494454480200020021000C5641525F544152
      5F54494D4501004900000001000557494454480200020021000D5641525F5441
      525F54494D453101004900000001000557494454480200020021000C5441525F
      4E414B5F54494D4501004900000001000557494454480200020021000D544152
      5F4E414B5F54494D453101004900000001000557494454480200020021000A50
      4F5745525F54494D4501004900000001000557494454480200020021000B504F
      5745525F54494D453101004900000001000557494454480200020021000C4D45
      535F504F545F54494D4501004900000001000557494454480200020021000D4D
      45535F504F545F54494D45310100490000000100055749445448020002002100
      0C504F545F4F544B5F54494D4501004900000001000557494454480200020021
      000D504F545F4F544B5F54494D45310100490000000100055749445448020002
      0021000854494D455F5343480100490000000100055749445448020002002100
      0346445404004B00000001000753554254595045020049000500546578740003
      46445004004B000000010007535542545950450200490005005465787400034D
      455304000100000000000950524F465F4E41475204004B000000010007535542
      5459504502004900050054657874000A50524F465F4E4147523104004B000000
      0100075355425459504502004900050054657874000E50524F465F4E4147525F
      54494D4501004900000001000557494454480200020021000F50524F465F4E41
      47525F54494D453101004900000001000557494454480200020021000000}
    object EXPDMAININC: TIntegerField
      FieldName = 'INC'
    end
    object EXPDMAINCOD: TIntegerField
      FieldName = 'COD'
    end
    object EXPDMAINKV: TIntegerField
      FieldName = 'KV'
    end
    object EXPDMAINNS: TStringField
      FieldName = 'NS'
      Size = 50
    end
    object EXPDMAINSDF: TIntegerField
      FieldName = 'SDF'
    end
    object EXPDMAINPHONE: TStringField
      FieldName = 'PHONE'
      Size = 5
    end
    object EXPDMAINDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 200
    end
    object EXPDMAINLSCHET: TStringField
      FieldName = 'LSCHET'
      Size = 30
    end
    object EXPDMAINUBANK: TStringField
      FieldName = 'UBANK'
      Size = 30
    end
    object EXPDMAINVAR_TAR: TMemoField
      FieldName = 'VAR_TAR'
      BlobType = ftMemo
    end
    object EXPDMAINVAR_TAR1: TMemoField
      FieldName = 'VAR_TAR1'
      BlobType = ftMemo
    end
    object EXPDMAINMES_POT: TMemoField
      FieldName = 'MES_POT'
      BlobType = ftMemo
    end
    object EXPDMAINMES_POT1: TMemoField
      FieldName = 'MES_POT1'
      BlobType = ftMemo
    end
    object EXPDMAINPOWER: TMemoField
      FieldName = 'POWER'
      BlobType = ftMemo
    end
    object EXPDMAINPOWER1: TMemoField
      FieldName = 'POWER1'
      BlobType = ftMemo
    end
    object EXPDMAINPOT_OTK: TMemoField
      FieldName = 'POT_OTK'
      BlobType = ftMemo
    end
    object EXPDMAINPOT_OTK1: TMemoField
      FieldName = 'POT_OTK1'
      BlobType = ftMemo
    end
    object EXPDMAINTAR_NAK: TMemoField
      FieldName = 'TAR_NAK'
      BlobType = ftMemo
    end
    object EXPDMAINTAR_NAK1: TMemoField
      FieldName = 'TAR_NAK1'
      BlobType = ftMemo
    end
    object EXPDMAINTIME0: TStringField
      FieldName = 'TIME0'
      Size = 33
    end
    object EXPDMAINTIME1: TStringField
      FieldName = 'TIME1'
      Size = 33
    end
    object EXPDMAINTIMES: TStringField
      FieldName = 'TIMES'
      Size = 33
    end
    object EXPDMAINTIMEC: TStringField
      FieldName = 'TIMEC'
      Size = 33
    end
    object EXPDMAINVAR_TAR_TIME: TStringField
      FieldName = 'VAR_TAR_TIME'
      Size = 33
    end
    object EXPDMAINVAR_TAR_TIME1: TStringField
      FieldName = 'VAR_TAR_TIME1'
      Size = 33
    end
    object EXPDMAINTAR_NAK_TIME: TStringField
      FieldName = 'TAR_NAK_TIME'
      Size = 33
    end
    object EXPDMAINTAR_NAK_TIME1: TStringField
      FieldName = 'TAR_NAK_TIME1'
      Size = 33
    end
    object EXPDMAINPOWER_TIME: TStringField
      FieldName = 'POWER_TIME'
      Size = 33
    end
    object EXPDMAINPOWER_TIME1: TStringField
      FieldName = 'POWER_TIME1'
      Size = 33
    end
    object EXPDMAINMES_POT_TIME: TStringField
      FieldName = 'MES_POT_TIME'
      Size = 33
    end
    object EXPDMAINMES_POT_TIME1: TStringField
      FieldName = 'MES_POT_TIME1'
      Size = 33
    end
    object EXPDMAINPOT_OTK_TIME: TStringField
      FieldName = 'POT_OTK_TIME'
      Size = 33
    end
    object EXPDMAINPOT_OTK_TIME1: TStringField
      FieldName = 'POT_OTK_TIME1'
      Size = 33
    end
    object EXPDMAINTIME_SCH: TStringField
      FieldName = 'TIME_SCH'
      Size = 33
    end
    object EXPDMAINFDT: TMemoField
      FieldName = 'FDT'
      BlobType = ftMemo
    end
    object EXPDMAINFDP: TMemoField
      FieldName = 'FDP'
      BlobType = ftMemo
    end
    object EXPDMAINMES: TIntegerField
      FieldName = 'MES'
    end
    object EXPDMAINPROF_NAGR: TMemoField
      FieldName = 'PROF_NAGR'
      BlobType = ftMemo
    end
    object EXPDMAINPROF_NAGR1: TMemoField
      FieldName = 'PROF_NAGR1'
      BlobType = ftMemo
    end
    object EXPDMAINPROF_NAGR_TIME: TStringField
      FieldName = 'PROF_NAGR_TIME'
      Size = 33
    end
    object EXPDMAINPROF_NAGR_TIME1: TStringField
      FieldName = 'PROF_NAGR_TIME1'
      Size = 33
    end
  end
  object EXPDARHIV: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'COD'
    MasterFields = 'INC'
    MasterSource = DataSource2
    PacketRecords = 0
    Params = <>
    Left = 160
    Top = 16
    Data = {
      B50100009619E0BD01000000180000000F000000000003000000B50103434F44
      0400010000000000024D3104004B000000010007535542545950450200490005
      005465787400024D3204004B0000000100075355425459504502004900050054
      65787400024D3304004B00000001000753554254595045020049000500546578
      7400024D3404004B000000010007535542545950450200490005005465787400
      024D3504004B000000010007535542545950450200490005005465787400024D
      3604004B000000010007535542545950450200490005005465787400024D3704
      004B000000010007535542545950450200490005005465787400024D3804004B
      000000010007535542545950450200490005005465787400024D3904004B0000
      00010007535542545950450200490005005465787400034D313004004B000000
      010007535542545950450200490005005465787400034D313104004B00000001
      0007535542545950450200490005005465787400034D313204004B0000000100
      075355425459504502004900050054657874000352455A040001000000000003
      474F440100490000000100055749445448020002000A000000}
    object EXPDARHIVCOD: TIntegerField
      FieldName = 'COD'
    end
    object EXPDARHIVM1: TMemoField
      FieldName = 'M1'
      BlobType = ftMemo
    end
    object EXPDARHIVM2: TMemoField
      FieldName = 'M2'
      BlobType = ftMemo
    end
    object EXPDARHIVM3: TMemoField
      FieldName = 'M3'
      BlobType = ftMemo
    end
    object EXPDARHIVM4: TMemoField
      FieldName = 'M4'
      BlobType = ftMemo
    end
    object EXPDARHIVM5: TMemoField
      FieldName = 'M5'
      BlobType = ftMemo
    end
    object EXPDARHIVM6: TMemoField
      FieldName = 'M6'
      BlobType = ftMemo
    end
    object EXPDARHIVM7: TMemoField
      FieldName = 'M7'
      BlobType = ftMemo
    end
    object EXPDARHIVM8: TMemoField
      FieldName = 'M8'
      BlobType = ftMemo
    end
    object EXPDARHIVM9: TMemoField
      FieldName = 'M9'
      BlobType = ftMemo
    end
    object EXPDARHIVM10: TMemoField
      FieldName = 'M10'
      BlobType = ftMemo
    end
    object EXPDARHIVM11: TMemoField
      FieldName = 'M11'
      BlobType = ftMemo
    end
    object EXPDARHIVM12: TMemoField
      FieldName = 'M12'
      BlobType = ftMemo
    end
    object EXPDARHIVREZ: TIntegerField
      FieldName = 'REZ'
    end
    object EXPDARHIVGOD: TStringField
      FieldName = 'GOD'
      Size = 10
    end
  end
  object EXPDVARTAR: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VARTAR_1'
        DataType = ftMemo
      end
      item
        Name = 'VARTAR_2'
        DataType = ftMemo
      end
      item
        Name = 'VARTAR_3'
        DataType = ftMemo
      end
      item
        Name = 'VARTAR_4'
        DataType = ftMemo
      end
      item
        Name = 'VARTAR_5'
        DataType = ftMemo
      end
      item
        Name = 'VARTAR_6'
        DataType = ftMemo
      end
      item
        Name = 'VARTAR_7'
        DataType = ftMemo
      end
      item
        Name = 'VARTAR_8'
        DataType = ftMemo
      end
      item
        Name = 'VARTAR_9'
        DataType = ftMemo
      end
      item
        Name = 'VARTAR_10'
        DataType = ftMemo
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 92
    Top = 136
    Data = {
      830100009619E0BD01000000180000000A000000000003000000830108564152
      5441525F3104004B000000010007535542545950450200490005005465787400
      085641525441525F3204004B0000000100075355425459504502004900050054
      65787400085641525441525F3304004B00000001000753554254595045020049
      0005005465787400085641525441525F3404004B000000010007535542545950
      450200490005005465787400085641525441525F3504004B0000000100075355
      42545950450200490005005465787400085641525441525F3604004B00000001
      0007535542545950450200490005005465787400085641525441525F3704004B
      000000010007535542545950450200490005005465787400085641525441525F
      3804004B00000001000753554254595045020049000500546578740008564152
      5441525F3904004B000000010007535542545950450200490005005465787400
      095641525441525F313004004B00000001000753554254595045020049000500
      54657874000000}
  end
  object DataSource1: TDataSource
    DataSet = ImpExp
    Left = 28
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = EXPDMAIN
    Left = 24
    Top = 80
  end
  object Zip1: TZip
    RelativeDir = byItem
    Attributes = [fsZeroAttr, fsReadOnly, fsArchive, fsCompressed, fsEncrypted]
    DeleteOptions = doAllowUndo
    RecurseDirs = False
    ArcType = atZip
    AttributesEx = [fsReparsePoints]
    CompressMethod = cmDeflate
    DefaultExt = '.exp'
    SeedDataKeys.Key0 = 305419896
    SeedDataKeys.Key1 = 591751049
    SeedDataKeys.Key2 = 878082192
    SeedHeaderKeys.Key0 = 269766672
    SeedHeaderKeys.Key1 = 33834504
    SeedHeaderKeys.Key2 = 541352064
    EncryptionMethod = emZip_V2
    Password = 'Delphi Project'
    StoreFilesOfType.Strings = (
      '.ace'
      '.arc'
      '.arj'
      '.bh'
      '.bz'
      '.bz2'
      '.cab'
      '.enc'
      '.gz'
      '.ha'
      '.jar'
      '.lha'
      '.lzh'
      '.mbf'
      '.mim'
      '.pak'
      '.pk3'
      '.pk_'
      '.rar'
      '.sqx'
      '.tar'
      '.tbz'
      '.tgz'
      '.uue'
      '.uu'
      '.war'
      '.xxe'
      '.z'
      '.zap'
      '.zip'
      '.zoo'
      '.ztv')
    TempDir = 'C:\WINDOWS\Temp\'
    Switch = swMove
    Left = 268
    Top = 20
  end
  object EXPDPROF: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'COD'
    MasterFields = 'INC'
    MasterSource = DataSource2
    PacketRecords = 0
    Params = <>
    Left = 168
    Top = 76
    Data = {
      790000009619E0BD010000001800000004000000000003000000790003434F44
      040001000000000004444154410100490000000100055749445448020002000A
      000650524F46494C04004B000000010007535542545950450200490005005465
      7874000352455A01004900000001000557494454480200020006000000}
    object EXPDPROFCOD: TIntegerField
      FieldName = 'COD'
    end
    object EXPDPROFDATA: TStringField
      FieldName = 'DATA'
      Size = 10
    end
    object EXPDPROFPROFIL: TMemoField
      FieldName = 'PROFIL'
      BlobType = ftMemo
    end
    object EXPDPROFREZ: TStringField
      FieldName = 'REZ'
      Size = 6
    end
  end
  object UnZIP1: TUnZip
    TranslateOemChar = False
    CpuType = cptAuto
    SeedDataKeys.Key0 = 305419896
    SeedDataKeys.Key1 = 591751049
    SeedDataKeys.Key2 = 878082192
    SeedHeaderKeys.Key0 = 269766672
    SeedHeaderKeys.Key1 = 33834504
    SeedHeaderKeys.Key2 = 541352064
    FileSpec.Strings = (
      '*.*')
    Left = 268
    Top = 68
  end
end
