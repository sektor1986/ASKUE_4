unit USaveData;

interface

uses
  Classes, SysUtils, pFIBQuery, SyncObjs, Windows, CommCtrl, Messages, Graphics, RichEdit, Variants,
  pFIBDatabase, FIBDatabase, UDeviceThread;

type
  massTString = array of TStrings;
  //buf = array of byte;

procedure DecodeData(mass: buf);
procedure AddVarTar(mass: buf);
procedure AddDataVrem(mass: buf);
procedure AddKolZonVSutkah(mass: buf);
procedure AddTarificSezona(mass: buf; nomer: integer);
procedure AddFixDate(mass: buf);
procedure AddTarNak(mass: buf);
procedure AddPower(mass: buf);
procedure AddMesPotr(mass: buf; tarif: integer);
procedure AddPotOtk(mass: buf; vid: integer);
procedure AddProfil(mass: buf);
procedure SaveProfil(cod: integer);
function BCDToStr(BCDbyte: byte): string;
function ByteToBinStr(a_bByte: byte): string;
procedure UpdateLog(str: string; color: TColor);
function CRC(mass: buf; nach: integer; konec: integer): byte;
procedure SaveDataInBase(var response: TBytes; var DBs: TpFIBDatabase; incAddresmain: Integer);
implementation

uses Udm1, Unit1;

const
  colorError = clred;
  colorOk = clBlue;
  colorRab = clGreen;

var
  bufProfil: TStrings;
  BlodVarTar: TStrings;
  BlodTarNak: TStrings;
  BlodMesPotr: TStrings;
  BlodPower: TStrings;
  BlodPotOtk: TStrings;
  DataVrem: string;
  DataVremConc: string;
  DataVremConcFlag: Boolean;
  flagVarTar: Boolean;
  flagTarNak: Boolean;
  flagPower: Boolean;
  flagMesPotr: Boolean;
  flagPotOtk: Boolean;
  flagProfil: Boolean;
  stari: Boolean;
  versiaPO: Byte;
  nomSchetchik: string;

procedure AddDataVrem(mass: buf); //Дата - 10.04.08 Время - 10:32:21
begin
  if DataVremConcFlag then
    DataVremConc := 'Дата - ' + BCDToStr(mass[22]) + '.' + BCDToStr(mass[23]) + '.' + BCDToStr(mass[24]) +
      ' Время - ' + BCDToStr(mass[20]) + ':' + BCDToStr(mass[19]) + ':' + BCDToStr(mass[18])
  else
    DataVrem := 'Дата - ' + BCDToStr(mass[22]) + '.' + BCDToStr(mass[23]) + '.' + BCDToStr(mass[24]) +
      ' Время - ' + BCDToStr(mass[20]) + ':' + BCDToStr(mass[19]) + ':' + BCDToStr(mass[18]);
  DataVremConcFlag := true;
end;

procedure AddFixDate(mass: buf);
var
  i: integer;
  nomerByteResponse: integer;
begin
  nomerByteResponse := 18;
  for i := 360 to (360 + StrToInt(BlodVarTar.Strings[13]) - 1) do
  begin
    BlodVarTar.Strings[i] := Chr(mass[nomerByteResponse + 2]) + ' ' + BCDToStr(mass[nomerByteResponse + 1]) + '-' +
      BCDToStr(mass[nomerByteResponse]);
    if CRC(mass, nomerByteResponse, nomerByteResponse + 2) <> mass[nomerByteResponse + 3] then
      UpdateLog('Ошибка в контрольной сумме фиксированных дат счётчика ' + nomSchetchik, colorError);
    Inc(nomerByteResponse, 4);
  end;

end;

procedure AddKolZonVSutkah(mass: buf);
var
  i: integer;
  nomer: integer;
  errorSave: Boolean;
begin
  errorSave := false;
  nomer := 24; //Номер первого байта в поле var_tar для количества зон в сутках
  for i := 1 to StrToInt(BlodVarTar.Strings[0]) * 3 do
  begin
    if ((mass[nomer - 6] > 8) or (mass[nomer - 6] = 0)) and (not errorSave) then
    begin
      UpdateLog(' Ошибка в количестве зон варианта тарификации счётчика ' + nomSchetchik, colorError);
      errorSave := true;
    end;
    BlodVarTar.Strings[nomer] := IntToStr(mass[nomer - 6]);
    Inc(nomer);
  end;
end;

