unit Udm2;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  Tdm2 = class(TDataModule)
    DSaddresmain: TDataSource;
    DSaddres: TDataSource;
    DStmp: TDataSource;
    addresmain_konc: TpFIBDataSet;
    addres_konc: TpFIBDataSet;
    tmp_konc: TpFIBDataSet;
    addresmain_koncINC: TFIBIntegerField;
    addresmain_koncREZ: TFIBIntegerField;
    addresmain_koncADDR: TFIBStringField;
    addresmain_koncTOWN: TFIBStringField;
    addresmain_koncPHONE: TFIBStringField;
    addresmain_koncCHEC: TFIBIntegerField;
    addres_koncINC: TFIBIntegerField;
    addres_koncCOD: TFIBIntegerField;
    addres_koncCHEC: TFIBIntegerField;
    addres_koncSTREET: TFIBStringField;
    addres_koncPHONE: TFIBStringField;
    addres_koncTOWN: TFIBIntegerField;
    tmp_koncINC: TFIBIntegerField;
    tmp_koncCOD: TFIBIntegerField;
    tmp_koncKV: TFIBIntegerField;
    tmp_koncNS: TFIBStringField;
    tmp_koncADDR: TFIBStringField;
    tmp_koncFIO: TFIBStringField;
    tmp_koncPHONE: TFIBStringField;
    tmp_koncPPLAT: TFIBStringField;
    tmp_koncUBANK: TFIBStringField;
    tmp_koncLSCHET: TFIBStringField;
    tmp_koncSPOL: TFIBIntegerField;
    tmp_koncSDF: TFIBStringField;
    tmp_koncCHEC: TFIBIntegerField;
    tmp_koncDESCRIPTION: TFIBStringField;
    tmp_koncHASHW: TFIBStringField;
    tmp_koncHASHR: TFIBStringField;
    tmp_koncNDOG: TFIBStringField;
    tmp_koncDATE_INST: TFIBDateField;
    tmp_koncDATE_ZAM: TFIBDateField;
    tmp_koncNUM_OLD: TFIBStringField;
    tmp_koncNUM_NEW: TFIBStringField;
    tmp_koncTAR_NAK_OLD: TFIBMemoField;
    tmp_koncTAR_NAK_NEW: TFIBMemoField;
    tmp_koncARH: TFIBIntegerField;
    sys_bd: TpFIBDataSet;
    sys_bdINC: TFIBIntegerField;
    sys_bdCOD: TFIBIntegerField;
    sys_bdVAR_TAR: TFIBMemoField;
    sys_bdMES_POT: TFIBMemoField;
    sys_bdPOWER: TFIBMemoField;
    sys_bdTIM_E: TFIBMemoField;
    sys_bdPOT_OTK: TFIBMemoField;
    sys_bdTAR_NAK: TFIBMemoField;
    sys_bdVAR_TAR1: TFIBMemoField;
    sys_bdMES_POT1: TFIBMemoField;
    sys_bdPOWER1: TFIBMemoField;
    sys_bdTIM_E1: TFIBMemoField;
    sys_bdPOT_OTK1: TFIBMemoField;
    sys_bdTAR_NAK1: TFIBMemoField;
    sys_bdTARIF1: TFIBFloatField;
    sys_bdTARIF2: TFIBFloatField;
    sys_bdTARIF3: TFIBFloatField;
    sys_bdTARIF4: TFIBFloatField;
    sys_bdVAR_TAR_3X: TFIBMemoField;
    sys_bdVarTar_1: TFIBMemoField;
    sys_bdVarTar_2: TFIBMemoField;
    sys_bdVarTar_3: TFIBMemoField;
    sys_bdVarTar_4: TFIBMemoField;
    sys_bdVarTar_5: TFIBMemoField;
    sys_bdVarTar_6: TFIBMemoField;
    sys_bdVarTar_7: TFIBMemoField;
    sys_bdVarTar_8: TFIBMemoField;
    sys_bdVarTar_9: TFIBMemoField;
    sys_bdVarTar_10: TFIBMemoField;
    sys_bdCVT1: TFIBMemoField;
    sys_bdCVT2: TFIBMemoField;
    sys_bdCVT3: TFIBMemoField;
    sys_bdCVT4: TFIBMemoField;
    sys_bdCVT5: TFIBMemoField;
    sys_bdCVT6: TFIBMemoField;
    sys_bdCVT7: TFIBMemoField;
    sys_bdCVT8: TFIBMemoField;
    sys_bdCVT9: TFIBMemoField;
    sys_bdCVT10: TFIBMemoField;
    sys_bdVARTAR_11: TFIBBlobField;
    sys_bdCVT11: TFIBBlobField;
    sys_bdVARTAR_12: TFIBBlobField;
    sys_bdCVT12: TFIBBlobField;
    addresmain_koncTIME_: TFIBStringField;
    transact: TpFIBTransaction;
    addresmain_koncIP_ADDRES: TFIBStringField;
    addresmain_koncREZHIM: TFIBIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm2: Tdm2;

implementation

uses Udm1;

{$R *.dfm}

end.
