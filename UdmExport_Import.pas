unit UdmExport_Import;

interface

uses
  SysUtils, Classes,  DBClient, DB,
  FIBDataSet, pFIBDataSet, Forms, Windows, ZipMstr19;
  //ztvBase, ztvUnZIP, ztvRegister, ztvZip,

type
  TdmExport_Import = class(TDataModule)
    addresmainQ: TpFIBDataSet;
    addresQ: TpFIBDataSet;
    tmpQ: TpFIBDataSet;
    kv_konfigQ: TpFIBDataSet;
    tmp_3xfQ: TpFIBDataSet;
    arhivQ: TpFIBDataSet;
    profmainQ: TpFIBDataSet;
    kv_konfig_arhQ: TpFIBDataSet;
    sys_bdQ: TpFIBDataSet;
    koncenQ: TpFIBDataSet;
    DSaddresmainQ: TDataSource;
    DSaddresQ: TDataSource;
    DStmpQ: TDataSource;
    DSkv_konfigQ: TDataSource;
    DStmp_3xfQ: TDataSource;
    DSarhivQ: TDataSource;
    DSprofmainQ: TDataSource;
    DSkv_konfig_arhQ: TDataSource;
    DSsys_bdQ: TDataSource;
    DSkoncenQ: TDataSource;
    CDS_addresmain: TClientDataSet;
    CDS_addres: TClientDataSet;
    CDS_tmp: TClientDataSet;
    CDS_kv_konfig: TClientDataSet;
    CDS_tmp_3xf: TClientDataSet;
    CDS_arhiv: TClientDataSet;
    CDS_profmain: TClientDataSet;
    CDS_kv_konfig_arh: TClientDataSet;
    CDS_sys_bd: TClientDataSet;
    CDS_koncen: TClientDataSet;
    DSaddresmain: TDataSource;
    DSaddres: TDataSource;
    DStmp: TDataSource;
    DSkv_konfig: TDataSource;
    DStmp_3xf: TDataSource;
    DSarhiv: TDataSource;
    DSprofmain: TDataSource;
    DSkv_konfig_arh: TDataSource;
    DSsys_bd: TDataSource;
    DSkoncen: TDataSource;
    profmainQINC: TFIBIntegerField;
    profmainQCOD: TFIBIntegerField;
    profmainQDATA: TFIBStringField;
    profmainQPROFIL: TFIBMemoField;
    profmainQREZ: TFIBStringField;
    profmainQCHEC: TFIBIntegerField;
    ZipMaster1: TZipMaster19;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExportData():Boolean;
  end;

var
  dmExport_Import: TdmExport_Import;

implementation

uses Udm1, UExport;

{$R *.dfm}

{ TdmExport_Import }

procedure TdmExport_Import.DataModuleCreate(Sender: TObject);
begin
  ZipMaster1.DLLDirectory := ExtractFilePath(Application.ExeName) + 'DLL';
end;

procedure TdmExport_Import.DataModuleDestroy(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TClientDataSet) and (TClientDataSet(Components[i]).Active) then
      (Components[i] as TClientDataSet).Close
    else
      if (Components[i] is TpFIBDataSet) and (TpFIBDataSet(Components[i]).Active) then
        (Components[i] as TpFIBDataSet).Close;
end;

function TdmExport_Import.ExportData: Boolean;
  procedure SaveTable(CDS: TClientDataSet; FDS: TpFIBDataSet; nameFile: string);
  var
    i: integer;
  begin
    if not CDS.Active then
      CDS.Open;
    CDS.EmptyDataSet;
    while not FDS.Eof do
    begin
      CDS.Append;
      for i := 0 to CDS.FieldCount - 1 do
        begin
          if FDS.FindField(CDS.Fields[i].FieldName) <> nil then
            CDS.Fields[i].AsVariant := FDS.FindField(CDS.Fields[i].FieldName).AsVariant;
        end;
      try
        CDS.Post;
      except

      end;
      FDS.Next;
      FormExport.sGauge1.Progress := FormExport.sGauge1.Progress + 1;
      Application.ProcessMessages;
    end;
    CDS.SaveToFile(ExtractFilePath(Application.ExeName) + nameFile + '.fzs_exp', dfBinary);
  end;
var
  i: integer;
