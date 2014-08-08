unit Udm1;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ActnList, sMaskEdit, sComboBox, sCheckBox, sEdit, sMemo, sLabel, Dialogs,
  DBGridEhImpExp, Forms, DBGridEh, ShellAPI, Controls, Windows, FIBQuery,
  pFIBQuery, pFIBStoredProc, ExtCtrls, fib, pFIBErrorHandler;

type
  Tdm1 = class(TDataModule)
    database: TpFIBDatabase;
    addresmain: TpFIBDataSet;
    addres: TpFIBDataSet;
    DSaddresmain: TDataSource;
    transact1: TpFIBTransaction;
    DSaddres: TDataSource;
    DStmp: TDataSource;
    tmp: TpFIBDataSet;
    town: TpFIBDataSet;
    DStown: TDataSource;
    addres_1: TpFIBDataSet;
    DSaddres_1: TDataSource;
    DStmp_1: TDataSource;
    tmp_1: TpFIBDataSet;
    DStmp_2: TDataSource;
    tmp_2: TpFIBDataSet;
    kv_konfig: TpFIBDataSet;
    DSkv_konfig: TDataSource;
    AListTmp: TActionList;
    tmp_summir: TpFIBDataSet;
    DStmp_summir: TDataSource;
    addres_bal: TpFIBDataSet;
    DSaddr_bal: TDataSource;
    tmp_bal: TpFIBDataSet;
    DStmp_bal: TDataSource;
    tmp_3xf: TpFIBDataSet;
    DStmp_3xf: TDataSource;
    sp_tmp_3fx: TpFIBStoredProc;
    tmp_3xfINC: TFIBIntegerField;
    tmp_3xfCOD: TFIBIntegerField;
    tmp_3xfNS: TFIBStringField;
    tmp_3xfADDR: TFIBStringField;
    tmp_3xfFIO: TFIBStringField;
    tmp_3xfTIPE: TFIBStringField;
    tmp_3xfSDF: TFIBStringField;
    tmp_3xfKV: TFIBIntegerField;
    townINC: TFIBIntegerField;
    townTOWN: TFIBStringField;
    townAdd: TpFIBDataSet;
    townAddINC: TFIBIntegerField;
    townAddTOWN: TFIBStringField;
    sp_addresmain: TpFIBStoredProc;
    sp_townAdd: TpFIBStoredProc;
    addresINC: TFIBIntegerField;
    addresCOD: TFIBIntegerField;
    addresCHEC: TFIBIntegerField;
    addresSTREET: TFIBStringField;
    addresPHONE: TFIBStringField;
    addresTOWN: TFIBIntegerField;
    sp_addres: TpFIBStoredProc;
    koncen: TpFIBDataSet;
    DSkoncen: TDataSource;
    sp_koncen: TpFIBStoredProc;
    koncenINC: TFIBIntegerField;
    koncenCOD: TFIBIntegerField;
    koncenNUMSCHIT: TFIBStringField;
    koncenSTREET: TFIBMemoField;
    koncenTMP: TFIBMemoField;
    koncenADDR: TFIBStringField;
    koncenPHONE: TFIBStringField;
    koncenMES_POT: TFIBMemoField;
    koncenPOWER: TFIBMemoField;
    koncenPOT_OTK: TFIBMemoField;
    koncenTAR_NAK: TFIBMemoField;
    koncenMES_POT1: TFIBMemoField;
    koncenPOWER1: TFIBMemoField;
    koncenPOT_OTK1: TFIBMemoField;
    koncenTAR_NAK1: TFIBMemoField;
    koncenVARTAR_1: TFIBMemoField;
    koncenVARTAR_2: TFIBMemoField;
    koncenVARTAR_3: TFIBMemoField;
    koncenVARTAR_4: TFIBMemoField;
    koncenVARTAR_5: TFIBMemoField;
    koncenVARTAR_6: TFIBMemoField;
    koncenVARTAR_7: TFIBMemoField;
    koncenVARTAR_8: TFIBMemoField;
    koncenVARTAR_9: TFIBMemoField;
    koncenVARTAR_10: TFIBMemoField;
    koncenVARTAR_11: TFIBMemoField;
    koncenVARTAR_21: TFIBMemoField;
    koncenVARTAR_31: TFIBMemoField;
    koncenVARTAR_41: TFIBMemoField;
    koncenVARTAR_51: TFIBMemoField;
    koncenVARTAR_61: TFIBMemoField;
    koncenVARTAR_71: TFIBMemoField;
    koncenVARTAR_81: TFIBMemoField;
    koncenVARTAR_91: TFIBMemoField;
    koncenVARTAR_101: TFIBMemoField;
    koncenTIME_: TFIBStringField;
    koncenTIME_1: TFIBStringField;
    koncenCONF: TFIBMemoField;
    tmpINC: TFIBIntegerField;
    tmpCOD: TFIBIntegerField;
    tmpKV: TFIBIntegerField;
    tmpNS: TFIBStringField;
    tmpADDR: TFIBStringField;
    tmpFIO: TFIBStringField;
    tmpPHONE: TFIBStringField;
    tmpPPLAT: TFIBStringField;
    tmpUBANK: TFIBStringField;
    tmpLSCHET: TFIBStringField;
    tmpSPOL: TFIBIntegerField;
    tmpSDF: TFIBStringField;
    tmpCHEC: TFIBIntegerField;
    tmpDESCRIPTION: TFIBStringField;
    tmpHASHW: TFIBStringField;
    tmpHASHR: TFIBStringField;
    tmpNDOG: TFIBStringField;
    addres_korrekt: TpFIBDataSet;
    DSaddres_korrekt: TDataSource;
    tmp_korrekt: TpFIBDataSet;
    DStmp_korrekt: TDataSource;
    addres_korrektINC: TFIBIntegerField;
    addres_korrektCOD: TFIBIntegerField;
    addres_korrektCHEC: TFIBIntegerField;
    addres_korrektSTREET: TFIBStringField;
    addres_korrektPHONE: TFIBStringField;
    addres_korrektTOWN: TFIBIntegerField;
    tmp_korrektINC: TFIBIntegerField;
    tmp_korrektCOD: TFIBIntegerField;
    tmp_korrektKV: TFIBIntegerField;
    tmp_korrektNS: TFIBStringField;
    tmp_korrektADDR: TFIBStringField;
    tmp_korrektFIO: TFIBStringField;
    tmp_korrektPHONE: TFIBStringField;
    tmp_korrektPPLAT: TFIBStringField;
    tmp_korrektUBANK: TFIBStringField;
    tmp_korrektLSCHET: TFIBStringField;
    tmp_korrektSPOL: TFIBIntegerField;
    tmp_korrektSDF: TFIBStringField;
    tmp_korrektCHEC: TFIBIntegerField;
    tmp_korrektDESCRIPTION: TFIBStringField;
    tmp_korrektHASHW: TFIBStringField;
    tmp_korrektHASHR: TFIBStringField;
    tmp_korrektNDOG: TFIBStringField;
    tmp_korrektDATE_INST: TFIBDateField;
    tmp_korrektDATE_ZAM: TFIBDateField;
    tmp_korrektNUM_OLD: TFIBStringField;
    tmp_korrektNUM_NEW: TFIBStringField;
    tmp_korrektTAR_NAK_OLD: TFIBMemoField;
    tmp_korrektTAR_NAK_NEW: TFIBMemoField;
    tmp_korrektARH: TFIBIntegerField;
    sp_tmp: TpFIBStoredProc;
    sp_INSERT_COUNTER: TpFIBStoredProc;
    query: TpFIBQuery;
    tmp_balINC: TFIBIntegerField;
    tmp_balCOD: TFIBIntegerField;
    tmp_balKV: TFIBIntegerField;
    tmp_balNS: TFIBStringField;
    tmp_balADDR: TFIBStringField;
    tmp_balFIO: TFIBStringField;
    tmp_balPHONE: TFIBStringField;
    tmp_balPPLAT: TFIBStringField;
    tmp_balUBANK: TFIBStringField;
    tmp_balLSCHET: TFIBStringField;
    tmp_balSPOL: TFIBIntegerField;
    tmp_balSDF: TFIBStringField;
    tmp_balCHEC: TFIBIntegerField;
    tmp_balDESCRIPTION: TFIBStringField;
    tmp_balHASHW: TFIBStringField;
    tmp_balHASHR: TFIBStringField;
    tmp_balNDOG: TFIBStringField;
    tmp_balDATE_INST: TFIBDateField;
    tmp_balDATE_ZAM: TFIBDateField;
    tmp_balNUM_OLD: TFIBStringField;
    tmp_balNUM_NEW: TFIBStringField;
    tmp_balTAR_NAK_OLD: TFIBMemoField;
    tmp_balTAR_NAK_NEW: TFIBMemoField;
    tmp_balARH: TFIBIntegerField;
    update_kv_konfig: TpFIBDataSet;
    update_kv_konfigINC: TFIBIntegerField;
    update_kv_konfigCOD: TFIBIntegerField;
    update_kv_konfigVAR_TAR: TFIBMemoField;
    update_kv_konfigVAR_TAR1: TFIBMemoField;
    update_kv_konfigKV: TFIBMemoField;
    update_kv_konfigMES_POT: TFIBMemoField;
    update_kv_konfigMES_POT1: TFIBMemoField;
    update_kv_konfigPOWER: TFIBMemoField;
    update_kv_konfigPOWER1: TFIBMemoField;
    update_kv_konfigPOT_OTK: TFIBMemoField;
    update_kv_konfigPOT_OTK1: TFIBMemoField;
    update_kv_konfigTAR_NAK: TFIBMemoField;
    update_kv_konfigTAR_NAK1: TFIBMemoField;
    update_kv_konfigTIME0: TFIBStringField;
    update_kv_konfigTIME1: TFIBStringField;
    update_kv_konfigTIMES: TFIBStringField;
    update_kv_konfigTIMEC: TFIBStringField;
    update_kv_konfigVAR_TAR_TIME: TFIBStringField;
    update_kv_konfigVAR_TAR_TIME1: TFIBStringField;
    update_kv_konfigTAR_NAK_TIME: TFIBStringField;
    update_kv_konfigTAR_NAK_TIME1: TFIBStringField;
    update_kv_konfigPOWER_TIME: TFIBStringField;
    update_kv_konfigPOWER_TIME1: TFIBStringField;
    update_kv_konfigMES_POT_TIME: TFIBStringField;
    update_kv_konfigMES_POT_TIME1: TFIBStringField;
    update_kv_konfigPOT_OTK_TIME: TFIBStringField;
    update_kv_konfigPOT_OTK_TIME1: TFIBStringField;
    update_kv_konfigTIME_SCH: TFIBStringField;
    update_kv_konfigFDT: TFIBMemoField;
    update_kv_konfigFDP: TFIBMemoField;
    update_kv_konfigM1: TFIBMemoField;
    update_kv_konfigM2: TFIBMemoField;
    update_kv_konfigM3: TFIBMemoField;
    update_kv_konfigM4: TFIBMemoField;
    update_kv_konfigM5: TFIBMemoField;
    update_kv_konfigM6: TFIBMemoField;
    update_kv_konfigM7: TFIBMemoField;
    update_kv_konfigM8: TFIBMemoField;
    update_kv_konfigM9: TFIBMemoField;
    update_kv_konfigM10: TFIBMemoField;
    update_kv_konfigM11: TFIBMemoField;
    update_kv_konfigM12: TFIBMemoField;
    update_kv_konfigMES: TFIBIntegerField;
    update_kv_konfigPROF_NAGR: TFIBMemoField;
    update_kv_konfigPROF_NAGR1: TFIBMemoField;
    update_kv_konfigPROF_NAGR_TIME: TFIBStringField;
    update_kv_konfigPROF_NAGR_TIME1: TFIBStringField;
    updateTransact: TpFIBTransaction;
    tmp_korrekt_FIO_licSch: TpFIBDataSet;
    DStmp_korrect_FIO_licsch: TDataSource;
    tmp_korrekt_FIO_licSchINC: TFIBIntegerField;
    tmp_korrekt_FIO_licSchCOD: TFIBIntegerField;
    tmp_korrekt_FIO_licSchKV: TFIBIntegerField;
    tmp_korrekt_FIO_licSchNS: TFIBStringField;
    tmp_korrekt_FIO_licSchADDR: TFIBStringField;
    tmp_korrekt_FIO_licSchFIO: TFIBStringField;
    tmp_korrekt_FIO_licSchPHONE: TFIBStringField;
    tmp_korrekt_FIO_licSchPPLAT: TFIBStringField;
    tmp_korrekt_FIO_licSchUBANK: TFIBStringField;
    tmp_korrekt_FIO_licSchLSCHET: TFIBStringField;
    tmp_korrekt_FIO_licSchSPOL: TFIBIntegerField;
    tmp_korrekt_FIO_licSchSDF: TFIBStringField;
    tmp_korrekt_FIO_licSchCHEC: TFIBIntegerField;
    tmp_korrekt_FIO_licSchDESCRIPTION: TFIBStringField;
    tmp_korrekt_FIO_licSchHASHW: TFIBStringField;
    tmp_korrekt_FIO_licSchHASHR: TFIBStringField;
    tmp_korrekt_FIO_licSchNDOG: TFIBStringField;
    tmp_korrekt_FIO_licSchDATE_INST: TFIBDateField;
    tmp_korrekt_FIO_licSchDATE_ZAM: TFIBDateField;
    tmp_korrekt_FIO_licSchNUM_OLD: TFIBStringField;
    tmp_korrekt_FIO_licSchNUM_NEW: TFIBStringField;
    tmp_korrekt_FIO_licSchTAR_NAK_OLD: TFIBMemoField;
    tmp_korrekt_FIO_licSchTAR_NAK_NEW: TFIBMemoField;
    tmp_korrekt_FIO_licSchARH: TFIBIntegerField;
    update_profmain: TpFIBDataSet;
    update_profmainINC: TFIBIntegerField;
    update_profmainCOD: TFIBIntegerField;
    update_profmainDATA: TFIBStringField;
    update_profmainPROFIL: TFIBMemoField;
    update_profmainREZ: TFIBStringField;
    update_profmainCHEC: TFIBIntegerField;
    update_kv_konfigDATE_POVERKA: TFIBDateField;
    databaseSaveThread: TpFIBDatabase;
    ErrorHandler1: TpFibErrorHandler;
    import: TpFIBDataSet;
    DSimport: TDataSource;
    importCHEC: TFIBIntegerField;
    importSTREET: TFIBStringField;
    importKV: TFIBMemoField;
    importNS: TFIBMemoField;
    importSDF: TFIBMemoField;
    importVARTAR: TFIBMemoField;
    importDESK: TFIBMemoField;
    importINC: TFIBIntegerField;
    TransactSaveTHread: TpFIBTransaction;
    kv_konfig_korrekt: TpFIBDataSet;
    arhiv_korrekt: TpFIBDataSet;
    kv_konfig_arh_korrekt: TpFIBDataSet;
    profmain_korrekt: TpFIBDataSet;
    DStownAdd: TDataSource;
    tmp_korrekt_FIO_licSchNDOG_2: TFIBStringField;
    tmp_korrekt_FIO_licSchNDOG_3: TFIBStringField;
    tmp_korrekt_FIO_licSchNDOG_4: TFIBStringField;
    tmp_3xfID_TMP: TFIBIntegerField;
    counter_type: TpFIBDataSet;
    dsCounter_type: TDataSource;
    tmp_korrektID_COUNTER_TYPE: TFIBSmallIntField;
    tmp_korrektLookupCounte_type: TStringField;
    tmp_korrektCOD_SCH: TFIBStringField;
    addresmainINC: TFIBIntegerField;
    addresmainADDR: TFIBStringField;
    addresmainREZ: TFIBIntegerField;
    addresmainREZ1: TFIBStringField;
    addresmainREZ2: TFIBStringField;
    addresmainCHEC: TFIBIntegerField;
    addresmainCHECKED: TFIBIntegerField;
    addresmainPIC: TFIBBlobField;
    addresmainDESCRIPTION: TFIBMemoField;
    addresmainHOME_COD: TFIBStringField;
    addresmainDATE_INSTAL: TFIBDateField;
    addresmainJEU: TFIBStringField;
    addresmainSCHEMA: TFIBBlobField;
    addresmainDOC: TFIBBlobField;
    addresmainINFO: TFIBMemoField;
    addresmainLATITUDE: TFIBFloatField;
    addresmainLONGITUDE: TFIBFloatField;
    addresmainREPAIR: TFIBIntegerField;
    addresmainBALANS: TFIBStringField;
    addresmainREZHIM: TFIBIntegerField;
    koncenIP_ADDRES: TFIBStringField;
    tmp_korrektPASSWORD: TFIBStringField;
    procedure townAfterOpen(DataSet: TDataSet);
    procedure tmpAfterScroll(DataSet: TDataSet);
    procedure tmp_1AfterScroll(DataSet: TDataSet);
    procedure tmp_2AfterScroll(DataSet: TDataSet);

    //Собственные процедуры
    procedure Tmp_1_2_AfterScroll(DataSet: TDataSet);
    procedure DateTime(DataSet: TDataSet);
    procedure VarTar(DataSet: TDataSet);
    procedure MesPotr(DataSet: TDataSet);

    procedure Na1ChisloMes(DataSet: TDataSet);
    procedure ConvertNa1ChisloMes(var Memo: TStrings; month: word; tar_nak: string);
    procedure Power(DataSet: TDataSet);
    procedure OtklPodkl(DataSet: TDataSet);
    procedure SortOtklPodkl(var blod: TStrings);
    procedure TarNak(DataSet: TDataSet); //Процедура заполнения окошка тарифных накопителей
    procedure TarPerehodi;
    procedure ViewText(text: string; savetobase: Boolean);
    procedure SaveDbGridToFile(handle: THandle; grid: TDBGridEh;
      expclas: TDBGridEhExportClass; FileName: string);
    //========*************++++++++++
    procedure DataModuleCreate(Sender: TObject);
    procedure addresBeforeScroll(DataSet: TDataSet);
    procedure tmpCHECChange(Sender: TField);
    procedure addresCHECChange(Sender: TField);
    procedure tmp_korrektPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tmp_3xfPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tmp_korrektPPLATChange(Sender: TField);
    procedure SaveKonfigCheckedToFile(FileName: string);
    procedure LoadFonfigCheckedFromFile(FileName: string);
    procedure ErrorHandler1FIBErrorEvent(Sender: TObject;
      ErrorValue: EFIBError; KindIBError: TKindIBError; var DoRaise: Boolean);
    procedure tmp_korrektNSChange(Sender: TField);
    procedure addres_korrektBeforeOpen(DataSet: TDataSet);
    procedure tmp_korrektID_COUNTER_TYPEChange(Sender: TField);
  private
    { Private declarations }
  public
  const
    color_tek = $00FF0000;
    color_pred = 0;
