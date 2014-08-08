object dm2: Tdm2
  OldCreateOrder = False
  Height = 254
  Width = 355
  object DSaddresmain: TDataSource
    DataSet = addresmain_konc
    Left = 120
    Top = 8
  end
  object DSaddres: TDataSource
    DataSet = addres_konc
    Left = 120
    Top = 64
  end
  object DStmp: TDataSource
    DataSet = tmp_konc
    Left = 120
    Top = 120
  end
  object addresmain_konc: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    UpdateSQL.Strings = (
      'UPDATE ADDRESMAIN'
      'SET '
      '    REZ = :REZ,'
      '    REZ1 = :REZ1,'
      '    REZ2 = :REZ2,'
      '    CHEC = :CHEC,'
      '    ADDR = :ADDR'
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
      '    REZ,'
      '    REZ1,'
      '    REZ2,'
      '    CHEC,'
      '    ADDR'
      ')'
      'VALUES('
      '    :INC,'
      '    :REZ,'
      '    :REZ1,'
      '    :REZ2,'
      '    :CHEC,'
      '    :ADDR'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ADDRESMAIN.INC,'
      '    REZ,'
      '    REZ1,'
      '    REZ2,'
      '    CHEC,'
      '    ADDRESMAIN.ADDR,'
      '    TOWN,'
      '    PHONE'
      'FROM'
      '    ADDRESMAIN, TOWN, KONCEN'
      'where(  ADDRESMAIN.CHEC = 1'
      'and ADDRESMAIN.REZ = TOWN.INC'
      'and KONCEN.COD = ADDRESMAIN.INC'
      '     ) and (     ADDRESMAIN.INC = :OLD_INC'
      '     )'
      '     '
      '')
    SelectSQL.Strings = (
      'SELECT'
      '    distinct PHONE,'
      '    ADDRESMAIN.ADDR,'
      '    ADDRESMAIN.INC,'
      '    REZ,'
      '    REZ1,'
      '    REZ2,'
      '    CHEC,'
      '    TOWN,'
      '    TIME_,'
      '    KONCEN.IP_ADDRES,'
      '    ADDRESMAIN.REZHIM'
      'FROM'
      '    ADDRESMAIN, TOWN, KONCEN'
      'where ADDRESMAIN.CHEC = 1'
      'and ADDRESMAIN.REZ = TOWN.INC'
      'and KONCEN.COD = ADDRESMAIN.INC '
      'order by TOWN, ADDRESMAIN.ADDR')
    Transaction = transact
    Database = dm1.database
    Left = 32
    Top = 8
    poAskRecordCount = True
    object addresmain_koncINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object addresmain_koncREZ: TFIBIntegerField
      FieldName = 'REZ'
    end
    object addresmain_koncADDR: TFIBStringField
      FieldName = 'ADDR'
      Size = 100
      EmptyStrToNull = True
    end
    object addresmain_koncTOWN: TFIBStringField
      FieldName = 'TOWN'
      Size = 30
      EmptyStrToNull = True
    end
    object addresmain_koncPHONE: TFIBStringField
      FieldName = 'PHONE'
      EmptyStrToNull = True
    end
    object addresmain_koncCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
    object addresmain_koncTIME_: TFIBStringField
      FieldName = 'TIME_'
      EmptyStrToNull = True
    end
    object addresmain_koncIP_ADDRES: TFIBStringField
      FieldName = 'IP_ADDRES'
      Size = 15
      EmptyStrToNull = True
    end
    object addresmain_koncREZHIM: TFIBIntegerField
      FieldName = 'REZHIM'
    end
  end
  object addres_konc: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
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
      '    ADDRES'
      'where(  cod = :inc'
      'and chec = 1'
      '     ) and (     ADDRES.INC = :OLD_INC'
      '     )'
      '    '
      '')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    CHEC,'
      '    STREET,'
      '    PHONE,'
      '    TOWN'
      'FROM'
      '    ADDRES'
      'where cod = :inc'
      'and chec = 1'
      ''
      'order by STREET')
    Transaction = transact
    Database = dm1.database
    DataSource = DSaddresmain
    Left = 32
    Top = 64
    poAskRecordCount = True
    object addres_koncINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object addres_koncCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object addres_koncCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
    object addres_koncSTREET: TFIBStringField
      FieldName = 'STREET'
      Size = 60
      EmptyStrToNull = True
    end
    object addres_koncPHONE: TFIBStringField
      FieldName = 'PHONE'
      EmptyStrToNull = True
    end
    object addres_koncTOWN: TFIBIntegerField
      FieldName = 'TOWN'
    end
  end
  object tmp_konc: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TMP'
      'WHERE'
      '        INC = :OLD_INC'
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
      '    DATE_INST,'
      '    DATE_ZAM,'
      '    NUM_OLD,'
      '    NUM_NEW,'
      '    TAR_NAK_OLD,'
      '    TAR_NAK_NEW,'
      '    ARH'
      'FROM'
      '    TMP'
      'where cod = :inc'
      'and chec = 1'
      ''
      'order by KV')
    Transaction = transact
    Database = dm1.database
    DataSource = DSaddres
    Left = 32
    Top = 120
    poAskRecordCount = True
    object tmp_koncINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object tmp_koncCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object tmp_koncKV: TFIBIntegerField
      FieldName = 'KV'
    end
    object tmp_koncNS: TFIBStringField
      FieldName = 'NS'
      Size = 9
      EmptyStrToNull = True
    end
    object tmp_koncADDR: TFIBStringField
      FieldName = 'ADDR'
      EmptyStrToNull = True
    end
    object tmp_koncFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 75
      EmptyStrToNull = True
    end
    object tmp_koncPHONE: TFIBStringField
      FieldName = 'PHONE'
      Size = 9
      EmptyStrToNull = True
    end
    object tmp_koncPPLAT: TFIBStringField
      FieldName = 'PPLAT'
      Size = 40
      EmptyStrToNull = True
    end
    object tmp_koncUBANK: TFIBStringField
      FieldName = 'UBANK'
      Size = 40
      EmptyStrToNull = True
    end
    object tmp_koncLSCHET: TFIBStringField
      FieldName = 'LSCHET'
      EmptyStrToNull = True
    end
    object tmp_koncSPOL: TFIBIntegerField
      FieldName = 'SPOL'
    end
    object tmp_koncSDF: TFIBStringField
      FieldName = 'SDF'
      Size = 1
      EmptyStrToNull = True
    end
    object tmp_koncCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
    object tmp_koncDESCRIPTION: TFIBStringField
      FieldName = 'DESCRIPTION'
      Size = 200
      EmptyStrToNull = True
    end
    object tmp_koncHASHW: TFIBStringField
      FieldName = 'HASHW'
      EmptyStrToNull = True
    end
    object tmp_koncHASHR: TFIBStringField
      FieldName = 'HASHR'
      EmptyStrToNull = True
    end
    object tmp_koncNDOG: TFIBStringField
      FieldName = 'NDOG'
      Size = 10
      EmptyStrToNull = True
    end
    object tmp_koncDATE_INST: TFIBDateField
      FieldName = 'DATE_INST'
    end
    object tmp_koncDATE_ZAM: TFIBDateField
      FieldName = 'DATE_ZAM'
    end
    object tmp_koncNUM_OLD: TFIBStringField
      FieldName = 'NUM_OLD'
      Size = 6
      EmptyStrToNull = True
    end
    object tmp_koncNUM_NEW: TFIBStringField
      FieldName = 'NUM_NEW'
      Size = 6
      EmptyStrToNull = True
    end
    object tmp_koncTAR_NAK_OLD: TFIBMemoField
      FieldName = 'TAR_NAK_OLD'
      BlobType = ftMemo
      Size = 8
    end
    object tmp_koncTAR_NAK_NEW: TFIBMemoField
      FieldName = 'TAR_NAK_NEW'
      BlobType = ftMemo
      Size = 8
    end
    object tmp_koncARH: TFIBIntegerField
      FieldName = 'ARH'
    end
  end
  object sys_bd: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SYS_BD'
      'SET '
      '    COD = :COD,'
      '    VAR_TAR = :VAR_TAR,'
      '    MES_POT = :MES_POT,'
      '    POWER = :POWER,'
      '    TIM_E = :TIM_E,'
      '    POT_OTK = :POT_OTK,'
      '    TAR_NAK = :TAR_NAK,'
      '    VAR_TAR1 = :VAR_TAR1,'
      '    MES_POT1 = :MES_POT1,'
      '    POWER1 = :POWER1,'
      '    TIM_E1 = :TIM_E1,'
      '    POT_OTK1 = :POT_OTK1,'
      '    TAR_NAK1 = :TAR_NAK1,'
      '    TARIF1 = :TARIF1,'
      '    TARIF2 = :TARIF2,'
      '    TARIF3 = :TARIF3,'
      '    TARIF4 = :TARIF4,'
      '    VAR_TAR_3X = :VAR_TAR_3X,'
      '    "VarTar_1" = :"VarTar_1",'
      '    "VarTar_2" = :"VarTar_2",'
      '    "VarTar_3" = :"VarTar_3",'
      '    "VarTar_4" = :"VarTar_4",'
      '    "VarTar_5" = :"VarTar_5",'
      '    "VarTar_6" = :"VarTar_6",'
      '    "VarTar_7" = :"VarTar_7",'
      '    "VarTar_8" = :"VarTar_8",'
      '    "VarTar_9" = :"VarTar_9",'
      '    "VarTar_10" = :"VarTar_10",'
      '    CVT1 = :CVT1,'
      '    CVT2 = :CVT2,'
      '    CVT3 = :CVT3,'
      '    CVT4 = :CVT4,'
      '    CVT5 = :CVT5,'
      '    CVT6 = :CVT6,'
      '    CVT7 = :CVT7,'
      '    CVT8 = :CVT8,'
      '    CVT9 = :CVT9,'
      '    CVT10 = :CVT10,'
      '    VARTAR_11 = :VARTAR_11,'
      '    CVT11 = :CVT11,'
      '    VARTAR_12 = :VARTAR_12,'
      '    CVT12 = :CVT12'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SYS_BD'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_BD('
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    MES_POT,'
      '    POWER,'
      '    TIM_E,'
      '    POT_OTK,'
      '    TAR_NAK,'
      '    VAR_TAR1,'
      '    MES_POT1,'
      '    POWER1,'
      '    TIM_E1,'
      '    POT_OTK1,'
      '    TAR_NAK1,'
      '    TARIF1,'
      '    TARIF2,'
      '    TARIF3,'
      '    TARIF4,'
      '    VAR_TAR_3X,'
      '    "VarTar_1",'
      '    "VarTar_2",'
      '    "VarTar_3",'
      '    "VarTar_4",'
      '    "VarTar_5",'
      '    "VarTar_6",'
      '    "VarTar_7",'
      '    "VarTar_8",'
      '    "VarTar_9",'
      '    "VarTar_10",'
      '    CVT1,'
      '    CVT2,'
      '    CVT3,'
      '    CVT4,'
      '    CVT5,'
      '    CVT6,'
      '    CVT7,'
      '    CVT8,'
      '    CVT9,'
      '    CVT10,'
      '    VARTAR_11,'
      '    CVT11,'
      '    VARTAR_12,'
      '    CVT12'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :VAR_TAR,'
      '    :MES_POT,'
      '    :POWER,'
      '    :TIM_E,'
      '    :POT_OTK,'
      '    :TAR_NAK,'
      '    :VAR_TAR1,'
      '    :MES_POT1,'
      '    :POWER1,'
      '    :TIM_E1,'
      '    :POT_OTK1,'
      '    :TAR_NAK1,'
      '    :TARIF1,'
      '    :TARIF2,'
      '    :TARIF3,'
      '    :TARIF4,'
      '    :VAR_TAR_3X,'
      '    :"VarTar_1",'
      '    :"VarTar_2",'
      '    :"VarTar_3",'
      '    :"VarTar_4",'
      '    :"VarTar_5",'
      '    :"VarTar_6",'
      '    :"VarTar_7",'
      '    :"VarTar_8",'
      '    :"VarTar_9",'
      '    :"VarTar_10",'
      '    :CVT1,'
      '    :CVT2,'
      '    :CVT3,'
      '    :CVT4,'
      '    :CVT5,'
      '    :CVT6,'
      '    :CVT7,'
      '    :CVT8,'
      '    :CVT9,'
      '    :CVT10,'
      '    :VARTAR_11,'
      '    :CVT11,'
      '    :VARTAR_12,'
      '    :CVT12'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    MES_POT,'
      '    POWER,'
      '    TIM_E,'
      '    POT_OTK,'
      '    TAR_NAK,'
      '    VAR_TAR1,'
      '    MES_POT1,'
      '    POWER1,'
      '    TIM_E1,'
      '    POT_OTK1,'
      '    TAR_NAK1,'
      '    TARIF1,'
      '    TARIF2,'
      '    TARIF3,'
      '    TARIF4,'
      '    VAR_TAR_3X,'
      '    "VarTar_1",'
      '    "VarTar_2",'
      '    "VarTar_3",'
      '    "VarTar_4",'
      '    "VarTar_5",'
      '    "VarTar_6",'
      '    "VarTar_7",'
      '    "VarTar_8",'
      '    "VarTar_9",'
      '    "VarTar_10",'
      '    CVT1,'
      '    CVT2,'
      '    CVT3,'
      '    CVT4,'
      '    CVT5,'
      '    CVT6,'
      '    CVT7,'
      '    CVT8,'
      '    CVT9,'
      '    CVT10,'
      '    VARTAR_11,'
      '    CVT11,'
      '    VARTAR_12,'
      '    CVT12'
      'FROM'
      '    SYS_BD '
      ''
      ' WHERE '
      '        SYS_BD.INC = :OLD_INC'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    VAR_TAR,'
      '    MES_POT,'
      '    POWER,'
      '    TIM_E,'
      '    POT_OTK,'
      '    TAR_NAK,'
      '    VAR_TAR1,'
      '    MES_POT1,'
      '    POWER1,'
      '    TIM_E1,'
      '    POT_OTK1,'
      '    TAR_NAK1,'
      '    TARIF1,'
      '    TARIF2,'
      '    TARIF3,'
      '    TARIF4,'
      '    VAR_TAR_3X,'
      '    "VarTar_1",'
      '    "VarTar_2",'
      '    "VarTar_3",'
      '    "VarTar_4",'
      '    "VarTar_5",'
      '    "VarTar_6",'
      '    "VarTar_7",'
      '    "VarTar_8",'
      '    "VarTar_9",'
      '    "VarTar_10",'
      '    CVT1,'
      '    CVT2,'
      '    CVT3,'
      '    CVT4,'
      '    CVT5,'
      '    CVT6,'
      '    CVT7,'
      '    CVT8,'
      '    CVT9,'
      '    CVT10,'
      '    VARTAR_11,'
      '    CVT11,'
      '    VARTAR_12,'
      '    CVT12'
      'FROM'
      '    SYS_BD ')
    Transaction = dm1.transact1
    Database = dm1.database
    UpdateTransaction = dm1.updateTransact
    Left = 32
    Top = 184
    object sys_bdINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object sys_bdCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object sys_bdVAR_TAR: TFIBMemoField
      FieldName = 'VAR_TAR'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdMES_POT: TFIBMemoField
      FieldName = 'MES_POT'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdPOWER: TFIBMemoField
      FieldName = 'POWER'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdTIM_E: TFIBMemoField
      FieldName = 'TIM_E'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdPOT_OTK: TFIBMemoField
      FieldName = 'POT_OTK'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdTAR_NAK: TFIBMemoField
      FieldName = 'TAR_NAK'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVAR_TAR1: TFIBMemoField
      FieldName = 'VAR_TAR1'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdMES_POT1: TFIBMemoField
      FieldName = 'MES_POT1'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdPOWER1: TFIBMemoField
      FieldName = 'POWER1'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdTIM_E1: TFIBMemoField
      FieldName = 'TIM_E1'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdPOT_OTK1: TFIBMemoField
      FieldName = 'POT_OTK1'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdTAR_NAK1: TFIBMemoField
      FieldName = 'TAR_NAK1'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdTARIF1: TFIBFloatField
      FieldName = 'TARIF1'
    end
    object sys_bdTARIF2: TFIBFloatField
      FieldName = 'TARIF2'
    end
    object sys_bdTARIF3: TFIBFloatField
      FieldName = 'TARIF3'
    end
    object sys_bdTARIF4: TFIBFloatField
      FieldName = 'TARIF4'
    end
    object sys_bdVAR_TAR_3X: TFIBMemoField
      FieldName = 'VAR_TAR_3X'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVarTar_1: TFIBMemoField
      FieldName = 'VarTar_1'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVarTar_2: TFIBMemoField
      FieldName = 'VarTar_2'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVarTar_3: TFIBMemoField
      FieldName = 'VarTar_3'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVarTar_4: TFIBMemoField
      FieldName = 'VarTar_4'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVarTar_5: TFIBMemoField
      FieldName = 'VarTar_5'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVarTar_6: TFIBMemoField
      FieldName = 'VarTar_6'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVarTar_7: TFIBMemoField
      FieldName = 'VarTar_7'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVarTar_8: TFIBMemoField
      FieldName = 'VarTar_8'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVarTar_9: TFIBMemoField
      FieldName = 'VarTar_9'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVarTar_10: TFIBMemoField
      FieldName = 'VarTar_10'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdCVT1: TFIBMemoField
      FieldName = 'CVT1'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdCVT2: TFIBMemoField
      FieldName = 'CVT2'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdCVT3: TFIBMemoField
      FieldName = 'CVT3'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdCVT4: TFIBMemoField
      FieldName = 'CVT4'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdCVT5: TFIBMemoField
      FieldName = 'CVT5'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdCVT6: TFIBMemoField
      FieldName = 'CVT6'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdCVT7: TFIBMemoField
      FieldName = 'CVT7'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdCVT8: TFIBMemoField
      FieldName = 'CVT8'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdCVT9: TFIBMemoField
      FieldName = 'CVT9'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdCVT10: TFIBMemoField
      FieldName = 'CVT10'
      BlobType = ftMemo
      Size = 8
    end
    object sys_bdVARTAR_11: TFIBBlobField
      FieldName = 'VARTAR_11'
      Size = 8
    end
    object sys_bdCVT11: TFIBBlobField
      FieldName = 'CVT11'
      Size = 8
    end
    object sys_bdVARTAR_12: TFIBBlobField
      FieldName = 'VARTAR_12'
      Size = 8
    end
    object sys_bdCVT12: TFIBBlobField
      FieldName = 'CVT12'
      Size = 8
    end
  end
  object transact: TpFIBTransaction
    DefaultDatabase = dm1.database
    TimeoutAction = TARollbackRetaining
    Left = 224
    Top = 64
  end
end
