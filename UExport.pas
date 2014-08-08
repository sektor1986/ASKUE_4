unit UExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, FIBDataSet, pFIBDataSet, StdCtrls,
  Buttons, sBitBtn, ExtCtrls, sPanel, pFIBQuery, Menus, QExport4, QExport4DBF,
  sGroupBox, sComboBox, sGauge, sComboBoxes, acShellCtrls, sDialogs, sMemo,
  sBevel, sCheckBox, DBGridEhGrouping;

type
  TFormExport = class(TForm)
    sPanel1: TsPanel;
    ExportEnergo: TpFIBDataSet;
    DSExpGomel: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    sPanel2: TsPanel;
    sRadioGroup1: TsRadioGroup;
    sRadioGroup2: TsRadioGroup;
    ExpGomelDbf: TQExport4DBF;
    sPanel3: TsPanel;
    DBGridEh1: TDBGridEh;
    addresmain_exp: TpFIBDataSet;
    DSaddresmain_exp: TDataSource;
    sGauge1: TsGauge;
    sBitBtn1: TsBitBtn;
    sComboBox1: TsComboBox;
    addresmain_expINC: TFIBIntegerField;
    addresmain_expADDR: TFIBStringField;
    addresmain_expREZ: TFIBIntegerField;
    addresmain_expREZ1: TFIBStringField;
    addresmain_expREZ2: TFIBStringField;
    addresmain_expCHEC: TFIBIntegerField;
    addresmain_expCHECKED: TFIBIntegerField;
    addresmain_expPIC: TFIBBlobField;
    addresmain_expDESCRIPTION: TFIBMemoField;
    addresmain_expTOWN: TFIBStringField;
    sSaveDialog1: TsSaveDialog;
    N2: TMenuItem;
    sMemo1: TsMemo;
    sBitBtn2: TsBitBtn;
    ExpVitebskDbf: TQExport4DBF;
    sBitBtn3: TsBitBtn;
    sBevel1: TsBevel;
    sRadioGroup3: TsRadioGroup;
    sCheckBox1: TsCheckBox;
    ExpMinskDbf: TQExport4DBF;
    procedure sBitBtn1Click(Sender: TObject);
    procedure sRadioGroup2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure addresmain_expAfterScroll(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure sRadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    DLLHandle: THandle;


    procedure ExpDataEnergosbit;
    procedure ExpStruktura;
    procedure ExpAllData;
    function LoadDllExp():Boolean;
  public
    procedure KonvertNa1Chislo(var blod: TStrings; tar_nak: TStrings; month: Word);
    procedure CreateTableExpGomel;
    { Public declarations }
  end;

var
  FormExport: TFormExport;

implementation

uses Udm1, UProcedure, Unit1, UdmExport_Import;

{$R *.dfm}
const
  mes: array[1..12] of String = ('Январь', 'Февраль', 'Март', 'Апрель', 'Май',
  'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь');
var expMes: integer;
    expScroll: Boolean;

procedure TFormExport.addresmain_expAfterScroll(DataSet: TDataSet);
var
  year: word;
  month: word;
  day: Word;
  maxMes: integer;
  i: integer;
  tempMes: integer;
  sql: TpFIBQuery;
  data: string;
  flagOpr: Boolean;
begin
  if not expScroll then
    exit;
  maxMes := 0;
  flagOpr := false;
  sql := TpFIBQuery.Create(nil);
  with sql do
  try
    Database :=  dm1.database;
    Transaction := dm1.database.DefaultTransaction;
    SQL.Text := 'select mes_pot_time from kv_konfig where cod in (select inc from tmp where cod in (select inc from addres where cod =' + addresmain_expINC.AsString + '))';
    Screen.Cursor := crSQLWait;
    ExecQuery;
    Screen.Cursor := crDefault;
    sComboBox1.Items.Clear;
    year := 0;
    month := 0;
    day := 0;
    while not Eof do
      begin
        data := Copy(FN('mes_pot_time').AsString, 8, 8);
        if data <> '' then
          try
            DecodeDate(StrToDate(data), year, month, day);
            tempMes := year*12 + month;
            flagOpr := true;
          except

          end;

        if (tempMes div 12) < 9999 then
          if maxMes < tempMes then
            maxMes := tempMes;
        Next;
      end;
    if not flagOpr then
      begin
        sComboBox1.Items.Add('Не опрашивался');
        sComboBox1.ItemIndex := 0;
        Exit;
      end;
  finally
    Free;
  end;
  expMes := maxMes - 11;       //Минимальный месяц для экспорта
  for i := maxMes-10-1 to maxMes-1-1 do
    sComboBox1.Items.Add(mes[(i mod 12)+1] + ' ' +IntToStr(i div 12));
  sComboBox1.ItemIndex := 9;
end;

procedure TFormExport.CreateTableExpGomel;
var
  sql: TpFIBQuery;
begin
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;

      Transaction.StartTransaction;
      SQL.Text := 'DROP table ExportEnergo';
      try
        ExecQuery;
        Transaction.Commit;
      except

      end;
      Close;
      Transaction.StartTransaction;
      SQL.Text := 'CREATE TABLE ExportEnergo' +
                          '(COD         INTEGER,'  +
                          'LIC_CH       CHAR(15),' +
                          'LIC_CH2      VARCHAR(15),' +
                          'LIC_CH3      VARCHAR(15),' +
                          'LIC_CH4      VARCHAR(15),' +
                          'REGISTR_NOMER CHAR(15),'+
                          'FIO          CHAR(40),' +
                          'NAM_PUNK     CHAR(20),' +
                          'NAS_STR      CHAR(20),' +
                          'DOM          CHAR(5),'  +
                          'KORP         CHAR(4),'  +
                          'KVAR         CHAR(4),'  +
                          'STAMP        DATE,'  +
                          'NOM_SCH      CHAR(20),' +
                          'D1           DATE,' +
                          'D2           DATE,' +
                          'VAL_K1       DECIMAL(11,2),' +
                          'VAL_MAX1     DECIMAL(11,2),' +
                          'VAL_MIN1     DECIMAL(11,2),' +
                          'VAL_K2       DECIMAL(11,2),' +
                          'VAL_MAX2     DECIMAL(11,2),' +
                          'VAL_MIN2     DECIMAL(11,2),' +
                          'R_MAX        DECIMAL(6,2),'  +
                          'R_MIN        DECIMAL(6,2),'  +
                          'R_ALL        DECIMAL(6,2),'  +

                          'POK_T3       DECIMAL(11,2),' +
                          'POK_T4       DECIMAL(11,2),' +
                          'POK_T5       DECIMAL(11,2),' +
                          'POK_HOUSE    DECIMAL(11,2),' +
                          'POK_ALL      DECIMAL(11,2),' +
                          'DATE_TIME    CHAR(14),' +
                          'FLAG         INTEGER)';
      ExecQuery;
      Transaction.Commit;
    finally
      Free;
      //ShowMessage('База  обновлена');
    end;
end;


procedure TFormExport.ExpAllData;
begin
  sGauge1.Progress := 0;
  expScroll := false;
  if addresmain_exp.IsEmpty then
    begin
      Application.MessageBox('Не выбрано ни одного адреса для экспорта', 'Предупреждение!', MB_OK+MB_ICONWARNING);
      Exit
    end;
  addresmain_exp.First;

end;

procedure TFormExport.ExpDataEnergosbit;
var
  sql: TpFIBQuery;
  year: Word;
  month: Word;
  day: Word;
  Hour: word;
  Min:  word;
  Sec:  word;
  Msec: word;
  nach: integer;
  kon: integer;
  maxExpMes: integer;
  countRec: integer;
  expMonth: integer;
  expMonthMin: integer;
  adres: string;
  nas_str: string;
  dom: string;
  korp: string;
  dataOpr: string;
  timeOpr: string;
  addr: string;
  expMogilev: TStrings;
  expMinsk: TStrings;
  errorSave: Boolean;
  blod: TStrings;
  tar_nak: TStrings;
  var_tar: TStrings;
  count_ls: Integer;
  i: Integer;
  label konec;
begin
  sGauge1.Progress := 0;
  expMonthMin := expMes;
  sMemo1.Clear;
  Application.ProcessMessages;
  expMogilev := TStringList.Create;
  expMinsk := TStringList.Create;
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      Transaction.StartTransaction;

      SQL.Text := 'delete from ExportEnergo'; //Очистка таблицы
      ExecQuery;
      Transaction.Commit;
      Transaction := dm1.database.DefaultTransaction;

      ExportEnergo.CloseOpen(false);
      countRec := 0;
      expScroll := false;
      addresmain_exp.First;
      while not addresmain_exp.Eof do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select INC, ns, ndog, ndog_2, ndog_3, ndog_4, ubank, fio, kv from tmp ' +
                      ' where cod in (select inc from addres where cod = ' + addresmain_expINC.AsString + ')');
          if sCheckBox1.Checked then
            SQL.Add(' and chec = 1');
          SQL.Add(' order by NDOG, KV, NS');
          ExecQuery;
          adres := addresmain_expADDR.AsString;
          nas_str := Copy(adres, 1, Pos( ',', adres)-1);
          dom := Trim(Copy(adres, Pos('дом', adres)+3, Pos('корпус', adres)-Pos('дом', adres)-5));
          korp := Trim(Copy(adres, Pos('корпус', adres)+6, 4));
          while not Eof do
            begin
              ExportEnergo.Append;
              ExportEnergo.FieldByName('COD').AsInteger := FieldByName('INC').AsInteger;
              ExportEnergo.FieldByName('NOM_SCH').AsString := FieldByName('NS').AsString;
              ExportEnergo.FieldByName('LIC_CH').AsString := FieldByName('NDOG').AsString;
              ExportEnergo.FieldByName('LIC_CH2').AsString := FieldByName('NDOG_2').AsString;
              ExportEnergo.FieldByName('LIC_CH3').AsString := FieldByName('NDOG_3').AsString;
              ExportEnergo.FieldByName('LIC_CH4').AsString := FieldByName('NDOG_4').AsString;
              ExportEnergo.FieldByName('REGISTR_NOMER').AsString := FieldByName('UBANK').AsString;
              if sRadioGroup1.ItemIndex = 4 then
                begin
                  ExportEnergo.FieldByName('FIO').AsString := 'VZEP';
                  ExportEnergo.FieldByName('NAM_PUNK').AsString := 'ЭЭ 8003'
                end
              else
                begin
                  ExportEnergo.FieldByName('FIO').AsString := FieldByName('FIO').AsString;
                  ExportEnergo.FieldByName('NAM_PUNK').AsString := dm1.townTOWN.AsString;
                end;

              ExportEnergo.FieldByName('NAS_STR').AsString := nas_str;
              ExportEnergo.FieldByName('DOM').AsString := dom;
              ExportEnergo.FieldByName('KORP').AsString := korp;
              ExportEnergo.FieldByName('KVAR').AsString := FieldByName('KV').AsString;
              ExportEnergo.Post;
              Inc(countRec);
              Next;
            end;
          addresmain_exp.Next;
        end;
        expScroll := true;
    finally
      Free
    end;

    ExportEnergo.First;
    blod := TStringList.Create;
    sql := TpFIBQuery.Create(nil);
    with sql do
      try
        Database := dm1.database;
        Transaction := dm1.database.DefaultTransaction;
        maxExpMes := expMonthMin + 10;
        expMonth := expMonthMin + sComboBox1.ItemIndex;

        if (expMonth mod 12) = 0 then
          begin
            kon := 0;
            nach := 11;
          end
        else
          begin
            kon := expMonth mod 12;
            nach := (expMonth mod 12) - 1;
          end;

        sGauge1.MaxValue := countRec;
        while not ExportEnergo.Eof do
          begin
            errorSave := false;
            sGauge1.Progress := sGauge1.Progress + 1;
            Close;
            SQL.Clear;
            SQL.Add('select mes_pot, mes_pot_time, tar_nak, addr, var_tar from kv_konfig, tmp ' +
                    ' where kv_konfig.cod = (select inc from tmp where inc =' +
                    ExportEnergo.FBN('COD').AsString + ')');
            ExecQuery;
            blod.Clear;
            blod.Text := FN('mes_pot').AsString;
            //Дата - 20.12.04 Время - 11:42:35
            dataOpr := Copy(FN('mes_pot_time').AsString, Pos('Дата - ', FN('mes_pot_time').AsString) + 7, 8);
            timeOpr := Copy(FN('mes_pot_time').AsString, Pos('Время - ', FN('mes_pot_time').AsString) + 8, 8);
            if dataOPr = '' then
              begin
                sMemo1.Lines.Add('Нет данных для счётчика ' + ExportEnergo.FBN('NOM_SCH').AsString);
                with ExportEnergo do
                  expMinsk.Add(FN('LIC_CH').AsString + '^VZEP^' + FN('NOM_SCH').AsString + '^' + FN('NAS_STR').AsString + '^' + FN('DOM').AsString + '^' + FN('KORP').AsString + '^' + FN('KVAR').AsString + '^' +
                    '^' +  '^нет');
                goto konec;
              end;

            try
              DecodeDate(StrToDate(dataOpr), year, month, day);
              DecodeTime(StrToTime(timeOpr), Hour, Min, Sec, Msec);
            except
              sMemo1.Lines.Add('Ошибка даты считывания счётчика ' + ExportEnergo.FBN('NOM_SCH').AsString);
              errorSave := true;
            end;
            if errorSave then
              goto konec;

            if maxExpMes > (year*12+month-1) then
              begin
                sMemo1.Lines.Add('Для счётчика ' + ExportEnergo.FBN('NOM_SCH').AsString + ' отсутсвуют данные за этот период');
                with ExportEnergo do
                  expMinsk.Add(FN('LIC_CH').AsString + '^VZEP^' + FN('NOM_SCH').AsString + '^' + FN('NAS_STR').AsString + '^' + FN('DOM').AsString + '^' + FN('KORP').AsString + '^' + FN('KVAR').AsString + '^' +
                    '^' +  '^нет');
                goto konec;
              end;

            tar_nak := TStringList.Create;
            tar_nak.Clear;
            tar_nak.Text := FN('tar_nak').AsString;
            var_tar := TStringList.Create;
            var_tar.Clear;
            tar_nak.Text := FN('var_tar').AsString;
            try
              count_ls :=  StrToIntDef(tar_nak.Strings[2], 1);
            except
              count_ls := 1;
            end;
            if ((count_ls > 4) or (count_ls = 0)) then
              count_ls := 1;

            Close;
            SQL.Text := 'select addr, hashr from tmp where inc = ' + ExportEnergo.FBN('COD').AsString;
            ExecQuery;
            addr := FN('addr').AsString;
            if (addr = '1') or (addr = '') then
              try
                KonvertNa1Chislo(blod, tar_nak, month);
              except
                sMemo1.Lines.Add('Ошибка показаниий счётчика ' + ExportEnergo.FBN('NOM_SCH').AsString);
                errorSave := true;
              end;
            if errorSave then
              goto konec;

            ExportEnergo.Edit;
            ExportEnergo.FieldByName('STAMP').AsString := dataOpr;
            ExportEnergo.FieldByName('D1').AsString := '01.' + FormatFloat('00', nach+2 - 12*((nach+1) div 12)) + '.' + IntToStr(expMonth div 12);
            ExportEnergo.FieldByName('D2').AsString := '01.' + FormatFloat('00', kon+2 - 12*((kon+1) div 12)) + '.' + IntToStr((expMonth+1) div 12);
            ExportEnergo.FieldByName('VAL_MAX1').AsFloat := StrToFloatDef(blod.Strings[nach], 0);
            ExportEnergo.FieldByName('VAL_MAX2').AsFloat := StrToFloatDef(blod.Strings[kon], 0);
            ExportEnergo.FieldByName('VAL_MIN1').AsFloat := StrToFloatDef(blod.Strings[nach+13], 0);
            ExportEnergo.FieldByName('VAL_MIN2').AsFloat :=  StrToFloatDef(blod.Strings[kon+13], 0);
            ExportEnergo.FieldByName('POK_T3').AsFloat := StrToFloatDef(blod.Strings[kon+26], 0);
            ExportEnergo.FieldByName('POK_T4').AsFloat := StrToFloatDef(blod.Strings[kon+39], 0);
            ExportEnergo.FieldByName('POK_T5').AsFloat := 0;
            ExportEnergo.FieldByName('VAL_K1').AsFloat := ExportEnergo.FieldByName('VAL_MAX1').AsFloat + ExportEnergo.FieldByName('VAL_MIN1').AsFloat;
            ExportEnergo.FieldByName('VAL_K2').AsFloat := ExportEnergo.FieldByName('VAL_MAX2').AsFloat + ExportEnergo.FieldByName('VAL_MIN2').AsFloat;
            //Специально для Минска
            //ExportEnergo.FieldByName('VAL_K1').AsFloat := ExportEnergo.FieldByName('VAL_MAX1').AsFloat + ExportEnergo.FieldByName('VAL_MIN1').AsFloat + StrToFloatDef(blod.Strings[nach+26], 0) + StrToFloatDef(blod.Strings[nach+39], 0);;
            //ExportEnergo.FieldByName('VAL_K2').AsFloat := ExportEnergo.FieldByName('VAL_MAX2').AsFloat + ExportEnergo.FieldByName('VAL_MIN2').AsFloat + StrToFloatDef(blod.Strings[kon+26], 0) + StrToFloatDef(blod.Strings[kon+39], 0);

            ExportEnergo.FieldByName('R_MAX').AsFloat := ExportEnergo.FieldByName('VAL_MAX2').AsFloat - ExportEnergo.FieldByName('VAL_MAX1').AsFloat;
            ExportEnergo.FieldByName('R_MIN').AsFloat := ExportEnergo.FieldByName('VAL_MIN2').AsFloat - ExportEnergo.FieldByName('VAL_MIN1').AsFloat;
            ExportEnergo.FieldByName('R_ALL').AsFloat := ExportEnergo.FieldByName('R_MAX').AsFloat + ExportEnergo.FieldByName('R_MIN').AsFloat;
            ExportEnergo.FieldByName('POK_ALL').AsFloat := ExportEnergo.FieldByName('VAL_K2').AsFloat + ExportEnergo.FieldByName('POK_T3').AsFloat + ExportEnergo.FieldByName('POK_T4').AsFloat;
            if FN('HASHR').AsInteger <> 1 then
              ExportEnergo.FieldByName('FLAG').AsInteger := 0
            else
              ExportEnergo.FieldByName('FLAG').AsInteger := 1;
            ExportEnergo.FieldByName('DATE_TIME').AsString := IntToStr(year) + FormatFloat('00', month) + FormatFloat('00', day) + FormatFloat('00', Hour) + FormatFloat('00', Min) + FormatFloat('00', Sec);
            ExportEnergo.Post;
            dataOpr := ExportEnergo.FieldByName('D2').AsString;
            if sRadioGroup3.ItemIndex = 0 then
              dataOpr := DateToStr(StrToDate(dataOpr)-1);
            with ExportEnergo do
              begin
                ExpMogilev.Add(Copy(dataOpr, 0, 2) + '/' + Copy(dataOpr, 4, 2) + '/20' + Copy(dataOpr, 9, 2) + ';' + FN('REGISTR_NOMER').AsString + ';' + FN('LIC_CH').AsString + ';' + FN('NOM_SCH').AsString + ';' +
                                      FN('FIO').AsString + ';г. ' + FN('NAM_PUNK').AsString + ', ' + FN('NAS_STR').AsString + ' ' + FN('DOM').AsString + ' к. ' + FN('KORP').AsString + ', кв. ' + FN('KVAR').AsString + ';' +
                                      IntToStr(round(FN('VAL_MAX2').AsFloat)) + ';' + IntToStr(round(FN('VAL_MIN2').AsFloat)) + ';' + IntToStr(round(FN('POK_T3').AsFloat)) + ';' + IntToStr(round(FN('POK_T4').AsFloat)));

                // В зависимости от количества действующих тарифов выгрузка происходит либо по одному лицевому счету
                // либо по каждому тарифу (разные лицевые счета)
                if count_ls = 1 then
                begin
                  expMinsk.Add(FN('LIC_CH').AsString + '^VZEP^' + FN('NOM_SCH').AsString + '^' + FN('NAS_STR').AsString + '^' + FN('DOM').AsString + '^' + FN('KORP').AsString + '^' + FN('KVAR').AsString + '^' +
                                      Copy(dataOpr, 0, 2) + '/' + Copy(dataOpr, 4, 2) + '/20' + Copy(dataOpr, 9, 2) + '^' + FN('POK_ALL').AsString + '^да')
                end
                else
                begin
                  for i := 1 to count_ls do
                  begin
                    case i of
                      1:
                        expMinsk.Add(FN('LIC_CH').AsString + '^VZEP^' + FN('NOM_SCH').AsString + '^' + FN('NAS_STR').AsString + '^' + FN('DOM').AsString + '^' + FN('KORP').AsString + '^' + FN('KVAR').AsString + '^' +
                                      Copy(dataOpr, 0, 2) + '/' + Copy(dataOpr, 4, 2) + '/20' + Copy(dataOpr, 9, 2) + '^' + FN('VAL_MAX2').AsString + '^да');
                      2:
                        expMinsk.Add(FN('LIC_CH2').AsString + '^VZEP^' + FN('NOM_SCH').AsString + '^' + FN('NAS_STR').AsString + '^' + FN('DOM').AsString + '^' + FN('KORP').AsString + '^' + FN('KVAR').AsString + '^' +
                                      Copy(dataOpr, 0, 2) + '/' + Copy(dataOpr, 4, 2) + '/20' + Copy(dataOpr, 9, 2) + '^' + FN('VAL_MIN2').AsString + '^да');
                      3:
                        expMinsk.Add(FN('LIC_CH3').AsString + '^VZEP^' + FN('NOM_SCH').AsString + '^' + FN('NAS_STR').AsString + '^' + FN('DOM').AsString + '^' + FN('KORP').AsString + '^' + FN('KVAR').AsString + '^' +
                                      Copy(dataOpr, 0, 2) + '/' + Copy(dataOpr, 4, 2) + '/20' + Copy(dataOpr, 9, 2) + '^' + FN('POK_T3').AsString + '^да');
                      4:
                        expMinsk.Add(FN('LIC_CH4').AsString + '^VZEP^' + FN('NOM_SCH').AsString + '^' + FN('NAS_STR').AsString + '^' + FN('DOM').AsString + '^' + FN('KORP').AsString + '^' + FN('KVAR').AsString + '^' +
                                      Copy(dataOpr, 0, 2) + '/' + Copy(dataOpr, 4, 2) + '/20' + Copy(dataOpr, 9, 2) + '^' + FN('POK_T4').AsString + '^да');
                    end;
                  end;
                end;
              end;
          konec:
            ExportEnergo.Next;
          end;
      finally

      end;

      case sRadioGroup1.ItemIndex of
        0, 1, 4: begin
                sSaveDialog1.Filter := 'Файл экспорта|*.dbf';
                sSaveDialog1.DefaultExt := 'dbf';
              end;
        2:  begin
              sSaveDialog1.FileName := Copy(dataOpr, 9, 2) + Copy(dataOpr, 4, 2) + Copy(dataOpr, 0, 2);
              sSaveDialog1.Filter := 'Файл экспорта|*.obh';
              sSaveDialog1.DefaultExt := 'obh';
            end;
        3 : begin
              sSaveDialog1.Filter := 'Файл экспорта|*.txt';
              sSaveDialog1.DefaultExt := 'txt';
            end;
      end;
      if sSaveDialog1.Execute then
        case sRadioGroup1.ItemIndex of
          0:  begin
                ExpVitebskDbf.FileName := sSaveDialog1.FileName;
                ExpVitebskDbf.Execute;
              end;

          1:  begin
                ExpGomelDbf.FileName := sSaveDialog1.FileName;
                ExpGomelDbf.Execute;
              end;

          2:  begin
                ExpMogilev.Text := WinToDOS(ExpMogilev.Text);
                expMogilev.SaveToFile(sSaveDialog1.FileName);
                expMogilev.Free;
              end;

          3:  begin
                expMinsk.SaveToFile(sSaveDialog1.FileName);
                expMinsk.Free;
              end;
              
          4:  begin
                ExpMinskDbf.FileName := sSaveDialog1.FileName;
                ExpMinskDbf.Execute;
              end;
        end;