procedure ConvertMesPotr(var Memo: TStrings);
var
    month, day, year, month1, day1, year1: Word;
    flagDobavlNewSchetch: Boolean; //Если true добавляем новый если false то изм номер
    { Public declarations }
  end;

var
  dm1: Tdm1;

implementation

uses Unit1, UDataVrem, UVarTar, UPomesPotr, UNa1Chislo, UPower, UOtklPodkl,
  UTarNak, UView, UTarPerehodi, USamSchetchika;

{$R *.dfm}
//Процедура заполнения окошка дата время

procedure Tdm1.addresBeforeScroll(DataSet: TDataSet);
begin

end;

//Процедура выделения адреса при выделеи разёма

procedure Tdm1.addresCHECChange(Sender: TField);
var
  sql: TpFIBQuery;
begin
  if addresmainCHEC.AsInteger = 0 then
  begin
    if sender.AsInteger = 1 then
    begin
      sql := TpFIBQuery.Create(nil);
      with sql do
        try
          Database := dm1.database;
          Transaction := dm1.database.DefaultUpdateTransaction;
          dm1.updateTransact.StartTransaction;
          SQL.Text := 'UPDATE addresmain set chec = 1 where inc =' + addresmainINC.AsString;
          ExecQuery;
          SQL.Text := 'UPDATE addres set chec = 1 where inc =' + addresINC.AsString;
          ExecQuery;
          dm1.updateTransact.Commit
        finally
          Free;
        end;
      addresmain.ReopenLocate('inc');
      addres.ReopenLocate('inc');
      tmp.ReopenLocate('inc');
    end;
  end;

end;

procedure Tdm1.addres_korrektBeforeOpen(DataSet: TDataSet);
begin
  counter_type.Open;
end;

procedure Tdm1.ConvertMesPotr(var Memo: TStrings);
var
  j, q, i: integer;
  tempBlod: TStrings;
begin
  tempBlod := TStringList.Create;
  with FormPomesPotr do
  begin
    tempBlod.Clear;
    for i := 0 to 54 do
      tempBlod.Add('');
    for q := 1 to 11 do
    begin
      for j := 0 to 3 do
        try
          tempBlod.Strings[q + j * 13] := FormatFloat('000000.00', StrToFloatDef(Memo.Strings[q + j * 13] + '0', 0) -
            StrToFloatDef(Memo.Strings[q + j * 13 - 1] + '0', 0));
          if StrToFloatDef(tempBlod.Strings[q + j * 13], 0) < 0 then
            tempBlod.Strings[q + j * 13] := '000000,00'
        except
          tempBlod.Strings[q + j * 13] := '000000,00';
        end;
    end;
    j := 0;
    for q := 0 to 3 do
    begin
      try
        tempBlod.Strings[j] := FormatFloat('000000.00', StrToFloatDef(Memo.Strings[j] + '0', 0) -
          StrToFloatDef(Memo.Strings[j + 12] + '0', 0));
        if StrToFloatDef(tempBlod.Strings[j], 0) < 0 then
          tempBlod.Strings[j] := '000000,00';
      except
        tempBlod.Strings[j] := '000000,00';
      end;
      Inc(j, 13);
      tempBlod.Strings[j - 1] := Memo.Strings[j - 1];
    end;
    Memo.Text := tempBlod.text;
  end;
end;

//Процедура конвертирования для заполнения окно потребления на
//первое число месяца

procedure Tdm1.ConvertNa1ChisloMes(var Memo: TStrings; month: word; tar_nak: string);
var
  q, i: integer;
  tar_nak_summ: array[0..3] of string;
  tar_nak_tekmes: array[0..3] of string;
  tar_nak_tekgod: array[0..3] of string;
  temp: Real;
  tempBlod: TStrings;