procedure AddMesPotr(mass: buf; tarif: integer);
var
  i: Integer;
  nomerByte: integer;
  errorSave: Boolean;
begin
  errorSave := false;
  if BlodMesPotr = nil then
  begin
    BlodMesPotr := TStringList.Create;
    for i := 0 to 51 do
      BlodMesPotr.Add('');
  end;
  nomerByte := 18;
  for i := 13 * (tarif - 1) to 13 * (tarif - 1) + 12 do
  begin
    BlodMesPotr.Strings[i] := BCDToStr(mass[nomerByte + 3]) + BCDToStr(mass[nomerByte + 2]) + BCDToStr(mass[nomerByte +
      1]) + ',' + BCDToStr(mass[nomerByte]);
    if (CRC(mass, nomerByte, nomerByte + 3) <> mass[nomerByte + 4]) and (not errorSave) then
    begin
      UpdateLog('Ошибка в контрольной сумме помесячного потребления счётчика ' + nomSchetchik, colorError);
      errorSave := true;
    end;
    Inc(nomerByte, 5);
  end;
end;

procedure AddPotOtk(mass: buf; vid: integer);
var
  i: integer;
  nomerByteResponse: integer;
  errorSave: Boolean;
begin
  errorSave := false;
  if BlodPotOtk = nil then //Проверяем, создан ли объект
  begin
    BlodPotOtk := TStringList.Create; //Создание списка
    for i := 0 to 29 do
      BlodPotOtk.Add('');
  end;
  nomerByteResponse := 18;
  for i := 10 * (vid - 1) to 10 * (vid - 1) + 9 do
  begin
    BlodPotOtk.Strings[i] := BCDToStr(mass[nomerByteResponse + 4]) + ':' + BCDToStr(mass[nomerByteResponse + 3]) + ' '
      + BCDToStr(mass[nomerByteResponse + 2]) + '-' + BCDToStr(mass[nomerByteResponse + 1]) + '-' +
      BCDToStr(mass[nomerByteResponse]);
    if (CRC(mass, nomerByteResponse, nomerByteResponse + 4) <> mass[nomerByteResponse + 5]) and (not errorSave) then
    begin
      UpdateLog('Ошибка в контрольной сумме журнала событии счётчика ' + nomSchetchik, colorError);
      errorSave := true;
    end;
    Inc(nomerByteResponse, 6);
  end;
end;

procedure AddPower(mass: buf);
var
  i: Integer;
  nomerByteResponse: integer;
begin
  BlodPower := TStringList.Create;
  for i := 0 to 3 do
    BlodPower.Add('');
  nomerByteResponse := 18;
  for i := 0 to 3 do
  begin
    BlodPower.Strings[i] := BCDToStr(mass[nomerByteResponse + 1]) + ',' + BCDToStr(mass[nomerByteResponse]);
    Inc(nomerByteResponse, 3);
  end;
end;

procedure AddProfil(mass: buf);
var
  i: integer;
  nomByte: integer;
begin
  if not flagProfil then
    bufProfil := TStringList.Create;
  nomByte := 18;
  for i := 0 to 47 do
  begin
    bufProfil.Add(BCDToStr(mass[nomByte + 1]) + ',' + BCDToStr(mass[nomByte]));
    Inc(nomByte, 2);
  end;
  flagProfil := true;
end;

procedure AddTarificSezona(mass: buf; nomer: integer); //nomer - номер сезона
var
  nomerPervByte: integer; //номер первого байта в поле var_tar для тарификации сезонов
  nomerByteResponse: integer;
  kolzon: integer;
  i: integer;