end;

procedure TFormExport.ExpStruktura;
type
  proc1 = function (Path: string;
                    data: Integer): Integer;
  proc2 = function (Street: String;
                    kv : String;
                    ns: String;
                    sdf: String;
                    vartar:String;
                    desk:String): Integer;
  proc3 = function (data:integer): Integer;
  proc4 = function ():Integer;
  proc5 = function (KV:Integer;
                    NS:String;
                    SDF:Integer;
                    PHONE: String;
                    DESCRIPTION: String;
                    LSCHET,UBANK: String;
                    VAR_TAR:String;
                    VAR_TAR1:String;
                    TAR_NAK:String;
                    TAR_NAK1:String;
                    MES_POT:String;
                    MES_POT1:String;
                    POWER:String;
                    POWER1:String;
                    POT_OTK:String;
                    POT_OTK1:String;
                    TIME0:String;
                    TIME1:String;
                    TIMES:String;
                    TIMEC:String;
                    VAR_TAR_TIME,VAR_TAR_TIME1,TAR_NAK_TIME,TAR_NAK_TIME1,
                    POWER_TIME,POWER_TIME1,MES_POT_TIME,MES_POT_TIME1,POT_OTK_TIME,POT_OTK_TIME1,
                    TIME_SCH,FDT,FDP:String;
                    MES:Integer;
                    PROF_NAGR,PROF_NAGR1,PROF_NAGR_TIME,PROF_NAGR_TIME1:String):Integer;
  proc6 = function (M1,
                    M2,
                    M3,
                    M4,
                    M5,
                    M6,
                    M7,
                    M8,
                    M9,
                    M10,
                    M11,
                    M12,
                    GOD:String;
                    REZ:Integer):Integer;
  proc7 = function (DATA,
                    PROFIL,
                    REZ:String):Integer;
  proc8 = function (VARTAR1,
                    VARTAR2,
                    VARTAR3,
                    VARTAR4,
                    VARTAR5,
                    VARTAR6,
                    VARTAR7,
                    VARTAR8,
                    VARTAR9,
                    VARTAR10:String):Integer;