begin
  tempBlod := TStringList.Create;
  tempBlod.Text := kv_konfig.FieldByName(tar_nak).AsString;
  for i := 0 to 3 do
  begin
    tar_nak_summ[i] := tempBlod.Strings[i];
    tar_nak_tekmes[i] := tempBlod.Strings[i + 4];
    tar_nak_tekgod[i] := tempBlod.Strings[i + 8];
  end;

  for i := 0 to 54 do
    tempBlod.Add('');

  for i := 1 to 4 do
  begin
    tempBlod.Strings[13 * i - 1] := FormatFloat('000000.00', StrToFloatDef(tar_nak_summ[i - 1], 0) -
      StrToFloatDef(tar_nak_tekgod[i - 1], 0))
  end;
  for q := 0 to 3 do
  begin
    temp := StrToFloatDef(tar_nak_summ[q], 0) - StrToFloatDef(tar_nak_tekmes[q], 0);
    tempBlod.Strings[((month + 12 - 2) mod 12) + q * 13] := FormatFloat('000000.00', temp);
    for i := month - 3 downto 0 do
      try
        temp := temp - StrToFloat(Memo.Strings[((i + 1) mod 12) + q * 13]);
        tempBlod.Strings[i + q * 13] := FormatFloat('000000.00', temp)
      except
        tempBlod.Strings[i + q * 13] := '000000.00'
      end;
    for i := 11 downto month - 1 do
      if not ((month = 1) and (i = 11)) then
        try
          temp := temp - StrToFloat(Memo.Strings[((i + 1) mod 12) + q * 13]);
          tempBlod.Strings[i + q * 13] := FormatFloat('000000.00', temp);
        except
          tempBlod.Strings[i + q * 13] := '000000.00'
        end;
  end;
  Memo.Clear;
  Memo.Text := tempBlod.Text
end;

procedure Tdm1.DataModuleCreate(Sender: TObject);
begin
  DecodeDate(Date, year, month, day);
end;

//Процедура заполнения окошка дата-время
//при просмотре данных о счётчиках

procedure Tdm1.DateTime(DataSet: TDataSet);
var
  time1, time2, time3: tDateTime;
begin
  with FormDataVrem do
  begin
    sEdit1.Text := '';
    sEdit2.Text := '';
    Caption := 'Счётчик № ' + DataSet.FieldByName('NS').AsString;
    try
      sEdit1.Text := kv_konfig.FieldByName('timec').AsString;
      if (kv_konfig.FieldByName('times').AsString <> '') and (kv_konfig.FieldByName('timec').AsString <> '') then
      begin
        sEdit2.Text := kv_konfig.FieldByName('times').AsString;
        time1 := StrToTime(Copy(kv_konfig.FieldByName('timec').AsString, Pos('Время - ',
          kv_konfig.FieldByName('timec').AsString) + 8, 8));
        time2 := StrToTime(Copy(kv_konfig.FieldByName('times').AsString, Pos('Время - ',
          kv_konfig.FieldByName('times').AsString) + 8, 8));
        time3 := StrToTime('00:01:00');
        if (StrToTime(TimeToStr(time1 - time2))) > time3 then
          sEdit2.Font.Color := 240
        else
          sEdit2.Font.Color := 0;
      end;
    except
      sEdit1.Text := 'Нет информации';
      sEdit2.Text := 'Нет информации';
    end;
  end;
end;

procedure Tdm1.LoadFonfigCheckedFromFile(FileName: string);
var
  list: TStrings;
  sql: TpFIBQuery;
  i: Integer;
  j: integer;
begin
  Screen.Cursor := crSQLWait;
  list := TStringList.Create;
  list.LoadFromFile(FileName);
  sql := TpFIBQuery.Create(nil);
  sql.Database := database;
  sql.Transaction := updateTransact;
  with sql do
    try
      SQL.Text := 'update addresmain set chec = 1 where inc in (';
      SQL.Add(list.Strings[1]);
      i := 2;
      while list.Strings[i] <> 'Allocated addres' do
      begin
        SQL.Add(', ' + list.Strings[i]);
        Inc(i);
      end;
      SQL.Add(')');
      Transaction.StartTransaction;
      ExecQuery;

      Inc(i);
      repeat
        Close;
        SQL.Text := 'update addres set chec = 1 where inc in (';
        SQL.Add(list.Strings[i]);
        Inc(i);
        j := 0;
        while ((list.Strings[i] <> 'Allocated tmp') and (j < 1000)) do
        begin
          SQL.Add(', ' + list.Strings[i]);
          Inc(i);
          Inc(j);
        end;
        SQL.Add(')');
        ExecQuery;
      until (list.Strings[i] = 'Allocated tmp');

      Inc(i);
      repeat
        Close;
        SQL.Text := 'update tmp set chec = 1 where inc in (';
        SQL.Add(list.Strings[i]);
        Inc(i);
        j := 0;
        while ((i < list.Count) and (j < 1000)) do
        begin
          SQL.Add(', ' + list.Strings[i]);
          Inc(i);
          Inc(j);
        end;
        SQL.Add(')');
        ExecQuery;
      until (i > list.Count - 1);

      Transaction.Commit;
    finally
      Free;
    end;
  Form1.ReopenAdrTmp;
  Form1.DBLookupComboboxEh1.SetFocus;
  Screen.Cursor := crDefault;
end;

//Процедура заполнения окошка вариант тарификации

procedure Tdm1.VarTar(DataSet: TDataSet);
var
  i: integer;
  poslChtenie: TStrings;
  predPoslChtenie: TStrings;
begin
  with FormVarTar do
  begin
    Caption := 'Вариант тарификации - счётчик № ' + DataSet.FieldByName('NS').AsString;
    sTabSheet1.Caption := 'Последнее чтение: ' + kv_konfig.FieldByName('var_tar_time').AsString;
    sTabSheet2.Caption := 'Предпоследнее чтение: ' + kv_konfig.FieldByName('var_tar_time1').AsString;
    poslChtenie := TStringList.Create;
    predPoslChtenie := TStringList.Create;
    poslChtenie.Text := kv_konfig.FieldByName('var_tar').AsString;
    predPoslChtenie.Text := kv_konfig.FieldByName('var_tar1').AsString;

    try
      //Заполнение вкладки последнего чтения
      if poslChtenie.Text = '' then
        exit;
      for i := poslChtenie.Count to 384 do
        poslChtenie.Add('');
      for i := 0 to frameVartar1.ComponentCount - 1 do
      begin
        if frameVartar1.Components[i].ClassName = 'TsMaskEdit' then
          (frameVartar1.Components[i] as TsMaskEdit).Text := poslChtenie.Strings[(frameVartar1.Components[i] as
            TsMaskEdit).Tag];
        if frameVartar1.Components[i].ClassName = 'TsComboBox' then
          (frameVartar1.Components[i] as TsComboBox).Text := poslChtenie.Strings[(frameVartar1.Components[i] as
            TsComboBox).Tag];
        if (frameVartar1.Components[i].ClassName = 'TsCheckBox') and (poslChtenie.Strings[(frameVartar1.Components[i]
            as
            TsCheckBox).Tag] <> '') then
          (frameVartar1.Components[i] as TsCheckBox).Checked :=
            StrToBoolDef(poslChtenie.Strings[(frameVartar1.Components[i] as TsCheckBox).Tag], false);
      end;
      frameVartar1.sSpinEdit1.Text := poslChtenie.Strings[1];
      frameVartar1.sComboBox1Change(self);
      frameVartar1.sComboBox3Change(self);

      if predPoslChtenie.Text = '' then
        exit;
      for i := predPoslChtenie.Count to 384 do
        predPoslChtenie.Add('');
      //Заполнение вкладки предпоследнего чтения
      for i := 0 to frameVartar2.ComponentCount - 1 do
      begin
        if frameVartar2.Components[i].ClassName = 'TsMaskEdit' then
        begin
          (frameVartar2.Components[i] as TsMaskEdit).Text := predPoslChtenie.Strings[(frameVartar2.Components[i] as
            TsMaskEdit).Tag];
          if (frameVartar1.Components[i] as TsMaskEdit).Text<>(frameVartar2.Components[i] as TsMaskEdit).Text then
          begin
            (frameVartar1.Components[i] as TsMaskEdit).Font.Color := 240;
            (frameVartar2.Components[i] as TsMaskEdit).Font.Color := 240;
          end
          else
          begin
            (frameVartar1.Components[i] as TsMaskEdit).Font.Color := 0;
            (frameVartar2.Components[i] as TsMaskEdit).Font.Color := 0;
          end;
        end;
        if frameVartar2.Components[i].ClassName = 'TsComboBox' then
          (frameVartar2.Components[i] as TsComboBox).Text := predPoslChtenie.Strings[(frameVartar2.Components[i] as
            TsComboBox).Tag];
        if (frameVartar2.Components[i].ClassName = 'TsCheckBox') and
          (predPoslChtenie.Strings[(frameVartar2.Components[i] as TsCheckBox).Tag] <> '') then
          (frameVartar2.Components[i] as TsCheckBox).Checked :=
            StrToBoolDef(predPoslChtenie.Strings[(frameVartar2.Components[i] as TsCheckBox).Tag], false);
      end;
      frameVartar2.sSpinEdit1.Text := predPoslChtenie.Strings[1];
      frameVartar2.sComboBox1Change(self);
      frameVartar2.sComboBox3Change(self);
    except
      ShowMessage('Ошибка варианта тарификации');
    end;
  end;
end;

procedure Tdm1.ViewText(text: string; savetobase: Boolean);
begin
  with FormView do
  begin
    sMemo1.Text := text;
    save := savetobase;
    sMemo1.ReadOnly := not savetobase;
    ActionSave.Enabled := savetobase;
    ShowModal;
  end;
end;

//Процедура заполения окошка помесячного потребления

procedure Tdm1.MesPotr(DataSet: TDataSet);
const
  mes: array[1..12] of string = ('Январь', 'Февраль', 'Март', 'Апрель', 'Май',
    'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь');
var
  i, i1, q, koeff: Integer;
  poslCht: TStrings;
  predPoslCht: TStrings;