begin
  //открытие наборов данных
    try
      addresmainQ.Open;
      if addresmainQ.RecordCount > 10 then
        if Application.MessageBox('ƒл€ экспотра выбрано большое количество адресов (>10)!' + #13#10 +
                                  '            Ќе рекомендуетс€ дл€ слабых компьютеров!' + #13#10 +
                                  '                            ѕродолжить!', '¬нимание!', MB_YESNO+MB_ICONWARNING) <> IDYES then
          begin
            addresmainQ.Close;
            Exit;
          end;
      addresQ.Open;
      tmpQ.Open;
      kv_konfigQ.Open;
      tmp_3xfQ.Open;
      arhivQ.Open;
      profmainQ.Open;
      kv_konfig_arhQ.Open;
      sys_bdQ.Open;
      koncenQ.Open;
    except
      addresmainQ.Close;
      addresQ.Close;
      tmpQ.Close;
      kv_konfigQ.Close;
      tmp_3xfQ.Close;
      arhivQ.Close;
      profmainQ.Close;
      kv_konfig_arhQ.Close;
      sys_bdQ.Close;
      koncenQ.Close;
      Result := false;
    end;

  //ѕодсчет количества эксортируемых записей
  FormExport.sGauge1.MaxValue := addresmainQ.RecordCount + addresQ.RecordCount +
                                  tmpQ.RecordCount + kv_konfigQ.RecordCount +
                                  tmp_3xfQ.RecordCount + arhivQ.RecordCount +
                                  profmainQ.RecordCount + kv_konfig_arhQ.RecordCount +
                                  sys_bdQ.RecordCount + koncenQ.RecordCount;

  //-----------Ёкспорт данных о адресах------------
  //******'Ёксорт таблицы адреса*******
  SaveTable(CDS_addresmain, addresmainQ, 'addresmain');

  //**********Ёкпорт таблицы разъЄмов *********
  SaveTable(CDS_addres, addresQ, 'addres');

  //**********Ёкпорт таблицы счЄтчиков *********
  SaveTable(CDS_tmp, tmpQ, 'tmp');

  //**********Ёкпорт таблицы данных о счЄтчиках *********
  SaveTable(CDS_kv_konfig, kv_konfigQ, 'kv_konfig');

  //**********Ёкпорт таблицы баланса *********
  SaveTable(CDS_tmp_3xf, tmp_3xfQ, 'tmp_3xf');

  //**********Ёкпорт таблицы архивов *********
  SaveTable(CDS_arhiv, arhivQ, 'arhiv');

  //**********Ёкпорт таблицы профил€ нагрузки *********
  SaveTable(CDS_profmain, profmainQ, 'profmain');

  //**********Ёкпорт таблицы архивов потреблени€ *********
  SaveTable(CDS_kv_konfig_arh, kv_konfig_arhQ, 'kv_konfig_arh');

  //**********Ёкпорт таблицы sys_bd *********
  SaveTable(CDS_sys_bd, sys_bdQ, 'sys_bd');

  //**********Ёкпорт таблицы контцентраторов *********
  SaveTable(CDS_koncen, koncenQ, 'koncen');

  FormExport.sSaveDialog1.Filter := 'јрхивный файл экспорта|*.zip';
  FormExport.sSaveDialog1.DefaultExt := 'zip';
  if FormExport.sSaveDialog1.Execute then
    begin
      ZipMaster1.Dll_Load := true;
      ZipMaster1.Password := EmptyStr;
      ZipMaster1.ZipFileName := FormExport.sSaveDialog1.FileName;
      if FileExists(ZipMaster1.ZipFileName) then
        DeleteFile(PChar(ZipMaster1.ZipFileName));
      ZipMaster1.FSpecArgs.Add(ExtractFilePath(Application.ExeName) + '*.fzs_exp');
      //ZipMaster1.FSpecArgs.Add(ExtractFilePath(Application.ExeName) + 'pass.txt*MyNewPassword');
      if ZipMaster1.Add <> 0 then
        Application.MessageBox('ќшибка при упаковке файлов экспорта', 'ќшибка!', MB_OK+MB_ICONERROR);

    end;
  DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'addresmain.fzs_exp'));
  DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'addres.fzs_exp'));
  DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'tmp.fzs_exp'));
  DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'kv_konfig.fzs_exp'));
  DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'kv_konfig_arh.fzs_exp'));
  DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'profmain.fzs_exp'));
  DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'arhiv.fzs_exp'));
  DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'tmp_3xf.fzs_exp'));
  DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'koncen.fzs_exp'));
  DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'sys_bd.fzs_exp'));
  addresmainQ.Close;
  addresQ.Close;
  tmpQ.Close;
  kv_konfigQ.Close;
  tmp_3xfQ.Close;
  arhivQ.Close;
  profmainQ.Close;
  kv_konfig_arhQ.Close;
  sys_bdQ.Close;
  koncenQ.Close;
  DataModuleDestroy(Self);
  Result := true;
end;

end.
