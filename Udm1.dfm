object dm1: Tdm1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 546
  Width = 913
  object database: TpFIBDatabase
    DBName = 'D:\'#1095#1090#1086#1090#1086'\IBExpert\'#1053#1086#1074#1072#1103'_11.04.11.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251'
      'sql_role_name=3')
    DefaultTransaction = transact1
    DefaultUpdateTransaction = updateTransact
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = [ddoIsDefaultDatabase]
    LibraryName = 'fbclient.dll'
    CacheSchemaOptions.LocalCacheFile = 'cache.fps'
    CacheSchemaOptions.AutoSaveToFile = True
    CacheSchemaOptions.AutoLoadFromFile = True
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object addresmain: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ADDRESMAIN'
      'SET '
      '    ADDR = :ADDR,'
      '    REZ = :REZ,'
      '    REZ1 = :REZ1,'
      '    REZ2 = :REZ2,'
      '    CHEC = :CHEC,'
      '    CHECKED = :CHECKED,'
      '    PIC = :PIC,'
      '    DESCRIPTION = :DESCRIPTION,'
      '    HOME_COD = :HOME_COD,'
      '    DATE_INSTAL = :DATE_INSTAL,'
      '    JEU = :JEU,'
      '    "SCHEMA" = :"SCHEMA",'
      '    DOC = :DOC,'
      '    INFO = :INFO,'
      '    LATITUDE = :LATITUDE,'
      '    LONGITUDE = :LONGITUDE,'
      '    REPAIR = :REPAIR,'
      '    BALANS = :BALANS,'
      '    REZHIM = :REZHIM'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ADDRESMAIN'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ADDRESMAIN('
      '    INC,'
      '    ADDR,'
      '    REZ,'
      '    REZ1,'
      '    REZ2,'
      '    CHEC,'
      '    CHECKED,'
      '    PIC,'
      '    DESCRIPTION,'
      '    HOME_COD,'
      '    DATE_INSTAL,'
      '    JEU,'
      '    "SCHEMA",'
      '    DOC,'
      '    INFO,'
      '    LATITUDE,'
      '    LONGITUDE,'
      '    REPAIR,'
      '    BALANS,'
      '    REZHIM'
      ')'
      'VALUES('
      '    :INC,'
      '    :ADDR,'
      '    :REZ,'
      '    :REZ1,'
      '    :REZ2,'
      '    :CHEC,'
      '    :CHECKED,'
      '    :PIC,'
      '    :DESCRIPTION,'
      '    :HOME_COD,'
      '    :DATE_INSTAL,'
      '    :JEU,'
      '    :"SCHEMA",'
      '    :DOC,'
      '    :INFO,'
      '    :LATITUDE,'
      '    :LONGITUDE,'
      '    :REPAIR,'
      '    :BALANS,'
      '    :REZHIM'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM'
      '    ADDRESMAIN '
      'where(  rez = :inc'
      '     ) and (     ADDRESMAIN.INC = :OLD_INC'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM'
      '    ADDRESMAIN '
      'where rez = :inc'
      'order by addr')
    AllowedUpdateKinds = [ukModify, ukDelete]
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DataSource = DStown
    Left = 24
    Top = 64
    poAskRecordCount = True
    WaitEndMasterScroll = True
    dcForceOpen = True
    object addresmainINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object addresmainADDR: TFIBStringField
      FieldName = 'ADDR'
      Size = 100
      EmptyStrToNull = True
    end
    object addresmainREZ: TFIBIntegerField
      FieldName = 'REZ'
    end
    object addresmainREZ1: TFIBStringField
      FieldName = 'REZ1'
      Size = 40
      EmptyStrToNull = True
    end
    object addresmainREZ2: TFIBStringField
      FieldName = 'REZ2'
      Size = 40
      EmptyStrToNull = True
    end
    object addresmainCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
    object addresmainCHECKED: TFIBIntegerField
      FieldName = 'CHECKED'
    end
    object addresmainPIC: TFIBBlobField
      FieldName = 'PIC'
      Size = 8
    end
    object addresmainDESCRIPTION: TFIBMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object addresmainHOME_COD: TFIBStringField
      FieldName = 'HOME_COD'
      EmptyStrToNull = True
    end
    object addresmainDATE_INSTAL: TFIBDateField
      FieldName = 'DATE_INSTAL'
    end
    object addresmainJEU: TFIBStringField
      FieldName = 'JEU'
      Size = 10
      EmptyStrToNull = True
    end
    object addresmainSCHEMA: TFIBBlobField
      FieldName = 'SCHEMA'
      Size = 8
    end
    object addresmainDOC: TFIBBlobField
      FieldName = 'DOC'
      Size = 8
    end
    object addresmainINFO: TFIBMemoField
      FieldName = 'INFO'
      BlobType = ftMemo
      Size = 8
    end
    object addresmainLATITUDE: TFIBFloatField
      FieldName = 'LATITUDE'
    end
    object addresmainLONGITUDE: TFIBFloatField
      FieldName = 'LONGITUDE'
    end
    object addresmainREPAIR: TFIBIntegerField
      FieldName = 'REPAIR'
    end
    object addresmainBALANS: TFIBStringField
      FieldName = 'BALANS'
      Size = 40
      EmptyStrToNull = True
    end
    object addresmainREZHIM: TFIBIntegerField
      FieldName = 'REZHIM'
    end
  end
  object addres: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ADDRES'
      'SET '
      '    COD = :COD,'
      '    CHEC = :CHEC,'
      '    STREET = :STREET,'
      '    PHONE = :PHONE,'
      '    TOWN = :TOWN'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ADDRES'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ADDRES('
      '    INC,'
      '    COD,'
      '    CHEC,'
      '    STREET,'
      '    PHONE,'
      '    TOWN'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :CHEC,'
      '    :STREET,'
      '    :PHONE,'
      '    :TOWN'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    CHEC,'
      '    STREET,'
      '    PHONE,'
      '    TOWN'
      'FROM'
      '    ADDRES '
      'where(  cod = :inc'
      '     ) and (     ADDRES.INC = :OLD_INC'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    CHEC,'
      '    STREET,'
      '    PHONE,'
      '    TOWN'
      'FROM'
      '    ADDRES '
      'where cod = :inc')
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DSaddresmain
    Left = 24
    Top = 112
    poAskRecordCount = True
    WaitEndMasterScroll = True
    object addresINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object addresCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object addresCHEC: TFIBIntegerField
      FieldName = 'CHEC'
      OnChange = addresCHECChange
    end
    object addresSTREET: TFIBStringField
      FieldName = 'STREET'
      Size = 100
      EmptyStrToNull = True
    end
    object addresPHONE: TFIBStringField
      FieldName = 'PHONE'
      EmptyStrToNull = True
    end
    object addresTOWN: TFIBIntegerField
      FieldName = 'TOWN'
    end
  end
  object DSaddresmain: TDataSource
    DataSet = addresmain
    Left = 88
    Top = 64
  end
  object transact1: TpFIBTransaction
    DefaultDatabase = database
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'nowait'
      'read_committed'
      'rec_version')
    TPBMode = tpbDefault
    Left = 88
    Top = 8
  end
  object DSaddres: TDataSource
    DataSet = addres
    Left = 88
    Top = 112
  end
  object DStmp: TDataSource
    DataSet = tmp
    Left = 88
    Top = 160
  end
  object tmp: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TMP'
      'SET '
      '    COD = :COD,'
      '    KV = :KV,'
      '    NS = :NS,'
      '    ADDR = :ADDR,'
      '    FIO = :FIO,'
      '    PHONE = :PHONE,'
      '    PPLAT = :PPLAT,'
      '    UBANK = :UBANK,'
      '    LSCHET = :LSCHET,'
      '    SPOL = :SPOL,'
      '    SDF = :SDF,'
      '    CHEC = :CHEC,'
      '    DESCRIPTION = :DESCRIPTION,'
      '    HASHW = :HASHW,'
      '    HASHR = :HASHR,'
      '    NDOG = :NDOG,'
      '    DATE_INST = :DATE_INST,'
      '    DATE_ZAM = :DATE_ZAM,'
      '    NUM_OLD = :NUM_OLD,'
      '    NUM_NEW = :NUM_NEW,'
      '    TAR_NAK_OLD = :TAR_NAK_OLD,'
      '    TAR_NAK_NEW = :TAR_NAK_NEW,'
      '    ARH = :ARH'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TMP'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TMP('
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    SDF,'
      '    CHEC,'
      '    DESCRIPTION,'
      '    HASHW,'
      '    HASHR,'
      '    NDOG,'
      '    DATE_INST,'
      '    DATE_ZAM,'
      '    NUM_OLD,'
      '    NUM_NEW,'
      '    TAR_NAK_OLD,'
      '    TAR_NAK_NEW,'
      '    ARH'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :KV,'
      '    :NS,'
      '    :ADDR,'
      '    :FIO,'
      '    :PHONE,'
      '    :PPLAT,'
      '    :UBANK,'
      '    :LSCHET,'
      '    :SPOL,'
      '    :SDF,'
      '    :CHEC,'
      '    :DESCRIPTION,'
      '    :HASHW,'
      '    :HASHR,'
      '    :NDOG,'
      '    :DATE_INST,'
      '    :DATE_ZAM,'
      '    :NUM_OLD,'
      '    :NUM_NEW,'
      '    :TAR_NAK_OLD,'
      '    :TAR_NAK_NEW,'
      '    :ARH'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    SDF,'
      '    CHEC,'
      '    DESCRIPTION,'
      '    HASHW,'
      '    HASHR,'
      '    NDOG,'
      '    DATE_INST,'
      '    DATE_ZAM,'
      '    NUM_OLD,'
      '    NUM_NEW,'
      '    TAR_NAK_OLD,'
      '    TAR_NAK_NEW,'
      '    ARH'
      'FROM'
      '    TMP '
      'where(  cod = :inc'
      '     ) and (     TMP.INC = :OLD_INC'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    SDF,'
      '    CHEC,'
      '    DESCRIPTION,'
      '    HASHW,'
      '    HASHR,'
      '    NDOG'
      'FROM'
      '    TMP '
      'where cod = :inc'
      'order by kv')
    AfterScroll = tmpAfterScroll
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DSaddres
    Left = 24
    Top = 160
    poAskRecordCount = True
    object tmpINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object tmpCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object tmpKV: TFIBIntegerField
      FieldName = 'KV'
    end
    object tmpNS: TFIBStringField
      FieldName = 'NS'
      Size = 9
      EmptyStrToNull = True
    end
    object tmpADDR: TFIBStringField
      FieldName = 'ADDR'
      EmptyStrToNull = True
    end
    object tmpFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 75
      EmptyStrToNull = True
    end
    object tmpPHONE: TFIBStringField
      FieldName = 'PHONE'
      Size = 9
      EmptyStrToNull = True
    end
    object tmpPPLAT: TFIBStringField
      FieldName = 'PPLAT'
      Size = 40
      EmptyStrToNull = True
    end
    object tmpUBANK: TFIBStringField
      FieldName = 'UBANK'
      Size = 40
      EmptyStrToNull = True
    end
    object tmpLSCHET: TFIBStringField
      FieldName = 'LSCHET'
      EmptyStrToNull = True
    end
    object tmpSPOL: TFIBIntegerField
      FieldName = 'SPOL'
    end
    object tmpSDF: TFIBStringField
      FieldName = 'SDF'
      Size = 1
      EmptyStrToNull = True
    end
    object tmpCHEC: TFIBIntegerField
      FieldName = 'CHEC'
      OnChange = tmpCHECChange
    end
    object tmpDESCRIPTION: TFIBStringField
      FieldName = 'DESCRIPTION'
      Size = 200
      EmptyStrToNull = True
    end
    object tmpHASHW: TFIBStringField
      FieldName = 'HASHW'
      EmptyStrToNull = True
    end
    object tmpHASHR: TFIBStringField
      FieldName = 'HASHR'
      EmptyStrToNull = True
    end
    object tmpNDOG: TFIBStringField
      FieldName = 'NDOG'
      EmptyStrToNull = True
    end
  end
  object town: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    TOWN'
      'FROM'
      '    TOWN'
      'order by town ')
    AfterOpen = townAfterOpen
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    Left = 24
    Top = 216
    poAskRecordCount = True
    object townINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object townTOWN: TFIBStringField
      FieldName = 'TOWN'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object DStown: TDataSource
    DataSet = town
    Left = 88
    Top = 216
  end
  object addres_1: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    CHEC,'
      '    STREET,'
      '    PHONE,'
      '    TOWN'
      'FROM'
      '    ADDRES '
      'where cod = :inc')
    Transaction = transact1
    Database = database
    SQLScreenCursor = crSQLWait
    DataSource = DSaddresmain
    Left = 144
    Top = 112
    poAskRecordCount = True
  end
  object DSaddres_1: TDataSource
    DataSet = addres_1
    Left = 208
    Top = 112
  end
  object DStmp_1: TDataSource
    DataSet = tmp_1
    Left = 208
    Top = 160
  end
  object tmp_1: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    HASHR,'
      '    SDF,'
      '    DESCRIPTION,'
      '    NDOG,'
      '    DATE_ZAM'
      'FROM'
      '    TMP '
      'where cod = :inc'
      'order by kv')
    AfterScroll = tmp_1AfterScroll
    Transaction = transact1
    Database = database
    SQLScreenCursor = crSQLWait
    DataSource = DSaddres_1
    Left = 144
    Top = 160
    poAskRecordCount = True
  end
  object DStmp_2: TDataSource
    DataSet = tmp_2
    Left = 336
    Top = 160
  end
  object tmp_2: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    HASHR,'
      '    SDF,'
      '    DESCRIPTION,'
      '    NDOG,'
      '    DATE_ZAM'
      'FROM'
      '    TMP '
      'where cod in'
      '             (select inc from addres'
      '              where cod = :inc)'
      'order by kv')
    AfterScroll = tmp_2AfterScroll
    Transaction = transact1
    Database = database
    SQLScreenCursor = crSQLWait
    DataSource = DSaddresmain
    Left = 272
    Top = 160
    poAskRecordCount = True
  end
  object kv_konfig: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    VAR_TAR1,'
      '    KV,'
      '    MES_POT,'
      '    MES_POT1,'
      '    POWER,'
      '    POWER1,'
      '    POT_OTK,'
      '    POT_OTK1,'
      '    TAR_NAK,'
      '    TAR_NAK1,'
      '    TIME0,'
      '    TIME1,'
      '    TIMES,'
      '    TIMEC,'
      '    VAR_TAR_TIME,'
      '    VAR_TAR_TIME1,'
      '    TAR_NAK_TIME,'
      '    TAR_NAK_TIME1,'
      '    POWER_TIME,'
      '    POWER_TIME1,'
      '    MES_POT_TIME,'
      '    MES_POT_TIME1,'
      '    POT_OTK_TIME,'
      '    POT_OTK_TIME1,'
      '    TIME_SCH,'
      '    FDT,'
      '    FDP,'
      '    MES,'
      '    PROF_NAGR,'
      '    PROF_NAGR1,'
      '    PROF_NAGR_TIME,'
      '    PROF_NAGR_TIME1,'
      '    M7,'
      '    M8,'
      '    M9,'
      '    M10'
      'FROM'
      '    KV_KONFIG'
      'where cod = :inc ')
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    Left = 22
    Top = 272
  end
  object DSkv_konfig: TDataSource
    DataSet = kv_konfig
    Left = 88
    Top = 272
  end
  object AListTmp: TActionList
    Left = 411
    Top = 32
  end
  object tmp_summir: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TMP'
      'SET '
      '    NS = :NS,'
      '    SPOL = :SPOL'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TMP'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TMP('
      '    INC,'
      '    NS,'
      '    SPOL'
      ')'
      'VALUES('
      '    :INC,'
      '    :NS,'
      '    :SPOL'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    inc,'
      '    NS,'
      '    SPOL'
      'FROM'
      '    TMP '
      'where(  cod in (select inc from addres'
      '              where cod = :inc) and sdf = 3'
      '     ) and (     TMP.INC = :OLD_INC'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    inc,'
      '    NS,'
      '    SPOL'
      'FROM'
      '    TMP '
      'where cod in (select inc from addres'
      '              where cod = :inc) and sdf = 3')
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DSaddresmain
    Left = 408
    Top = 160
    poAskRecordCount = True
  end
  object DStmp_summir: TDataSource
    DataSet = tmp_summir
    Left = 483
    Top = 160
  end
  object addres_bal: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    inc,'
      '    STREET'
      'FROM'
      '    ADDRES'
      'where cod = :inc ')
    Transaction = transact1
    Database = database
    DataSource = DSaddresmain
    Left = 272
    Top = 112
    poAskRecordCount = True
  end
  object DSaddr_bal: TDataSource
    DataSet = addres_bal
    Left = 336
    Top = 112
  end
  object tmp_bal: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    SDF,'
      '    CHEC,'
      '    DESCRIPTION,'
      '    HASHW,'
      '    HASHR,'
      '    NDOG,'
      '    DATE_INST,'
      '    DATE_ZAM,'
      '    NUM_OLD,'
      '    NUM_NEW,'
      '    TAR_NAK_OLD,'
      '    TAR_NAK_NEW,'
      '    ARH'
      'FROM'
      '    TMP '
      'where (cod = :inc and sdf <> 3)'
      'order by kv')
    Transaction = transact1
    Database = database
    DataSource = DSaddr_bal
    Left = 560
    Top = 160
    poAskRecordCount = True
    object tmp_balINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object tmp_balCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object tmp_balKV: TFIBIntegerField
      FieldName = 'KV'
    end
    object tmp_balNS: TFIBStringField
      FieldName = 'NS'
      Size = 9
      EmptyStrToNull = True
    end
    object tmp_balADDR: TFIBStringField
      FieldName = 'ADDR'
      EmptyStrToNull = True
    end
    object tmp_balFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 75
      EmptyStrToNull = True
    end
    object tmp_balPHONE: TFIBStringField
      FieldName = 'PHONE'
      Size = 9
      EmptyStrToNull = True
    end
    object tmp_balPPLAT: TFIBStringField
      FieldName = 'PPLAT'
      Size = 40
      EmptyStrToNull = True
    end
    object tmp_balUBANK: TFIBStringField
      FieldName = 'UBANK'
      Size = 40
      EmptyStrToNull = True
    end
    object tmp_balLSCHET: TFIBStringField
      FieldName = 'LSCHET'
      EmptyStrToNull = True
    end
    object tmp_balSPOL: TFIBIntegerField
      FieldName = 'SPOL'
    end
    object tmp_balSDF: TFIBStringField
      FieldName = 'SDF'
      Size = 1
      EmptyStrToNull = True
    end
    object tmp_balCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
    object tmp_balDESCRIPTION: TFIBStringField
      FieldName = 'DESCRIPTION'
      Size = 200
      EmptyStrToNull = True
    end
    object tmp_balHASHW: TFIBStringField
      FieldName = 'HASHW'
      EmptyStrToNull = True
    end
    object tmp_balHASHR: TFIBStringField
      FieldName = 'HASHR'
      EmptyStrToNull = True
    end
    object tmp_balNDOG: TFIBStringField
      FieldName = 'NDOG'
      EmptyStrToNull = True
    end
    object tmp_balDATE_INST: TFIBDateField
      FieldName = 'DATE_INST'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object tmp_balDATE_ZAM: TFIBDateField
      FieldName = 'DATE_ZAM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object tmp_balNUM_OLD: TFIBStringField
      FieldName = 'NUM_OLD'
      Size = 6
      EmptyStrToNull = True
    end
    object tmp_balNUM_NEW: TFIBStringField
      FieldName = 'NUM_NEW'
      Size = 6
      EmptyStrToNull = True
    end
    object tmp_balTAR_NAK_OLD: TFIBMemoField
      FieldName = 'TAR_NAK_OLD'
      BlobType = ftMemo
      Size = 8
    end
    object tmp_balTAR_NAK_NEW: TFIBMemoField
      FieldName = 'TAR_NAK_NEW'
      BlobType = ftMemo
      Size = 8
    end
    object tmp_balARH: TFIBIntegerField
      FieldName = 'ARH'
    end
  end
  object DStmp_bal: TDataSource
    DataSet = tmp_bal
    Left = 619
    Top = 160
  end
  object tmp_3xf: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TMP_3XF'
      'SET '
      '    COD = :COD,'
      '    NS = :NS,'
      '    ADDR = :ADDR,'
      '    FIO = :FIO,'
      '    TIPE = :TIPE,'
      '    SDF = :SDF,'
      '    KV = :KV,'
      '    ID_TMP = :ID_TMP'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TMP_3XF'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_3XF('
      '    INC,'
      '    COD,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    TIPE,'
      '    SDF,'
      '    KV,'
      '    ID_TMP'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :NS,'
      '    :ADDR,'
      '    :FIO,'
      '    :TIPE,'
      '    :SDF,'
      '    :KV,'
      '    :ID_TMP'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    TIPE,'
      '    SDF,'
      '    KV,'
      '    ID_TMP'
      'FROM'
      '    TMP_3XF'
      'where(  cod = :inc'
      '     ) and (     TMP_3XF.INC = :OLD_INC'
      '     )'
      '     ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    TIPE,'
      '    SDF,'
      '    KV,'
      '    ID_TMP'
      'FROM'
      '    TMP_3XF'
      'where cod = :inc '
      'order by KV')
    OnPostError = tmp_3xfPostError
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DStmp_summir
    Left = 24
    Top = 328
    poAskRecordCount = True
    object tmp_3xfINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object tmp_3xfCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object tmp_3xfNS: TFIBStringField
      FieldName = 'NS'
      Size = 6
      EmptyStrToNull = True
    end
    object tmp_3xfADDR: TFIBStringField
      FieldName = 'ADDR'
      EmptyStrToNull = True
    end
    object tmp_3xfFIO: TFIBStringField
      FieldName = 'FIO'
      EmptyStrToNull = True
    end
    object tmp_3xfTIPE: TFIBStringField
      FieldName = 'TIPE'
      Size = 30
      EmptyStrToNull = True
    end
    object tmp_3xfSDF: TFIBStringField
      FieldName = 'SDF'
      Size = 1
      EmptyStrToNull = True
    end
    object tmp_3xfKV: TFIBIntegerField
      FieldName = 'KV'
    end
    object tmp_3xfID_TMP: TFIBIntegerField
      FieldName = 'ID_TMP'
    end
  end
  object DStmp_3xf: TDataSource
    DataSet = tmp_3xf
    Left = 88
    Top = 328
  end
  object sp_tmp_3fx: TpFIBStoredProc
    Transaction = updateTransact
    Database = database
    SQL.Strings = (
      'EXECUTE PROCEDURE TMP_3XF_INC ')
    StoredProcName = 'TMP_3XF_INC'
    Left = 408
    Top = 272
  end
  object townAdd: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TOWN'
      'SET '
      '    TOWN = :TOWN'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TOWN'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TOWN('
      '    INC,'
      '    TOWN'
      ')'
      'VALUES('
      '    :INC,'
      '    :TOWN'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    TOWN'
      'FROM'
      '    TOWN '
      ''
      ' WHERE '
      '        TOWN.INC = :OLD_INC'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    TOWN'
      'FROM'
      '    TOWN'
      'order by town ')
    AfterOpen = townAfterOpen
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    Left = 144
    Top = 216
    poAskRecordCount = True
    object townAddINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object townAddTOWN: TFIBStringField
      FieldName = 'TOWN'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object sp_addresmain: TpFIBStoredProc
    Transaction = updateTransact
    Database = database
    SQL.Strings = (
      'EXECUTE PROCEDURE ADDRESMAIN_INC ')
    StoredProcName = 'ADDRESMAIN_INC'
    Left = 712
    Top = 56
  end
  object sp_townAdd: TpFIBStoredProc
    Transaction = updateTransact
    Database = database
    SQL.Strings = (
      'EXECUTE PROCEDURE TOWN_INC ')
    StoredProcName = 'TOWN_INC'
    Left = 408
    Top = 224
  end
  object sp_addres: TpFIBStoredProc
    Transaction = updateTransact
    Database = database
    SQL.Strings = (
      'EXECUTE PROCEDURE ADDRES_INC ')
    StoredProcName = 'ADDRES_INC'
    Left = 712
    Top = 104
  end
  object koncen: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE KONCEN'
      'SET '
      '    COD = :COD,'
      '    NUMSCHIT = :NUMSCHIT,'
      '    STREET = :STREET,'
      '    TMP = :TMP,'
      '    ADDR = :ADDR,'
      '    PHONE = :PHONE,'
      '    MES_POT = :MES_POT,'
      '    POWER = :POWER,'
      '    POT_OTK = :POT_OTK,'
      '    TAR_NAK = :TAR_NAK,'
      '    MES_POT1 = :MES_POT1,'
      '    POWER1 = :POWER1,'
      '    POT_OTK1 = :POT_OTK1,'
      '    TAR_NAK1 = :TAR_NAK1,'
      '    VARTAR_1 = :VARTAR_1,'
      '    VARTAR_2 = :VARTAR_2,'
      '    VARTAR_3 = :VARTAR_3,'
      '    VARTAR_4 = :VARTAR_4,'
      '    VARTAR_5 = :VARTAR_5,'
      '    VARTAR_6 = :VARTAR_6,'
      '    VARTAR_7 = :VARTAR_7,'
      '    VARTAR_8 = :VARTAR_8,'
      '    VARTAR_9 = :VARTAR_9,'
      '    VARTAR_10 = :VARTAR_10,'
      '    VARTAR_11 = :VARTAR_11,'
      '    VARTAR_21 = :VARTAR_21,'
      '    VARTAR_31 = :VARTAR_31,'
      '    VARTAR_41 = :VARTAR_41,'
      '    VARTAR_51 = :VARTAR_51,'
      '    VARTAR_61 = :VARTAR_61,'
      '    VARTAR_71 = :VARTAR_71,'
      '    VARTAR_81 = :VARTAR_81,'
      '    VARTAR_91 = :VARTAR_91,'
      '    VARTAR_101 = :VARTAR_101,'
      '    TIME_ = :TIME_,'
      '    TIME_1 = :TIME_1,'
      '    CONF = :CONF,'
      '    IP_ADDRES = :IP_ADDRES'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    KONCEN'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO KONCEN('
      '    INC,'
      '    COD,'
      '    NUMSCHIT,'
      '    STREET,'
      '    TMP,'
      '    ADDR,'
      '    PHONE,'
      '    MES_POT,'
      '    POWER,'
      '    POT_OTK,'
      '    TAR_NAK,'
      '    MES_POT1,'
      '    POWER1,'
      '    POT_OTK1,'
      '    TAR_NAK1,'
      '    VARTAR_1,'
      '    VARTAR_2,'
      '    VARTAR_3,'
      '    VARTAR_4,'
      '    VARTAR_5,'
      '    VARTAR_6,'
      '    VARTAR_7,'
      '    VARTAR_8,'
      '    VARTAR_9,'
      '    VARTAR_10,'
      '    VARTAR_11,'
      '    VARTAR_21,'
      '    VARTAR_31,'
      '    VARTAR_41,'
      '    VARTAR_51,'
      '    VARTAR_61,'
      '    VARTAR_71,'
      '    VARTAR_81,'
      '    VARTAR_91,'
      '    VARTAR_101,'
      '    TIME_,'
      '    TIME_1,'
      '    CONF,'
      '    IP_ADDRES'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :NUMSCHIT,'
      '    :STREET,'
      '    :TMP,'
      '    :ADDR,'
      '    :PHONE,'
      '    :MES_POT,'
      '    :POWER,'
      '    :POT_OTK,'
      '    :TAR_NAK,'
      '    :MES_POT1,'
      '    :POWER1,'
      '    :POT_OTK1,'
      '    :TAR_NAK1,'
      '    :VARTAR_1,'
      '    :VARTAR_2,'
      '    :VARTAR_3,'
      '    :VARTAR_4,'
      '    :VARTAR_5,'
      '    :VARTAR_6,'
      '    :VARTAR_7,'
      '    :VARTAR_8,'
      '    :VARTAR_9,'
      '    :VARTAR_10,'
      '    :VARTAR_11,'
      '    :VARTAR_21,'
      '    :VARTAR_31,'
      '    :VARTAR_41,'
      '    :VARTAR_51,'
      '    :VARTAR_61,'
      '    :VARTAR_71,'
      '    :VARTAR_81,'
      '    :VARTAR_91,'
      '    :VARTAR_101,'
      '    :TIME_,'
      '    :TIME_1,'
      '    :CONF,'
      '    :IP_ADDRES'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    NUMSCHIT,'
      '    STREET,'
      '    TMP,'
      '    ADDR,'
      '    PHONE,'
      '    MES_POT,'
      '    POWER,'
      '    POT_OTK,'
      '    TAR_NAK,'
      '    MES_POT1,'
      '    POWER1,'
      '    POT_OTK1,'
      '    TAR_NAK1,'
      '    VARTAR_1,'
      '    VARTAR_2,'
      '    VARTAR_3,'
      '    VARTAR_4,'
      '    VARTAR_5,'
      '    VARTAR_6,'
      '    VARTAR_7,'
      '    VARTAR_8,'
      '    VARTAR_9,'
      '    VARTAR_10,'
      '    VARTAR_11,'
      '    VARTAR_21,'
      '    VARTAR_31,'
      '    VARTAR_41,'
      '    VARTAR_51,'
      '    VARTAR_61,'
      '    VARTAR_71,'
      '    VARTAR_81,'
      '    VARTAR_91,'
      '    VARTAR_101,'
      '    TIME_,'
      '    TIME_1,'
      '    CONF,'
      '    IP_ADDRES'
      'FROM'
      '    KONCEN'
      'where(  cod = :inc'
      '     ) and (     KONCEN.INC = :OLD_INC'
      '     )'
      '     ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    NUMSCHIT,'
      '    STREET,'
      '    TMP,'
      '    ADDR,'
      '    PHONE,'
      '    MES_POT,'
      '    POWER,'
      '    POT_OTK,'
      '    TAR_NAK,'
      '    MES_POT1,'
      '    POWER1,'
      '    POT_OTK1,'
      '    TAR_NAK1,'
      '    VARTAR_1,'
      '    VARTAR_2,'
      '    VARTAR_3,'
      '    VARTAR_4,'
      '    VARTAR_5,'
      '    VARTAR_6,'
      '    VARTAR_7,'
      '    VARTAR_8,'
      '    VARTAR_9,'
      '    VARTAR_10,'
      '    VARTAR_11,'
      '    VARTAR_21,'
      '    VARTAR_31,'
      '    VARTAR_41,'
      '    VARTAR_51,'
      '    VARTAR_61,'
      '    VARTAR_71,'
      '    VARTAR_81,'
      '    VARTAR_91,'
      '    VARTAR_101,'
      '    TIME_,'
      '    TIME_1,'
      '    CONF,'
      '    IP_ADDRES'
      'FROM'
      '    KONCEN'
      'where cod = :inc ')
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DSaddresmain
    Left = 24
    Top = 384
    object koncenINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object koncenCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object koncenNUMSCHIT: TFIBStringField
      FieldName = 'NUMSCHIT'
      EmptyStrToNull = True
    end
    object koncenSTREET: TFIBMemoField
      FieldName = 'STREET'
      BlobType = ftMemo
      Size = 8
    end
    object koncenTMP: TFIBMemoField
      FieldName = 'TMP'
      BlobType = ftMemo
      Size = 8
    end
    object koncenADDR: TFIBStringField
      FieldName = 'ADDR'
      Size = 100
      EmptyStrToNull = True
    end
    object koncenPHONE: TFIBStringField
      FieldName = 'PHONE'
      EmptyStrToNull = True
    end
    object koncenMES_POT: TFIBMemoField
      FieldName = 'MES_POT'
      BlobType = ftMemo
      Size = 8
    end
    object koncenPOWER: TFIBMemoField
      FieldName = 'POWER'
      BlobType = ftMemo
      Size = 8
    end
    object koncenPOT_OTK: TFIBMemoField
      FieldName = 'POT_OTK'
      BlobType = ftMemo
      Size = 8
    end
    object koncenTAR_NAK: TFIBMemoField
      FieldName = 'TAR_NAK'
      BlobType = ftMemo
      Size = 8
    end
    object koncenMES_POT1: TFIBMemoField
      FieldName = 'MES_POT1'
      BlobType = ftMemo
      Size = 8
    end
    object koncenPOWER1: TFIBMemoField
      FieldName = 'POWER1'
      BlobType = ftMemo
      Size = 8
    end
    object koncenPOT_OTK1: TFIBMemoField
      FieldName = 'POT_OTK1'
      BlobType = ftMemo
      Size = 8
    end
    object koncenTAR_NAK1: TFIBMemoField
      FieldName = 'TAR_NAK1'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_1: TFIBMemoField
      FieldName = 'VARTAR_1'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_2: TFIBMemoField
      FieldName = 'VARTAR_2'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_3: TFIBMemoField
      FieldName = 'VARTAR_3'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_4: TFIBMemoField
      FieldName = 'VARTAR_4'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_5: TFIBMemoField
      FieldName = 'VARTAR_5'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_6: TFIBMemoField
      FieldName = 'VARTAR_6'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_7: TFIBMemoField
      FieldName = 'VARTAR_7'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_8: TFIBMemoField
      FieldName = 'VARTAR_8'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_9: TFIBMemoField
      FieldName = 'VARTAR_9'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_10: TFIBMemoField
      FieldName = 'VARTAR_10'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_11: TFIBMemoField
      FieldName = 'VARTAR_11'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_21: TFIBMemoField
      FieldName = 'VARTAR_21'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_31: TFIBMemoField
      FieldName = 'VARTAR_31'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_41: TFIBMemoField
      FieldName = 'VARTAR_41'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_51: TFIBMemoField
      FieldName = 'VARTAR_51'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_61: TFIBMemoField
      FieldName = 'VARTAR_61'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_71: TFIBMemoField
      FieldName = 'VARTAR_71'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_81: TFIBMemoField
      FieldName = 'VARTAR_81'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_91: TFIBMemoField
      FieldName = 'VARTAR_91'
      BlobType = ftMemo
      Size = 8
    end
    object koncenVARTAR_101: TFIBMemoField
      FieldName = 'VARTAR_101'
      BlobType = ftMemo
      Size = 8
    end
    object koncenTIME_: TFIBStringField
      FieldName = 'TIME_'
      EmptyStrToNull = True
    end
    object koncenTIME_1: TFIBStringField
      FieldName = 'TIME_1'
      EmptyStrToNull = True
    end
    object koncenCONF: TFIBMemoField
      FieldName = 'CONF'
      BlobType = ftMemo
      Size = 8
    end
    object koncenIP_ADDRES: TFIBStringField
      FieldName = 'IP_ADDRES'
      Size = 15
      EmptyStrToNull = True
    end
  end
  object DSkoncen: TDataSource
    DataSet = koncen
    Left = 88
    Top = 384
  end
  object sp_koncen: TpFIBStoredProc
    Transaction = updateTransact
    Database = database
    SQL.Strings = (
      'EXECUTE PROCEDURE KONCEN_INC ')
    StoredProcName = 'KONCEN_INC'
    Left = 408
    Top = 320
  end
  object addres_korrekt: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ADDRES'
      'SET '
      '    COD = :COD,'
      '    CHEC = :CHEC,'
      '    STREET = :STREET,'
      '    PHONE = :PHONE,'
      '    TOWN = :TOWN'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ADDRES'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ADDRES('
      '    INC,'
      '    COD,'
      '    CHEC,'
      '    STREET,'
      '    PHONE,'
      '    TOWN'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :CHEC,'
      '    :STREET,'
      '    :PHONE,'
      '    :TOWN'
      ')')
    RefreshSQL.Strings = (
      'select * from addres '
      ' where(  cod in '
      '   (select inc from addresmain where rez = :inc)'
      '     ) and (     ADDRES.INC = :OLD_INC'
      '     )'
      '     ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    CHEC,'
      '    STREET,'
      '    PHONE,'
      '    TOWN'
      'FROM'
      '    ADDRES '
      ' where cod in '
      '   (select inc from addresmain where rez = :inc) '
      'order by street')
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    BeforeOpen = addres_korrektBeforeOpen
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DSaddresmain
    Left = 408
    Top = 112
    poAskRecordCount = True
    object addres_korrektINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object addres_korrektCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object addres_korrektCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
    object addres_korrektSTREET: TFIBStringField
      FieldName = 'STREET'
      Size = 100
      EmptyStrToNull = True
    end
    object addres_korrektPHONE: TFIBStringField
      FieldName = 'PHONE'
      EmptyStrToNull = True
    end
    object addres_korrektTOWN: TFIBIntegerField
      FieldName = 'TOWN'
    end
  end
  object DSaddres_korrekt: TDataSource
    DataSet = addres_korrekt
    Left = 488
    Top = 112
  end
  object tmp_korrekt: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TMP'
      'SET '
      '    COD = :COD,'
      '    KV = :KV,'
      '    NS = :NS,'
      '    ADDR = :ADDR,'
      '    FIO = :FIO,'
      '    PHONE = :PHONE,'
      '    PPLAT = :PPLAT,'
      '    UBANK = :UBANK,'
      '    LSCHET = :LSCHET,'
      '    SPOL = :SPOL,'
      '    SDF = :SDF,'
      '    CHEC = :CHEC,'
      '    DESCRIPTION = :DESCRIPTION,'
      '    HASHW = :HASHW,'
      '    HASHR = :HASHR,'
      '    NDOG = :NDOG,'
      '    DATE_INST = :DATE_INST,'
      '    DATE_ZAM = :DATE_ZAM,'
      '    NUM_OLD = :NUM_OLD,'
      '    NUM_NEW = :NUM_NEW,'
      '    TAR_NAK_OLD = :TAR_NAK_OLD,'
      '    TAR_NAK_NEW = :TAR_NAK_NEW,'
      '    ARH = :ARH,'
      '    ID_COUNTER_TYPE = :ID_COUNTER_TYPE,'
      '    COD_SCH = :COD_SCH,'
      '    "PASSWORD" = :"PASSWORD"'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TMP'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TMP('
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    SDF,'
      '    CHEC,'
      '    DESCRIPTION,'
      '    HASHW,'
      '    HASHR,'
      '    NDOG,'
      '    DATE_INST,'
      '    DATE_ZAM,'
      '    NUM_OLD,'
      '    NUM_NEW,'
      '    TAR_NAK_OLD,'
      '    TAR_NAK_NEW,'
      '    ARH,'
      '    ID_COUNTER_TYPE,'
      '    COD_SCH,'
      '    "PASSWORD"'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :KV,'
      '    :NS,'
      '    :ADDR,'
      '    :FIO,'
      '    :PHONE,'
      '    :PPLAT,'
      '    :UBANK,'
      '    :LSCHET,'
      '    :SPOL,'
      '    :SDF,'
      '    :CHEC,'
      '    :DESCRIPTION,'
      '    :HASHW,'
      '    :HASHR,'
      '    :NDOG,'
      '    :DATE_INST,'
      '    :DATE_ZAM,'
      '    :NUM_OLD,'
      '    :NUM_NEW,'
      '    :TAR_NAK_OLD,'
      '    :TAR_NAK_NEW,'
      '    :ARH,'
      '    :ID_COUNTER_TYPE,'
      '    :COD_SCH,'
      '    :"PASSWORD"'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    SDF,'
      '    CHEC,'
      '    DESCRIPTION,'
      '    HASHW,'
      '    HASHR,'
      '    NDOG,'
      '    DATE_INST,'
      '    DATE_ZAM,'
      '    NUM_OLD,'
      '    NUM_NEW,'
      '    TAR_NAK_OLD,'
      '    TAR_NAK_NEW,'
      '    ARH,'
      '    ID_COUNTER_TYPE,'
      '    COD_SCH, '
      '    "PASSWORD"'
      'FROM'
      '    TMP'
      'where(  cod = :inc'
      '     ) and (     TMP.INC = :OLD_INC'
      '     )'
      '     ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    SDF,'
      '    CHEC,'
      '    DESCRIPTION,'
      '    HASHW,'
      '    HASHR,'
      '    NDOG,'
      '    DATE_INST,'
      '    DATE_ZAM,'
      '    NUM_OLD,'
      '    NUM_NEW,'
      '    TAR_NAK_OLD,'
      '    TAR_NAK_NEW,'
      '    ARH,'
      '    ID_COUNTER_TYPE,'
      '    COD_SCH, '
      '    "PASSWORD"'
      'FROM'
      '    TMP'
      'where cod = :inc ')
    OnPostError = tmp_korrektPostError
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DSaddres_korrekt
    Left = 696
    Top = 160
    poAskRecordCount = True
    object tmp_korrektINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object tmp_korrektCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object tmp_korrektKV: TFIBIntegerField
      FieldName = 'KV'
    end
    object tmp_korrektNS: TFIBStringField
      FieldName = 'NS'
      OnChange = tmp_korrektNSChange
      Size = 9
      EmptyStrToNull = True
    end
    object tmp_korrektADDR: TFIBStringField
      FieldName = 'ADDR'
      EmptyStrToNull = True
    end
    object tmp_korrektFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 75
      EmptyStrToNull = True
    end
    object tmp_korrektPHONE: TFIBStringField
      FieldName = 'PHONE'
      Size = 9
      EmptyStrToNull = True
    end
    object tmp_korrektPPLAT: TFIBStringField
      FieldName = 'PPLAT'
      OnChange = tmp_korrektPPLATChange
      Size = 40
      EmptyStrToNull = True
    end
    object tmp_korrektUBANK: TFIBStringField
      FieldName = 'UBANK'
      Size = 40
      EmptyStrToNull = True
    end
    object tmp_korrektLSCHET: TFIBStringField
      FieldName = 'LSCHET'
      EmptyStrToNull = True
    end
    object tmp_korrektSPOL: TFIBIntegerField
      FieldName = 'SPOL'
    end
    object tmp_korrektSDF: TFIBStringField
      FieldName = 'SDF'
      Size = 1
      EmptyStrToNull = True
    end
    object tmp_korrektCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
    object tmp_korrektDESCRIPTION: TFIBStringField
      FieldName = 'DESCRIPTION'
      Size = 200
      EmptyStrToNull = True
    end
    object tmp_korrektHASHW: TFIBStringField
      FieldName = 'HASHW'
      EmptyStrToNull = True
    end
    object tmp_korrektHASHR: TFIBStringField
      FieldName = 'HASHR'
      EmptyStrToNull = True
    end
    object tmp_korrektNDOG: TFIBStringField
      FieldName = 'NDOG'
      EmptyStrToNull = True
    end
    object tmp_korrektDATE_INST: TFIBDateField
      FieldName = 'DATE_INST'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object tmp_korrektDATE_ZAM: TFIBDateField
      FieldName = 'DATE_ZAM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object tmp_korrektNUM_OLD: TFIBStringField
      FieldName = 'NUM_OLD'
      Size = 6
      EmptyStrToNull = True
    end
    object tmp_korrektNUM_NEW: TFIBStringField
      FieldName = 'NUM_NEW'
      Size = 6
      EmptyStrToNull = True
    end
    object tmp_korrektTAR_NAK_OLD: TFIBMemoField
      FieldName = 'TAR_NAK_OLD'
      BlobType = ftMemo
      Size = 8
    end
    object tmp_korrektTAR_NAK_NEW: TFIBMemoField
      FieldName = 'TAR_NAK_NEW'
      BlobType = ftMemo
      Size = 8
    end
    object tmp_korrektARH: TFIBIntegerField
      FieldName = 'ARH'
    end
    object tmp_korrektID_COUNTER_TYPE: TFIBSmallIntField
      FieldName = 'ID_COUNTER_TYPE'
      OnChange = tmp_korrektID_COUNTER_TYPEChange
    end
    object tmp_korrektLookupCounte_type: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupCounte_type'
      LookupDataSet = counter_type
      LookupKeyFields = 'COUNTER_TYPE_ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_COUNTER_TYPE'
      Lookup = True
    end
    object tmp_korrektCOD_SCH: TFIBStringField
      FieldName = 'COD_SCH'
      Size = 15
      EmptyStrToNull = True
    end
    object tmp_korrektPASSWORD: TFIBStringField
      FieldName = 'PASSWORD'
      Size = 6
      EmptyStrToNull = True
    end
  end
  object DStmp_korrekt: TDataSource
    DataSet = tmp_korrekt
    Left = 768
    Top = 160
  end
  object sp_tmp: TpFIBStoredProc
    Transaction = updateTransact
    Database = database
    SQL.Strings = (
      'EXECUTE PROCEDURE TMP_INC ')
    StoredProcName = 'TMP_INC'
    Left = 840
    Top = 160
  end
  object sp_INSERT_COUNTER: TpFIBStoredProc
    Transaction = updateTransact
    Database = database
    SQL.Strings = (
      'EXECUTE PROCEDURE INSERT_COUNTER (?COD)')
    StoredProcName = 'INSERT_COUNTER'
    Left = 408
    Top = 376
  end
  object query: TpFIBQuery
    Transaction = transact1
    Database = database
    SQL.Strings = (
      'select  ns, kv '
      'from tmp'
      'where cod in (select inc from addres '
      '              where cod = :inc)'
      'and hashr = 0')
    Left = 396
    Top = 492
  end
  object update_kv_konfig: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE KV_KONFIG'
      'SET '
      '    COD = :COD,'
      '    VAR_TAR = :VAR_TAR,'
      '    VAR_TAR1 = :VAR_TAR1,'
      '    KV = :KV,'
      '    MES_POT = :MES_POT,'
      '    MES_POT1 = :MES_POT1,'
      '    POWER = :POWER,'
      '    POWER1 = :POWER1,'
      '    POT_OTK = :POT_OTK,'
      '    POT_OTK1 = :POT_OTK1,'
      '    TAR_NAK = :TAR_NAK,'
      '    TAR_NAK1 = :TAR_NAK1,'
      '    TIME0 = :TIME0,'
      '    TIME1 = :TIME1,'
      '    TIMES = :TIMES,'
      '    TIMEC = :TIMEC,'
      '    VAR_TAR_TIME = :VAR_TAR_TIME,'
      '    VAR_TAR_TIME1 = :VAR_TAR_TIME1,'
      '    TAR_NAK_TIME = :TAR_NAK_TIME,'
      '    TAR_NAK_TIME1 = :TAR_NAK_TIME1,'
      '    POWER_TIME = :POWER_TIME,'
      '    POWER_TIME1 = :POWER_TIME1,'
      '    MES_POT_TIME = :MES_POT_TIME,'
      '    MES_POT_TIME1 = :MES_POT_TIME1,'
      '    POT_OTK_TIME = :POT_OTK_TIME,'
      '    POT_OTK_TIME1 = :POT_OTK_TIME1,'
      '    TIME_SCH = :TIME_SCH,'
      '    FDT = :FDT,'
      '    FDP = :FDP,'
      '    M1 = :M1,'
      '    M2 = :M2,'
      '    M3 = :M3,'
      '    M4 = :M4,'
      '    M5 = :M5,'
      '    M6 = :M6,'
      '    M7 = :M7,'
      '    M8 = :M8,'
      '    M9 = :M9,'
      '    M10 = :M10,'
      '    M11 = :M11,'
      '    M12 = :M12,'
      '    MES = :MES,'
      '    PROF_NAGR = :PROF_NAGR,'
      '    PROF_NAGR1 = :PROF_NAGR1,'
      '    PROF_NAGR_TIME = :PROF_NAGR_TIME,'
      '    PROF_NAGR_TIME1 = :PROF_NAGR_TIME1,'
      '    DATE_POVERKA = :DATE_POVERKA'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    KV_KONFIG'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO KV_KONFIG('
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    VAR_TAR1,'
      '    KV,'
      '    MES_POT,'
      '    MES_POT1,'
      '    POWER,'
      '    POWER1,'
      '    POT_OTK,'
      '    POT_OTK1,'
      '    TAR_NAK,'
      '    TAR_NAK1,'
      '    TIME0,'
      '    TIME1,'
      '    TIMES,'
      '    TIMEC,'
      '    VAR_TAR_TIME,'
      '    VAR_TAR_TIME1,'
      '    TAR_NAK_TIME,'
      '    TAR_NAK_TIME1,'
      '    POWER_TIME,'
      '    POWER_TIME1,'
      '    MES_POT_TIME,'
      '    MES_POT_TIME1,'
      '    POT_OTK_TIME,'
      '    POT_OTK_TIME1,'
      '    TIME_SCH,'
      '    FDT,'
      '    FDP,'
      '    M1,'
      '    M2,'
      '    M3,'
      '    M4,'
      '    M5,'
      '    M6,'
      '    M7,'
      '    M8,'
      '    M9,'
      '    M10,'
      '    M11,'
      '    M12,'
      '    MES,'
      '    PROF_NAGR,'
      '    PROF_NAGR1,'
      '    PROF_NAGR_TIME,'
      '    PROF_NAGR_TIME1,'
      '    DATE_POVERKA'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :VAR_TAR,'
      '    :VAR_TAR1,'
      '    :KV,'
      '    :MES_POT,'
      '    :MES_POT1,'
      '    :POWER,'
      '    :POWER1,'
      '    :POT_OTK,'
      '    :POT_OTK1,'
      '    :TAR_NAK,'
      '    :TAR_NAK1,'
      '    :TIME0,'
      '    :TIME1,'
      '    :TIMES,'
      '    :TIMEC,'
      '    :VAR_TAR_TIME,'
      '    :VAR_TAR_TIME1,'
      '    :TAR_NAK_TIME,'
      '    :TAR_NAK_TIME1,'
      '    :POWER_TIME,'
      '    :POWER_TIME1,'
      '    :MES_POT_TIME,'
      '    :MES_POT_TIME1,'
      '    :POT_OTK_TIME,'
      '    :POT_OTK_TIME1,'
      '    :TIME_SCH,'
      '    :FDT,'
      '    :FDP,'
      '    :M1,'
      '    :M2,'
      '    :M3,'
      '    :M4,'
      '    :M5,'
      '    :M6,'
      '    :M7,'
      '    :M8,'
      '    :M9,'
      '    :M10,'
      '    :M11,'
      '    :M12,'
      '    :MES,'
      '    :PROF_NAGR,'
      '    :PROF_NAGR1,'
      '    :PROF_NAGR_TIME,'
      '    :PROF_NAGR_TIME1,'
      '    :DATE_POVERKA'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    VAR_TAR1,'
      '    KV,'
      '    MES_POT,'
      '    MES_POT1,'
      '    POWER,'
      '    POWER1,'
      '    POT_OTK,'
      '    POT_OTK1,'
      '    TAR_NAK,'
      '    TAR_NAK1,'
      '    TIME0,'
      '    TIME1,'
      '    TIMES,'
      '    TIMEC,'
      '    VAR_TAR_TIME,'
      '    VAR_TAR_TIME1,'
      '    TAR_NAK_TIME,'
      '    TAR_NAK_TIME1,'
      '    POWER_TIME,'
      '    POWER_TIME1,'
      '    MES_POT_TIME,'
      '    MES_POT_TIME1,'
      '    POT_OTK_TIME,'
      '    POT_OTK_TIME1,'
      '    TIME_SCH,'
      '    FDT,'
      '    FDP,'
      '    M1,'
      '    M2,'
      '    M3,'
      '    M4,'
      '    M5,'
      '    M6,'
      '    M7,'
      '    M8,'
      '    M9,'
      '    M10,'
      '    M11,'
      '    M12,'
      '    MES,'
      '    PROF_NAGR,'
      '    PROF_NAGR1,'
      '    PROF_NAGR_TIME,'
      '    PROF_NAGR_TIME1,'
      '    DATE_POVERKA'
      'FROM'
      '    KV_KONFIG'
      'where(  cod = (select inc from tmp where ns = :nom)'
      '     ) and (     KV_KONFIG.INC = :OLD_INC'
      '     )'
      '     ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    VAR_TAR1,'
      '    KV,'
      '    MES_POT,'
      '    MES_POT1,'
      '    POWER,'
      '    POWER1,'
      '    POT_OTK,'
      '    POT_OTK1,'
      '    TAR_NAK,'
      '    TAR_NAK1,'
      '    TIME0,'
      '    TIME1,'
      '    TIMES,'
      '    TIMEC,'
      '    VAR_TAR_TIME,'
      '    VAR_TAR_TIME1,'
      '    TAR_NAK_TIME,'
      '    TAR_NAK_TIME1,'
      '    POWER_TIME,'
      '    POWER_TIME1,'
      '    MES_POT_TIME,'
      '    MES_POT_TIME1,'
      '    POT_OTK_TIME,'
      '    POT_OTK_TIME1,'
      '    TIME_SCH,'
      '    FDT,'
      '    FDP,'
      '    M1,'
      '    M2,'
      '    M3,'
      '    M4,'
      '    M5,'
      '    M6,'
      '    M7,'
      '    M8,'
      '    M9,'
      '    M10,'
      '    M11,'
      '    M12,'
      '    MES,'
      '    PROF_NAGR,'
      '    PROF_NAGR1,'
      '    PROF_NAGR_TIME,'
      '    PROF_NAGR_TIME1,'
      '    DATE_POVERKA'
      'FROM'
      '    KV_KONFIG'
      'where cod = (select inc from tmp where ns = :nom) ')
    Transaction = TransactSaveTHread
    Database = databaseSaveThread
    AutoCommit = True
    Left = 728
    Top = 480
    object update_kv_konfigINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object update_kv_konfigCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object update_kv_konfigVAR_TAR: TFIBMemoField
      FieldName = 'VAR_TAR'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigVAR_TAR1: TFIBMemoField
      FieldName = 'VAR_TAR1'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigKV: TFIBMemoField
      FieldName = 'KV'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigMES_POT: TFIBMemoField
      FieldName = 'MES_POT'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigMES_POT1: TFIBMemoField
      FieldName = 'MES_POT1'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigPOWER: TFIBMemoField
      FieldName = 'POWER'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigPOWER1: TFIBMemoField
      FieldName = 'POWER1'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigPOT_OTK: TFIBMemoField
      FieldName = 'POT_OTK'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigPOT_OTK1: TFIBMemoField
      FieldName = 'POT_OTK1'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigTAR_NAK: TFIBMemoField
      FieldName = 'TAR_NAK'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigTAR_NAK1: TFIBMemoField
      FieldName = 'TAR_NAK1'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigTIME0: TFIBStringField
      FieldName = 'TIME0'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigTIME1: TFIBStringField
      FieldName = 'TIME1'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigTIMES: TFIBStringField
      FieldName = 'TIMES'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigTIMEC: TFIBStringField
      FieldName = 'TIMEC'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigVAR_TAR_TIME: TFIBStringField
      FieldName = 'VAR_TAR_TIME'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigVAR_TAR_TIME1: TFIBStringField
      FieldName = 'VAR_TAR_TIME1'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigTAR_NAK_TIME: TFIBStringField
      FieldName = 'TAR_NAK_TIME'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigTAR_NAK_TIME1: TFIBStringField
      FieldName = 'TAR_NAK_TIME1'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigPOWER_TIME: TFIBStringField
      FieldName = 'POWER_TIME'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigPOWER_TIME1: TFIBStringField
      FieldName = 'POWER_TIME1'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigMES_POT_TIME: TFIBStringField
      FieldName = 'MES_POT_TIME'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigMES_POT_TIME1: TFIBStringField
      FieldName = 'MES_POT_TIME1'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigPOT_OTK_TIME: TFIBStringField
      FieldName = 'POT_OTK_TIME'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigPOT_OTK_TIME1: TFIBStringField
      FieldName = 'POT_OTK_TIME1'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigTIME_SCH: TFIBStringField
      FieldName = 'TIME_SCH'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigFDT: TFIBMemoField
      FieldName = 'FDT'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigFDP: TFIBMemoField
      FieldName = 'FDP'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM1: TFIBMemoField
      FieldName = 'M1'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM2: TFIBMemoField
      FieldName = 'M2'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM3: TFIBMemoField
      FieldName = 'M3'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM4: TFIBMemoField
      FieldName = 'M4'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM5: TFIBMemoField
      FieldName = 'M5'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM6: TFIBMemoField
      FieldName = 'M6'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM7: TFIBMemoField
      FieldName = 'M7'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM8: TFIBMemoField
      FieldName = 'M8'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM9: TFIBMemoField
      FieldName = 'M9'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM10: TFIBMemoField
      FieldName = 'M10'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM11: TFIBMemoField
      FieldName = 'M11'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigM12: TFIBMemoField
      FieldName = 'M12'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigMES: TFIBIntegerField
      FieldName = 'MES'
    end
    object update_kv_konfigPROF_NAGR: TFIBMemoField
      FieldName = 'PROF_NAGR'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigPROF_NAGR1: TFIBMemoField
      FieldName = 'PROF_NAGR1'
      BlobType = ftMemo
      Size = 8
    end
    object update_kv_konfigPROF_NAGR_TIME: TFIBStringField
      FieldName = 'PROF_NAGR_TIME'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigPROF_NAGR_TIME1: TFIBStringField
      FieldName = 'PROF_NAGR_TIME1'
      Size = 33
      EmptyStrToNull = True
    end
    object update_kv_konfigDATE_POVERKA: TFIBDateField
      FieldName = 'DATE_POVERKA'
    end
  end
  object updateTransact: TpFIBTransaction
    DefaultDatabase = database
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'read_committed'
      'wait'
      'rec_version')
    TPBMode = tpbDefault
    Left = 176
    Top = 8
  end
  object tmp_korrekt_FIO_licSch: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TMP'
      'SET '
      '    COD = :COD,'
      '    KV = :KV,'
      '    NS = :NS,'
      '    ADDR = :ADDR,'
      '    FIO = :FIO,'
      '    PHONE = :PHONE,'
      '    PPLAT = :PPLAT,'
      '    UBANK = :UBANK,'
      '    LSCHET = :LSCHET,'
      '    SPOL = :SPOL,'
      '    SDF = :SDF,'
      '    CHEC = :CHEC,'
      '    DESCRIPTION = :DESCRIPTION,'
      '    HASHW = :HASHW,'
      '    HASHR = :HASHR,'
      '    NDOG = :NDOG,'
      '    NDOG_2 = :NDOG_2,'
      '    NDOG_3 = :NDOG_3,'
      '    NDOG_4 = :NDOG_4,'
      '    DATE_INST = :DATE_INST,'
      '    DATE_ZAM = :DATE_ZAM,'
      '    NUM_OLD = :NUM_OLD,'
      '    NUM_NEW = :NUM_NEW,'
      '    TAR_NAK_OLD = :TAR_NAK_OLD,'
      '    TAR_NAK_NEW = :TAR_NAK_NEW,'
      '    ARH = :ARH'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TMP'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TMP('
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    SDF,'
      '    CHEC,'
      '    DESCRIPTION,'
      '    HASHW,'
      '    HASHR,'
      '    NDOG,'
      '    NDOG_2,'
      '    NDOG_3,'
      '    NDOG_4,'
      '    DATE_INST,'
      '    DATE_ZAM,'
      '    NUM_OLD,'
      '    NUM_NEW,'
      '    TAR_NAK_OLD,'
      '    TAR_NAK_NEW,'
      '    ARH'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :KV,'
      '    :NS,'
      '    :ADDR,'
      '    :FIO,'
      '    :PHONE,'
      '    :PPLAT,'
      '    :UBANK,'
      '    :LSCHET,'
      '    :SPOL,'
      '    :SDF,'
      '    :CHEC,'
      '    :DESCRIPTION,'
      '    :HASHW,'
      '    :HASHR,'
      '    :NDOG,'
      '    :NDOG_2,'
      '    :NDOG_3,'
      '    :NDOG_4,'
      '    :DATE_INST,'
      '    :DATE_ZAM,'
      '    :NUM_OLD,'
      '    :NUM_NEW,'
      '    :TAR_NAK_OLD,'
      '    :TAR_NAK_NEW,'
      '    :ARH'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    SDF,'
      '    CHEC,'
      '    DESCRIPTION,'
      '    HASHW,'
      '    HASHR,'
      '    NDOG,'
      '    NDOG_2,'
      '    NDOG_3,'
      '    NDOG_4,'
      '    DATE_INST,'
      '    DATE_ZAM,'
      '    NUM_OLD,'
      '    NUM_NEW,'
      '    TAR_NAK_OLD,'
      '    TAR_NAK_NEW,'
      '    ARH'
      'FROM'
      '    TMP '
      'where(  cod in'
      '             (select inc from addres'
      '              where cod = :inc)'
      '     ) and (     TMP.INC = :OLD_INC'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    KV,'
      '    NS,'
      '    ADDR,'
      '    FIO,'
      '    PHONE,'
      '    PPLAT,'
      '    UBANK,'
      '    LSCHET,'
      '    SPOL,'
      '    SDF,'
      '    CHEC,'
      '    DESCRIPTION,'
      '    HASHW,'
      '    HASHR,'
      '    NDOG,'
      '    NDOG_2,'
      '    NDOG_3,'
      '    NDOG_4,'
      '    DATE_INST,'
      '    DATE_ZAM,'
      '    NUM_OLD,'
      '    NUM_NEW,'
      '    TAR_NAK_OLD,'
      '    TAR_NAK_NEW,'
      '    ARH'
      'FROM'
      '    TMP '
      'where cod in'
      '             (select inc from addres'
      '              where cod = :inc)'
      'order by kv')
    AllowedUpdateKinds = [ukModify]
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DSaddresmain
    Left = 696
    Top = 216
    poAskRecordCount = True
    WaitEndMasterScroll = True
    object tmp_korrekt_FIO_licSchINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object tmp_korrekt_FIO_licSchCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object tmp_korrekt_FIO_licSchKV: TFIBIntegerField
      FieldName = 'KV'
    end
    object tmp_korrekt_FIO_licSchNS: TFIBStringField
      FieldName = 'NS'
      Size = 9
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchADDR: TFIBStringField
      FieldName = 'ADDR'
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 75
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchPHONE: TFIBStringField
      FieldName = 'PHONE'
      Size = 9
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchPPLAT: TFIBStringField
      FieldName = 'PPLAT'
      Size = 40
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchUBANK: TFIBStringField
      FieldName = 'UBANK'
      Size = 40
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchLSCHET: TFIBStringField
      FieldName = 'LSCHET'
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchSPOL: TFIBIntegerField
      FieldName = 'SPOL'
    end
    object tmp_korrekt_FIO_licSchSDF: TFIBStringField
      FieldName = 'SDF'
      Size = 1
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
    object tmp_korrekt_FIO_licSchDESCRIPTION: TFIBStringField
      FieldName = 'DESCRIPTION'
      Size = 200
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchHASHW: TFIBStringField
      FieldName = 'HASHW'
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchHASHR: TFIBStringField
      FieldName = 'HASHR'
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchNDOG: TFIBStringField
      DisplayWidth = 20
      FieldName = 'NDOG'
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchDATE_INST: TFIBDateField
      FieldName = 'DATE_INST'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object tmp_korrekt_FIO_licSchDATE_ZAM: TFIBDateField
      FieldName = 'DATE_ZAM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object tmp_korrekt_FIO_licSchNUM_OLD: TFIBStringField
      FieldName = 'NUM_OLD'
      Size = 6
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchNUM_NEW: TFIBStringField
      FieldName = 'NUM_NEW'
      Size = 6
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchTAR_NAK_OLD: TFIBMemoField
      FieldName = 'TAR_NAK_OLD'
      BlobType = ftMemo
      Size = 8
    end
    object tmp_korrekt_FIO_licSchTAR_NAK_NEW: TFIBMemoField
      FieldName = 'TAR_NAK_NEW'
      BlobType = ftMemo
      Size = 8
    end
    object tmp_korrekt_FIO_licSchARH: TFIBIntegerField
      FieldName = 'ARH'
    end
    object tmp_korrekt_FIO_licSchNDOG_2: TFIBStringField
      FieldName = 'NDOG_2'
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchNDOG_3: TFIBStringField
      FieldName = 'NDOG_3'
      EmptyStrToNull = True
    end
    object tmp_korrekt_FIO_licSchNDOG_4: TFIBStringField
      FieldName = 'NDOG_4'
      EmptyStrToNull = True
    end
  end
  object DStmp_korrect_FIO_licsch: TDataSource
    DataSet = tmp_korrekt_FIO_licSch
    Left = 696
    Top = 264
  end
  object update_profmain: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PROFMAIN'
      'SET '
      '    COD = :COD,'
      '    DATA = :DATA,'
      '    PROFIL = :PROFIL,'
      '    REZ = :REZ,'
      '    CHEC = :CHEC'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PROFMAIN'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PROFMAIN('
      '    INC,'
      '    COD,'
      '    DATA,'
      '    PROFIL,'
      '    REZ,'
      '    CHEC'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :DATA,'
      '    :PROFIL,'
      '    :REZ,'
      '    :CHEC'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    DATA,'
      '    PROFIL,'
      '    REZ,'
      '    CHEC'
      'FROM'
      '    PROFMAIN '
      ''
      ' WHERE '
      '        PROFMAIN.INC = :OLD_INC'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    DATA,'
      '    PROFIL,'
      '    REZ,'
      '    CHEC'
      'FROM'
      '    PROFMAIN ')
    AutoUpdateOptions.UpdateTableName = 'PROFMAIN'
    AutoUpdateOptions.KeyFields = 'INC'
    AutoUpdateOptions.GeneratorName = 'PROFMAIN_GEN'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = TransactSaveTHread
    Database = databaseSaveThread
    AutoCommit = True
    Left = 732
    Top = 432
    object update_profmainINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object update_profmainCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object update_profmainDATA: TFIBStringField
      FieldName = 'DATA'
      Size = 10
      EmptyStrToNull = True
    end
    object update_profmainPROFIL: TFIBMemoField
      FieldName = 'PROFIL'
      BlobType = ftMemo
      Size = 8
    end
    object update_profmainREZ: TFIBStringField
      FieldName = 'REZ'
      Size = 6
      EmptyStrToNull = True
    end
    object update_profmainCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
  end
  object databaseSaveThread: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251'
      'sql_role_name=')
    DefaultTransaction = TransactSaveTHread
    DefaultUpdateTransaction = TransactSaveTHread
    SQLDialect = 3
    Timeout = 0
    LibraryName = 'fbclient.dll'
    WaitForRestoreConnect = 0
    Left = 728
    Top = 376
  end
  object ErrorHandler1: TpFibErrorHandler
    OnFIBErrorEvent = ErrorHandler1FIBErrorEvent
    Options = [oeException, oeForeignKey, oeLostConnect, oeCheck, oeUniqueViolation]
    Left = 280
    Top = 8
  end
  object import: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE IMPORT'
      'SET '
      '    CHEC = :CHEC,'
      '    STREET = :STREET,'
      '    KV = :KV,'
      '    NS = :NS,'
      '    SDF = :SDF,'
      '    VARTAR = :VARTAR,'
      '    DESK = :DESK'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    IMPORT'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO IMPORT('
      '    CHEC,'
      '    STREET,'
      '    KV,'
      '    NS,'
      '    SDF,'
      '    VARTAR,'
      '    DESK,'
      '    INC'
      ')'
      'VALUES('
      '    :CHEC,'
      '    :STREET,'
      '    :KV,'
      '    :NS,'
      '    :SDF,'
      '    :VARTAR,'
      '    :DESK,'
      '    :INC'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    CHEC,'
      '    STREET,'
      '    KV,'
      '    NS,'
      '    SDF,'
      '    VARTAR,'
      '    DESK,'
      '    INC'
      'FROM'
      '    IMPORT '
      ''
      ' WHERE '
      '        IMPORT.INC = :OLD_INC'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    CHEC,'
      '    STREET,'
      '    KV,'
      '    NS,'
      '    SDF,'
      '    VARTAR,'
      '    DESK,'
      '    INC'
      'FROM'
      '    IMPORT ')
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    Left = 24
    Top = 444
    object importCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
    object importSTREET: TFIBStringField
      FieldName = 'STREET'
      Size = 100
      EmptyStrToNull = True
    end
    object importKV: TFIBMemoField
      FieldName = 'KV'
      BlobType = ftMemo
      Size = 8
    end
    object importNS: TFIBMemoField
      FieldName = 'NS'
      BlobType = ftMemo
      Size = 8
    end
    object importSDF: TFIBMemoField
      FieldName = 'SDF'
      BlobType = ftMemo
      Size = 8
    end
    object importVARTAR: TFIBMemoField
      FieldName = 'VARTAR'
      BlobType = ftMemo
      Size = 8
    end
    object importDESK: TFIBMemoField
      FieldName = 'DESK'
      BlobType = ftMemo
      Size = 8
    end
    object importINC: TFIBIntegerField
      FieldName = 'INC'
    end
  end
  object DSimport: TDataSource
    DataSet = import
    Left = 88
    Top = 448
  end
  object TransactSaveTHread: TpFIBTransaction
    DefaultDatabase = databaseSaveThread
    TimeoutAction = TARollback
    TPBMode = tpbDefault
    Left = 828
    Top = 376
  end
  object kv_konfig_korrekt: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE KV_KONFIG'
      'SET '
      '    COD = :COD,'
      '    VAR_TAR = :VAR_TAR,'
      '    VAR_TAR1 = :VAR_TAR1,'
      '    KV = :KV,'
      '    MES_POT = :MES_POT,'
      '    MES_POT1 = :MES_POT1,'
      '    POWER = :POWER,'
      '    POWER1 = :POWER1,'
      '    POT_OTK = :POT_OTK,'
      '    POT_OTK1 = :POT_OTK1,'
      '    TAR_NAK = :TAR_NAK,'
      '    TAR_NAK1 = :TAR_NAK1,'
      '    TIME0 = :TIME0,'
      '    TIME1 = :TIME1,'
      '    TIMES = :TIMES,'
      '    TIMEC = :TIMEC,'
      '    VAR_TAR_TIME = :VAR_TAR_TIME,'
      '    VAR_TAR_TIME1 = :VAR_TAR_TIME1,'
      '    TAR_NAK_TIME = :TAR_NAK_TIME,'
      '    TAR_NAK_TIME1 = :TAR_NAK_TIME1,'
      '    POWER_TIME = :POWER_TIME,'
      '    POWER_TIME1 = :POWER_TIME1,'
      '    MES_POT_TIME = :MES_POT_TIME,'
      '    MES_POT_TIME1 = :MES_POT_TIME1,'
      '    POT_OTK_TIME = :POT_OTK_TIME,'
      '    POT_OTK_TIME1 = :POT_OTK_TIME1,'
      '    TIME_SCH = :TIME_SCH,'
      '    FDT = :FDT,'
      '    FDP = :FDP,'
      '    M1 = :M1,'
      '    M2 = :M2,'
      '    M3 = :M3,'
      '    M4 = :M4,'
      '    M5 = :M5,'
      '    M6 = :M6,'
      '    M7 = :M7,'
      '    M8 = :M8,'
      '    M9 = :M9,'
      '    M10 = :M10,'
      '    M11 = :M11,'
      '    M12 = :M12,'
      '    MES = :MES,'
      '    PROF_NAGR = :PROF_NAGR,'
      '    PROF_NAGR1 = :PROF_NAGR1,'
      '    PROF_NAGR_TIME = :PROF_NAGR_TIME,'
      '    PROF_NAGR_TIME1 = :PROF_NAGR_TIME1,'
      '    DATE_POVERKA = :DATE_POVERKA'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    KV_KONFIG'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO KV_KONFIG('
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    VAR_TAR1,'
      '    KV,'
      '    MES_POT,'
      '    MES_POT1,'
      '    POWER,'
      '    POWER1,'
      '    POT_OTK,'
      '    POT_OTK1,'
      '    TAR_NAK,'
      '    TAR_NAK1,'
      '    TIME0,'
      '    TIME1,'
      '    TIMES,'
      '    TIMEC,'
      '    VAR_TAR_TIME,'
      '    VAR_TAR_TIME1,'
      '    TAR_NAK_TIME,'
      '    TAR_NAK_TIME1,'
      '    POWER_TIME,'
      '    POWER_TIME1,'
      '    MES_POT_TIME,'
      '    MES_POT_TIME1,'
      '    POT_OTK_TIME,'
      '    POT_OTK_TIME1,'
      '    TIME_SCH,'
      '    FDT,'
      '    FDP,'
      '    M1,'
      '    M2,'
      '    M3,'
      '    M4,'
      '    M5,'
      '    M6,'
      '    M7,'
      '    M8,'
      '    M9,'
      '    M10,'
      '    M11,'
      '    M12,'
      '    MES,'
      '    PROF_NAGR,'
      '    PROF_NAGR1,'
      '    PROF_NAGR_TIME,'
      '    PROF_NAGR_TIME1,'
      '    DATE_POVERKA'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :VAR_TAR,'
      '    :VAR_TAR1,'
      '    :KV,'
      '    :MES_POT,'
      '    :MES_POT1,'
      '    :POWER,'
      '    :POWER1,'
      '    :POT_OTK,'
      '    :POT_OTK1,'
      '    :TAR_NAK,'
      '    :TAR_NAK1,'
      '    :TIME0,'
      '    :TIME1,'
      '    :TIMES,'
      '    :TIMEC,'
      '    :VAR_TAR_TIME,'
      '    :VAR_TAR_TIME1,'
      '    :TAR_NAK_TIME,'
      '    :TAR_NAK_TIME1,'
      '    :POWER_TIME,'
      '    :POWER_TIME1,'
      '    :MES_POT_TIME,'
      '    :MES_POT_TIME1,'
      '    :POT_OTK_TIME,'
      '    :POT_OTK_TIME1,'
      '    :TIME_SCH,'
      '    :FDT,'
      '    :FDP,'
      '    :M1,'
      '    :M2,'
      '    :M3,'
      '    :M4,'
      '    :M5,'
      '    :M6,'
      '    :M7,'
      '    :M8,'
      '    :M9,'
      '    :M10,'
      '    :M11,'
      '    :M12,'
      '    :MES,'
      '    :PROF_NAGR,'
      '    :PROF_NAGR1,'
      '    :PROF_NAGR_TIME,'
      '    :PROF_NAGR_TIME1,'
      '    :DATE_POVERKA'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    VAR_TAR1,'
      '    KV,'
      '    MES_POT,'
      '    MES_POT1,'
      '    POWER,'
      '    POWER1,'
      '    POT_OTK,'
      '    POT_OTK1,'
      '    TAR_NAK,'
      '    TAR_NAK1,'
      '    TIME0,'
      '    TIME1,'
      '    TIMES,'
      '    TIMEC,'
      '    VAR_TAR_TIME,'
      '    VAR_TAR_TIME1,'
      '    TAR_NAK_TIME,'
      '    TAR_NAK_TIME1,'
      '    POWER_TIME,'
      '    POWER_TIME1,'
      '    MES_POT_TIME,'
      '    MES_POT_TIME1,'
      '    POT_OTK_TIME,'
      '    POT_OTK_TIME1,'
      '    TIME_SCH,'
      '    FDT,'
      '    FDP,'
      '    M1,'
      '    M2,'
      '    M3,'
      '    M4,'
      '    M5,'
      '    M6,'
      '    M7,'
      '    M8,'
      '    M9,'
      '    M10,'
      '    M11,'
      '    M12,'
      '    MES,'
      '    PROF_NAGR,'
      '    PROF_NAGR1,'
      '    PROF_NAGR_TIME,'
      '    PROF_NAGR_TIME1,'
      '    DATE_POVERKA'
      'FROM'
      '    KV_KONFIG '
      ''
      ' WHERE '
      '        KV_KONFIG.INC = :OLD_INC'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    VAR_TAR1,'
      '    KV,'
      '    MES_POT,'
      '    MES_POT1,'
      '    POWER,'
      '    POWER1,'
      '    POT_OTK,'
      '    POT_OTK1,'
      '    TAR_NAK,'
      '    TAR_NAK1,'
      '    TIME0,'
      '    TIME1,'
      '    TIMES,'
      '    TIMEC,'
      '    VAR_TAR_TIME,'
      '    VAR_TAR_TIME1,'
      '    TAR_NAK_TIME,'
      '    TAR_NAK_TIME1,'
      '    POWER_TIME,'
      '    POWER_TIME1,'
      '    MES_POT_TIME,'
      '    MES_POT_TIME1,'
      '    POT_OTK_TIME,'
      '    POT_OTK_TIME1,'
      '    TIME_SCH,'
      '    FDT,'
      '    FDP,'
      '    M1,'
      '    M2,'
      '    M3,'
      '    M4,'
      '    M5,'
      '    M6,'
      '    M7,'
      '    M8,'
      '    M9,'
      '    M10,'
      '    M11,'
      '    M12,'
      '    MES,'
      '    PROF_NAGR,'
      '    PROF_NAGR1,'
      '    PROF_NAGR_TIME,'
      '    PROF_NAGR_TIME1,'
      '    DATE_POVERKA'
      'FROM'
      '    KV_KONFIG ')
    AutoUpdateOptions.UpdateTableName = 'KV_KONFIG'
    AutoUpdateOptions.KeyFields = 'INC'
    AutoUpdateOptions.GeneratorName = 'KV_KONFIG_GEN'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DStmp_korrekt
    Left = 192
    Top = 272
  end
  object arhiv_korrekt: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ARHIV'
      'SET '
      '    COD = :COD,'
      '    M1 = :M1,'
      '    M2 = :M2,'
      '    M3 = :M3,'
      '    M4 = :M4,'
      '    M5 = :M5,'
      '    M6 = :M6,'
      '    M7 = :M7,'
      '    M8 = :M8,'
      '    M9 = :M9,'
      '    M10 = :M10,'
      '    M11 = :M11,'
      '    M12 = :M12,'
      '    M13 = :M13,'
      '    M14 = :M14,'
      '    M15 = :M15,'
      '    M16 = :M16,'
      '    M17 = :M17,'
      '    M18 = :M18,'
      '    M19 = :M19,'
      '    M20 = :M20,'
      '    M21 = :M21,'
      '    M22 = :M22,'
      '    M23 = :M23,'
      '    M24 = :M24,'
      '    M25 = :M25,'
      '    M26 = :M26,'
      '    M27 = :M27,'
      '    M28 = :M28,'
      '    M29 = :M29,'
      '    M30 = :M30,'
      '    M31 = :M31,'
      '    M32 = :M32,'
      '    M33 = :M33,'
      '    M34 = :M34,'
      '    M35 = :M35,'
      '    M36 = :M36,'
      '    REZ = :REZ,'
      '    GOD = :GOD'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ARHIV'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ARHIV('
      '    INC,'
      '    COD,'
      '    M1,'
      '    M2,'
      '    M3,'
      '    M4,'
      '    M5,'
      '    M6,'
      '    M7,'
      '    M8,'
      '    M9,'
      '    M10,'
      '    M11,'
      '    M12,'
      '    M13,'
      '    M14,'
      '    M15,'
      '    M16,'
      '    M17,'
      '    M18,'
      '    M19,'
      '    M20,'
      '    M21,'
      '    M22,'
      '    M23,'
      '    M24,'
      '    M25,'
      '    M26,'
      '    M27,'
      '    M28,'
      '    M29,'
      '    M30,'
      '    M31,'
      '    M32,'
      '    M33,'
      '    M34,'
      '    M35,'
      '    M36,'
      '    REZ,'
      '    GOD'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :M1,'
      '    :M2,'
      '    :M3,'
      '    :M4,'
      '    :M5,'
      '    :M6,'
      '    :M7,'
      '    :M8,'
      '    :M9,'
      '    :M10,'
      '    :M11,'
      '    :M12,'
      '    :M13,'
      '    :M14,'
      '    :M15,'
      '    :M16,'
      '    :M17,'
      '    :M18,'
      '    :M19,'
      '    :M20,'
      '    :M21,'
      '    :M22,'
      '    :M23,'
      '    :M24,'
      '    :M25,'
      '    :M26,'
      '    :M27,'
      '    :M28,'
      '    :M29,'
      '    :M30,'
      '    :M31,'
      '    :M32,'
      '    :M33,'
      '    :M34,'
      '    :M35,'
      '    :M36,'
      '    :REZ,'
      '    :GOD'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    M1,'
      '    M2,'
      '    M3,'
      '    M4,'
      '    M5,'
      '    M6,'
      '    M7,'
      '    M8,'
      '    M9,'
      '    M10,'
      '    M11,'
      '    M12,'
      '    M13,'
      '    M14,'
      '    M15,'
      '    M16,'
      '    M17,'
      '    M18,'
      '    M19,'
      '    M20,'
      '    M21,'
      '    M22,'
      '    M23,'
      '    M24,'
      '    M25,'
      '    M26,'
      '    M27,'
      '    M28,'
      '    M29,'
      '    M30,'
      '    M31,'
      '    M32,'
      '    M33,'
      '    M34,'
      '    M35,'
      '    M36,'
      '    REZ,'
      '    GOD'
      'FROM'
      '    ARHIV '
      'where(  cod = :inc'
      '     ) and (     ARHIV.INC = :OLD_INC'
      '     )'
      '     ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    M1,'
      '    M2,'
      '    M3,'
      '    M4,'
      '    M5,'
      '    M6,'
      '    M7,'
      '    M8,'
      '    M9,'
      '    M10,'
      '    M11,'
      '    M12,'
      '    M13,'
      '    M14,'
      '    M15,'
      '    M16,'
      '    M17,'
      '    M18,'
      '    M19,'
      '    M20,'
      '    M21,'
      '    M22,'
      '    M23,'
      '    M24,'
      '    M25,'
      '    M26,'
      '    M27,'
      '    M28,'
      '    M29,'
      '    M30,'
      '    M31,'
      '    M32,'
      '    M33,'
      '    M34,'
      '    M35,'
      '    M36,'
      '    REZ,'
      '    GOD'
      'FROM'
      '    ARHIV '
      'where cod = :inc ')
    AutoUpdateOptions.UpdateTableName = 'ARHIV'
    AutoUpdateOptions.KeyFields = 'INC'
    AutoUpdateOptions.GeneratorName = 'ARHIV_GEN'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DStmp_korrekt
    Left = 192
    Top = 328
  end
  object kv_konfig_arh_korrekt: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE KV_KONFIG_ARH'
      'SET '
      '    COD = :COD,'
      '    VAR_TAR = :VAR_TAR,'
      '    TAR_NAK = :TAR_NAK,'
      '    POWER = :POWER,'
      '    MES_POT = :MES_POT,'
      '    POT_OTK = :POT_OTK,'
      '    PROF_NAGR = :PROF_NAGR,'
      '    NS_TIME = :NS_TIME,'
      '    KON_TIME = :KON_TIME,'
      '    NCOUNT = :NCOUNT,'
      '    DATA = :DATA,'
      '    DATE_TIME = :DATE_TIME,'
      '    DATE_EDIT = :DATE_EDIT'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    KV_KONFIG_ARH'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO KV_KONFIG_ARH('
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    TAR_NAK,'
      '    POWER,'
      '    MES_POT,'
      '    POT_OTK,'
      '    PROF_NAGR,'
      '    NS_TIME,'
      '    KON_TIME,'
      '    NCOUNT,'
      '    DATA,'
      '    DATE_TIME,'
      '    DATE_EDIT'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :VAR_TAR,'
      '    :TAR_NAK,'
      '    :POWER,'
      '    :MES_POT,'
      '    :POT_OTK,'
      '    :PROF_NAGR,'
      '    :NS_TIME,'
      '    :KON_TIME,'
      '    :NCOUNT,'
      '    :DATA,'
      '    :DATE_TIME,'
      '    :DATE_EDIT'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    TAR_NAK,'
      '    POWER,'
      '    MES_POT,'
      '    POT_OTK,'
      '    PROF_NAGR,'
      '    NS_TIME,'
      '    KON_TIME,'
      '    NCOUNT,'
      '    DATA,'
      '    DATE_TIME,'
      '    DATE_EDIT'
      'FROM'
      '    KV_KONFIG_ARH '
      'where(  cod = :inc'
      '     ) and (     KV_KONFIG_ARH.INC = :OLD_INC'
      '     )'
      '     ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    TAR_NAK,'
      '    POWER,'
      '    MES_POT,'
      '    POT_OTK,'
      '    PROF_NAGR,'
      '    NS_TIME,'
      '    KON_TIME,'
      '    NCOUNT,'
      '    DATA,'
      '    DATE_TIME,'
      '    DATE_EDIT'
      'FROM'
      '    KV_KONFIG_ARH '
      'where cod = :inc ')
    AutoUpdateOptions.UpdateTableName = 'KV_KONFIG_ARH'
    AutoUpdateOptions.KeyFields = 'INC'
    AutoUpdateOptions.GeneratorName = 'GEN_KV_KONFIG_ARH_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DStmp_korrekt
    Left = 192
    Top = 384
  end
  object profmain_korrekt: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PROFMAIN'
      'SET '
      '    COD = :COD,'
      '    DATA = :DATA,'
      '    PROFIL = :PROFIL,'
      '    REZ = :REZ,'
      '    CHEC = :CHEC'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PROFMAIN'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PROFMAIN('
      '    INC,'
      '    COD,'
      '    DATA,'
      '    PROFIL,'
      '    REZ,'
      '    CHEC'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :DATA,'
      '    :PROFIL,'
      '    :REZ,'
      '    :CHEC'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    DATA,'
      '    PROFIL,'
      '    REZ,'
      '    CHEC'
      'FROM'
      '    PROFMAIN '
      'where(  cod = :inc'
      '     ) and (     PROFMAIN.INC = :OLD_INC'
      '     )'
      '     ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    DATA,'
      '    PROFIL,'
      '    REZ,'
      '    CHEC'
      'FROM'
      '    PROFMAIN '
      'where cod = :inc ')
    AutoUpdateOptions.UpdateTableName = 'PROFMAIN'
    AutoUpdateOptions.KeyFields = 'INC'
    AutoUpdateOptions.GeneratorName = 'PROFMAIN_GEN'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    AutoCommit = True
    DataSource = DStmp_korrekt
    Left = 192
    Top = 448
  end
  object DStownAdd: TDataSource
    DataSet = townAdd
    Left = 200
    Top = 216
  end
  object counter_type: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    COUNTER_TYPE_ID,'
      '    NAME'
      'FROM'
      '    COUNTER_TYPE ')
    Transaction = transact1
    Database = database
    UpdateTransaction = updateTransact
    Left = 570
    Top = 356
  end
  object dsCounter_type: TDataSource
    DataSet = counter_type
    Left = 571
    Top = 430
  end
end