begin

  with FormPomesPotr do
  begin
    //Очистка Editov последнего и предпоследнего считывания
    for i := 0 to framePomesPotr1.ComponentCount - 1 do
    begin
      if framePomesPotr1.Components[i].ClassName = 'TsEdit' then
      begin
        (framePomesPotr1.Components[i] as TsEdit).Text := '';
        (framePomesPotr2.Components[i] as TsEdit).Text := '';
      end;
    end;

    Caption := 'Помесячное потребление счётчик № ' + DataSet.FieldByName('NS').AsString;
    sTabSheet1.Caption := 'Последнее чтение: ' + kv_konfig.FieldByName('mes_pot_time').AsString;
    if kv_konfig.FieldByName('mes_pot_time1').AsString <> 'Нет' then
      sTabSheet2.Caption := 'Предпоследнее чтение - ' + kv_konfig.FieldByName('mes_pot_time1').AsString
    else
      sTabSheet2.Caption :=
        '                                   Предпоследнее чтение: нет                                   ';

    if (kv_konfig.FieldByName('mes_pot_time').AsString <> 'Нет') then
    begin
      try
        begin
          DecodeDate(StrToDate(Copy(kv_konfig.FieldByName('mes_pot_time').AsString, 8, 8)), year, month, day);
          framePomesPotr1.sLabel1.Caption := mes[month];
          framePomesPotr1.sLabel14.Caption := IntToStr(year);
          framePomesPotr1.sLabel29.Caption := IntToStr(year - 1);
        end;
      except

      end;
    end;
    if (kv_konfig.FieldByName('mes_pot_time1').AsString <> 'Нет') then
    begin
      try
        DecodeDate(StrToDate(Copy(kv_konfig.FieldByName('mes_pot_time1').AsString, 8, 8)), year1, month1, day1);
        framePomesPotr2.sLabel1.Caption := mes[month1];
        framePomesPotr2.sLabel14.Caption := IntToStr(year1);
        framePomesPotr2.sLabel29.Caption := IntToStr(year1 - 1);
      except

      end;
    end;

    poslCht := TStringList.Create;
    predPoslCht := TStringList.Create;
    poslCht.Text := kv_konfig.FBN('tar_nak').AsString;
    predPoslCht.Text := kv_konfig.FBN('tar_nak1').AsString;

    if poslCht.Text <> '' then
    begin
      koeff := 1;
      try
        if DataSet.FieldByName('SDF').AsString = '3' then
        begin
          if sCheckBox1.Checked then
            koeff := StrToInt(poslCht.Strings[13]);
          sCheckBox1.Visible := True;
        end
        else
        begin
          koeff := 1;
          sCheckBox1.Visible := False;
        end;
      except
        koeff := 1;
      end;

      if sPageControl1.ActivePageIndex = 0 then
      begin
        //Последнее чтение
        //Заполнение показателей текущего месяца
        try
          with framePomesPotr1 do
          begin
            sEdit1.Text := FormatFloat('000000.00', StrToFloat(poslCht.Strings[4]) * koeff);
            sEdit2.Text := FormatFloat('000000.00', StrToFloat(poslCht.Strings[5]) * koeff);
            sEdit3.Text := FormatFloat('000000.00', StrToFloat(poslCht.Strings[6]) * koeff);
            sEdit4.Text := FormatFloat('000000.00', StrToFloat(poslCht.Strings[7]) * koeff);
          end
        except
          with framePomesPotr1 do
          begin
            sEdit1.Text := poslCht.Strings[4];
            sEdit2.Text := poslCht.Strings[5];
            sEdit3.Text := poslCht.Strings[6];
            sEdit4.Text := poslCht.Strings[7];
          end;
        end;
        if (kv_konfig.FieldByName('mes_pot_time').AsString = 'Нет') then
          exit;
        poslCht.Clear;
        poslCht.Text := kv_konfig.FieldByName('mes_pot').AsString;
        if (DataSet.FieldByName('Addr').AsString = '2') or (DataSet.FieldByName('Addr').AsString = '3') then
          ConvertMesPotr(poslCht);

        for q := 1 to 48 do
        begin
          for i := 0 to framePomesPotr1.ComponentCount - 1 do
          begin
            if (framePomesPotr1.Components[i].Tag = q) then
            begin
              if koeff <> 1 then
                (framePomesPotr1.Components[i] as TsEdit).Text := FormatFloat('000000.00',
                  StrToFloatDef(poslCht.Strings[((q + month - 2) mod 12) + 13 * ((q - 1) div 12)], 0) * koeff)
              else
                (framePomesPotr1.Components[i] as TsEdit).Text := poslCht.Strings[((q + month - 2) mod 12) + 13 * ((q -
                  1) div 12)];
              break;
            end;
          end;
        end;
        for q := 0 to 3 do
        begin
          for i := 0 to framePomesPotr1.ComponentCount - 1 do
          begin
            if (framePomesPotr1.Components[i].Tag = (212 + q * 13)) then
            begin
              (framePomesPotr1.Components[i] as TsEdit).Text := poslCht.Strings[12 + q * 13];
              break;
            end;
          end;
        end;
        for q := 51 to 62 do
        begin
          for i := 0 to framePomesPotr1.ComponentCount - 1 do
          begin
            if (framePomesPotr1.Components[i].Tag = q) then
            begin
              if (q + month - 51) > 12 then
              begin
                (framePomesPotr1.Components[i] as TsLabel).Caption := mes[((q + month - 51) mod 12)];
                (framePomesPotr1.Components[i] as TsLabel).Font.Color := color_tek;
              end
              else
              begin
                (framePomesPotr1.Components[i] as TsLabel).Caption := mes[(q + month - 51)];
                (framePomesPotr1.Components[i] as TsLabel).Font.Color := color_pred;
              end;
              break;
            end;
          end;
        end;
        i1 := 13 - month;
        for q := 101 to 112 do
        begin
          for i := 0 to framePomesPotr1.ComponentCount - 1 do
          begin
            if (framePomesPotr1.Components[i].Tag = q) then
            begin
              if i1 > 0 then
              begin
                (framePomesPotr1.Components[i] as TsLabel).Caption := IntToStr(year - 1);
                (framePomesPotr1.Components[i] as TsLabel).Font.Color := color_pred;
              end
              else
              begin
                (framePomesPotr1.Components[i] as TsLabel).Caption := IntToStr(year);
                (framePomesPotr1.Components[i] as TsLabel).Font.Color := color_tek;
              end;
              Dec(i1);
              Break;
            end;
          end;
        end;
        for q := 0 to 13 do
        begin
          i := 5 + q * 5;
          try
            TsEdit(framePomesPotr1.FindComponent('sEdit' + IntToStr(i))).Text := FormatFloat('000000.00',
              StrToFloat(TsEdit(framePomesPotr1.FindComponent('sEdit' + IntToStr(i - 1))).Text + '0') +
              StrToFloat(TsEdit(framePomesPotr1.FindComponent('sEdit' + IntToStr(i - 2))).Text + '0') +
              StrToFloat(TsEdit(framePomesPotr1.FindComponent('sEdit' + IntToStr(i - 3))).Text + '0') +
              StrToFloat(TsEdit(framePomesPotr1.FindComponent('sEdit' + IntToStr(i - 4))).Text + '0'))
          except
            TsEdit(framePomesPotr1.FindComponent('sEdit' + IntToStr(i))).Text := '000000,00'
          end;
        end;
      end

      else
      begin
        //Предпоследнее чтение
        if (kv_konfig.FieldByName('mes_pot_time1').AsString = 'Нет') then
          exit;
        try
          with framePomesPotr2 do
          begin
            sEdit1.Text := FormatFloat('000000.00', StrToFloat(predPoslCht.Strings[4]) * koeff);
            sEdit2.Text := FormatFloat('000000.00', StrToFloat(predPoslCht.Strings[5]) * koeff);
            sEdit3.Text := FormatFloat('000000.00', StrToFloat(predPoslCht.Strings[6]) * koeff);
            sEdit4.Text := FormatFloat('000000.00', StrToFloat(predPoslCht.Strings[7]) * koeff);
          end
        except
          with framePomesPotr2 do
          begin
            sEdit1.Text := predPoslCht.Strings[4];
            sEdit2.Text := predPoslCht.Strings[5];
            sEdit3.Text := predPoslCht.Strings[6];
            sEdit4.Text := predPoslCht.Strings[7];
          end;
        end;
        predPoslCht.Clear;
        predPoslCht.Text := kv_konfig.FieldByName('mes_pot1').AsString;
        if (DataSet.FieldByName('Addr').AsString = '2') or (DataSet.FieldByName('Addr').AsString = '3') then
          ConvertMesPotr(predPoslCht);

        for q := 1 to 48 do
        begin
          for i := 0 to framePomesPotr2.ComponentCount - 1 do
          begin
            if (framePomesPotr2.Components[i].Tag = q) then
            begin
              if koeff <> 1 then
                (framePomesPotr2.Components[i] as TsEdit).Text := FormatFloat('000000.00',
                  StrToFloatDef(predPoslCht.Strings[((q + month1 - 2) mod 12) + 13 * ((q - 1) div 12)], 0) * koeff)
              else
                (framePomesPotr2.Components[i] as TsEdit).Text := predPoslCht.Strings[((q + month1 - 2) mod 12) + 13 *
                  ((q - 1) div 12)];
              break;
            end;
          end;
        end;
        for q := 0 to 3 do
        begin
          for i := 0 to framePomesPotr2.ComponentCount - 1 do
          begin
            if (framePomesPotr2.Components[i].Tag = (212 + q * 13)) then
            begin
              (framePomesPotr2.Components[i] as TsEdit).Text := predPoslCht.Strings[12 + q * 13];
              break;
            end;
          end;
        end;
        for q := 51 to 62 do
        begin
          for i := 0 to framePomesPotr2.ComponentCount - 1 do
          begin
            if (framePomesPotr2.Components[i].Tag = q) then
            begin
              if (q + month1 - 51) > 12 then
              begin
                (framePomesPotr2.Components[i] as TsLabel).Caption := mes[((q + month1 - 51) mod 12)];
                (framePomesPotr2.Components[i] as TsLabel).Font.Color := color_tek;
              end
              else
              begin
                (framePomesPotr2.Components[i] as TsLabel).Caption := mes[(q + month1 - 51)];
                (framePomesPotr2.Components[i] as TsLabel).Font.Color := color_pred;
              end;
              break;
            end;
          end;
        end;
        i1 := 13 - month1;
        for q := 101 to 112 do
        begin
          for i := 0 to framePomesPotr2.ComponentCount - 1 do
          begin
            if (framePomesPotr2.Components[i].Tag = q) then
            begin
              if i1 > 0 then
              begin
                (framePomesPotr2.Components[i] as TsLabel).Caption := IntToStr(year1 - 1);
                (framePomesPotr2.Components[i] as TsLabel).Font.Color := color_pred;
              end
              else
              begin
                (framePomesPotr2.Components[i] as TsLabel).Caption := IntToStr(year1);
                (framePomesPotr2.Components[i] as TsLabel).Font.Color := color_tek;
              end;
              Dec(i1);
              Break;
            end;
          end;
        end;
        for q := 0 to 13 do
        begin
          i := 5 + q * 5;
          try
            TsEdit(framePomesPotr2.FindComponent('sEdit' + IntToStr(i))).Text := FormatFloat('000000.00',
              StrToFloat(TsEdit(framePomesPotr2.FindComponent('sEdit' + IntToStr(i - 1))).Text + '0') +
              StrToFloat(TsEdit(framePomesPotr2.FindComponent('sEdit' + IntToStr(i - 2))).Text + '0') +
              StrToFloat(TsEdit(framePomesPotr2.FindComponent('sEdit' + IntToStr(i - 3))).Text + '0') +
              StrToFloat(TsEdit(framePomesPotr2.FindComponent('sEdit' + IntToStr(i - 4))).Text + '0'))
          except
            TsEdit(framePomesPotr2.FindComponent('sEdit' + IntToStr(i))).Text := '000000,00'
          end;
        end;
      end;
    end;
  end;
end;

procedure Tdm1.Na1ChisloMes(DataSet: TDataSet);
const
  mes: array[1..12] of string = ('Январь', 'Февраль', 'Март', 'Апрель', 'Май',
    'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь');
var
  i, i1, q, koeff: Integer;
  poslCht: TStrings;
  predPoslCht: TStrings;