begin
  nomerPervByte := 60 + 25 * (nomer - 1);
  BlodVarTar.Strings[nomerPervByte] := BCDToStr(mass[19]) + '-' + BCDToStr(mass[18]);
  Inc(nomerPervByte); //Начало рабочей заны сезона nomer

  nomerByteResponse := 22;
  kolzon := StrToIntDef(BlodVarTar.Strings[24 + 3 * (nomer - 1)], 0);
  if kolzon > 8 then
    UpdateLog('Ошибка в количестве рабочих зон тарифа №' + IntToStr(nomer) + ' счетчика ' + nomSchetchik, colorError)
  else
    for i := 1 to kolzon do
    begin
      BlodVarTar.Strings[nomerPervByte] := 'T' + Chr(mass[nomerByteResponse + 2]) + ' ' +
        BCDToStr(mass[nomerByteResponse + 1]) + ':' + BCDToStr(mass[nomerByteResponse]);
      Inc(nomerByteResponse, 4);
      Inc(nomerPervByte);
    end;

  nomerPervByte := 60 + 25 * (nomer - 1) + 9; //Начало субботней заны сезона nomer
  kolzon := StrToIntDef(BlodVarTar.Strings[25 + 3 * (nomer - 1)], 0);
  if kolzon > 8 then
    UpdateLog('Ошибка в количестве субботних зон тарифа №' + IntToStr(nomer) + ' счетчика ' + nomSchetchik, colorError)
  else
    for i := 1 to kolzon do
    begin
      BlodVarTar.Strings[nomerPervByte] := 'T' + Chr(mass[nomerByteResponse + 2]) + ' ' +
        BCDToStr(mass[nomerByteResponse + 1]) + ':' + BCDToStr(mass[nomerByteResponse]);
      Inc(nomerByteResponse, 4);
      Inc(nomerPervByte);
    end;

  nomerPervByte := 60 + 25 * (nomer - 1) + 17; //Начало воскресной зоны сезона nomer
  kolzon := StrToIntDef(BlodVarTar.Strings[26 + 3 * (nomer - 1)], 0);
  if kolzon > 8 then
    UpdateLog('Ошибка в количестве воскресных зон тарифа №' + IntToStr(nomer) + ' счетчика ' + nomSchetchik, colorError)
  else
    for i := 1 to kolzon do
    begin
      BlodVarTar.Strings[nomerPervByte] := 'T' + Chr(mass[nomerByteResponse + 2]) + ' ' +
        BCDToStr(mass[nomerByteResponse + 1]) + ':' + BCDToStr(mass[nomerByteResponse]);
      Inc(nomerByteResponse, 4);
      Inc(nomerPervByte);
    end;
end;

procedure AddTarNak(mass: buf);
var
  i: Integer;
  nomerByteResponse: integer;
  errorSave: Boolean;
begin
  errorSave := false;
  BlodTarNak := TStringList.Create;
  for i := 0 to 13 do
    BlodTarNak.Add('');
  nomerByteResponse := 18;
  for i := 4 to 7 do
  begin
    BlodTarNak.Strings[i] := BCDToStr(mass[nomerByteResponse + 3]) + BCDToStr(mass[nomerByteResponse + 2]) +
      BCDToStr(mass[nomerByteResponse + 1]) + ',' + BCDToStr(mass[nomerByteResponse]);
    if (CRC(mass, nomerByteResponse, nomerByteResponse + 3) <> mass[nomerByteResponse + 4]) and (not errorSave) then
    begin
      UpdateLog('Ошибка в контрольной сумме тарифных накопителей счетчика ' + nomSchetchik, colorError);
      errorSave := true;
    end;
    Inc(nomerByteResponse, 5);
  end;
  for i := 8 to 11 do
  begin
    BlodTarNak.Strings[i] := BCDToStr(mass[nomerByteResponse + 3]) + BCDToStr(mass[nomerByteResponse + 2]) +
      BCDToStr(mass[nomerByteResponse + 1]) + ',' + BCDToStr(mass[nomerByteResponse]);
    if (CRC(mass, nomerByteResponse, nomerByteResponse + 3) <> mass[nomerByteResponse + 4]) and (not errorSave) then
    begin
      UpdateLog('Ошибка в контрольной сумме тарифных накопителей счетчика ' + nomSchetchik, colorError);
      errorSave := true;
    end;
    Inc(nomerByteResponse, 5);
  end;
  for i := 0 to 3 do
  begin
    BlodTarNak.Strings[i] := BCDToStr(mass[nomerByteResponse + 3]) + BCDToStr(mass[nomerByteResponse + 2]) +
      BCDToStr(mass[nomerByteResponse + 1]) + ',' + BCDToStr(mass[nomerByteResponse]);
    if (CRC(mass, nomerByteResponse, nomerByteResponse + 3) <> mass[nomerByteResponse + 4]) and (not errorSave) then
    begin
      UpdateLog('Ошибка в контрольной сумме тарифных накопителей счетчика ' + nomSchetchik, colorError);
      errorSave := true;
    end;
    Inc(nomerByteResponse, 5);
  end;

  for i := 4 to 7 do
    try
      BlodTarNak.Strings[i] := FormatFloat('000000.00', StrToFloat(BlodTarNak.Strings[i - 4]) -
        StrToFloat(BlodTarNak.Strings[i]));
    except

    end;
  for i := 8 to 11 do
    try
      BlodTarNak.Strings[i] := FormatFloat('000000.00', StrToFloat(BlodTarNak.Strings[i - 8]) -
        StrToFloat(BlodTarNak.Strings[i]));
    except

    end;

  BlodTarNak.Strings[12] := BCDToStr(mass[nomerByteResponse + 3]) + BCDToStr(mass[nomerByteResponse + 2]) +
    BCDToStr(mass[nomerByteResponse + 1]) + ',' + BCDToStr(mass[nomerByteResponse]);
  BlodTarNak.Strings[13] := '1';