var
  CreateImpExp: proc1;
  Exp : proc2;
  SaveExp: proc3;
  CloseImp: proc4;
  ExpDMAIN: proc5;
  ExpDARHIV: proc6;
  ExpDPROF: proc7;
  ExpDVARTAR: proc8;
  sqlAddres: TpFIBQuery;
  sqlTmp: TpFIBQuery;
  sqlKv_konfig: TpFIBQuery;
  sqlArhiv: TpFIBQuery;
  sqlProfmain: TpFIBQuery;
  kvs, nss, sdfs, vartars, descs: string;
  allExport: Byte;
begin
  expScroll := false;
  if addresmain_exp.IsEmpty then
    begin
      Application.MessageBox('Не выбрано ни одного адреса для экспорта', 'Предупреждение!', MB_OK+MB_ICONWARNING);
      Exit
    end;
  //****************Загрузка dll и функций**************
  LoadDllExp;
  @CreateImpExp := GetProcAddress(DLLHandle, 'CreateImpExp');
  @Exp := GetProcAddress(DLLHandle, 'Exp');
  @SaveExp := GetProcAddress(DLLHandle, 'SaveExp');
  @CloseImp := GetProcAddress(DLLHandle, 'CloseImp');
  @ExpDMAIN := GetProcAddress(DLLHandle, 'ExpDMAIN');
  @ExpDARHIV := GetProcAddress(DLLHandle, 'ExpDARHIV');
  @ExpDPROF := GetProcAddress(DLLHandle, 'ExpDPROF');
  @ExpDVARTAR := GetProcAddress(DLLHandle, 'ExpDVARTAR');
  //-------------------------------------------------

  allExport := sRadioGroup2.ItemIndex;    //Вид экспорта если 1 - все данные, если 0 - только структура

  if CreateImpExp(PChar(ExtractFilePath(Application.ExeName)), allExport) = 0 then
    begin
      Application.MessageBox('Ошибка выполнения функции создания экспорта', 'Ошибка!!!', MB_OK+MB_ICONERROR);
      Exit
    end;
  sGauge1.MaxValue := addresmain_exp.RecordCount;
  addresmain_exp.First;
  //Запрос для разъёма
  sqlAddres := TpFIBQuery.Create(nil);
  sqlAddres.Database := dm1.database;
  sqlAddres.Transaction := dm1.database.DefaultTransaction;
  sqlAddres.SQL.Text := 'select * from addres where cod = :inc order by inc, street';
  //Запрос для счетчика
  sqlTmp := TpFIBQuery.Create(nil);
  sqlTmp.Database := dm1.database;
  sqlTmp.Transaction := dm1.database.DefaultTransaction;
  sqlTmp.SQL.Text := 'select * from tmp where cod = :inc order by inc';
  if allExport = 1 then
    begin
      //Запрос для данных счётчика
      sqlKv_konfig := TpFIBQuery.Create(nil);
      sqlKv_konfig.Database := dm1.database;
      sqlKv_konfig.Transaction := dm1.database.DefaultTransaction;
      sqlKv_konfig.SQL.Text := 'select * from kv_konfig where cod = :inc';
      //Запрос для архивных данных счётчика
      sqlArhiv := TpFIBQuery.Create(nil);
      sqlArhiv.Database := dm1.database;
      sqlArhiv.Transaction := dm1.database.DefaultTransaction;
      sqlArhiv.SQL.Text := 'select * from arhiv where cod = :inc';
      //Запрос для профиля нагрузки счётчика
      sqlProfmain := TpFIBQuery.Create(nil);
      sqlProfmain.Database := dm1.database;
      sqlProfmain.Transaction := dm1.database.DefaultTransaction;
      sqlProfmain.SQL.Text := 'select * from profmain where cod = :inc';
    end;
  while not addresmain_exp.eof do
    begin
      sqlAddres.Close;
      //sqlAddres.SQL.Text := 'select * from addres where cod = :inc order by inc, street';
      sqlAddres.ParamByName('inc').AsInteger := addresmain_expINC.AsInteger;
      sqlAddres.ExecQuery;
      while not sqlAddres.Eof do
        begin
          sqlTmp.Close;
          //sqlTmp.SQL.Text := 'select * from tmp where cod = :inc order by inc';
          sqlTmp.ParamByName('inc').AsInteger := sqlAddres.FieldByName('inc').AsInteger;
          sqlTmp.ExecQuery;
          kvs := '';
          nss := '';
          sdfs := '';
          vartars := '';
          descs := '';
          while not sqlTmp.Eof do
            begin
              kvs := kvs + sqlTmp.FN('KV').AsString + Char(#13);
              nss := nss + sqlTmp.FN('NS').AsString + Char(#13);
              sdfs := sdfs + sqlTmp.FN('SDF').AsString + Char(#13);
              vartars := vartars + sqlTmp.FN('PHONE').AsString + Char(#13);
              descs := descs + sqlTmp.FN('DESCRIPTION').AsString + Char(#13);
              sqlTmp.Next;
            end;
          if Exp(sqlAddres.FN('STREET').AsString, kvs, nss, sdfs, vartars, descs) = 0 then
            begin
              Application.MessageBox('Ошибка экспорта', 'Ошибка!!!', MB_OK+MB_ICONERROR);
              CloseImp;
              Exit;
            end;

          if allExport = 1 then
            begin
              sqlTmp.Close;
              sqlTmp.ExecQuery;
              while not sqlTmp.Eof do
                begin
                  sqlKv_konfig.Close;
                  sqlKv_konfig.ParamByName('inc').AsInteger := sqlTmp.FN('inc').AsInteger;
                  sqlKv_konfig.ExecQuery;
                  ExpDMAIN(sqlTmp.FN('KV').AsInteger,
                          sqlTmp.FN('NS').AsString,
                          sqlTmp.FN('SDF').AsInteger,
                          sqlTmp.FN('PHONE').AsString,
                          sqlTmp.FN('DESCRIPTION').AsString,
                          sqlTmp.FN('LSCHET').AsString,
                          sqlTmp.FN('UBANK').AsString,
                          sqlKv_konfig.FN('VAR_TAR').AsString,
                          sqlKv_konfig.FN('VAR_TAR1').AsString,
                          sqlKv_konfig.FN('TAR_NAK').AsString,
                          sqlKv_konfig.FN('TAR_NAK1').AsString,
                          sqlKv_konfig.FN('MES_POT').AsString,
                          sqlKv_konfig.FN('MES_POT1').AsString,
                          sqlKv_konfig.FN('POWER').AsString,
                          sqlKv_konfig.FN('POWER1').AsString,
                          sqlKv_konfig.FN('POT_OTK').AsString,
                          sqlKv_konfig.FN('POT_OTK1').AsString,
                          sqlKv_konfig.FN('TIME0').AsString,
                          sqlKv_konfig.FN('TIME1').AsString,
                          sqlKv_konfig.FN('TIMES').AsString,
                          sqlKv_konfig.FN('TIMEC').AsString,
                          sqlKv_konfig.FN('VAR_TAR_TIME').AsString,
                          sqlKv_konfig.FN('VAR_TAR_TIME1').AsString,
                          sqlKv_konfig.FN('TAR_NAK_TIME').AsString,
                          sqlKv_konfig.FN('TAR_NAK_TIME1').AsString,
                          sqlKv_konfig.FN('POWER_TIME').AsString,
                          sqlKv_konfig.FN('POWER_TIME1').AsString,
                          sqlKv_konfig.FN('MES_POT_TIME').AsString,
                          sqlKv_konfig.FN('MES_POT_TIME1').AsString,
                          sqlKv_konfig.FN('POT_OTK_TIME').AsString,
                          sqlKv_konfig.FN('POT_OTK_TIME1').AsString,
                          sqlKv_konfig.FN('TIME_SCH').AsString,
                          sqlKv_konfig.FN('FDT').AsString,
                          sqlKv_konfig.FN('FDP').AsString,
                          sqlKv_konfig.FN('MES').AsInteger,
                          sqlKv_konfig.FN('PROF_NAGR').AsString,
                          sqlKv_konfig.FN('PROF_NAGR1').AsString,
                          sqlKv_konfig.FN('PROF_NAGR_TIME').AsString,
                          sqlKv_konfig.FN('PROF_NAGR_TIME1').AsString);

                  sqlArhiv.Close;
                  sqlArhiv.ParamByName('inc').AsInteger := sqlTmp.FN('inc').AsInteger;
                  sqlArhiv.ExecQuery;
                  while not sqlArhiv.Eof do
                    begin
                      ExpDARHIV(sqlArhiv.FN('M1').AsString,
                                sqlArhiv.FN('M2').AsString,
                                sqlArhiv.FN('M3').AsString,
                                sqlArhiv.FN('M4').AsString,
                                sqlArhiv.FN('M5').AsString,
                                sqlArhiv.FN('M6').AsString,
                                sqlArhiv.FN('M7').AsString,
                                sqlArhiv.FN('M8').AsString,
                                sqlArhiv.FN('M9').AsString,
                                sqlArhiv.FN('M11').AsString,
                                sqlArhiv.FN('M11').AsString,
                                sqlArhiv.FN('M12').AsString,
                                sqlArhiv.FN('GOD').AsString,
                                sqlArhiv.FN('REZ').AsInteger);
                      sqlArhiv.Next;
                    end;

                  sqlProfmain.Close;
                  sqlProfmain.ParamByName('inc').AsInteger := sqlTmp.FN('inc').AsInteger;
                  sqlProfmain.ExecQuery;
                  while not sqlProfmain.Eof do
                    begin
                      ExpDPROF(sqlProfmain.FN('DATA').AsString,
                                sqlProfmain.FN('PROFIL').AsString,
                                sqlProfmain.FN('REZ').AsString);
                      sqlProfmain.Next;
                    end;

                  sqlTmp.Next;
                end;
            end;
          sqlAddres.Next;
        end;
      sGauge1.Progress := sGauge1.Progress + 1;
      addresmain_exp.Next
    end;
  if SaveExp(allExport) = 0 then
    begin
      Application.MessageBox('Ошибка экспорта', 'Ошибка!!!', MB_OK+MB_ICONERROR);
      CloseImp;
      Exit;
    end;
  if DLLHandle <> 0 then
    FreeLibrary(DLLHandle);
  expScroll := true;
end;

procedure TFormExport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  addresmain_exp.Close;
end;

procedure TFormExport.FormShow(Sender: TObject);
begin
  expScroll := false;
  addresmain_exp.Open;
  if addresmain_exp.Eof then
    begin
      Application.MessageBox('Не выбрано ни одного адреса для экспорта!', 'Предупреждение!', MB_OK+MB_ICONINFORMATION);
      addresmain_exp.Close;
      Exit;
    end;
  expScroll := true;
  addresmain_expAfterScroll(addresmain_exp);
end;

procedure TFormExport.KonvertNa1Chislo(var blod: TStrings; tar_nak: TStrings; month: Word);
var
  q,i: integer;
  tar_nak_summ: array[0..3] of string;
  tar_nak_tekmes: array[0..3] of string;
  tar_nak_tekgod: array[0..3] of string;
  temp: Real;
  tempBlod: TStrings;
begin

  for i := 0 to 3 do
   begin
      tar_nak_summ[i] := tar_nak.Strings[i];
      tar_nak_tekmes[i] := tar_nak.Strings[i+4];
      tar_nak_tekgod[i] := tar_nak.Strings[i+8];
   end;

  tempBlod := TStringList.Create;
  for i := 0 to 54 do
    tempBlod.Add('');

  for i := 1 to 4 do
    begin
      tempBlod.Strings[13*i-1] := FormatFloat('000000.00', StrToFloat(tar_nak_summ[i-1])-StrToFloat(tar_nak_tekgod[i-1]))
    end;
  for q := 0 to 3 do
    begin
    temp  := StrToFloat(tar_nak_summ[q])-StrToFloat(tar_nak_tekmes[q]);
    tempBlod.Strings[((month+12-2) mod 12) +q*13] := FormatFloat('000000.00', temp);
      for i := month-3 downto 0 do
        begin
          temp := temp - StrToFloat(blod.Strings[((i+1) mod 12)+q*13]);
          tempBlod.Strings[i+q*13] := FormatFloat('000000.00', temp)
        end;
      for i := 11 downto month-1 do
        if not ((month = 1) and (i = 11)) then
          begin
            temp := temp - StrToFloat(blod.Strings[((i+1) mod 12)+q*13]);
            tempBlod.Strings[i+q*13] := FormatFloat('000000.00', temp);
          end;
    end;
  blod.Clear;
  blod.Text := tempBlod.Text;
end;

function TFormExport.LoadDllExp: Boolean;
begin
  try
    DLLHandle :=  LoadLibrary(PChar(ExtractFilePath(Application.ExeName) + '\DLL\export\DllImport.dll'));
  except
    exit;
  end;
  if DLLHandle = 0 then
    begin
      Application.MessageBox('Не найдена бибилиотека экспорта', 'Ошибка!', MB_OK+MB_ICONWARNING);
      Result := false;
      Exit;
    end;
end;

procedure TFormExport.N2Click(Sender: TObject);
begin
  CreateTableExpGomel;
end;

procedure TFormExport.sBitBtn1Click(Sender: TObject);
begin
  sGauge1.Progress := 0;
  case sRadioGroup2.ItemIndex of
  0:  ExpStruktura;
  1:  dmExport_Import.ExportData;
  2:  ExpDataEnergosbit;
  end;
end;

procedure TFormExport.sRadioGroup1Click(Sender: TObject);
begin
  sRadioGroup3.Visible := sRadioGroup1.ItemIndex in [2, 3];
end;

procedure TFormExport.sRadioGroup2Click(Sender: TObject);
begin
  sRadioGroup1.Visible := sRadioGroup2.ItemIndex = 2;
  sCheckBox1.Visible := sRadioGroup2.ItemIndex = 2;
  if not sRadioGroup1.Visible then
    sRadioGroup3.Visible := false
  else
    sRadioGroup1Click(self);
end;

procedure TFormExport.sBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFormExport.sBitBtn3Click(Sender: TObject);
begin
  sMemo1.Clear;
end;

end.