begin
  with FormNa1Chislo do
  begin
    //Очистка Editov последнего и предпоследнего считывания
    for i := 0 to frameNa1Chislo1.ComponentCount - 1 do
    begin
      if frameNa1Chislo1.Components[i].ClassName = 'TsEdit' then
      begin
        (frameNa1Chislo1.Components[i] as TsEdit).Text := '';
        (frameNa1Chislo2.Components[i] as TsEdit).Text := '';
      end;
    end;

    Caption := 'Показания на 1-е число месяца (0 ч 00 мин) счётчик № ' + DataSet.FieldByName('NS').AsString;
    sTabSheet1.Caption := 'Последнее чтение: ' + kv_konfig.FieldByName('mes_pot_time').AsString;
    if (kv_konfig.FieldByName('mes_pot_time1').AsString <> 'Нет') and (kv_konfig.FieldByName('mes_pot_time1').AsString
      <> '') then
      sTabSheet2.Caption := 'Предпоследнее чтение - ' + kv_konfig.FieldByName('mes_pot_time1').AsString
    else
      sTabSheet2.Caption :=
        '                                   Предпоследнее чтение: нет                                   ';

    if (kv_konfig.FieldByName('mes_pot_time').AsString <> 'Нет') then
    begin
      try
        begin
          DecodeDate(StrToDate(Copy(kv_konfig.FieldByName('mes_pot_time').AsString, 8, 8)), year, month, day);
        end;
      except

      end;
    end;
    if (kv_konfig.FieldByName('mes_pot_time1').AsString <> 'Нет') then
    begin
      try
        DecodeDate(StrToDate(Copy(kv_konfig.FieldByName('mes_pot_time1').AsString, 8, 8)), year1, month1, day1);
      except

      end;
    end;

    poslCht := TStringList.Create;
    predPoslCht := TStringList.Create;
    poslCht.Text := kv_konfig.FieldByName('tar_nak').AsString;
    predPoslCht.Text := kv_konfig.FieldByName('tar_nak1').AsString;

    if poslCht.Text <> '' then
    begin
      koeff := 1;
      try
        if DataSet.FieldByName('SDF').AsString = '3' then
        begin
          sCheckBox1.Visible := True;
          if sCheckBox1.Checked then
            koeff := StrToInt(poslCht.Strings[13]);
        end
        else
        begin
          koeff := 1;
          sCheckBox1.Visible := False;
        end;
      except
        koeff := 1;
      end;

      //Заполнение вкладки последнего чтения
      if sPageControl1.ActivePageIndex = 0 then
      begin
        if (kv_konfig.FieldByName('mes_pot_time').AsString = 'Нет') then
          exit;
        poslCht.Clear;
        poslCht.Text := kv_konfig.FieldByName('mes_pot').AsString;
        if (DataSet.FieldByName('Addr').AsString = '1') or (DataSet.FieldByName('Addr').AsString = '') then
          ConvertNa1ChisloMes(poslCht, month, 'tar_nak');

        for q := 1 to 48 do
        begin
          for i := 0 to frameNa1Chislo1.ComponentCount - 1 do
          begin
            if (frameNa1Chislo1.Components[i].Tag = q) then
            begin
              if koeff <> 1 then
                (frameNa1Chislo1.Components[i] as TsEdit).Text := FormatFloat('000000.00',
                  StrToFloatDef(poslCht.Strings[((q + month - 2) mod 12) + 13 * ((q - 1) div 12)], 0) * koeff)
              else
                (frameNa1Chislo1.Components[i] as TsEdit).Text := poslCht.Strings[((q + month - 2) mod 12) + 13 * ((q -
                  1) div 12)];
              break;
            end;
          end;
        end;
        for q := 1 to 4 do
        begin
          if koeff <> 1 then
            TsEdit(frameNa1Chislo1.FindComponent('sEdit' + IntToStr(60 + q))).Text := FormatFloat('000000.00',
              StrToFloatDef(poslCht.Strings[13 * q - 1], 0) * koeff)
          else
            TsEdit(frameNa1Chislo1.FindComponent('sEdit' + IntToStr(60 + q))).Text := poslCht.Strings[13 * q - 1];
        end;
        for q := 51 to 62 do
        begin
          for i := 0 to frameNa1Chislo1.ComponentCount - 1 do
          begin
            if (frameNa1Chislo1.Components[i].Tag = q) then
            begin
              if (q + month - 50) > 12 then
              begin
                (frameNa1Chislo1.Components[i] as TsLabel).Caption := mes[((q + month - 50) mod 12)];
                (frameNa1Chislo1.Components[i] as TsLabel).Font.Color := color_tek;
              end
              else
              begin
                (frameNa1Chislo1.Components[i] as TsLabel).Caption := mes[(q + month - 50)];
                (frameNa1Chislo1.Components[i] as TsLabel).Font.Color := color_pred;
              end;
              break;
            end;
          end;
        end;
        i1 := 12 - month;
        for q := 101 to 112 do
        begin
          for i := 0 to frameNa1Chislo1.ComponentCount - 1 do
          begin
            if (frameNa1Chislo1.Components[i].Tag = q) then
            begin
              if i1 > 0 then
              begin
                (frameNa1Chislo1.Components[i] as TsLabel).Caption := IntToStr(year - 1);
                (frameNa1Chislo1.Components[i] as TsLabel).Font.Color := color_pred;
              end
              else
              begin
                (frameNa1Chislo1.Components[i] as TsLabel).Caption := IntToStr(year);
                (frameNa1Chislo1.Components[i] as TsLabel).Font.Color := color_tek;
              end;
              Dec(i1);
              Break;
            end;
          end;
        end;
        frameNa1Chislo1.sLabel29.Caption := IntToStr(year - 1);
        for q := 0 to 12 do
        begin
          i := 5 + q * 5;
          try
            TsEdit(frameNa1Chislo1.FindComponent('sEdit' + IntToStr(i))).Text := FormatFloat('000000.00',
              StrToFloat(TsEdit(frameNa1Chislo1.FindComponent('sEdit' + IntToStr(i - 1))).Text + '0') +
              StrToFloat(TsEdit(frameNa1Chislo1.FindComponent('sEdit' + IntToStr(i - 2))).Text + '0') +
              StrToFloat(TsEdit(frameNa1Chislo1.FindComponent('sEdit' + IntToStr(i - 3))).Text + '0') +
              StrToFloat(TsEdit(frameNa1Chislo1.FindComponent('sEdit' + IntToStr(i - 4))).Text + '0'))
          except
            TsEdit(frameNa1Chislo1.FindComponent('sEdit' + IntToStr(i))).Text := '000000,00';
          end;
        end;
      end

        //Заполнение вкладки предпоследнего чтения
      else
      begin
        if (kv_konfig.FieldByName('mes_pot_time1').AsString = 'Нет') then
          exit;
        predPoslCht.Clear;
        predPoslCht.Text := kv_konfig.FieldByName('mes_pot1').AsString;
        if (DataSet.FieldByName('Addr').AsString = '1') or (DataSet.FieldByName('Addr').AsString = '') then
          ConvertNa1ChisloMes(predPoslCht, month1, 'tar_nak1');

        for q := 1 to 48 do
        begin
          for i := 0 to frameNa1Chislo2.ComponentCount - 1 do
          begin
            if (frameNa1Chislo2.Components[i].Tag = q) then
            begin
              if koeff <> 1 then
                (frameNa1Chislo2.Components[i] as TsEdit).Text := FormatFloat('000000.00',
                  StrToFloatDef(predPoslCht.Strings[((q + month1 - 2) mod 12) + 13 * ((q - 1) div 12)], 0) * koeff)
              else
                (frameNa1Chislo2.Components[i] as TsEdit).Text := predPoslCht.Strings[((q + month1 - 2) mod 12) + 13 *
                  ((q - 1) div 12)];
              break;
            end;
          end;
        end;
        for q := 1 to 4 do
        begin
          if koeff <> 1 then
            TsEdit(frameNa1Chislo2.FindComponent('sEdit' + IntToStr(60 + q))).Text := FormatFloat('000000.00',
              StrToFloatDef(predPoslCht.Strings[13 * q - 1], 0) * koeff)
          else
            TsEdit(frameNa1Chislo2.FindComponent('sEdit' + IntToStr(60 + q))).Text := predPoslCht.Strings[13 * q - 1];
        end;
        for q := 51 to 62 do
        begin
          for i := 0 to frameNa1Chislo2.ComponentCount - 1 do
          begin
            if (frameNa1Chislo2.Components[i].Tag = q) then
            begin
              if (q + month1 - 50) > 12 then
              begin
                (frameNa1Chislo2.Components[i] as TsLabel).Caption := mes[((q + month1 - 50) mod 12)];
                (frameNa1Chislo2.Components[i] as TsLabel).Font.Color := color_tek;
              end
              else
              begin
                (frameNa1Chislo2.Components[i] as TsLabel).Caption := mes[(q + month1 - 50)];
                (frameNa1Chislo2.Components[i] as TsLabel).Font.Color := color_pred;
              end;
              break;
            end;
          end;
        end;
        i1 := 12 - month1;
        for q := 101 to 112 do
        begin
          for i := 0 to frameNa1Chislo2.ComponentCount - 1 do
          begin
            if (frameNa1Chislo2.Components[i].Tag = q) then
            begin
              if i1 > 0 then
              begin
                (frameNa1Chislo2.Components[i] as TsLabel).Caption := IntToStr(year1 - 1);
                (frameNa1Chislo2.Components[i] as TsLabel).Font.Color := color_pred;
              end
              else
              begin
                (frameNa1Chislo2.Components[i] as TsLabel).Caption := IntToStr(year1);
                (frameNa1Chislo2.Components[i] as TsLabel).Font.Color := color_tek;
              end;
              Dec(i1);
              Break;
            end;
          end;
        end;
        frameNa1Chislo2.sLabel29.Caption := IntToStr(year1 - 1);
        for q := 0 to 12 do
        begin
          i := 5 + q * 5;
          try
            TsEdit(frameNa1Chislo2.FindComponent('sEdit' + IntToStr(i))).Text := FormatFloat('000000.00',
              StrToFloat(TsEdit(frameNa1Chislo2.FindComponent('sEdit' + IntToStr(i - 1))).Text + '0') +
              StrToFloat(TsEdit(frameNa1Chislo2.FindComponent('sEdit' + IntToStr(i - 2))).Text + '0') +
              StrToFloat(TsEdit(frameNa1Chislo2.FindComponent('sEdit' + IntToStr(i - 3))).Text + '0') +
              StrToFloat(TsEdit(frameNa1Chislo2.FindComponent('sEdit' + IntToStr(i - 4))).Text + '0'))
          except
            TsEdit(frameNa1Chislo2.FindComponent('sEdit' + IntToStr(i))).Text := '000000,00';
          end;
        end;

      end;
    end;
  end;
end;

procedure Tdm1.OtklPodkl(DataSet: TDataSet);
var
  i: integer;
  blod: TStrings;
