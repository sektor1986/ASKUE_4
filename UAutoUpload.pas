unit UAutoUpload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, sBitBtn, sCheckBox, sComboBox,
  sSpinEdit, sEdit, sRadioButton, sGroupBox, sBevel,
  Mask, sMaskEdit, sCustomComboEdit, sTooledit, IniFiles, pFIBQuery, DB,
  FIBDataSet, pFIBDataSet, QExport4, QExport4DBF,
  sLabel, sMemo, uMySqlVio, uMysqlCT, uMysqlClient, uMysqlHelpers;

type
  TForm_AutoUpload = class(TForm)
    sBevel3: TsBevel;
    sGroupBox1: TsGroupBox;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sBevel4: TsBevel;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sRadioButton3: TsRadioButton;
    sTimePicker1: TsTimePicker;
    sSpinEdit1: TsSpinEdit;
    sTimePicker2: TsTimePicker;
    sTimePicker3: TsTimePicker;
    sRadioButton4: TsRadioButton;
    sTimePicker4: TsTimePicker;
    sComboBox1: TsComboBox;
    sCheckBox1: TsCheckBox;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sGroupBox2: TsGroupBox;
    sRadioButton5: TsRadioButton;
    sRadioButton6: TsRadioButton;
    Timer1: TTimer;
    sGroupBox3: TsGroupBox;
    sGroupBox4: TsGroupBox;
    sDirectoryEdit1: TsDirectoryEdit;
    sEdit1: TsEdit;
    ExportEnergo: TpFIBDataSet;
    addresmain_exp: TpFIBDataSet;
    addresmain_expINC: TFIBIntegerField;
    addresmain_expADDR: TFIBStringField;
    addresmain_expREZ1: TFIBStringField;
    addresmain_expREZ: TFIBIntegerField;
    addresmain_expREZ2: TFIBStringField;
    addresmain_expCHEC: TFIBIntegerField;
    addresmain_expCHECKED: TFIBIntegerField;
    addresmain_expPIC: TFIBBlobField;
    addresmain_expDESCRIPTION: TFIBMemoField;
    addresmain_expTOWN: TFIBStringField;
    Export_1: TQExport4DBF;
    sLabel1: TsLabel;
    sEdit2: TsEdit;
    sEdit3: TsEdit;
    sBitBtn3: TsBitBtn;
    sEdit4: TsEdit;
    sEdit5: TsEdit;
    sEdit6: TsEdit;
    sEdit7: TsEdit;
    sEdit8: TsEdit;
    sBitBtn4: TsBitBtn;
    sEdit9: TsEdit;
    procedure sRadioButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sTimePicker1Change(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
  private
    task: Boolean;
    MySQLClient: TMySQLClient;
    procedure LoadOptions();
    procedure SaveOptions();
    procedure UploadMySQL();
    procedure UploadDBF();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_AutoUpload: TForm_AutoUpload;

implementation

uses UFunction, UExport, Udm1, Unit1;

{$R *.dfm}

const
  mes: array[1..12] of string = ('Январь', 'Февраль', 'Март', 'Апрель', 'Май',
    'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь');
var
  expMes: integer;
  expScroll: Boolean;

procedure TForm_AutoUpload.FormCreate(Sender: TObject);
begin
  LoadOptions();
  MySQLClient := TMySQLClient.Create;
  MySQLClient.Host := sEdit4.Text;
  MySQLClient.port := StrToInt(sEdit5.Text);
  MySQLClient.user := sEdit7.text;
  MySQLClient.password := sEdit8.text;
  MySQLClient.Db := sEdit6.Text;
  MySQLClient.UseSSL := false;
  MySQLClient.Compress := true;
end;

procedure TForm_AutoUpload.FormShow(Sender: TObject);
begin
  LoadOptions();
  sRadioButton5Click(Self);
end;

procedure TForm_AutoUpload.LoadOptions;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
  sRadioButton1.Checked := IniFile.ReadBool('AutoUpload', 'EveryDay', False);
  sRadioButton2.Checked := IniFile.ReadBool('AutoUpload', 'monthly', False);
  sRadioButton3.Checked := IniFile.ReadBool('AutoUpload', 'once', False);
  sRadioButton4.Checked := IniFile.ReadBool('AutoUpload', 'Week', False);
  sCheckBox1.Checked := IniFile.ReadBool('AutoUpload', 'Enable', False);
  sTimePicker1.Text := IniFile.ReadString('AutoUpload', 'EveryDay_Time',
    '00:00:00');
  sTimePicker2.Text := IniFile.ReadString('AutoUpload', 'monthly_Time',
    '00:00:00');
  sTimePicker3.Text := IniFile.ReadString('AutoUpload', 'once_Time',
    '00:00:00');
  sTimePicker4.Text := IniFile.ReadString('AutoUpload', 'Week_Time',
    '00:00:00');
  sSpinEdit1.Value := IniFile.ReadInteger('AutoUpload', 'once_Day', 1);
  sComboBox1.ItemIndex := IniFile.ReadInteger('AutoUpload', 'once_Week', 0);

  if (IniFile.ReadInteger('AutoUpload', 'mode_upload', 0) = 0) then
    sRadioButton5.Checked := True
  else
    sRadioButton6.Checked := True;

  // Для выгрузки в dbf
  sDirectoryEdit1.Text := IniFile.ReadString('AutoUpload', 'Patch', '');
  sEdit1.Text := IniFile.ReadString('AutoUpload', 'mask', 'dd/mm/yy');
  sEdit2.Text := IniFile.ReadString('AutoUpload', 'prefix', '');
  sEdit3.Text := IniFile.ReadString('AutoUpload', 'postfix', '');

  // Для выгрузки в MySQL
  sEdit4.Text := IniFile.ReadString('AutoUpload', 'MySQL_HostName',
    'localhost');
  sEdit5.Text := IniFile.ReadString('AutoUpload', 'MySQL_Port', '3306');
  sEdit6.Text := IniFile.ReadString('AutoUpload', 'MySQL_Database', '');
  sEdit7.Text := IniFile.ReadString('AutoUpload', 'MySQL_User', 'root');
  sEdit8.Text := IniFile.ReadString('AutoUpload', 'MySQL_Password', '');
  sEdit9.Text := IniFile.ReadString('AutoUpload', 'MySQL_TableName',
    'export_gomel');
  Timer1.Enabled := IniFile.ReadBool('AutoUpload', 'Enable', False);
  IniFile.Free;
end;

procedure TForm_AutoUpload.SaveOptions;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
  IniFile.WriteBool('AutoUpload', 'EveryDay', sRadioButton1.Checked);
  IniFile.WriteBool('AutoUpload', 'monthly', sRadioButton2.Checked);
  IniFile.WriteBool('AutoUpload', 'once', sRadioButton3.Checked);
  IniFile.WriteBool('AutoUpload', 'Week', sRadioButton4.Checked);
  IniFile.WriteBool('AutoUpload', 'Enable', sCheckBox1.Checked);
  IniFile.WriteString('AutoUpload', 'EveryDay_Time', sTimePicker1.Text);
  IniFile.WriteString('AutoUpload', 'monthly_Time', sTimePicker2.Text);
  IniFile.WriteString('AutoUpload', 'once_Time', sTimePicker3.Text);
  IniFile.WriteString('AutoUpload', 'Week_Time', sTimePicker4.Text);
  IniFile.WriteInteger('AutoUpload', 'once_Day', sSpinEdit1.Value);
  IniFile.WriteInteger('AutoUpload', 'once_Week', sComboBox1.ItemIndex);
  if sRadioButton5.Checked then
    IniFile.WriteInteger('AutoUpload', 'mode_upload', 0)
  else
    IniFile.WriteInteger('AutoUpload', 'mode_upload', 1);
  IniFile.WriteString('AutoUpload', 'Patch', sDirectoryEdit1.Text);
  IniFile.WriteString('AutoUpload', 'mask', sEdit1.Text);
  IniFile.WriteString('AutoUpload', 'prefix', sEdit2.Text);
  IniFile.WriteString('AutoUpload', 'postfix', sEdit3.Text);

  IniFile.WriteString('AutoUpload', 'MySQL_HostName', sEdit4.Text);
  IniFile.WriteString('AutoUpload', 'MySQL_Port', sEdit5.Text);
  IniFile.WriteString('AutoUpload', 'MySQL_Database', sEdit6.Text);
  IniFile.WriteString('AutoUpload', 'MySQL_User', sEdit7.Text);
  IniFile.WriteString('AutoUpload', 'MySQL_Password', sEdit8.Text);
  IniFile.WriteString('AutoUpload', 'MySQL_TableName', sEdit9.Text);

  IniFile.Free;

end;

procedure TForm_AutoUpload.sBitBtn1Click(Sender: TObject);
begin
  task := False;
  SaveOptions;
  Timer1.Enabled := sCheckBox1.Checked;
  sBitBtn1.Enabled := False;
end;

procedure TForm_AutoUpload.sBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_AutoUpload.sBitBtn3Click(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  if sRadioButton6.Checked then
    UploadDBF;
  if sRadioButton5.Checked then
    UploadMySQL;
  Screen.Cursor := crDefault;
end;

procedure TForm_AutoUpload.sBitBtn4Click(Sender: TObject);
begin
  MySQLClient := TMySQLClient.Create;
  MySQLClient.Host := sEdit4.Text;
  MySQLClient.port := StrToInt(sEdit5.Text);
  MySQLClient.user := sEdit7.text;
  MySQLClient.password := sEdit8.text;
  MySQLClient.Db := sEdit6.Text;
  MySQLClient.UseSSL := false;
  MySQLClient.Compress := true;
  Screen.Cursor := crSQLWait;
  if MySQLClient.Connect then
  begin
    Application.MessageBox('Соединение с базой успешно установлено!',
      'Проверка соединения', MB_OK + MB_ICONINFORMATION);
    MySQLClient.close;
  end
  else
    Application.MessageBox('Не удалось соединиться с базой!',
      'Проверка соединения', MB_OK + MB_ICONWARNING);
  Screen.Cursor := crDefault;
end;

procedure TForm_AutoUpload.sCheckBox1Click(Sender: TObject);
begin
  sBitBtn1.Enabled := True;
end;

procedure TForm_AutoUpload.sRadioButton5Click(Sender: TObject);
begin
  sGroupBox3.Visible := sRadioButton5.Checked;
  sGroupBox4.Visible := not sRadioButton5.Checked;
  sCheckBox1Click(Self);
end;

procedure TForm_AutoUpload.sTimePicker1Change(Sender: TObject);
begin
  sBitBtn1.Enabled := True;
end;

procedure TForm_AutoUpload.Timer1Timer(Sender: TObject);
var
  time_str: string;
  day, month, year: Word;
begin
  LongTimeFormat := 'hh:mm:ss';
  if sCheckBox1.Checked then
  begin
    if sRadioButton1.Checked then
    begin
      time_str := TimeToStr(now);
      if time_str = sTimePicker1.Text then
      begin
        if sRadioButton5.Checked then
          UploadMySQL
        else
          UploadDBF;
      end;
    end;
    if sRadioButton2.Checked then
    begin
      DecodeDate(Date, year, month, day);
      if sSpinEdit1.Value = day then
      begin
        time_str := TimeToStr(now);
        if time_str = sTimePicker2.Text then
        begin
          if sRadioButton5.Checked then
            UploadMySQL
          else
            UploadDBF;
        end;
      end;

    end;
    if (sRadioButton3.Checked) and (task = False) then
    begin
      time_str := TimeToStr(now);
      if time_str = sTimePicker3.Text then
      begin
        if sRadioButton5.Checked then
          UploadMySQL
        else
          UploadDBF;
        task := True;
      end;
    end;
    if sRadioButton4.Checked then
    begin
      DecodeDate(Date, year, month, day);
      if DayOfWeek(Date) = sComboBox1.ItemIndex then
      begin
        time_str := TimeToStr(now);
        if time_str = sTimePicker4.Text then
        begin
          if sRadioButton5.Checked then
            UploadMySQL
          else
            UploadDBF;
        end;
      end;
    end;

  end;

end;

procedure TForm_AutoUpload.UploadDBF;
var
  sql: TpFIBQuery;
  year: Word;
  month: Word;
  day: Word;
  Hour: word;
  Min: word;
  Sec: word;
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
label
  konec;
begin
  //  sGauge1.Progress := 0;
  expMonthMin := expMes;
  //  sMemo1.Clear;
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
      addresmain_exp.Open;
      addresmain_exp.First;
      while not addresmain_exp.Eof do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select INC, ns, ndog, ubank, fio, kv from tmp ' +
          ' where cod in (select inc from addres where cod = ' +
          addresmain_expINC.AsString + ')');
        if sCheckBox1.Checked then
          SQL.Add(' and chec = 1');
        SQL.Add(' order by NDOG, KV, NS');
        ExecQuery;
        adres := addresmain_expADDR.AsString;
        nas_str := Copy(adres, 1, Pos(',', adres) - 1);
        dom := Trim(Copy(adres, Pos('дом', adres) + 3, Pos('корпус', adres) -
          Pos('дом', adres) - 5));
        korp := Trim(Copy(adres, Pos('корпус', adres) + 6, 4));
        while not Eof do
        begin
          ExportEnergo.Append;
          ExportEnergo.FieldByName('COD').AsInteger :=
            FieldByName('INC').AsInteger;
          ExportEnergo.FieldByName('NOM_SCH').AsString :=
            FieldByName('NS').AsString;
          ExportEnergo.FieldByName('LIC_CH').AsString :=
            FieldByName('NDOG').AsString;
          ExportEnergo.FieldByName('REGISTR_NOMER').AsString :=
            FieldByName('UBANK').AsString;
          ExportEnergo.FieldByName('NAS_STR').AsString := nas_str;
          ExportEnergo.FieldByName('DOM').AsString := dom;
          ExportEnergo.FieldByName('KORP').AsString := korp;
          ExportEnergo.FieldByName('KVAR').AsString :=
            FieldByName('KV').AsString;
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

      //        sGauge1.MaxValue := countRec;
      while not ExportEnergo.Eof do
      begin
        errorSave := false;
          //            sGauge1.Progress := sGauge1.Progress + 1;
        Close;
        SQL.Clear;
        SQL.Add('select mes_pot, mes_pot_time, tar_nak, addr from kv_konfig, tmp ' +
          ' where kv_konfig.cod = (select inc from tmp where inc =' +
          ExportEnergo.FBN('COD').AsString + ')');
        ExecQuery;
          //blod.Clear;
          //blod.Text := FN('mes_pot').AsString;
          //Дата - 20.12.04 Время - 11:42:35
        dataOpr := Copy(FN('mes_pot_time').AsString, Pos('Дата - ',
          FN('mes_pot_time').AsString) + 7, 8);
        timeOpr := Copy(FN('mes_pot_time').AsString, Pos('Время - ',
          FN('mes_pot_time').AsString) + 8, 8);

        try
          DecodeDate(StrToDate(dataOpr), year, month, day);
          DecodeTime(StrToTime(timeOpr), Hour, Min, Sec, Msec);
        except
            //             sMemo1.Lines.Add('Ошибка даты считывания счётчика ' + ExportEnergo.FBN('NOM_SCH').AsString);
          errorSave := true;
        end;
        if errorSave then
          goto konec;

          //            if maxExpMes > (year*12+month-1) then
           //             begin
          //                sMemo1.Lines.Add('Для счётчика ' + ExportEnergo.FBN('NOM_SCH').AsString + ' отсутсвуют данные за этот период');
          //                with ExportEnergo do
          //                  expMinsk.Add(FN('LIC_CH').AsString + '^VZEP^' + FN('NOM_SCH').AsString + '^' + FN('NAS_STR').AsString + '^' + FN('DOM').AsString + '^' + FN('KORP').AsString + '^' + FN('KVAR').AsString + '^' +
          //                    '^' +  '^нет');
          //                goto konec;
          //              end;

        tar_nak := TStringList.Create;
        tar_nak.Clear;
        tar_nak.Text := FN('tar_nak').AsString;

        Close;
        SQL.Text := 'select addr, hashr from tmp where inc = ' +
          ExportEnergo.FBN('COD').AsString;
        ExecQuery;
          //            addr := FN('addr').AsString;
          //            if (addr = '1') or (addr = '') then
          //              try
          //                FormExport.KonvertNa1Chislo(blod, tar_nak, month);
          //              except
          ////                sMemo1.Lines.Add('Ошибка показаниий счётчика ' + ExportEnergo.FBN('NOM_SCH').AsString);
          //                errorSave := true;
          //              end;
          //            if errorSave then
          //              goto konec;

        ExportEnergo.Edit;
        ExportEnergo.FieldByName('STAMP').AsString := dataOpr;
        ExportEnergo.FieldByName('REGISTR_NOMER').AsString := '0';
        ExportEnergo.FieldByName('FIO').AsString := '1';

          //ExportEnergo.FieldByName('POK_ALL').AsFloat := StrToFloatDef(blod.Strings[kon], 0) + StrToFloatDef(blod.Strings[kon+13], 0) + StrToFloatDef(blod.Strings[kon+26], 0) + StrToFloatDef(blod.Strings[kon+39], 0);
        ExportEnergo.FieldByName('POK_ALL').AsFloat :=
          StrToFloatDef(tar_nak.Strings[0], 0) +
          StrToFloatDef(tar_nak.Strings[1],
          0) + StrToFloatDef(tar_nak.Strings[2], 0) +
          StrToFloatDef(tar_nak.Strings[3], 0);
        if FN('HASHR').AsInteger <> 1 then
          ExportEnergo.FieldByName('FLAG').AsInteger := 0
        else
          ExportEnergo.FieldByName('FLAG').AsInteger := 1;
        ExportEnergo.FieldByName('DATE_TIME').AsString := IntToStr(year) +
          FormatFloat('00', month) + FormatFloat('00', day) +
          FormatFloat('00',
          Hour) + FormatFloat('00', Min) + FormatFloat('00', Sec);
        ExportEnergo.Post;
        dataOpr := ExportEnergo.FieldByName('D2').AsString;
          //            if sRadioGroup3.ItemIndex = 0 then
          //              dataOpr := DateToStr(StrToDate(dataOpr)-1);
        konec:
        ExportEnergo.Next;
      end;
    finally

    end;

  DateSeparator := '-';
  TimeSeparator := '_';
  Export_1.FileName := sDirectoryEdit1.Text + '\' + sEdit2.Text +
    FormatDateTime(sEdit1.Text, Date + Time) + sEdit3.Text + '.dbf';
  Export_1.Execute;
end;

procedure TForm_AutoUpload.UploadMySQL;
var
  sql: TpFIBQuery;
  year: Word;
  month: Word;
  day: Word;
  Hour: word;
  Min: word;
  Sec: word;
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
  sqlInsert: string;
  lic_ch: string;
  fio: string;
  nam_punkt: string;
  stamp, d1, d2: string;
  ok: Boolean;
  tempDecimalSeparator: Char;
label
  konec;
begin

  try
    MySQLClient := TMySQLClient.Create;
    MySQLClient.Host := sEdit4.Text;
    MySQLClient.port := StrToInt(sEdit5.Text);
    MySQLClient.user := sEdit7.text;
    MySQLClient.password := sEdit8.text;
    MySQLClient.Db := sEdit6.Text;
    MySQLClient.UseSSL := false;
    MySQLClient.Compress := true;
    MySQLClient.Connect
  except
    Exit;
  end;

  DecodeDate(Date, year, month, day);
  expMonthMin := year * 12 + month - 2;
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
      addresmain_exp.Open;
      addresmain_exp.First;
      while not addresmain_exp.Eof do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select INC, ns, ndog, ubank, fio, kv from tmp ' +
          ' where cod in (select inc from addres where cod = ' +
          addresmain_expINC.AsString + ')');
        if sCheckBox1.Checked then
          SQL.Add(' and chec = 1');
        SQL.Add(' order by NDOG, KV, NS');
        ExecQuery;
        adres := addresmain_expADDR.AsString;
        nas_str := Copy(adres, 1, Pos(',', adres) - 1);
        dom := Trim(Copy(adres, Pos('дом', adres) + 3, Pos('корпус', adres) - Pos('дом', adres) - 5));
        korp := Trim(Copy(adres, Pos('корпус', adres) + 6, 4));
        while not Eof do
        begin
          ExportEnergo.Append;
          ExportEnergo.FieldByName('COD').AsInteger := FieldByName('INC').AsInteger;
          ExportEnergo.FieldByName('NOM_SCH').AsString := FieldByName('NS').AsString;
          ExportEnergo.FieldByName('LIC_CH').AsString := FieldByName('NDOG').AsString;
          ExportEnergo.FieldByName('REGISTR_NOMER').AsString := FieldByName('UBANK').AsString;
          ExportEnergo.FieldByName('FIO').AsString := FieldByName('FIO').AsString;
          ExportEnergo.FieldByName('NAM_PUNK').AsString := dm1.townTOWN.AsString;
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
      maxExpMes := expMonthMin;
      expMonth := expMonthMin; // + sComboBox1.ItemIndex;

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

      //        sGauge1.MaxValue := countRec;
      while not ExportEnergo.Eof do
      begin
        errorSave := false;
        Close;
        SQL.Clear;
        SQL.Add('select mes_pot, mes_pot_time, tar_nak, addr from kv_konfig, tmp ' +
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
          goto konec;
        end;

        try
          DecodeDate(StrToDate(dataOpr), year, month, day);
          DecodeTime(StrToTime(timeOpr), Hour, Min, Sec, Msec);
        except
            //              sMemo1.Lines.Add('Ошибка даты считывания счётчика ' + ExportEnergo.FBN('NOM_SCH').AsString);
          errorSave := true;
        end;
        if errorSave then
          goto konec;

        if maxExpMes>(year * 12 + month - 1) then
        begin
              //                sMemo1.Lines.Add('Для счётчика ' + ExportEnergo.FBN('NOM_SCH').AsString + ' отсутсвуют данные за этот период');
              //                with ExportEnergo do
              //                  expMinsk.Add(FN('LIC_CH').AsString + '^VZEP^' + FN('NOM_SCH').AsString + '^' + FN('NAS_STR').AsString + '^' + FN('DOM').AsString + '^' + FN('KORP').AsString + '^' + FN('KVAR').AsString + '^' +
              //                    '^' +  '^нет');
          goto konec;
        end;

        tar_nak := TStringList.Create;
        tar_nak.Clear;
        tar_nak.Text := FN('tar_nak').AsString;

        Close;
        SQL.Text := 'select addr, hashr from tmp where inc = ' +
          ExportEnergo.FBN('COD').AsString;
        ExecQuery;
        addr := FN('addr').AsString;
        if (addr = '1') or (addr = '') then
          try
            FormExport.KonvertNa1Chislo(blod, tar_nak, month);
          except
            errorSave := true;
          end;
        if errorSave then
          goto konec;

        ExportEnergo.Edit;
        ExportEnergo.FieldByName('STAMP').AsString := dataOpr;
        ExportEnergo.FieldByName('D1').AsString := '01.' + FormatFloat('00', nach + 2 - 12 * ((nach + 1) div 12)) + '.' + IntToStr(expMonth div 12);
        ExportEnergo.FieldByName('D2').AsString := '01.' + FormatFloat('00', kon + 2 - 12 * ((kon + 1) div 12)) + '.' +
          IntToStr((expMonth + 1) div 12);
        ExportEnergo.FieldByName('VAL_MAX1').AsFloat := StrToFloatDef(blod.Strings[nach], 0);
        ExportEnergo.FieldByName('VAL_MAX2').AsFloat := StrToFloatDef(blod.Strings[kon], 0);
        ExportEnergo.FieldByName('VAL_MIN1').AsFloat := StrToFloatDef(blod.Strings[nach + 13], 0);
        ExportEnergo.FieldByName('VAL_MIN2').AsFloat := StrToFloatDef(blod.Strings[kon + 13], 0);
        ExportEnergo.FieldByName('POK_T3').AsFloat := StrToFloatDef(blod.Strings[kon + 26], 0);
        ExportEnergo.FieldByName('POK_T4').AsFloat := StrToFloatDef(blod.Strings[kon + 39], 0);
        ExportEnergo.FieldByName('POK_T5').AsFloat := 0;
        ExportEnergo.FieldByName('VAL_K1').AsFloat := ExportEnergo.FieldByName('VAL_MAX1').AsFloat + ExportEnergo.FieldByName('VAL_MIN1').AsFloat;
        ExportEnergo.FieldByName('VAL_K2').AsFloat := ExportEnergo.FieldByName('VAL_MAX2').AsFloat + ExportEnergo.FieldByName('VAL_MIN2').AsFloat;
        ExportEnergo.FieldByName('R_MAX').AsFloat := ExportEnergo.FieldByName('VAL_MAX2').AsFloat - ExportEnergo.FieldByName('VAL_MAX1').AsFloat;
        ExportEnergo.FieldByName('R_MIN').AsFloat := ExportEnergo.FieldByName('VAL_MIN2').AsFloat - ExportEnergo.FieldByName('VAL_MIN1').AsFloat;
        ExportEnergo.FieldByName('R_ALL').AsFloat := ExportEnergo.FieldByName('R_MAX').AsFloat + ExportEnergo.FieldByName('R_MIN').AsFloat;
        ExportEnergo.FieldByName('POK_ALL').AsFloat := ExportEnergo.FieldByName('VAL_K2').AsFloat + ExportEnergo.FieldByName('POK_T3').AsFloat +
          ExportEnergo.FieldByName('POK_T4').AsFloat;
        if FN('HASHR').AsInteger <> 1 then
          ExportEnergo.FieldByName('FLAG').AsInteger := 0
        else
          ExportEnergo.FieldByName('FLAG').AsInteger := 1;
        ExportEnergo.FieldByName('DATE_TIME').AsString := IntToStr(year) + FormatFloat('00', month) + FormatFloat('00', day) +
          FormatFloat('00', Hour) + FormatFloat('00', Min) + FormatFloat('00', Sec);
        ExportEnergo.Post;
        dataOpr := ExportEnergo.FieldByName('D2').AsString;
        konec:
        ExportEnergo.Next;
      end;
    finally

    end;

  ExportEnergo.First;
  tempDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  while not ExportEnergo.Eof do
  begin
    lic_ch := ExportEnergo.FieldByName('LIC_CH').AsString;
    fio := ExportEnergo.FieldByName('FIO').AsString;
    nam_punkt := ExportEnergo.FieldByName('NAM_PUNK').AsString;
    nas_str := ExportEnergo.FieldByName('NAS_STR').AsString;
    stamp := FormatDateTime('YYYY-MM-DD',
      ExportEnergo.FieldByName('STAMP').AsDateTime);
    d1 := FormatDateTime('YYYY-MM-DD',
      ExportEnergo.FieldByName('D1').AsDateTime);
    d2 := FormatDateTime('YYYY-MM-DD',
      ExportEnergo.FieldByName('D2').AsDateTime);
    if lic_ch = '' then
      lic_ch := '-1';
    if fio = '' then
      fio := '-1';
    sqlInsert := 'INSERT INTO `' + sEdit9.Text +
      '`(`LIC_CH`, `FIO`, `NAM_PUNK`, `NAS_STR`, `DOM`, `KORP`, `STAMP`, `NOM_SCH`, `D1`, `D2`, `VAL_K1`, `VAL_MAX1`, `VAL_MIN1`, `VAL_K2`, `VAL_MAX2`, `VAL_MIN2`, `KVAR`, `R_MAX`, `R_MIN`, `R_ALL`) ';
    sqlInsert := sqlInsert + 'VALUES (''' + lic_ch + ''', ''' + fio + ''', ''' + nam_punkt + ''', ''' + nas_str + ''', ''' +
      ExportEnergo.FieldByName('DOM').AsString + ''', ''' +
      ExportEnergo.FieldByName('KORP').AsString + ''', ''' +
      stamp + ''', ''' +
      ExportEnergo.FieldByName('NOM_SCH').AsString + ''', ''' +
      d1 + ''', ''' +
      d2 + ''', ''' +
      FormatFloat('0.00',
      ExportEnergo.FieldByName('VAL_K1').AsFloat) + ''', ''' +
      FormatFloat('0.00', ExportEnergo.FieldByName('VAL_MAX1').AsFloat) + ''', ''' +
      FormatFloat('0.00', ExportEnergo.FieldByName('VAL_MIN1').AsFloat) + ''', ''' +
      FormatFloat('0.00', ExportEnergo.FieldByName('VAL_K2').AsFloat) + ''', ''' +
      FormatFloat('0.00', ExportEnergo.FieldByName('VAL_MAX2').AsFloat) + ''', ''' +
      FormatFloat('0.00', ExportEnergo.FieldByName('VAL_MIN2').AsFloat) + ''', ''' +
      ExportEnergo.FieldByName('KVAR').AsString + ''', ''' + FormatFloat('0.00', ExportEnergo.FieldByName('R_MAX').AsFloat) + ''', ''' +
      FormatFloat('0.00', ExportEnergo.FieldByName('R_MIN').AsFloat) + ''', ''' +
      FormatFloat('0.00', ExportEnergo.FieldByName('R_ALL').AsFloat) + ''')';
    try
      MySQLClient.query(sqlInsert, true, ok);
    except

    end;
    ExportEnergo.Next;
  end;
  DecimalSeparator := tempDecimalSeparator;
  Application.ProcessMessages;
end;

end.