end;

procedure AddVarTar(mass: buf); //Добавление в базу данных о варианте тарификации
var
  i: integer;
  str: string;
begin
  BlodVarTar := TStringList.Create;
  BlodVarTar.Clear;
  for i := 0 to 384 do
    BlodVarTar.Add(' ');
  with BlodVarTar do
  begin
    Strings[0] := IntToStr(mass[18]);
    Strings[1] := IntToStr(mass[19]);
    Strings[2] := IntToStr(mass[20]);
    str := ByteToBinStr(mass[21]);
    Strings[3] := str[1];
    Strings[4] := str[2];
    Strings[5] := str[3];
    Strings[6] := str[4];
    Strings[7] := str[5];
    Strings[8] := str[6];
    Strings[9] := str[7];
    Strings[10] := str[8];
    Strings[11] := IntToStr(mass[22]);
    //Strings[12] := FloatToStrF(mass[23], ffFixed, 2, 2);
    Strings[12] := BCDToStr(mass[24]) + ',' + BCDToStr(mass[23]);
    Strings[13] := IntToStr(mass[25]);
    Strings[14] := IntToStr(mass[26]);
    Strings[15] := IntToStr(mass[27]);
    if mass[31] = 43 then
      Strings[16] := '+ ' + BCDToStr(mass[30]) + ':' + BCDToStr(mass[29])
    else
      Strings[16] := '- ' + BCDToStr(mass[30]) + ':' + BCDToStr(mass[29]);
    Strings[17] := IntToStr(mass[32]);
    Strings[18] := IntToStr(mass[33]);
    Strings[19] := BCDToStr(mass[37]) + '.' + BCDToStr(mass[36]) + '.' + BCDToStr(mass[35]);
    if (((mass[39] >= 23) and (mass[39] < 75)) or ((mass[39] >= 9) and (mass[39] < 22))) and (mass[39] <> 255) then
      stari := false
    else
      stari := true;
    versiaPO := mass[39];
  end;
  if CRC(mass, 18, 27) <> mass[28] then
    UpdateLog('Ошибка в контрольной сумме варианта тарификации счётчика ' + nomSchetchik, colorError);
end;

function ByteToBinStr(a_bByte: byte): string;
var
  i: integer;
begin
  SetLength(Result, 8);
  for i := 8 downto 1 do
  begin
    Result[i] := chr($30 + (a_bByte and 1));
    a_bByte := a_bByte shr 1;
  end;
end;

procedure DecodeData(mass: buf);
var
  adr: integer;
begin
  adr := StrToInt('$' + IntToHex(mass[15], 2) + IntToHex(mass[14], 2));
  case adr of
    $0540:
      begin
        AddVarTar(mass);
        flagVarTar := true
      end;
    $F000: AddDataVrem(mass);
    $0000: AddTarificSezona(mass, 1);
    $0064: AddTarificSezona(mass, 2);
    $00C8: AddTarificSezona(mass, 3);
    $012C: AddTarificSezona(mass, 4);
    $0190: AddTarificSezona(mass, 5);
    $01F4: AddTarificSezona(mass, 6);
    $0258: AddTarificSezona(mass, 7);
    $02BC: AddTarificSezona(mass, 8);
    $0320: AddTarificSezona(mass, 9);
    $0384: AddTarificSezona(mass, 10);
    $03E8: AddTarificSezona(mass, 11);
    $044C: AddTarificSezona(mass, 12);
    $0560: AddKolZonVSutkah(mass);
    $04C0: AddFixDate(mass);
    $05A0:
      begin
        AddTarNak(mass);
        flagTarNak := true
      end;
    $05F0:
      begin
        AddPower(mass);
        flagPower := true
      end;
    $0600:
      begin
        AddMesPotr(mass, 1);
        flagMesPotr := true
      end;
    $0641:
      begin
        AddMesPotr(mass, 2);
        flagMesPotr := true
      end;
    $0682:
      begin
        AddMesPotr(mass, 3);
        flagMesPotr := true
      end;
    $06C3:
      begin
        AddMesPotr(mass, 4);
        flagMesPotr := true
      end;
    $0720:
      begin
        AddPotOtk(mass, 1);
        flagPotOtk := true
      end;
    $075C:
      begin
        AddPotOtk(mass, 2);
        flagPotOtk := true
      end;
    $0798:
      begin
        AddPotOtk(mass, 3);
        flagPotOtk := true
      end;
    $8000: AddProfil(mass)
  else
    begin
    end;
  end;