begin
  with FormOtklPodkl do
  begin
    for i := 0 to frameOtklPodkl1.ComponentCount - 1 do
      if frameOtklPodkl1.Components[i].ClassName = 'TsEdit' then
      begin
        (frameOtklPodkl1.Components[i] as TsEdit).Text := '';
        (frameOtklPodkl2.Components[i] as TsEdit).Text := '';
      end;
    Caption := 'Откл. подкл. счётчик № ' + DataSet.FieldByName('NS').AsString;
    sTabSheet1.Caption := kv_konfig.FieldByName('pot_otk_time').AsString;
    sTabSheet2.Caption := kv_konfig.FieldByName('pot_otk_time1').AsString;

    if kv_konfig.FN('pot_otk_time').AsString = 'Нет' then
      Exit;
    blod := TStringList.Create;
    blod.Text := kv_konfig.FieldByName('pot_otk').AsString;
    SortOtklPodkl(blod);
    for i := 0 to frameOtklPodkl1.ComponentCount - 1 do
      if frameOtklPodkl1.Components[i].ClassName = 'TsEdit' then
        try
          (frameOtklPodkl1.Components[i] as TsEdit).Text := blod.Strings[(frameOtklPodkl1.Components[i] as
            TsEdit).Tag];
        finally

        end;
    if kv_konfig.FN('pot_otk_time1').AsString = 'Нет' then
      Exit;
    blod.Clear;
    blod.Text := kv_konfig.FieldByName('pot_otk1').AsString;
    SortOtklPodkl(blod);
    for i := 0 to frameOtklPodkl2.ComponentCount - 1 do
      if frameOtklPodkl2.Components[i].ClassName = 'TsEdit' then
        try
          (frameOtklPodkl2.Components[i] as TsEdit).Text := blod.Strings[(frameOtklPodkl2.Components[i] as
            TsEdit).Tag];
        finally

        end;

  end;
end;

procedure Tdm1.ErrorHandler1FIBErrorEvent(Sender: TObject;
  ErrorValue: EFIBError; KindIBError: TKindIBError; var DoRaise: Boolean);
var
  Lasterror: string;
  FKindIBError: string;
  list: TStrings;