end;

function BCDToStr(BCDbyte: byte): string;
begin
  Result := '';
  SetLength(Result, 2);
  Result[1] := Char(((Ord(Chr(BCDbyte)) shr 4) and $F) + $30);
  Result[2] := Char((Ord(BCDbyte) and $F) + $30);
end;

procedure SaveDataInBase(var response: TBytes; var DBs: TpFIBDatabase; incAddresmain: Integer);
var
  countByte: integer;
  stroka: AnsiString;
  sql: TpFIBQuery;
  flagSave: Boolean;
  procedure SaveElectroSchetchik;
  var
    tempbuf: buf;
    numByte: integer;
    i, j: integer;
    count: integer;
    ns: integer;
  begin
    countByte := 0;
    stari := false;
    flagVarTar := false;
    flagTarNak := false;
    flagPower := false;
    flagMesPotr := false;
    flagPotOtk := false;
    flagProfil := false;
    DataVremConcFlag := false;
    nomSchetchik := BCDToStr(response[2]) + BCDToStr(response[1]) + BCDToStr(response[0]);
    SetLength(nomSchetchik, 6); //Усекаем строку до 6 символов
    repeat
      numByte := countByte + 16;
      tempbuf := nil;
      if StrToIntDef('$' + IntToHex(response[numByte - 1], 2) + IntToHex(response[numByte - 2], 2), $1) = $8000 then
        count := 96
      else
        count := response[numByte];
      SetLength(tempbuf, count + 18 + 1); //Количество байт + шапка + 1 контрольная сумма
      j := 0;
      for i := countByte to (countByte + 18 + count) do
      begin
        tempbuf[j] := response[i];
        Inc(j);
      end;
      DecodeData(tempbuf);
      countByte := countByte + count + 18 + 1; //Предыдущее кол-во байт + шапка + 1 контрольная сумма
      if (response[countByte] = 165) or (countByte > Length(response)) then // Выход из цикла при появлении байта 165
        Break;
    until (false);

    //---------------------------------------------------------
    //    Сохранение считанных параметров
    //---------------------------------------------------------

    try
      sql := TpFIBQuery.Create(nil);
      with sql do
      begin
        Database := DBs;
        Transaction := DBs.DefaultTransaction;
        try
          //Обновление поля addr в таблице tmp (номер версии программы)
          if stari then
            SQL.Text :=
              'update tmp set addr = 1 where ns = :ns and tmp.cod in (select inc from addres where cod = :inc)'
          else
            SQL.Text :=
              'update tmp set addr = 2 where ns = :ns and tmp.cod in (select inc from addres where cod = :inc)';
          ParamByName('inc').AsInteger := incAddresmain;
          ParamByName('ns').AsString := nomSchetchik;
          Transaction.StartTransaction;
          ExecQuery;
          SQL.Text := 'update tmp set LSCHET = :VPO where ns = :ns';
          ParamByName('VPO').AsString := IntToStr(versiaPO);
          ParamByName('ns').AsString := nomSchetchik;
          ExecQuery;

          //Обновление поля sdf в таблице tmp_3xf (номер верчии программы)
          if stari then
            SQL.Text := 'update tmp_3xf set sdf = 1 where ns = :ns and id_tmp in ' +
            '(select inc from tmp where cod in (select inc from addres where cod = :inc))'
          else
            SQL.Text := 'update tmp_3xf set sdf = 2 where ns = :ns and id_tmp in ' +
            '(select inc from tmp where cod in (select inc from addres where cod = :inc))';
          ParamByName('ns').AsString := nomSchetchik;
          ParamByName('inc').AsInteger := incAddresmain;
          ExecQuery;
          Transaction.CommitRetaining;

          //Проверка существования счётчика в базе
          SQL.Clear;
          SQL.Add('select COD from kv_konfig');
          SQL.Add(' where cod = (select inc from tmp where ns = :ns ');
          SQL.Add(' and tmp.cod in (select inc from addres where cod = :inc))');
          ParamByName('ns').AsString := nomSchetchik;
          ParamByName('inc').AsInteger := incAddresmain;
          ExecQuery;
          if not Eof then
            ns := FN('COD').AsInteger
          else
            ns := -1;

          //Сохранение данных со счетчиков
          if ns <> -1 then
          begin

            try
              Close;
              SQL.Clear;
              SQL.Add('UPDATE KV_KONFIG');
              SQL.Add(' SET DATE_POVERKA = :param1');
              SQL.Add(' where cod = :param2');
              ParamByName('param1').AsDate := StrToDateDef(BlodVarTar.Strings[19], 0);
              ParamByName('param2').AsInteger := ns;
              ExecQuery;
            except
            
            end;

            SQL.Clear;
            SQL.Add('EXECUTE PROCEDURE UPDATE_BLOB (:NS, :VAR_TAR, :TAR_NAK, :MES_POT, :POT_OTK, :POWER, :PROF_NAGR, :NS_TIME, :KON_TIME,:MONTH_, :ARHIV_, :DATE_TIME, :INC)');
            ParamByName('NS').AsString := nomSchetchik;
            ParamByName('inc').AsInteger := ns;
            if flagProfil then
              SaveProfil(ns);
            if flagVarTar then
            begin
              ParamByName('VAR_TAR').AsString := BlodVarTar.Text;
              BlodVarTar.Free;
              BlodVarTar := nil;
            end
            else
              ParamByName('VAR_TAR').AsString := '777';
            if flagTarNak then
            begin
              ParamByName('TAR_NAK').AsString := BlodTarNak.Text;
              BlodTarNak.Free;
              BlodTarNak := nil;
            end
            else
              ParamByName('TAR_NAK').AsString := '777';
            if flagPower then
            begin
              ParamByName('POWER').AsString := BlodPower.Text;
              BlodPower.Free;
              BlodPower := nil;
            end
            else
              ParamByName('POWER').AsString := '777';
            if flagMesPotr then
            begin
              ParamByName('MES_POT').AsString := BlodMesPotr.Text;
              BlodMesPotr.Free;
              BlodMesPotr := nil;
            end
            else
              ParamByName('MES_POT').AsString := '777';
            if flagPotOtk then
            begin
              ParamByName('POT_OTK').AsString := BlodPotOtk.Text;
              BlodPotOtk.Free;
              BlodPotOtk := nil;
            end
            else
              ParamByName('POT_OTK').AsString := '777';
            ParamByName('PROF_NAGR').AsString := '777';
            ParamByName('NS_TIME').AsString := DataVrem;
            ParamByName('KON_TIME').AsString := DataVremConc;
            ParamByName('DATE_TIME').AsString := DateTimeToStr(Form1.Port.GLOBAL_DATE_TIME_READED);
            try
              ExecQuery;
              Transaction.Commit;
              UpdateLog('Данные счётчика ' + nomSchetchik + ' сохранены', colorRab);
              flagSave := true;
            except
              UpdateLog('Ошибка при сохранении данных счётчика ' + nomSchetchik, colorError);
              flagSave := false;
            end;
          end
          else
          begin
            UpdateLog('Счётчик ' + nomSchetchik + ' не найден в базе', colorError);
            flagSave := false;
          end;
        finally
          Free;
        end;
      end;
    except

    end;
  end;

  //Процедура сохранеия данных о счетчике ТЭМ-104
  procedure SaveTem_104;
  var
    tempbuf: buf;
    buf_128: buf;
    buf_2k: buf;
    buf_512k: buf;
    buf_mimemory: buf;
    i: Integer;
    j: integer;
    numByte: integer;
    tempBlod: TStrings;
  label
    konec;
  begin
    SetLength(tempbuf, 64);
    numByte := 7 + response[5]; //Байт количества байтов в первой посылке
    while numByte < Length(response) do
    begin
      j := 0;
      for i := (numByte + 6) to (numByte + 69) do
      begin
        tempbuf[j] := response[i];
        inc(j);
      end;

      case StrToInt('$' + IntToHex(response[numByte + 3], 2) + IntToHex(response[numByte + 4], 2)) of
        $0F01: //адрес 0F01 - таймер 2K
          begin
            j := Length(buf_2k);
            SetLength(buf_2k, Length(buf_2k) + 64);
            for i := 0 to 63 do
            begin
              buf_2k[j] := tempbuf[i];
              Inc(j);
            end;
          end;
        $0F02: //адрес 0F02 - таймер 128 байт
          begin
            j := Length(buf_128);
            SetLength(buf_128, Length(buf_128) + 64);
            for i := 0 to 63 do
            begin
              buf_128[j] := tempbuf[i];
              Inc(j);
            end;
          end;
        $0C01: //адрес 0C01 - оперативная память
          begin
            j := Length(buf_mimemory);
            SetLength(buf_mimemory, Length(buf_mimemory) + 64);
            for i := 0 to 63 do
            begin
              buf_mimemory[j] := tempbuf[i];
              Inc(j);
            end;
          end;
        $0F03:
          begin
            j := Length(buf_512k);
            SetLength(buf_512k, Length(buf_512k) + 64);
            for i := 0 to 63 do
            begin
              buf_512k[j] := tempbuf[i];
              Inc(j);
            end;
          end;
      end;
      numByte := numByte + 71; //6 шапка + 64 данные + 1 контр. сумма = 71
    end;

    nomSchetchik := '';
    if (response[5] = 8) then // Если новая версия прошивки (ТЭМ-104/1)
    begin
      for i := 21 to 27 do
        nomSchetchik := nomSchetchik + Chr(response[i]);
      nomSchetchik := nomSchetchik + '#' + IntToStr(response[1]);
      buf_2k[511] := 1;
    end
    else if (response[5] = 7) then // Если старая верся прошивки (ТЭМ-104)
    begin
      nomSchetchik := IntToHex(response[152], 2);
      nomSchetchik := nomSchetchik + IntToHex(response[153], 2);
      nomSchetchik := nomSchetchik + IntToHex(response[154], 2);
      nomSchetchik := IntToStr(StrToInt('$' + nomSchetchik));
      nomSchetchik := nomSchetchik + '#' + IntToStr(response[1]);
      buf_2k[511] := 0;
    end;
    //--------Сохранение данных в базу-------------
    dm1.update_kv_konfig.Close;
    dm1.update_kv_konfig.ParamByName('nom').AsString := nomSchetchik;
    dm1.update_kv_konfig.Open;
    if dm1.update_kv_konfigINC.AsString = '' then
    begin
      UpdateLog('Теплосчётчик ' + nomSchetchik + ' не найден в базе', colorError);
      dm1.update_kv_konfig.Close;
      flagSave := false;
      goto konec;
    end;

    dm1.update_kv_konfig.Edit;

    if Length(buf_2k) <> 0 then
    begin
      tempBlod := TStringList.Create;
      j := Length(buf_2k);
      for i := 0 to j - 1 do
        tempBlod.Add(IntToStr(buf_2k[i]));
      dm1.update_kv_konfigM7.AsString := tempBlod.Text;
      tempBlod.Free;
    end;

    if Length(buf_128) <> 0 then
    begin
      tempBlod := TStringList.Create;
      j := Length(buf_128);
      for i := 0 to j - 1 do
        tempBlod.Add(IntToStr(buf_128[i]));
      dm1.update_kv_konfigM8.AsString := tempBlod.Text;
      tempBlod.Free;
    end;

    if Length(buf_mimemory) <> 0 then
    begin
      tempBlod := TStringList.Create;
      j := Length(buf_mimemory);
      for i := 0 to j - 1 do
        tempBlod.Add(IntToStr(buf_mimemory[i]));
      dm1.update_kv_konfigM9.AsString := tempBlod.Text;
      tempBlod.Free;
    end;

    if Length(buf_512k) <> 0 then
    begin
      tempBlod := TStringList.Create;
      j := Length(buf_512k);
      for i := 0 to j - 1 do
        tempBlod.Add(IntToStr(buf_512k[i]));
      dm1.update_kv_konfigM10.AsString := tempBlod.Text;
      tempBlod.Free;
    end;

    try
      dm1.update_kv_konfig.Post; //Применение изменений
      UpdateLog('Данные теплосчетчика ' + nomSchetchik + ' сохранены', colorRab);
      flagSave := true;
    except
      UpdateLog('Ошибка при сохранении данных теплосчётчика ' + nomSchetchik, colorError);
      flagSave := false;
    end;
    //**************************************************
    konec:
  end;

begin
  try
    //Проверка на наличие данных о счётчике ТЭМ-104
    if (response[0] = 170) and (response[3] = 0) and (response[4] = 0) then // and (response[5] = 7)  then
      SaveTem_104
    else
      SaveElectroSchetchik;

    //Увеличение счётчика на 1 единицу
    if flagSave then
    begin
      SetLength(stroka, 4);
      countByte := SendMessage(Form1.sEdit11.Handle, WM_GETTEXT, 4, Integer(@stroka[1]));
      SetLength(stroka, countByte);
      stroka := IntToStr(StrToInt(stroka) + 1);
      SendMessage(Form1.sEdit11.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR(stroka)));
    end;
    //********************************************************

  finally

  end;
end;

procedure SaveProfil(cod: integer);
var
  massProfil: massTString;
  Data: string;
  Vrem: string;
  countPervDay: integer;
  countDay: integer;
  i: Integer;
  j: Integer;
  nomStr: integer;
begin
  countDay := bufProfil.Count div 48;
  SetLength(massProfil, countDay);
  try
    Data := Copy(DataVrem, Pos('Дата - ', DataVrem) + 7, 8);
    Vrem := Copy(DataVrem, Pos('Время - ', DataVrem) + 8, 8);
    countPervDay := (StrToInt(Copy(Vrem, 1, 2)) * 60 + StrToInt(Copy(Vrem, 4, 2))) div 30;
  except
    UpdateLog('Ошибка сохранения профиля нагрузки', colorError);
    Exit
  end;
  massProfil[0] := TStringList.Create;
  massProfil[0].Add(Vrem);
  massProfil[0].Add(Data);
  for i := 0 to countPervDay - 1 do
    massProfil[0].Add(bufProfil.Strings[i]);

  nomStr := countPervDay;
  for i := 1 to countDay - 1 do
  begin
    massProfil[i] := TStringList.Create;
    massProfil[i].Add('00:00');
    Data := FormatDateTime('dd.mm.yy', StrToDate(Data) - 1);
    massProfil[i].Add(Data);
    for j := nomStr to nomStr + 47 do
      massProfil[i].Add(bufProfil.Strings[j]);
    nomStr := nomStr + 48;
  end;

  {if not dm1.transactSaveThread.Active then
    dm1.transact1.Active := true;
  try
    dm1.update_profmain.Open;
  except

  end;}
  dm1.update_profmain.Close;
  dm1.update_profmain.Open;
  for i := 0 to Length(massProfil) - 1 do
    with dm1 do
    begin
      if update_profmain.Locate('COD;DATA', VarArrayOf([cod, massProfil[i].Strings[1]]), []) then
        update_profmain.Edit
      else
        update_profmain.Append;
      update_profmainCOD.AsInteger := cod;
      update_profmainDATA.AsString := massProfil[i].Strings[1];
      update_profmainPROFIL.AsString := massProfil[i].Text;
      update_profmainCHEC.AsInteger := 0;
      update_profmain.Post;
    end;
  try
    dm1.update_profmain.Close;
  except
    UpdateLog('Ошибка при сохранении профиля нагрузки', colorError);
  end;
end;

procedure UpdateLog(str: string; color: TColor);
var
  Format: TCharFormat; //Переменная для хранения параметров шрифта TRichEdit
begin
  FillChar(Format, SizeOf(TCharFormat), 0);
  Format.cbSize := SizeOf(TCharFormat);
  SendMessage(Form1.sRichEdit1.Handle, EM_SETSEL, MaxInt, MaxInt);
  SendMessage(Form1.sRichEdit1.Handle, EM_GETCHARFORMAT, 0, LPARAM(@Format)); //Получение текущих параметров шрифта
  Format.dwMask := CFM_COLOR;
  Format.crTextColor := ColorToRGB(color);
  SendMessage(Form1.sRichEdit1.Handle, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@Format)); //Применение параметров
  SendMessage(Form1.sRichEdit1.Handle, EM_REPLACESEL, 0, LongInt(PChar(str + #13#10))); //Запись ново строки в TRichEdit
end;

function CRC(mass: buf; nach: integer; konec: integer): byte; //Функция подсчета контрольной суммы
var
  i: integer;
begin
  Result := 0;
  for i := nach to konec do
    Result := Result + mass[i];
end;

end.