begin
  list := TStringList.Create;
  list.Add(#13#10 + '===== ErrorHandler FIBErrorEvent =====');
  list.Add('Sender.ClassName = ' + Sender.ClassName);
  list.Add('Sender.Name = ' + (Sender as TComponent).Name);
  //if Sender is TFIBQuery then
  //  list.Add('Owner.Name = ' + (Sender as TFIBQuery).Owner.Name);
  if Sender is TpFIBStoredProc then
    list.Add('Sender.StoredProcName = ' + (Sender as TpFIBStoredProc).StoredProcName);
  list.Add('ConstraintName = ' + ErrorHandler1.ConstraintName);
  list.Add('ExceptionNumber = ' + IntToStr(ErrorHandler1.ExceptionNumber));
  case ErrorHandler1.LastError of
    keNoError: Lasterror := 'keNoError';
    keException: Lasterror := 'keException';
    keForeignKey: Lasterror := 'keForeignKey';
    keSecurity: Lasterror := 'keSecurity';
    keLostConnect: Lasterror := 'keLostConnect';
    keCheck: Lasterror := 'keCheck';
    keUniqueViolation: Lasterror := 'keUniqueViolation';
    keOther: Lasterror := 'keOther';
  else
    Lasterror := 'Undefined';
  end;
  list.Add('Lasterror = ' + Lasterror);
  list.Add('SQLCode = ' + IntToStr(ErrorValue.SQLCode));
  list.Add('IBErrorCode = ' +
    IntToStr(ErrorValue.IBErrorCode));
  list.Add('Message = ' + ErrorValue.Message);
  list.Add('IBMessage = ' + ErrorValue.IBMessage);
  list.Add('SQLMessage = ' + ErrorValue.SQLMessage);
  case KindIBError of
    keNoError: FKindIBError := 'keNoError';
    keException: FKindIBError := 'keException';
    keForeignKey: FKindIBError := 'keForeignKey';
    keSecurity: FKindIBError := 'keSecurity';
    keLostConnect: Lasterror := 'keLostConnect';
    keCheck: FKindIBError := 'keCheck';
    keUniqueViolation: FKindIBError := 'keUniqueViolation';
    keOther: FKindIBError := 'keOther';
  else
    FKindIBError := 'Undefined';
  end;
  list.Add('KindIBError = ' + FKindIBError);
  list.SaveToFile(ExtractFilePath(Application.ExeName) + '\Log\Error\' + DateToStr(Date) + '_' +
    StringReplace(TimeToStr(Time), ':', '.', [rfReplaceAll, rfIgnoreCase]) + '.log');
  list.Free;
end;

procedure Tdm1.Power(DataSet: TDataSet);
var
  i: integer;
  blod: TStrings;
begin
  with FormPower do
  begin
    //Очистка Editov последнего и предпоследнего считывания
    for i := 0 to ComponentCount - 1 do
      if FramePower1.Components[i].ClassName = 'TsEdit' then
      begin
        (FramePower1.Components[i] as TsEdit).Text := '';
        (FramePower2.Components[i] as TsEdit).Text := '';
      end;
    Caption := 'Мощность счётчик № ' + DataSet.FieldByName('NS').AsString;
    sTabSheet1.Caption := 'Последнее чтение: ' + kv_konfig.FieldByName('power_time').AsString;
    sTabSheet2.Caption := 'Предпоследнее чтение: ' + kv_konfig.FieldByName('power_time1').AsString;

    //Заполнение вкладок последнего и предпоследнего чтения
    blod := TStringList.Create;
    blod.Text := kv_konfig.FieldByName('power').AsString;
    blod.Text := blod.Text + kv_konfig.FieldByName('power1').AsString;
    //Заполнение пустых строк если не было повторного считывания
    for i := 7 downto blod.Count do
      blod.Add('00.00');

    for i := 0 to framePower1.ComponentCount - 1 do
      if framePower1.Components[i].ClassName = 'TsEdit' then
        (framePower1.Components[i] as TsEdit).Text := blod.Strings[(framePower1.Components[i] as TsEdit).Tag];
    for i := 0 to framePower2.ComponentCount - 1 do
      if framePower2.Components[i].ClassName = 'TsEdit' then
        (framePower2.Components[i] as TsEdit).Text := blod.Strings[(framePower2.Components[i] as TsEdit).Tag + 4];
  end;
end;

procedure Tdm1.SaveDbGridToFile(handle: THandle; grid: TDBGridEh;
  expclas: TDBGridEhExportClass; FileName: string);
begin
  try
    SaveDBGridEhToExportFile(expclas, grid, FileName, true);
    ShellExecute(handle, 'open', PChar(FileName), nil, PChar(ExtractFilePath(FileName)), SW_SHOWNORMAL);
  except
    ShowMessage('Ошибка при сохранении');
  end;
end;

procedure Tdm1.SaveKonfigCheckedToFile(FileName: string);
var
  sql: TpFIBQuery;
  list: TStrings;
begin
  list := TStringList.Create;

  sql := TpFIBQuery.Create(nil);
  sql.Database := database;
  sql.Transaction := transact1;
  Screen.Cursor := crSQLWait;
  with sql do
    try
      SQL.Text := 'select inc from addresmain where chec = 1';
      ExecQuery;
      list.Add('Allocated addresmain');
      while not eof do
      begin
        list.Add(FN('inc').AsString);
        Next
      end;

      Close;
      SQL.Text := 'select inc from addres where cod in (select inc from addresmain where chec = 1) and chec = 1';
      ExecQuery;
      list.Add('Allocated addres');
      while not eof do
      begin
        list.Add(FN('inc').AsString);
        Next
      end;

      Close;
      SQL.Text :=
        'select inc from tmp where cod in (select inc from addres where cod in (select inc from addresmain where chec = 1) and chec = 1) and chec = 1';
      ExecQuery;
      list.Add('Allocated tmp');
      while not eof do
      begin
        list.Add(FN('inc').AsString);
        Next
      end;
      list.SaveToFile(FileName);
    finally
      Free
    end;
  list.Free;
  Screen.Cursor := crDefault;
  Form1.DBLookupComboboxEh1.SetFocus;
end;

procedure Tdm1.SortOtklPodkl(var blod: TStrings);
label
  qqq, www;
var
  q, p, z, i, j: integer;
  t_d2, t_d3, t, t_1, t_d, t_d1: string;
  pot: bool;
begin
  pot := true;
  t_d2 := '01.01.01 00:00:00';
  t_d3 := '01.01.01 00:00:00';
  if blod.Strings[0] = '' then
    exit;

  for p := 0 to 2 do
  begin
    i := p * 10;
    z := i + 10;

    while i < z do
    begin
      t_d := Copy(blod.Strings[i], 7, 100);
      for j := 0 to Length(t_d) do
        if t_d[j] = '-' then
          t_d[j] := '.';

      if pot then
      begin
        t_d2 := Copy(blod.Strings[i + 1], 7, 100);
        for j := 0 to Length(t_d2) do
          if t_d2[j] = '-' then
            t_d2[j] := '.';
        t_d2 := t_d2 + ' ' + Copy(blod.Strings[i + 1], 1, 5) + ':00';
      end;

      t_d := t_d + ' ' + Copy(blod.Strings[i], 1, 5) + ':00';
      q := p * 10;

      while q < z do
      begin
        t_d1 := Copy(blod.Strings[q], 7, 100);
        for j := 0 to Length(t_d1) do
          if t_d1[j] = '-' then
            t_d1[j] := '.';

        if pot then
        begin
          t_d3 := Copy(blod.Strings[q + 1], 7, 100);
          for j := 0 to Length(t_d3) do
            if t_d3[j] = '-' then
              t_d3[j] := '.';
          t_d3 := t_d3 + ' ' + Copy(blod.Strings[q + 1], 1, 5) + ':00';
        end;

        t_d1 := t_d1 + ' ' + Copy(blod.Strings[q], 1, 5) + ':00';

        if t_d1 = '00.00.00 00:00:00' then
          t_d1 := '31.12.00 23:59:58';

        if t_d2 = '00.00.00 00:00:00' then
          t_d2 := '31.12.00 23:59:58';

        if t_d3 = '00.00.00 00:00:00' then
          t_d3 := '31.12.00 23:59:58';

        if t_d = '00.00.00 00:00:00' then
          t_d := '31.12.00 23:59:58';

        try
          if StrToDateTime(t_d1) < Now then
            ;
        except
          t_d1 := '31.12.99 23:59:59';
        end;

        if pot then
        begin
          try
            if StrToDateTime(t_d2) < Now then
              ;
          except
            t_d2 := '31.12.99 23:59:59';
          end;

          try
            if StrToDateTime(t_d3) < Now then
              ;
          except
            t_d3 := '31.12.99 23:59:59';
          end;
        end;

        try
          if StrToDateTime(t_d) < Now then
            ;
        except
          t_d := '31.12.99 23:59:59';
        end;

        qqq:
        if (StrToDateTime(t_d1) + StrToDateTime(t_d3))<(StrToDateTime(t_d) + StrToDateTime(t_d2)) then
        begin
          if pot then
          begin
            t := blod.Strings[i];
            t_1 := blod.Strings[i + 1];
            blod.Strings[i] := blod.Strings[q];
            blod.Strings[i + 1] := blod.Strings[q + 1];
            blod.Strings[q] := t;
            blod.Strings[q + 1] := t_1;
          end
          else
          begin
            t := blod.Strings[i];
            blod.Strings[i] := blod.Strings[q];
            blod.Strings[q] := t;
          end;
          t_d := t_d1;
        end;

        www:
        Inc(q);
        if pot then
          Inc(q);
      end;
      Inc(i);
      if pot then
        Inc(i);
    end;
    pot := false;
    t_d2 := '01.01.01 00:00:00';
    t_d3 := '01.01.01 00:00:00';
    for i := 0 to 29 do
      if blod.Strings[i] = '31.12.99 23:59:58' then
        blod.Strings[i] := '00.00.00 00:00:00';
  end;
end;

procedure Tdm1.TarNak(DataSet: TDataSet);
var
  i, koeff, col_tar: integer;
  blod: TStrings;
begin
  with FormTarNak do
  begin
    for i := 0 to frameTarNak1.ComponentCount - 1 do
      if frameTarNak1.Components[i].ClassName = 'TsEdit' then
        (frameTarNak1.Components[i] as TsEdit).Text := '';
    for i := 0 to frameTarNak2.ComponentCount - 1 do
      if frameTarNak2.Components[i].ClassName = 'TsEdit' then
        (frameTarNak2.Components[i] as TsEdit).Text := '';
    for i := 0 to frameTarNak3.ComponentCount - 1 do
      if frameTarNak3.Components[i].ClassName = 'TsEdit' then
        (frameTarNak3.Components[i] as TsEdit).Text := '';

    Caption := 'Тарифные накопители счётчик № ' + DataSet.FieldByName('NS').AsString;
    if kv_konfig.FieldByName('tar_nak_time').AsString <> 'Нет' then
      sTabSheet1.Caption := '          Последнее чтение: ' + kv_konfig.FieldByName('tar_nak_time').AsString +
        '          '
    else
      sTabSheet1.Caption := '                              Последнее чтение: нет                              ';

    if kv_konfig.FieldByName('tar_nak_time1').AsString <> 'Нет' then
      sTabSheet2.Caption := '          Предпоследнее чтение: ' + kv_konfig.FieldByName('tar_nak_time1').AsString +
        '          '
    else
      sTabSheet2.Caption := '                              Предпоследнее чтение: нет                              ';

    blod := TStringList.Create;
    blod.Text := kv_konfig.FieldByName('tar_nak').AsString;

    if blod.Strings[13] <> '' then
      koeff := StrToInt(blod.Strings[13])
    else
      koeff := 1;

    with frameTarNak1 do
      if kv_konfig.FieldByName('tar_nak_time').AsString <> 'Нет' then
        for i := 0 to ComponentCount - 1 do
          if (Components[i].ClassName = 'TsEdit') and (Components[i].Tag < 100) then
            if koeff <> 1 then
              try
                (Components[i] as TsEdit).Text := FormatFloat('000000.00', StrToFloat(blod.Strings[(Components[i] as
                    TsEdit).Tag]) * koeff)
              except
                (Components[i] as TsEdit).Text := '000000,00';
              end
            else
              (Components[i] as TsEdit).Text := blod.Strings[(Components[i] as TsEdit).Tag];

    blod.Clear;
    blod.Text := kv_konfig.FieldByName('tar_nak1').AsString;
    with frameTarNak2 do
      if kv_konfig.FieldByName('tar_nak_time1').AsString <> 'Нет' then
        for i := 0 to ComponentCount - 1 do
          if (Components[i].ClassName = 'TsEdit') and (Components[i].Tag < 100) then
            if koeff <> 1 then
              try
                (Components[i] as TsEdit).Text := FormatFloat('000000.00', StrToFloat(blod.Strings[(Components[i] as
                    TsEdit).Tag]) * koeff)
              except
                (Components[i] as TsEdit).Text := '000000,00';
              end
            else
              (Components[i] as TsEdit).Text := blod.Strings[(Components[i] as TsEdit).Tag];

    with frameTarNak1 do
    begin
      try
        sEdit6.Text := FormatFloat('000000.00', StrToFloat(sEdit1.Text) + StrToFloat(sEdit2.Text) +
          StrToFloat(sEdit3.Text) + StrToFloat(sEdit4.Text));
      except
        sEdit6.Text := '000000,00';
      end;
      try
        sEdit12.Text := FormatFloat('000000.00', StrToFloat(sEdit7.Text) + StrToFloat(sEdit8.Text) +
          StrToFloat(sEdit9.Text) + StrToFloat(sEdit10.Text));
      except
        sEdit12.Text := '000000,00';
      end;
      try
        sEdit18.Text := FormatFloat('000000.00', StrToFloat(sEdit13.Text) + StrToFloat(sEdit14.Text) +
          StrToFloat(sEdit15.Text) + StrToFloat(sEdit16.Text));
      except
        sEdit18.Text := '000000,00';
      end;
    end;

    with frameTarNak2 do
    begin
      try
        sEdit6.Text := FormatFloat('000000.00', StrToFloatDef(sEdit1.Text, 0) + StrToFloatDef(sEdit2.Text, 0) +
          StrToFloatDef(sEdit3.Text, 0) + StrToFloatDef(sEdit4.Text, 0));
      except
        sEdit6.Text := '000000,00';
      end;
      try
        sEdit12.Text := FormatFloat('000000.00', StrToFloatDef(sEdit7.Text, 0) + StrToFloatDef(sEdit8.Text, 0) +
          StrToFloatDef(sEdit9.Text, 0) + StrToFloatDef(sEdit10.Text, 0));
      except
        sEdit12.Text := '000000,00';
      end;
      try
        sEdit18.Text := FormatFloat('000000.00', StrToFloatDef(sEdit13.Text, 0) + StrToFloatDef(sEdit14.Text, 0) +
          StrToFloatDef(sEdit15.Text, 0) + StrToFloatDef(sEdit16.Text, 0));
      except
        sEdit18.Text := '000000,00';
      end;
    end;

    blod.Clear;
    blod.Text := kv_konfig.FieldByName('var_tar').AsString;
    try
      col_tar := StrToInt(blod.Strings[2]);
    except
      col_tar := 0;
    end;

    with frameTarNak1 do
    begin
      case col_tar of
        1:
          begin
            sEdit5.Text := sEdit1.Text;
            sEdit11.Text := sEdit7.Text;
            sEdit17.Text := sEdit13.Text;
          end;
        2:
          begin
            sEdit5.Text := FormatFloat('000000.00', StrToFloatDef(sEdit1.Text, 0) + StrToFloatDef(sEdit2.Text, 0));
            sEdit11.Text := FormatFloat('000000.00', StrToFloatDef(sEdit7.Text, 0) + StrToFloatDef(sEdit8.Text, 0));
            sEdit17.Text := FormatFloat('000000.00', StrToFloatDef(sEdit13.Text, 0) + StrToFloatDef(sEdit14.Text, 0));
          end;
        3:
          begin
            sEdit5.Text := FormatFloat('000000.00', StrToFloatDef(sEdit1.Text, 0) + StrToFloatDef(sEdit2.Text, 0) +
              StrToFloatDef(sEdit3.Text, 0));
            sEdit11.Text := FormatFloat('000000.00', StrToFloatDef(sEdit7.Text, 0) + StrToFloatDef(sEdit8.Text, 0) +
              StrToFloatDef(sEdit9.Text, 0));
            sEdit17.Text := FormatFloat('000000.00', StrToFloatDef(sEdit13.Text, 0) + StrToFloatDef(sEdit14.Text, 0) +
              StrToFloatDef(sEdit15.Text, 0));
          end;
        4:
          begin
            sEdit5.Text := FormatFloat('000000.00', StrToFloatDef(sEdit1.Text, 0) + StrToFloatDef(sEdit2.Text, 0) +
              StrToFloatDef(sEdit3.Text, 0) + StrToFloatDef(sEdit4.Text, 0));
            sEdit11.Text := FormatFloat('000000.00', StrToFloatDef(sEdit7.Text, 0) + StrToFloatDef(sEdit8.Text, 0) +
              StrToFloatDef(sEdit9.Text, 0) + StrToFloatDef(sEdit10.Text, 0));
            sEdit17.Text := FormatFloat('000000.00', StrToFloatDef(sEdit13.Text, 0) + StrToFloatDef(sEdit14.Text, 0) +
              StrToFloatDef(sEdit15.Text, 0) + StrToFloatDef(sEdit16.Text, 0));
          end;
      end;
    end;

    with frameTarNak2 do
    begin
      case col_tar of
        1:
          begin
            sEdit5.Text := sEdit1.Text;
            sEdit11.Text := sEdit7.Text;
            sEdit17.Text := sEdit13.Text;
          end;
        2:
          begin
            sEdit5.Text := FormatFloat('000000.00', StrToFloatDef(sEdit1.Text, 0) + StrToFloatDef(sEdit2.Text, 0));
            sEdit11.Text := FormatFloat('000000.00', StrToFloatDef(sEdit7.Text, 0) + StrToFloatDef(sEdit8.Text, 0));
            sEdit17.Text := FormatFloat('000000.00', StrToFloatDef(sEdit13.Text, 0) + StrToFloatDef(sEdit14.Text, 0));
          end;
        3:
          begin
            sEdit5.Text := FormatFloat('000000.00', StrToFloatDef(sEdit1.Text, 0) + StrToFloatDef(sEdit2.Text, 0) +
              StrToFloatDef(sEdit3.Text, 0));
            sEdit11.Text := FormatFloat('000000.00', StrToFloatDef(sEdit7.Text, 0) + StrToFloatDef(sEdit8.Text, 0) +
              StrToFloatDef(sEdit9.Text, 0));
            sEdit17.Text := FormatFloat('000000.00', StrToFloatDef(sEdit13.Text, 0) + StrToFloatDef(sEdit14.Text, 0) +
              StrToFloatDef(sEdit15.Text, 0));
          end;
        4:
          begin
            sEdit5.Text := FormatFloat('000000.00', StrToFloatDef(sEdit1.Text, 0) + StrToFloatDef(sEdit2.Text, 0) +
              StrToFloatDef(sEdit3.Text, 0) + StrToFloatDef(sEdit4.Text, 0));
            sEdit11.Text := FormatFloat('000000.00', StrToFloatDef(sEdit7.Text, 0) + StrToFloatDef(sEdit8.Text, 0) +
              StrToFloatDef(sEdit9.Text, 0) + StrToFloatDef(sEdit10.Text, 0));
            sEdit17.Text := FormatFloat('000000.00', StrToFloatDef(sEdit13.Text, 0) + StrToFloatDef(sEdit14.Text, 0) +
              StrToFloatDef(sEdit15.Text, 0) + StrToFloatDef(sEdit16.Text, 0));
          end;
      end;
    end;
    for i := 0 to frameTarNak3.ComponentCount - 1 do
      if frameTarNak3.Components[i].ClassName = 'TsEdit' then
        try
          (frameTarNak3.Components[i] as TsEdit).Text := FormatFloat('000000.00', StrToFloat((frameTarNak1.Components[i]
            as TsEdit).Text) - StrToFloat((frameTarNak2.Components[i] as TsEdit).Text));
        except
          (frameTarNak3.Components[i] as TsEdit).Text := 'Error';
        end;
  end;
end;

procedure Tdm1.TarPerehodi; //Заполнение окошка тарифных переходов
var
  i: integer;
  blod: TStrings;
begin
  with FormTarPerehodi do
  begin
    sTabSheet1.Caption := 'Последнее чтение: ' + dm1.kv_konfig.FBN('var_tar_time').AsString;
    sTabSheet2.Caption := 'Предпоследнее чтение: ' + dm1.kv_konfig.FBN('var_tar_time1').AsString;
    sPageControl1.ActivePageIndex := FormVarTar.sPageControl1.ActivePageIndex;

    if dm1.kv_konfig.FBN('var_tar_time').AsString = 'Нет' then
      exit;
    //*****Последнее считывание
    blod := TStringList.Create;
    blod.Text := dm1.kv_konfig.FBN('var_tar').AsString;
    for i := blod.Count to 361 do
      blod.Add('');
    with FrameTarPerehodi1 do
    begin
      try
        sComboBox1.ItemIndex := StrToInt(blod.Strings[24 + sComboBox4.ItemIndex * 3]);
      except
        sComboBox1.ItemIndex := 0;
      end;
      try
        sComboBox2.ItemIndex := StrToInt(blod.Strings[25 + sComboBox4.ItemIndex * 3]);
      except
        sComboBox2.ItemIndex := 0;
      end;
      try
        sComboBox3.ItemIndex := StrToInt(blod.Strings[26 + sComboBox4.ItemIndex * 3]);
      except
        sComboBox3.ItemIndex := 0;
      end;
      for i := 0 to ComponentCount - 1 do
        if Components[i].ClassName = 'TsMaskEdit' then
          (Components[i] as TsMaskEdit).Text := blod.Strings[(Components[i] as TsMaskEdit).Tag - 1 +
            sComboBox4.ItemIndex * 25];
      sComboBox1Change(sComboBox1);
      sComboBox1Change(sComboBox2);
      sComboBox1Change(sComboBox3);
    end;

    if dm1.kv_konfig.FBN('var_tar_time1').AsString = 'Нет' then
      exit;
    //*****Предпоследнее считывание
    blod.Clear;
    blod.Text := dm1.kv_konfig.FBN('var_tar1').AsString;
    for i := blod.Count to 361 do
      blod.Add('');
    with FrameTarPerehodi2 do
    begin
      try
        sComboBox1.ItemIndex := StrToInt(blod.Strings[24 + sComboBox4.ItemIndex * 3]);
      except
        sComboBox1.ItemIndex := 0;
      end;
      try
        sComboBox2.ItemIndex := StrToInt(blod.Strings[25 + sComboBox4.ItemIndex * 3]);
      except
        sComboBox2.ItemIndex := 0;
      end;
      try
        sComboBox3.ItemIndex := StrToInt(blod.Strings[26 + sComboBox4.ItemIndex * 3]);
      except
        sComboBox3.ItemIndex := 0;
      end;
      for i := 0 to ComponentCount - 1 do
        if Components[i].ClassName = 'TsMaskEdit' then
          (Components[i] as TsMaskEdit).Text := blod.Strings[(Components[i] as TsMaskEdit).Tag - 1 +
            sComboBox4.ItemIndex * 25];
      sComboBox1Change(sComboBox1);
      sComboBox1Change(sComboBox2);
      sComboBox1Change(sComboBox3);
    end;
  end;
end;

procedure Tdm1.tmpAfterScroll(DataSet: TDataSet);
begin
  if (not (DataSet as TpFIBDataSet).IsEmpty) and ((DataSet as TpFIBDataSet).FieldByName('sdf').AsString <> '') then
    if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 1 then
      Form1.sLabel36.Caption := 'Однофазный счётчик'
    else if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 4 then
      Form1.sLabel36.Caption := 'Трёхфазный счётчик (общ. потребления)'
    else if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 3 then
      Form1.sLabel36.Caption := 'Трёхфазный счётчик (суммирующий)'
    else if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 5 then
      Form1.sLabel36.Caption := 'Теплосчётчик ТЭМ-104'
end;

procedure Tdm1.tmpCHECChange(Sender: TField); //процедура выделения адреса и разъёма при выделении счётчика
var
  sql: TpFIBQuery;
begin
  if (addresmainCHEC.AsInteger = 0) or (addresCHEC.AsInteger = 0) then
  begin
    if sender.AsInteger = 1 then
    begin
      sql := TpFIBQuery.Create(nil);
      with sql do
        try
          Database := dm1.database;
          Transaction := dm1.database.DefaultUpdateTransaction;
          dm1.updateTransact.StartTransaction;
          SQL.Text := 'UPDATE addresmain set chec = 1 where inc =' + addresmainINC.AsString;
          ExecQuery;
          SQL.Text := 'UPDATE addres set chec = 1 where inc =' + addresINC.AsString;
          ExecQuery;
          SQL.Text := 'UPDATE tmp set chec = 1 where inc =' + tmpINC.AsString;
          ExecQuery;
          dm1.updateTransact.Commit
        finally
          Free;
        end;
      addresmain.ReopenLocate('inc');
      addres.ReopenLocate('inc');
      tmp.ReopenLocate('inc');
    end;
  end;
end;

procedure Tdm1.Tmp_1_2_AfterScroll(DataSet: TDataSet);
begin
  if FormDataVrem.Visible then
    DateTime(DataSet);
  if FormVarTar.Visible then
    VarTar(DataSet);
  if FormPomesPotr.Visible then
    MesPotr(DataSet);
  if FormNa1Chislo.Visible then
    Na1ChisloMes(DataSet);
  if FormPower.Visible then
    Power(DataSet);
  if FormOtklPodkl.Visible then
    OtklPodkl(DataSet);
  if FormTarNak.Visible then
    TarNak(DataSet);
  if FormTarPerehodi.Visible then
    TarPerehodi;
end;

procedure Tdm1.tmp_1AfterScroll(DataSet: TDataSet);
var
  TEM_104: Boolean;
begin
  Form1.sGroupBox7.Visible := false;
  Form1.sGroupBox6.Enabled := true;
  TEM_104 := false;
  if (not (DataSet as TpFIBDataSet).IsEmpty) and ((DataSet as TpFIBDataSet).FieldByName('sdf').AsString <> '') then
    if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 1 then
      Form1.sLabel8.Caption := 'Однофазный счётчик'
    else if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 4 then
      Form1.sLabel8.Caption := 'Трёхфазный счётчик (общего потребления)'
    else if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 3 then
      Form1.sLabel8.Caption := 'Трёхфазный счётчик (суммирующий)'
    else if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 5 then
    begin
      Form1.sLabel8.Caption := 'Теплосчётчик ТЭМ-104';
      Form1.sGroupBox7.Visible := true;
      Form1.sGroupBox6.Enabled := false;
      TEM_104 := True;
    end;
  if not TEM_104 then
    Tmp_1_2_AfterScroll(DataSet as TpFIBDataSet);
end;

procedure Tdm1.tmp_2AfterScroll(DataSet: TDataSet);
var
  TEM_104: Boolean;
begin
  Form1.sGroupBox7.Visible := false;
  Form1.sGroupBox6.Enabled := true;
  TEM_104 := false;
  if (not (DataSet as TpFIBDataSet).IsEmpty) and ((DataSet as TpFIBDataSet).FieldByName('sdf').AsString <> '') then
    if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 1 then
      Form1.sLabel9.Caption := 'Однофазный счётчик'
    else if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 4 then
      Form1.sLabel9.Caption := 'Трёхфазный счётчик (общего потребления)'
    else if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 3 then
      Form1.sLabel9.Caption := 'Трёхфазный счётчик (суммирующий)'
    else if (DataSet as TpFIBDataSet).FieldByName('sdf').asInteger = 5 then
    begin
      Form1.sLabel9.Caption := 'Теплосчётчик ТЭМ-104';
      Form1.sGroupBox7.Visible := true;
      Form1.sGroupBox6.Enabled := false;
      TEM_104 := True
    end;

  if not TEM_104 then
    Tmp_1_2_AfterScroll(DataSet as TpFIBDataSet);
end;

procedure Tdm1.tmp_3xfPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action := daAbort;
end;

procedure Tdm1.tmp_korrektID_COUNTER_TYPEChange(Sender: TField);
var
  sql: TpFIBQuery;
begin
  if Sender.NewValue = 0 then
    Exit;
  if Sender.OldValue <> Sender.NewValue then
  begin
    sql := TpFIBQuery.Create(nil);
    sql.Database := dm1.database;
    sql.Transaction := dm1.transact1;
    with sql do
    begin
      SQL.Text := 'select ns from tmp where ns = :ns and id_counter_type = :id_counter_type';
      ParamByName('id_counter_type').AsInteger := dm1.tmp_korrektID_COUNTER_TYPE.AsInteger;
      ParamByName('ns').AsString := tmp_korrektNS.AsString;
      ExecQuery;
      if not Eof then
      begin
        Application.MessageBox('  Счетчик с таким номером и ' + #13#10 +
          'такого типа уже  есть в базе!', 'Повтор счетчика!', MB_OK + MB_ICONWARNING);
        Sender.NewValue := Sender.OldValue;
        Exit;
      end;
    end;
  end;
end;

procedure Tdm1.tmp_korrektNSChange(Sender: TField);
begin
  if (tmp_korrekt.State <> dsInsert) and (Pos('#', Sender.OldValue) = 0) and (not FormSamSchetchika.Visible) then
  begin
    Form1.ActionSamSchetchikaExecute(self);
  end;
end;

procedure Tdm1.tmp_korrektPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  sql: TpFIBQuery;
  SqlText: string;
begin
  if flagDobavlNewSchetch then
    exit;
  sql := TpFIBQuery.Create(nil);
  with sql do
  begin
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultTransaction;
      SQL.Text :=
        'select inc, addr from addresmain where inc = (select cod from addres where inc = (select cod from tmp where NS = ''' +
        tmp_korrektNS.AsString + '''))';
      ExecQuery;
      SqlText := FN('addr').AsString;
      Application.MessageBox(PChar('Счётчик с таким номером уже есть в базе по адресу ' + SqlText),
        'Дублирование счетчика', MB_OK + MB_ICONWARNING);
    finally
      Free;
    end;
  end;
  Action := daAbort;
end;

procedure Tdm1.tmp_korrektPPLATChange(Sender: TField);
var
  vid: string;
begin
  vid := Form1.DBGridEh3.Columns[2].DisplayText;
  if vid = 'однофазный' then
  begin
    tmp_korrektSDF.AsString := '1';
    if tmp_korrektPHONE.AsString = '11' then
      tmp_korrektPHONE.AsString := '1'
  end
  else if vid = 'трёхфазный квартирный' then
  begin
    tmp_korrektSDF.AsString := '2';
    if tmp_korrektPHONE.AsString = '11' then
      tmp_korrektPHONE.AsString := '1'
  end
  else if vid = 'трёхфазный суммирующий' then
  begin
    tmp_korrektSDF.AsString := '3';
    if tmp_korrektPHONE.AsString = '11' then
      tmp_korrektPHONE.AsString := '1'
  end
  else if vid = 'трёхфазный общего потребления' then
  begin
    tmp_korrektSDF.AsString := '4';
    if tmp_korrektPHONE.AsString = '11' then
      tmp_korrektPHONE.AsString := '1'
  end
  else if vid = 'теплосчетчик ТЭМ-104' then
  begin
    tmp_korrektSDF.AsString := '5';
    tmp_korrektPHONE.AsInteger := 11;
  end;
end;

procedure Tdm1.townAfterOpen(DataSet: TDataSet);
begin
  Form1.DBLookupComboboxEh1.KeyValue := townINC.AsInteger;
end;

end.

