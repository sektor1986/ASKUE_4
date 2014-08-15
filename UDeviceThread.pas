unit UDeviceThread;

// 26.02.2014
// Изменена инициализация модема для возможности работы с USB-GSM модемами
// поддержка модема Huawei E1550

interface

uses
  Classes, Graphics, Messages, Windows, RichEdit, SysUtils, StrUtils, commctrl,
  Forms,
  pFIBQuery, pFIBDatabase, FIBDatabase, SyncObjs, UTypes, CPort, CPortTypes;

type
  buf = array of byte;
  bufPchar = array of PChar;
  ProcDll1 = function(nomConc: PChar; //Номер концентратора
    passwConcOld: PChar; //Пароль концентратора старый
    passwConcNew: PChar; //Пароль концентратора новый
    ConfigPer: array of PChar): TBytes;
  //Конфигурация передаваемых данных (трёхмерный массив)
//--0---номер разъёма (16 разъёмов)
//--1-----название разъёма
//--2-----количество счётчиков в разъёме

  ProcDll2 = function(nomConc: PChar;
    passwConcOld: PChar;
    passwConcNew: Pchar;
    ConfigPer: array of bufPChar): TBytes; //Конфигурация передаваемых данных
  //-0,0-номер разъёма
  //-1,0-количество счетчиков с 1-ым вариантом тар
  //-1,1-номер счётчика с 1-ым вариантом
  //-1,2-номер счётчикас 1-ым вар
  //-2,0-количество счетчиков со вторым вариантом
  //-2,1-номер
  //--.........
  //-10,0

  ProcDll3 = function(nomConc: PChar; //Номер концентратора
    passwConcOld: PChar; //Пароль концентратора старый
    passwConcNew: PChar; //Пароль концентратора новый
    passwSchOld: PChar; //Пароль на счетчики старый
    passwSchNew: PChar; //Парольна счетчики новый
    varTar: byte; //Номер варианта тарификации
    countRas: byte; //Количество разъёмов
    adrChtSap: array of PChar;
    //Адреса чтений/записи (4 байта) + количество байт параметра (2 байта)
    read: Boolean): TBytes; //Флаг чтения или записи)

  ProcDll4 = function(read: Boolean; //Функция формирования шапки запроса
    nomConc: PChar;
    passwConcOld: Pchar;
    passwConcNew: Pchar;
    addr: Pchar): TBytes;

  ProcDll5 = function(mass: TBytes; nach: integer; konec: integer): byte;
  ProcDll6 = function(const inStr: PChar): TBytes;
  ProcDll7 = function(response: TBytes): TBytes;
  ProcDll8 = function(nomConc: PChar; //Номер концентратора
    passwConcOld: PChar; //Пароль концентратора старый
    passwConcNew: PChar; //Пароль концентратора новый
    local_number: Byte;
    countRead_Flash512K: Byte;
    addr_Flash512K: integer;
    type_counter: Byte): TBytes;

  TDeviceThread = class(TThread)

    //Собственные процедуры и функции
    procedure Razriv; //Функция разрыва связи
    procedure LoadDll; //Загрузка динамических бмблиотек
    procedure ProgrNaChtenieSchit;
    //Процедура программирования на чтение считывателя
    procedure Chtenie; //Процедура чтения данных с концентратора
    procedure ChtenieSchit;
    procedure WriteBufInPort(bufer: TBytes);
    procedure WaitUpdateProgresBar(sec: integer);
    procedure ObnulSchetchikov;
    procedure UpdateTmpHashr(ns: string; val: string);
    procedure PovtorDozvona;

    //function SaprocNaChtenie(fer: Boolean):Boolean;
  private
    DLLHandle: THandle;
    FormirBuf_SapNazvRas: ProcDll1;
    FormirBuf_SapNomerovSch: ProcDll2;
    FormirBuf_SapAdrCht_Sapisi: ProcDll3;
    Shapka: ProcDll4;
    NumStringToBCD: ProcDll6;
    BCDToNumStr: ProcDll7;
    FormirBufFor_TEM_104: ProcDll8;
    CRC: ProcDll5;
    procedure ProgrNaChtenie;
    //Процедура программирования концентратора на чтение
    procedure ProgrWrite; // Процедура программирования концентратора на чтение
    procedure ProverkaWrite;
    function SaveDataSoSchet(response: TBytes; incAddresmain: Integer): Boolean;
    function DetectError(response: TBytes): string;
    procedure UpdateProgress;
    procedure incGauge1;
    procedure PuskTimer;
    procedure StopTimer;
    function WriteData(bufer: TBytes; nomAddr: Integer): Boolean;
    procedure WriteLog(str: string);
    procedure WritelnLog(str: string);
    procedure ClearLog;
    procedure AddPovtChtenie(numCounter: string; numAddr: Integer);
    procedure FilterNeschit(numAddr: Integer);
    function Dozvon(nomer: string): Boolean; //Функция дозвона по номеру nome
    function NastrPort(schit: Boolean): Boolean; //Процедура настройки com порта
    function WaitComData(msec: integer): boolean;

    //Процедура ожидания появления данных в приемном буфере порта
    function IniModem(): Boolean; //Процедура инициализации модема
  protected
    procedure Execute; override;
  public
    massivOprosa: TmassivOpr;
    KonfigWrite: array[1..10] of RKonfigZap;
    EnableVarTar: array of REnableVarTar;
    //massivOprosa: array of array of array of array of string;                     //Массив обьектов опроса
    ParOprosa: array of array of string;
    //Массив адресов опроса по вариантам тарификации                                              //Элементы с 1 по 10 для конкретного варианта тарификации
    flagTolkoChtenie: Boolean;
    //для определения вида опроса (нужно ли программирование на чтение)
    flagWrite: Boolean;
    stop: Boolean;
    GLOBAL_DATE_TIME_READED: TDateTime;
    CRsection: TCriticalSection;
    flagSchitivatel: Boolean; //Если работа со считывателем
    flagModem: Boolean;
    flagGPRS: Boolean;
    flagSetGPRSApn: Boolean;
    flagSecondRead: Boolean;

    procedure IncEditNum(handle: HWND);
    procedure BlokGlOkna;
    //Процедура блокировки компонентов при работе с com портом
    procedure OtmenaBlokGlOkna; //Отмена блокировок
    procedure UpdateLog(str: string; color: TColor); overload;
    //Добавление новой записи в протокол обмена
    procedure UpdateLog(hadn: THandle; str: string; color: TColor); overload;
  end;

implementation
uses Unit1, UOptions, UFormOpr, UFunction, Udm1, USaveData, UGPRS;
const
  colorError = clred;
  colorOk = clBlue;
  colorRab = clGreen;
  ojid = 30; //Константа времени ожидания при программировании считывателя
var
  ent: integer; //Переменная для #0D
  countDozvon: integer; //Количество попыток дозвона
  timeOdinSch: Real;
  logFile: TextFile;
  timeOpr: array of integer;
  //Массив времени ожидания для каждого опрашиваемого объекта
  flagAutomatCht: Boolean;
  schetchikByte: integer;
  log: Boolean;
  BComPort: TComPort; //**Создание экземпляра компонента TBComPort
  DBs: TpFIBDatabase;
  { TDeviceThread }

procedure TDeviceThread.AddPovtChtenie(numCounter: string; numAddr: Integer);
var
  i, j: Integer;
  countRaz: Integer;
  countCounter: Integer;
begin
  countRaz := Length(Form1.massivOprosa[numAddr]) - 1;
  for i := 1 to countRaz do
  begin
    countCounter := Length(Form1.massivOprosa[numAddr, i]) - 1;
    for j := 1 to countCounter do
    begin
      if numCounter = Form1.massivOprosa[numAddr, i, j, 0] then
      begin
        Form1.massivOprosa[numAddr, i, j, 2] := '1';
        Exit;
      end;
    end;
  end;
end;

procedure TDeviceThread.BlokGlOkna;
//Процедура блокировки компонентов при работе с com портом
begin
  FormOptions.sComboBox2.Enabled := false;
  Form1.sBitBtn41.Enabled := true;
  Form1.sBitBtn42.Enabled := true;
  Form1.sBitBtn63.Enabled := true;
  flagAutomatCht := Form1.ChBoxAutomCht.Checked;
  Form1.sGauge1.Progress := 0;
  log := FormOptions.sCheckBox4.Checked;
end;

procedure TDeviceThread.ObnulSchetchikov;
begin
  Form1.sEdit9.Text := '0';
  Form1.sEdit10.Text := '0';
  Form1.sEdit11.Text := '0';
  Form1.sEdit13.Text := '0';
end;

procedure TDeviceThread.OtmenaBlokGlOkna;
begin
  {
    if flagGPRS then
    begin
      dmGPRS.DisconnectGPRS;
    end
    else
    begin
      ent := $0D;
      try
        Sleep(1200);
        BComPort.WriteStr('+++');
        Sleep(1200);
        BComPort.WriteStr('ATH0');
      //BComPort.Write(ent, 1);
        BComPort.Write(@ent, 1);
        Sleep(1000);
        BComPort.ClearBuffer(true, true);
        BComPort.Close;
        BComPort.Free;
      except

      end;
    end;
    }
  if BComPort <> nil then
  begin
    try
      BComPort.Close;
      //      BComPort.Free;
    except

    end;
  end;
  FormOptions.sComboBox2.Enabled := true;
  StopTimer;
  Form1.sBitBtn41.Enabled := false;
  Form1.sBitBtn42.Enabled := false;
  try
    CloseFile(logFile);
    FreeLibrary(DLLHandle);
  except

  end;
end;

procedure TDeviceThread.PovtorDozvona;
begin
  if flagGPRS then
  begin
    UpdateLog('Связь прервана', colorError);
    Razriv;
    UpdateLog('Выполняется повторное соединение', colorOk);
  end
  else
  begin
    UpdateLog('Связь прервана', colorError);
    UpdateLog(' ', colorOk);
    if flagModem then
      UpdateLog('Выполняется повторный дозвон', colorOk);
  end;
end;

procedure TDeviceThread.ProgrNaChtenie;
  procedure LogErrorProgram(adr: string);
  begin
    UpdateLog(Form1.sRichEdit2.Handle,
      'Не удалось установить соединение с концентратором по адресу ' + adr,
      colorError);
    UpdateLog(Form1.sRichEdit2.Handle, ' ', colorError);
  end;
var
  hour: Word;
  min: Word;
  sec: Word;
  msec: Word;
  year: Word;
  month: Word;
  day: Word;
  DOW: Word;
  i: integer;
  j: Integer;
  k: integer;
  n: integer;
  countRaz: Integer;
  nachOprosa: integer;
  countSchetchikov: integer;
  povtorDozvona: integer;
  nomVarTar: array of Boolean;
  //массив для хранение данных о сущ. в дресе вариантах тарификации
  bufper: TBytes;
  bufPriema: TBytes;
  configPerNasv: array of PChar;
  configPerAdr: array of PChar;
  configPerNomSch: array of bufPchar;
label
  labelkonec;
begin
  //------------------------------------------
  //   Form1.massivOprosa - конфигурация опроса
  //   x - номер опрашиваемого объекта
  //   y - в зависимости от количества разъёмов (от 1 до 15)
  //   z - в зависимости от количества счётчиков в разъёме (начиная с 1)
  //   Form1.massivOprosa[x, 0, 0, 1] - адрес опрашиваемого объекта
  //   Form1.massivOprosa[x, 0, 0, 2] - номер SIM карты концентратора
  //   Form1.massivOprosa[x, 0, 0, 3] - пароль концентратора
  //   Form1.massivOprosa[x, 0, 0, 4] - пароль счетчиков
  //   Form1.massivOprosa[x, 0, 0, 5] - номер концентратора
  //
  //   Form1.massivOprosa[x, y, 0, 0] - название разъёма
  //
  //   Form1.massivOprosa[x, y, z, 0] - номер счётчика
  //   Form1.massivOprosa[x, y, z, 1] - вариант тарификачии счётчика
  //
  //******************************************
  //  0 - 0 - 0 - 0     - Город
  //   |   |   |- 1     - Адрес порашиваемого объекта
  //   |   |   |- 2     - Номер SIM карты концентратора
  //   |   |   |- 3     - пароль концентратора
  //   |   |   |- 4     - пароль счетчиков
  //   |   |   |- 5     - номер концентратора
  //   |   |   |- 6     - количество счетчиков в адресе
  //   |   |   |- 10     - IP адрес концентратора
  //   |   |
  //   |   |- 1 - 0     - номер теплосчетчика ТЭМ-104
  //   |       |- 1     - номер разёъма на котором расположен теплосчесчик
  //   |
  //   |- 1 - 0 - 0     - название разъёма
  //   |   |
  //   |   |- 1 - 0     - номер счетчика
  //   |   |   |- 1     - выриант тарификации
  //   |   ........
  //   |   |- n - 0
  //   |       |- 1
  //   ............
  //   |- m - 0 - 0
  //       |
  //       |- 1 - 0     - номер счетчика
  //       |   |- 1     - выриант тарификации
  //       ........
  //       |- n - 0
  //           |- 1

  {
  if not flagGPRS then
  begin
    BComPort.BeginUpdate;
    BComPort.Timeouts.ReadInterval := -1;
    if flagModem then
      BComPort.Timeouts.ReadTotalConstant := 1500
    else
      BComPort.Timeouts.ReadTotalConstant := 500;
    BComPort.Timeouts.ReadTotalMultiplier := -1;
    BComPort.EndUpdate;
  end;
}
  SetLength(timeOpr, Length(Form1.massivOprosa));
  Form1.sGauge1.MaxValue := Length(Form1.massivOprosa) * 2;

  for i := 0 to Length(Form1.massivOprosa) - 1 do
  begin
    //Проверка на необходимость программирования
    if (Form1.massivOprosa[i, 0, 0, 13] <> '1') then
    begin
      Form1.massivOprosa[i, 0, 0, 13] := '2';
      Continue;
    end;
    if Form1.massivOprosa[i, 0, 0, 12] = 'GPRS' then
      flagGPRS := True
    else
      flagGPRS := False;
    if not flagGPRS then
    begin
      BComPort := TComPort.Create(nil);
      //Установка параметров порта и его открытие
      if not NastrPort(flagSchitivatel) then
        goto labelkonec;

      if flagModem then
      begin
        if not IniModem then //Если модем недоступен то выйти из процедуры
          goto labelkonec;
      end;

      BComPort.BeginUpdate;
      BComPort.Timeouts.ReadInterval := -1;
      if flagModem then
        BComPort.Timeouts.ReadTotalConstant := 1500
      else
        BComPort.Timeouts.ReadTotalConstant := 500;
      BComPort.Timeouts.ReadTotalMultiplier := -1;
      BComPort.EndUpdate;
    end;
    //------Установка начальных параметров-----
    timeOpr[i] := 0; //Установка начального времени опроса счетчиков
    nomVarTar := nil;
    SetLength(nomVarTar, 10);
    povtorDozvona := 0;
    for k := 0 to 9 do
      nomVarTar[k] := false;
    //------------------------------------------

    if flagGPRS then
    begin
      UpdateLog('Соединение с концентратором по IP ' + Form1.massivOprosa[i, 0,
        0, 10] + '. Адрес: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
      if not Dozvon(Form1.massivOprosa[i, 0, 0, 10]) then
      begin
        UpdateLog('Невозможно установить соединение с концентратором по адресу '
          + Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(' ', colorOk);
        UpdateLog(Form1.sRichEdit2.Handle,
          'Не удалось установить соединение с концентратором по адресу ' +
          Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
        goto labelkonec;
      end;
      Sleep(3000);
    end
    else
    begin
      if flagModem then
      begin
        UpdateLog('Дозвон до концентратора по номеру ' + Form1.massivOprosa[i, 0,
          0, 2] + '. Адрес: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
        if not Dozvon(Form1.massivOprosa[i, 0, 0, 2]) then
        begin
          UpdateLog('Невозможно установить соединение с концентратором по адресу '
            + Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(' ', colorOk);
          UpdateLog(Form1.sRichEdit2.Handle,
            'Не удалось установить соединение с концентратором по адресу ' +
            Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
          goto labelkonec;
        end;
      end;
    end;

    UpdateLog('Программирование концентратора на чтение', colorOk);
    Synchronize(PuskTimer);
    DecodeTime(Time, hour, min, sec, msec);
    nachOprosa := 3600 * hour + 60 * min + sec;
    //----------------------------------------------
    //  Запись времени и даты
    //---------------------------------------------
    SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR('0')));
    schetchikByte := 0;
    SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(schetchikByte))));
    Inc(schetchikByte);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]),
      PChar('F0000')); //Определение номера последнего разъёма
    SetLength(bufPer, Length(bufPer) + 9);
    bufPer[16] := 8;
    bufPer[17] := CRC(bufPer, 0, 16);
    DecodeTime(Time, hour, min, sec, msec);
    DecodeDateFully(Date, year, month, day, DOW);
    bufper[18] := NumStringToBCD(Pchar(IntToStr(sec)))[0];
    bufper[19] := NumStringToBCD(Pchar(IntToStr(min)))[0];
    bufper[20] := NumStringToBCD(Pchar(IntToStr(hour)))[0];
    bufper[21] := NumStringToBCD(PChar(IntToStr(DOW - 1)))[0];
    bufper[22] := NumStringToBCD(PChar(IntToStr(day)))[0];
    bufper[23] := NumStringToBCD(PChar(IntToStr(month)))[0];
    bufper[24] := NumStringToBCD(PChar(Copy(IntToStr(year), 3, 2)))[0];
    bufper[25] := 128;
    bufper[26] := CRC(bufper, 0, 25);
    if not WriteData(bufper, i) then
    begin
      Razriv;
      LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
      goto labelkonec;
    end;
    UpdateLog('    Записана дата и время', colorRab);
    //*****************************************************************

    //------------------------------------------------------
    //****************Программирование теплосчётчика*****************
    //------------------------------------------------------
    if Length(Form1.massivOprosa[i, 0]) = 2 then
    begin
      case FormOptions.sRadioGroup2.ItemIndex of
        //Выбор читаемых данных флэш ТЭМ-104 в зависимости от настроек
        0: bufper := FormirBufFor_TEM_104(PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]),
            PChar(Form1.massivOprosa[i, 0, 0, 3]), StrToInt(Form1.massivOprosa[i, 0, 1, 0][9]), FormOptions.sSpinEdit3.Value, $00000000,
            FormOptions.sComboBox6.ItemIndex);
        1: bufper := FormirBufFor_TEM_104(PChar(Form1.massivOprosa[i, 0, 0, 5]),
            PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
            3]), StrToInt(Form1.massivOprosa[i, 0, 1, 0][9]),
              FormOptions.sSpinEdit3.Value, $00060000,
            FormOptions.sComboBox6.ItemIndex);
        2: bufper := FormirBufFor_TEM_104(PChar(Form1.massivOprosa[i, 0, 0, 5]),
            PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
            3]), StrToInt(Form1.massivOprosa[i, 0, 1, 0][9]),
              FormOptions.sSpinEdit3.Value, $00078000,
            FormOptions.sComboBox6.ItemIndex);
      end;

      if not WriteData(bufper, i) then
      begin
        Razriv;
        LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
        goto labelkonec;
      end;
      UpdateLog('    Концентратор запрограммирован на чтение ТЭМ-104',
        colorRab);
    end;

    //***************************************************************

    countRaz := 0;
    for j := 1 to Length(Form1.massivOprosa[i]) - 1 do
    begin
      //Если в программируемом разъёме нет ни одного счётчика - переход на следующий разъём
      if (Length(Form1.massivOprosa[i, j]) <= 1) then
        Continue;
      Inc(countRaz);
      //-----------------------------------------------
      //| Запись в устройство названия разъёма
      //-----------------------------------------------
      configPerNasv := nil;
      SetLength(configPerNasv, 3);
      //      configPerNasv[0] := PChar(IntToStr(j));
      configPerNasv[0] := PChar(IntToStr(countRaz));
      configPerNasv[1] := PChar(Form1.massivOprosa[i, j, 0, 0]);
      configPerNasv[2] := PChar(IntToStr(Length(Form1.massivOprosa[i, j]) - 1));
      bufper := FormirBuf_SapNazvRas(PChar(Form1.massivOprosa[i, 0, 0, 5]),
        PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
        3]), configPerNasv);
      if not WriteData(bufper, i) then
      begin
        Razriv;
        LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
        goto labelkonec;
      end;
      //***************************************

      //-----------------------------------------------
      //|       Запись номеров счетчиков
      //-----------------------------------------------
      configPerNomSch := nil;
      SetLength(configPerNomSch, 12);
      SetLength(configPerNomSch[0], 2);
      configPerNomSch[0, 1] := PChar(ReverseString(Trim(Copy(ReverseString(Form1.massivOprosa[i, j, 0, 0]), 1, 2))));
      //      configPerNomSch[0, 0] := PChar(IntToStr(j)); //Номер адреса для передачи
      configPerNomSch[0, 0] := PChar(IntToStr(countRaz)); //Номер адреса для передачи
      for k := 1 to Length(Form1.massivOprosa[i, j]) - 1 do
      begin
        SetLength(configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1])], Length(configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1])]) + 1);
        configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1]), Length(configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1])]) - 1] :=
        PChar(Form1.massivOprosa[i, j, k, 0]);
      end;
      bufper := FormirBuf_SapNomerovSch(PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0,
        0, 3]), configPerNomSch);
      for k := 1 to 10 do
        if Length(configPerNomSch[k]) <> 0 then
          nomVarTar[k - 1] := true;
      if not WriteData(bufper, i) then
      begin
        Razriv;
        LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
        goto labelkonec;
      end;
      UpdateLog('    Запрограммирован на чтение ' + Form1.massivOprosa[i, j, 0, 0], colorRab);
      //*************************************************
    end;

    if not flagGPRS then
      BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]),
      PChar(IntToStr(countRaz)));
    //      PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(IntToStr(Length(Form1.massivOprosa[i]) - 1)));

        //Определение номера последнего разъёма
    SetLength(bufPer, Length(bufPer) + 2);
    bufPer[16] := 1;
    bufPer[17] := CRC(bufPer, 0, 16);
    bufPer[18] := 255;
    bufPer[19] := CRC(bufPer, 0, 18);
    if not WriteData(bufper, i) then
    begin
      Razriv;
      LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
      goto labelkonec;
    end;

    //-----------------------------------------------------
    //    Передача адресов чтения по вариантам тарификации
    //-----------------------------------------------------
    for k := 1 to 10 do //Перебираем все варианты тарификации
      if nomVarTar[k - 1] = true then
      begin
        configPerAdr := nil;
        for n := 0 to Length(Form1.ParOprosa[0]) - 1 do
        begin
          SetLength(configPerAdr, Length(configPerAdr) + 1);
          configPerAdr[n] := PChar(Form1.ParOprosa[0, n]);
        end;
        for n := 0 to Length(Form1.ParOprosa[k]) - 1 do
        begin
          SetLength(configPerAdr, Length(configPerAdr) + 1);
          configPerAdr[Length(configPerAdr) - 1] := PChar(Form1.ParOprosa[k, n]);
        end;
        bufper := FormirBuf_SapAdrCht_Sapisi(PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]),
          PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 4]), PChar(Form1.massivOprosa[i, 0, 0, 8]), k,
          countRaz, configPerAdr, true);
        //          Length(Form1.massivOprosa[i]) - 1, configPerAdr, true);
        if not WriteData(bufper, i) then
        begin
          Razriv;
          LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
          goto labelkonec;
        end;
      end;
    //***************************************************

    //------------------------------------------------------
    //    Посылка конца передачи
    //------------------------------------------------------
    if not flagGPRS then
      BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]),
      PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
      3]), PChar('1E84'));
    SetLength(bufPer, Length(bufPer) + 4);
    bufPer[16] := 3;
    bufPer[17] := CRC(bufPer, 0, 16);
    bufPer[18] := 1;
    bufPer[19] := 0;
    if flagAutomatCht then
      bufPer[20] := 1
    else
      bufPer[20] := 0;
    bufPer[21] := CRC(bufPer, 0, 20);
    if not WriteData(bufper, i) then
    begin
      Razriv;
      LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
      goto labelkonec;
    end;

    if not flagGPRS then
      BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]),
      PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
      3]), PChar('1E88'));
    SetLength(bufPer, Length(bufPer) + 2);
    bufPer[16] := 1;
    bufPer[17] := CRC(bufPer, 0, 16);
    bufPer[18] := 0;
    bufPer[19] := CRC(bufPer, 0, 18);
    if not WriteData(bufper, i) then
    begin
      Razriv;
      LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
      goto labelkonec;
    end;

    //----------------------------------------------
    //    Определение времени необходимого для опроса счетчиков
    //    и количества счетчиков
    //----------------------------------------------
    countSchetchikov := 0;
    DecodeTime(Time, hour, min, sec, msec);
    timeOpr[i] := hour * 3600 + min * 60 + sec; //Начало времени опроса
    for j := 1 to Length(Form1.massivOprosa[i]) - 1 do
      for k := 1 to Length(Form1.massivOprosa[i, j]) - 1 do
        Inc(countSchetchikov); //Каждый счетчик (количество секунд)
    SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(countSchetchikov))));
    //время опроса одного счётчика на количество секунд
    timeOpr[i] := timeOpr[i] + Round(timeOdinSch * countSchetchikov);
    //Если в адресе присутствует теплосчетчик
    if Length(Form1.massivOprosa[i, 0]) = 2 then
      //Время на опрос теплосчетчика
      timeOpr[i] := timeOpr[i] + 30 + Round(FormOptions.sSpinEdit3.Value / 2);
    //Добавление времени на инициализацию концентратора
    timeOpr[i] := timeOpr[i] + 20;
    //***************************************************

    UpdateLog('Концентратор, расположенный по адресу: ' + Form1.massivOprosa[i,
      0, 0, 1] + ', запрограммирован на чтение', colorOk);
    SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(0))));
    DecodeTime(Time, hour, min, sec, msec);
    nachOprosa := (3600 * hour + 60 * min + sec) - nachOprosa;
    Synchronize(StopTimer);
    UpdateLog('Время работы с концентратором: ' + (IntToStr(nachOprosa div 60)) +
      ':' + FormatFloat('00', nachOprosa mod 60), colorOk);
    UpdateLog(' ', colorOk);
    Razriv; //разрыв связи с концентратором
    labelkonec:
    if (not flagGPRS) then
    begin
      if BComPort <> nil then
      begin
        BComPort.Close;
        BComPort.Free;
      end;
    end;
    Synchronize(incGauge1); //Увеличение на одну единицу общего прогресса
  end;
end;

procedure TDeviceThread.ProgrNaChtenieSchit;
var
  hour: Word;
  min: Word;
  sec: Word;
  msec: Word;
  year: Word;
  month: Word;
  day: Word;
  DOW: Word;
  i: integer;
  j: Integer;
  k: integer;
  n: integer;
  countRaz: integer;
  schetchikByte: integer;
  nomVarTar: array of Boolean;
  //маассив для хранение данных о сущ. в дресе вариантах тарификации
  bufper: TBytes;
  bufpriema: TBytes;
  configPerNasv: array of PChar;
  configPerAdr: array of PChar;
  configPerNomSch: array of bufPchar;
  numberRaz: Byte;
label
  labelKonec;
begin
  //------------------------------------------
  //   Form1.massivOprosa - конфигурация опроса
  //   x - номер опрашиваемого объекта
  //   y - в зависимости от количества разъёмов (от 1 до 15)
  //   z - в зависимости от количества счётчиков в разъёме (начиная с 1)
  //   Form1.massivOprosa[x, 0, 0, 1] - адрес опрашиваемого объекта
  //   Form1.massivOprosa[x, 0, 0, 2] - номер SIM карты концентратора
  //   Form1.massivOprosa[x, 0, 0, 3] - пароль концентратора
  //   Form1.massivOprosa[x, 0, 0, 4] - пароль счетчиков
  //   Form1.massivOprosa[x, 0, 0, 5] - номер концентратора
  //
  //   Form1.massivOprosa[x, y, 0, 0] - название разъёма
  //
  //   Form1.massivOprosa[x, y, z, 0] - номер счётчика
  //   Form1.massivOprosa[x, y, z, 1] - вариант тарификачии счётчика
  //
  //******************************************
  //  0 - 0 - 0 - 0     - Город
  //   |       |- 1     - Адрес порашиваемого объекта
  //   |       |- 2     - Номер SIM карты концентратора
  //   |       |- 3     - пароль концентратора
  //   |       |- 4     - пароль счетчиков
  //   |       |- 5     - номер концентратора
  //   |       |- 6     - количество счетчиков в адресе
  //   |
  //   |- 1 - 0 - 0     - название разъёма
  //   |   |
  //   |   |- 1 - 0     - номер счетчика
  //   |   |   |- 1     - выриант тарификации
  //   |   ........
  //   |   |- n - 0
  //   |       |- 1
  //   ............
  //   |- m - 0 - 0
  //       |
  //       |- 1 - 0     - номер счетчика
  //       |   |- 1     - выриант тарификации
  //       ........
  //       |- n - 0
  //           |- 1

  BComPort := TComPort.Create(nil);
  //Установка параметров порта и его открытие
  if not NastrPort(flagSchitivatel) then
    goto labelkonec;
  BComPort.BeginUpdate;
  BComPort.Timeouts.ReadInterval := -1;
  BComPort.Timeouts.ReadTotalConstant := 500;
  BComPort.Timeouts.ReadTotalMultiplier := -1;
  BComPort.EndUpdate;
  SetLength(timeOpr, Length(Form1.massivOprosa));

  UpdateLog('Программирование считывателя на чтение', colorOk);
  //----------------------------------------------
  //  Запись времени и даты
  //---------------------------------------------
  SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR('0')));
  schetchikByte := 0;
  SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
    Lparam(LPCTSTR(IntToStr(schetchikByte))));
  Inc(schetchikByte);
  bufPer := Shapka(true, PChar(Form1.massivOprosa[0, 0, 0, 5]),
    PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0, 3]),
    PChar('F0000')); //Определение номера последнего разъёма
  SetLength(bufPer, Length(bufPer) + 9);
  bufPer[16] := 8;
  bufPer[17] := CRC(bufPer, 0, 16);
  DecodeTime(Time, hour, min, sec, msec);
  DecodeDateFully(Date, year, month, day, DOW);
  bufper[18] := NumStringToBCD(Pchar(IntToStr(sec)))[0];
  bufper[19] := NumStringToBCD(Pchar(IntToStr(min)))[0];
  bufper[20] := NumStringToBCD(Pchar(IntToStr(hour)))[0];
  bufper[21] := NumStringToBCD(PChar(IntToStr(DOW - 1)))[0];
  bufper[22] := NumStringToBCD(PChar(IntToStr(day)))[0];
  bufper[23] := NumStringToBCD(PChar(IntToStr(month)))[0];
  bufper[24] := NumStringToBCD(PChar(Copy(IntToStr(year), 3, 2)))[0];
  bufper[25] := 128;
  bufper[26] := CRC(bufper, 0, 25);
  repeat
    BComPort.ClearBuffer(true, true);
    WriteBufInPort(bufper);
    bufPriema := nil;
    SetLength(bufPriema, 18);
    WriteLog('ЧТ. ');
    for n := 0 to 17 do
    begin
      BComPort.Read(@bufPriema[n], 1);
      SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
        Lparam(LPCTSTR(IntToStr(schetchikByte))));
      Inc(schetchikByte);
      WriteLog(IntToStr(bufPriema[n]) + ',');
    end;
    WritelnLog('.');
  until (bufper[17] = bufPriema[17] - bufPriema[12]);
  if bufPriema[12] <> 0 then
  begin
    UpdateLog(DetectError(bufpriema), colorError);
    goto labelkonec;
  end;
  UpdateLog('    Записана дата и время', colorRab);
  //****************************************************************

  nomVarTar := nil;
  SetLength(nomVarTar, 10);
  for k := 0 to 9 do
    nomVarTar[k] := false;
  countRaz := 0;

  for i := 0 to Length(Form1.massivOprosa) - 1 do
  begin
    //------------------------------------------------------
    //****************Программирование теплосчётчика*****************
    //------------------------------------------------------
    {
          if Length(Form1.massivOprosa[i, 0]) = 2 then
            begin
               case FormOptions.sRadioGroup2.ItemIndex of
                //Выбор читаемых данных флэш ТЭМ-104 в зависимости от настроек
                0: bufper := FormirBufFor_TEM_104(PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]), StrToInt(Form1.massivOprosa[i, 0, 1, 0][9]), FormOptions.sSpinEdit3.Value, $00000000);
                1: bufper := FormirBufFor_TEM_104(PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]), StrToInt(Form1.massivOprosa[i, 0, 1, 0][9]), FormOptions.sSpinEdit3.Value, $00060000);
                2: bufper := FormirBufFor_TEM_104(PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]), StrToInt(Form1.massivOprosa[i, 0, 1, 0][9]), FormOptions.sSpinEdit3.Value, $00078000);
              end;
              for k := 0 to (Length(bufper)-1) div 51  do
                begin
                  BComPort.ClearBuffer(true, true);
                  WriteLog('ЗП. ');
                  for n := k*51 to k*51 + 50 do
                    if n < Length(bufPer) then
                      begin
                        BComPort.Write(@bufPer[n], 1);
                        WriteLog(IntToStr(bufPer[n])+',');
                      end
                    else
                      break;
                  WritelnLog('.');
                end;
              Sleep(ojid);
              UpdateLog('    Считываттель запрограммирован на чтение ТЭМ-104', colorRab);
            end;
    }

    for j := 1 to Length(Form1.massivOprosa[i]) - 1 do
    begin
      //-----------------------------------------------
      //| Запись в устройство названия разъёма
      //-----------------------------------------------
      configPerNasv := nil;
      SetLength(configPerNasv, 3);
      configPerNasv[0] := PChar(IntToStr(countRaz + 1));
      configPerNasv[1] := PChar(Form1.massivOprosa[i, j, 0, 0]);
      configPerNasv[2] := PChar(IntToStr(Length(Form1.massivOprosa[i, j]) - 1));
      bufper := FormirBuf_SapNazvRas(PChar(Form1.massivOprosa[i, 0, 0, 5]),
        PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
        3]), configPerNasv);
      repeat
        BComPort.ClearBuffer(true, true);
        WriteBufInPort(bufper);
        bufPriema := nil;
        SetLength(bufPriema, 18);
        WriteLog('ЧТ. ');
        for n := 0 to 17 do
        begin
          BComPort.Read(@bufPriema[n], 1);
          SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
            Lparam(LPCTSTR(IntToStr(schetchikByte))));
          Inc(schetchikByte);
          WriteLog(IntToStr(bufPriema[n]) + ',');
        end;
        WritelnLog('.');
      until ((bufPriema[12] = 0) and (bufper[17] = bufPriema[17]));

      //***************************************

      //-----------------------------------------------
      //|       Запись номеров счетчиков
      //-----------------------------------------------
      configPerNomSch := nil;
      SetLength(configPerNomSch, 12);
      SetLength(configPerNomSch[0], 2);
      configPerNomSch[0, 1] :=
        PChar(ReverseString(Trim(Copy(ReverseString(Form1.massivOprosa[i, j, 0,
        0]), 1, 2))));
      configPerNomSch[0, 0] := PChar(IntToStr(j)); //Номер адреса для передачи
      for k := 1 to Length(Form1.massivOprosa[i, j]) - 1 do
      begin
        SetLength(configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1])],
          Length(configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1])]) + 1);
        configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1]),
          Length(configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1])]) - 1]
        := PChar(Form1.massivOprosa[i, j, k, 0]);
      end;
      configPerNomSch[0, 0] := PChar(IntToStr(countRaz + 1));
      bufper := FormirBuf_SapNomerovSch(PChar(Form1.massivOprosa[i, 0, 0, 5]),
        PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
        3]), configPerNomSch);
      for k := 1 to 10 do
        if Length(configPerNomSch[k]) <> 0 then
          nomVarTar[k - 1] := true;
      for k := 0 to (Length(bufper) - 1) div 51 do
        repeat
          BComPort.ClearBuffer(true, true);
          WriteLog('ЗП. ');
          for n := k * 51 to k * 51 + 50 do
            if n < Length(bufPer) then
            begin
              BComPort.Write(@bufPer[n], 1);
              WriteLog(IntToStr(bufPer[n]) + ',');
            end
            else
              break;
          WritelnLog('.');
          bufPriema := nil;
          SetLength(bufPriema, 18);
          WriteLog('ЧТ. ');
          for n := 0 to 17 do
          begin
            BComPort.Read(@bufPriema[n], 1);
            SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
              Lparam(LPCTSTR(IntToStr(schetchikByte))));
            Inc(schetchikByte);
            WriteLog(IntToStr(bufPriema[n]) + ',');
          end;
          WritelnLog('.');
        until ((bufPriema[12] = 0) and (bufper[17 + k * 51] = bufPriema[17]));
      Inc(countRaz);
      UpdateLog('    Запрограммирован на чтение ' + Form1.massivOprosa[i, j, 0,
        0], colorRab);
      //*************************************************
    end;
  end;

  repeat
    BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[0, 0, 0, 5]),
      PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0,
      3]), PChar(IntToStr(countRaz)));
    SetLength(bufPer, Length(bufPer) + 2);
    bufPer[16] := 1;
    bufPer[17] := CRC(bufPer, 0, 16);
    bufPer[18] := 255;
    bufPer[19] := CRC(bufPer, 0, 18);
    WriteBufInPort(bufper);
    bufPriema := nil;
    SetLength(bufPriema, 18);
    WriteLog('ЧТ. ');
    for n := 0 to 17 do
    begin
      BComPort.Read(@bufPriema[n], 1);
      SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
        Lparam(LPCTSTR(IntToStr(schetchikByte))));
      Inc(schetchikByte);
      WriteLog(IntToStr(bufPriema[n]) + ',');
    end;
    WritelnLog('.');
  until ((bufPriema[12] = 0) and (bufper[17] = bufPriema[17]));

  //-----------------------------------------------------
  //    Передача адресов чтения по вариантам тарификации
  //-----------------------------------------------------
  for k := 1 to 10 do //Перебираем все варианты тарификации
    if nomVarTar[k - 1] = true then
    begin
      configPerAdr := nil;
      for n := 0 to Length(Form1.ParOprosa[0]) - 1 do
      begin
        SetLength(configPerAdr, Length(configPerAdr) + 1);
        configPerAdr[n] := PChar(Form1.ParOprosa[0, n]);
      end;
      for n := 0 to Length(Form1.ParOprosa[k]) - 1 do
      begin
        SetLength(configPerAdr, Length(configPerAdr) + 1);
        configPerAdr[Length(configPerAdr) - 1] := PChar(Form1.ParOprosa[k, n]);
      end;
      bufper := FormirBuf_SapAdrCht_Sapisi(PChar(Form1.massivOprosa[0, 0, 0,
        5]),
          PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0,
        3]),
          PChar(Form1.massivOprosa[0, 0, 0, 4]), PChar(Form1.massivOprosa[0, 0, 0,
        8]),
          k, countRaz, configPerAdr, true);
      for j := 0 to (Length(bufper) div 51) do
        repeat
          BComPort.ClearBuffer(true, true);
          WriteLog('ЗП. ');
          for n := j * 51 to j * 51 + 50 do
            if n < Length(bufPer) then
            begin
              BComPort.Write(@bufPer[n], 1);
              WriteLog(IntToStr(bufPer[n]) + ',');
            end
            else
              break;
          WritelnLog('.');
          bufPriema := nil;
          SetLength(bufPriema, 18);
          WriteLog('ЧТ. ');
          for n := 0 to 17 do
          begin
            BComPort.Read(@bufPriema[n], 1);
            SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
              Lparam(LPCTSTR(IntToStr(schetchikByte))));
            Inc(schetchikByte);
            WriteLog(IntToStr(bufPriema[n]) + ',');
          end;
          WritelnLog('.');
        until ((bufPriema[12] = 0) and (bufper[17 + j * 51] = bufPriema[17]));
    end;

  //***************************************************

  //------------------------------------------------------
  //    Посылка конца передачи
  //------------------------------------------------------
  repeat
    BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[0, 0, 0, 5]),
      PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0,
      3]), PChar('1E84'));
    SetLength(bufPer, Length(bufPer) + 4);
    bufPer[16] := 3;
    bufPer[17] := CRC(bufPer, 0, 16);
    bufPer[18] := 1;
    bufPer[19] := 0;
    if flagAutomatCht then
      bufPer[20] := 1
    else
      bufPer[20] := 0;
    bufPer[21] := CRC(bufPer, 0, 20);
    WriteBufInPort(bufper);
    bufPriema := nil;
    SetLength(bufPriema, 18);
    WriteLog('ЧТ. ');
    for n := 0 to 17 do
    begin
      BComPort.Read(@bufPriema[n], 1);
      SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
        Lparam(LPCTSTR(IntToStr(schetchikByte))));
      Inc(schetchikByte);
      WriteLog(IntToStr(bufPriema[n]) + ',');
    end;
    WritelnLog('.');
  until ((bufPriema[12] = 0) and (bufper[17] = bufPriema[17]));

  repeat
    BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[0, 0, 0, 5]),
      PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0,
      3]), PChar('1E88'));
    SetLength(bufPer, Length(bufPer) + 2);
    bufPer[16] := 1;
    bufPer[17] := CRC(bufPer, 0, 16);
    bufPer[18] := 0;
    bufPer[19] := CRC(bufPer, 0, 18);
    WriteBufInPort(bufper);
    bufPriema := nil;
    SetLength(bufPriema, 18);
    WriteLog('ЧТ. ');
    for n := 0 to 17 do
    begin
      BComPort.Read(@bufPriema[n], 1);
      SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
        Lparam(LPCTSTR(IntToStr(schetchikByte))));
      Inc(schetchikByte);
      WriteLog(IntToStr(bufPriema[n]) + ',');
    end;
    WritelnLog('.');
  until ((bufPriema[12] = 0) and (bufper[17] = bufPriema[17]));

  repeat
    BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[0, 0, 0, 5]),
      PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0,
      3]), PChar('1EC8'));
    SetLength(bufPer, Length(bufPer) + 4);
    bufPer[16] := 3;
    bufPer[17] := CRC(bufPer, 0, 16);
    bufPer[18] := 0;
    bufPer[19] := 0;
    bufPer[20] := 0;
    bufPer[21] := CRC(bufPer, 0, 20);
    WriteBufInPort(bufper);
    bufPriema := nil;
    SetLength(bufPriema, 18);
    WriteLog('ЧТ. ');
    for n := 0 to 17 do
    begin
      BComPort.Read(@bufPriema[n], 1);
      SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
        Lparam(LPCTSTR(IntToStr(schetchikByte))));
      Inc(schetchikByte);
      WriteLog(IntToStr(bufPriema[n]) + ',');
    end;
    WritelnLog('.');
  until ((bufPriema[12] = 0) and (bufper[17] = bufPriema[17]));

  repeat
    BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[0, 0, 0, 5]),
      PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0,
      3]), PChar('1E82'));
    SetLength(bufPer, Length(bufPer) + 2);
    bufPer[16] := 1;
    bufPer[17] := CRC(bufPer, 0, 16);
    bufPer[18] := 0;
    bufPer[19] := CRC(bufPer, 0, 18);
    WriteBufInPort(bufper);
    bufPriema := nil;
    SetLength(bufPriema, 18);
    WriteLog('ЧТ. ');
    for n := 0 to 17 do
    begin
      BComPort.Read(@bufPriema[n], 1);
      SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
        Lparam(LPCTSTR(IntToStr(schetchikByte))));
      Inc(schetchikByte);
      WriteLog(IntToStr(bufPriema[n]) + ',');
    end;
    WritelnLog('.');
  until ((bufPriema[12] = 0) and (bufper[17] = bufPriema[17]));

  UpdateLog('Считыватель запрограммирован на чтение', colorOk);
  labelkonec:

  if BComPort <> nil then
  begin
    BComPort.Close;
    BComPort.Free;
  end;

end;

procedure TDeviceThread.ProgrWrite;
const
  AdrWriteVarTar: array[1..10] of Word = ($2080, $2180, $2280, $2380, $2480,
    $2580, $2680, $2780, $2880, $2980);
  procedure LogErrorProgram(adr: string);
  begin
    UpdateLog(Form1.sRichEdit2.Handle,
      'Не удалось установить соединение с концентратором по адресу ' + adr,
      colorError);
    UpdateLog(Form1.sRichEdit2.Handle, ' ', colorError);
  end;
var
  hour: Word;
  min: Word;
  sec: Word;
  msec: Word;
  year: Word;
  month: Word;
  day: Word;
  DOW: Word;
  i: integer;
  j: Integer;
  k: integer;
  n: integer;
  temp_endByte: Integer;
  nachOprosa: integer;
  countSchetchikov: integer;
  povtorDozvona: integer;
  adr_write_params: Integer;
  nomerByte: Integer;
  nomVarTar: array of Boolean;
  //массив для хранение данных о сущ. в дресе вариантах тарификации
  bufper: TBytes;
  bufPriema: TBytes;
  tempBuf: TBytes;
  tempBuf2: TBytes;
  configPerNasv: array of PChar;
  configPerAdr: array of PChar;
  configPerNomSch: array of bufPchar;
  adrWrite: array[1..10] of TWord;
  tempStr: string;
  bufApn: TBytes;
label
  labelkonec;

  function WriteParams(numAdr: Integer; adrParams: Word; var bufWrite: TBytes;
    numVT: Byte): Boolean;
  var
    m, t: Integer;
  begin
    Result := True;
    bufPer := Shapka(true, PChar(Form1.massivOprosa[numAdr, 0, 0, 5]),
      PChar(Form1.massivOprosa[numAdr, 0, 0, 3]), PChar(Form1.massivOprosa[numAdr,
      0, 0, 3]), PChar(IntToHex(adr_write_params, 4)));
    //Если данных для передачи только на один пакет
    if Length(bufWrite) <= 29 then
    begin
      SetLength(bufper, length(bufper) + 4 + length(bufWrite));
      bufper[16] := length(bufWrite) + 3; //Количество заисываемых байт
      bufper[17] := CRC(bufper, 0, 16);
      bufper[18] := adrParams and $FF;
      ; //Адрес
      bufper[19] := (adrParams shr 8) and $FF;
      bufper[20] := length(bufWrite);
      for m := 0 to length(bufWrite) - 1 do
        bufper[21 + m] := bufWrite[m];
      bufper[High(bufper)] := CRC(bufper, 0, High(bufper) - 1);
      SetLength(adrWrite[numVt], Length(adrWrite[numVT]) + 1);
      adrWrite[numVt][High(adrWrite[numVt])] := adr_write_params;

      if not WriteData(bufper, numAdr) then
      begin
        Razriv;
        LogErrorProgram(Form1.massivOprosa[numAdr, 0, 0, 1]);
        Result := False;
        Exit;
      end;

    end
    else
    begin
      SetLength(bufper, 51);
      bufper[16] := 32; //Количество запсываемых байт
      bufper[17] := CRC(bufper, 0, 16);
      bufper[18] := adrParams and $FF;
      ; //Адрес
      bufper[19] := (adrParams shr 8) and $FF;
      bufper[20] := length(bufWrite);
      for m := 0 to 28 do
        bufper[21 + m] := bufWrite[m];
      bufper[50] := CRC(bufper, 0, 49);
      SetLength(adrWrite[numVt], Length(adrWrite[numVT]) + 1);
      adrWrite[numVt][High(adrWrite[numVt])] := adr_write_params;

      if not WriteData(bufper, numAdr) then
      begin
        Razriv;
        LogErrorProgram(Form1.massivOprosa[numAdr, 0, 0, 1]);
        Result := False;
        Exit;
      end;

      temp_endByte := 29;
      for t := 1 to (((Length(bufWrite) - 30) div 32) + 1) do
      begin
        adr_write_params := adr_write_params + 32;
        bufPer := Shapka(true, PChar(Form1.massivOprosa[numAdr, 0, 0, 5]),
          PChar(Form1.massivOprosa[numAdr, 0, 0, 3]),
          PChar(Form1.massivOprosa[numAdr, 0, 0, 3]),
          PChar(IntToHex(adr_write_params, 4)));
        //Если текущий пакет не полный
        if (Length(bufWrite) - temp_endByte) < 32 then
        begin
          SetLength(bufper, length(bufper) + (Length(bufWrite) - temp_endByte) +
            1);
          bufper[16] := Length(bufWrite) - temp_endByte;
          //Количество запсываемых байт
          bufper[17] := CRC(bufper, 0, 16);
          for m := 18 to (bufper[16] + 18 - 1) do
          begin
            bufper[m] := bufWrite[temp_endByte];
            Inc(temp_endByte);
          end;
          bufper[High(bufper)] := CRC(bufper, 0, High(bufper) - 1);
        end
          // Если пакет полный
        else
        begin
          SetLength(bufper, 51);
          bufper[16] := 32; //Количество записываемых байт
          bufper[17] := CRC(bufper, 0, 16);
          for m := 18 to (bufper[16] + 18 - 1) do
          begin
            bufper[m] := bufWrite[temp_endByte];
            Inc(temp_endByte);
          end;
          bufper[High(bufper)] := CRC(bufper, 0, High(bufper) - 1);
        end;

        if not WriteData(bufper, numAdr) then
        begin
          Razriv;
          LogErrorProgram(Form1.massivOprosa[numAdr, 0, 0, 1]);
          Result := False;
          Exit;
        end;

      end;
    end;

  end;

  function WritePass(numAdr: Integer; adrParams: Word; var bufWrite: TBytes;
    numVT: Byte): Boolean;
  var
    m, t: Integer;
  begin
    Result := True;
    bufPer := Shapka(true, PChar(Form1.massivOprosa[numAdr, 0, 0, 5]),
      PChar(Form1.massivOprosa[numAdr, 0, 0, 3]), PChar(Form1.massivOprosa[numAdr,
      0, 0, 3]), PChar(IntToHex(adrParams, 4)));
    //Если данных для передачи только на один пакет
    if Length(bufWrite) <= 32 then
    begin
      SetLength(bufper, length(bufper) + 1 + length(bufWrite));
      bufper[16] := length(bufWrite); //Количество заисываемых байт
      bufper[17] := CRC(bufper, 0, 16);
      for m := 0 to length(bufWrite) - 1 do
        bufper[18 + m] := bufWrite[m];
      bufper[High(bufper)] := CRC(bufper, 0, High(bufper) - 1);
      if not WriteData(bufper, numAdr) then
      begin
        Razriv;
        LogErrorProgram(Form1.massivOprosa[numAdr, 0, 0, 1]);
        Result := False;
        Exit;
      end;
    end
    else
    begin
      SetLength(bufper, 51);
      bufper[16] := 32; //Количество запиываемых байт
      bufper[17] := CRC(bufper, 0, 16);

      for m := 0 to 31 do
        bufper[18 + m] := bufWrite[m];
      bufper[50] := CRC(bufper, 0, 49);

      if not WriteData(bufper, numAdr) then
      begin
        Razriv;
        LogErrorProgram(Form1.massivOprosa[numAdr, 0, 0, 1]);
        Result := False;
        Exit;
      end;

      temp_endByte := 32;
      for t := 1 to (((Length(bufWrite) - 33) div 32) + 1) do
      begin
        adr_write_params := adr_write_params + 32;
        bufPer := Shapka(true, PChar(Form1.massivOprosa[numAdr, 0, 0, 5]),
          PChar(Form1.massivOprosa[numAdr, 0, 0, 3]),
          PChar(Form1.massivOprosa[numAdr, 0, 0, 3]),
          PChar(IntToHex(adr_write_params, 4)));
        //Если текущий пакет не полный
        if (Length(bufWrite) - temp_endByte) < 32 then
        begin
          SetLength(bufper, length(bufper) + (Length(bufWrite) - temp_endByte) +
            1);
          bufper[16] := Length(bufWrite) - temp_endByte;
          //Количество запсываемых байт
          bufper[17] := CRC(bufper, 0, 16);
          for m := 18 to (bufper[16] + 18 - 1) do
          begin
            bufper[m] := bufWrite[temp_endByte];
            Inc(temp_endByte);
          end;
          bufper[High(bufper)] := CRC(bufper, 0, High(bufper) - 1);
        end
          // Если пакет полный
        else
        begin
          SetLength(bufper, 51);
          bufper[16] := 32; //Количество записываемых байт
          bufper[17] := CRC(bufper, 0, 16);
          for m := 18 to (bufper[16] + 18 - 1) do
          begin
            bufper[m] := bufWrite[temp_endByte];
            Inc(temp_endByte);
          end;
          bufper[High(bufper)] := CRC(bufper, 0, High(bufper) - 1);
        end;

        if not WriteData(bufper, numAdr) then
        begin
          Razriv;
          LogErrorProgram(Form1.massivOprosa[numAdr, 0, 0, 1]);
          Result := False;
          Exit;
        end;

      end;
    end;

  end;
begin
  //------------------------------------------
  //   Form1.massivOprosa - конфигурация опроса
  //   x - номер опрашиваемого объекта
  //   y - в зависимости от количества разъёмов (от 1 до 15)
  //   z - в зависимости от количества счётчиков в разъёме (начиная с 1)
  //   Form1.massivOprosa[x, 0, 0, 1] - адрес опрашиваемого объекта
  //   Form1.massivOprosa[x, 0, 0, 2] - номер SIM карты концентратора
  //   Form1.massivOprosa[x, 0, 0, 3] - пароль концентратора
  //   Form1.massivOprosa[x, 0, 0, 4] - пароль счетчиков
  //   Form1.massivOprosa[x, 0, 0, 5] - номер концентратора
  //
  //   Form1.massivOprosa[x, y, 0, 0] - название разъёма
  //
  //   Form1.massivOprosa[x, y, z, 0] - номер счётчика
  //   Form1.massivOprosa[x, y, z, 1] - вариант тарификачии счётчика
  //
  //******************************************
  //  0 - 0 - 0 - 0     - Город
  //   |   |   |- 1     - Адрес порашиваемого объекта
  //   |   |   |- 2     - Номер SIM карты концентратора
  //   |   |   |- 3     - пароль концентратора
  //   |   |   |- 4     - пароль счетчиков
  //   |   |   |- 5     - номер концентратора
  //   |   |   |- 6     - количество счетчиков в адресе
  //   |   |
  //   |   |- 1 - 0     - номер теплосчетчика ТЭМ-104
  //   |       |- 1     - номер разёъма на котором расположен теплосчесчик
  //   |
  //   |- 1 - 0 - 0     - название разъёма
  //   |   |
  //   |   |- 1 - 0     - номер счетчика
  //   |   |   |- 1     - выриант тарификации
  //   |   ........
  //   |   |- n - 0
  //   |       |- 1
  //   ............
  //   |- m - 0 - 0
  //       |
  //       |- 1 - 0     - номер счетчика
  //       |   |- 1     - выриант тарификации
  //       ........
  //       |- n - 0
  //           |- 1
  {
  if not flagGPRS then
  begin
    BComPort.BeginUpdate;
    BComPort.Timeouts.ReadInterval := -1;
    if flagModem then
      BComPort.Timeouts.ReadTotalConstant := 1500
    else
      BComPort.Timeouts.ReadTotalConstant := 500;
    BComPort.Timeouts.ReadTotalMultiplier := -1;
    BComPort.EndUpdate;
  end;
  }
  SetLength(timeOpr, Length(Form1.massivOprosa));

  for i := 0 to Length(Form1.massivOprosa) - 1 do
  begin
    if Form1.massivOprosa[i, 0, 0, 12] = 'GPRS' then
      flagGPRS := True
    else
      flagGPRS := False;

    if not flagGPRS then
    begin
      BComPort := TComPort.Create(nil);
      //Установка параметров порта и его открытие
      if not NastrPort(flagSchitivatel) then
        goto labelkonec;

      if flagModem then
      begin
        if not IniModem then //Если модем недоступен то выйти из процедуры
          goto labelkonec;
      end;

      BComPort.BeginUpdate;
      BComPort.Timeouts.ReadInterval := -1;
      if flagModem then
        BComPort.Timeouts.ReadTotalConstant := 1500
      else
        BComPort.Timeouts.ReadTotalConstant := 500;
      BComPort.Timeouts.ReadTotalMultiplier := -1;
      BComPort.EndUpdate;
    end;
    //------Установка начальных параметров-----
    timeOpr[i] := 0; //Установка начального времени записи  счетчиков
    nomVarTar := nil;
    SetLength(nomVarTar, 10);
    povtorDozvona := 0;
    for k := 0 to 9 do
      nomVarTar[k] := false;
    //------------------------------------------
    if flagGPRS then
    begin
      UpdateLog('Соединение с концентратором по IP ' + Form1.massivOprosa[i, 0,
        0, 10] + '. Адрес: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
      if not Dozvon(Form1.massivOprosa[i, 0, 0, 10]) then
      begin
        UpdateLog('Невозможно установить соединение с концентратором по адресу '
          + Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(' ', colorOk);
        UpdateLog(Form1.sRichEdit2.Handle,
          'Не удалось установить соединение с концентратором по адресу ' +
          Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
        goto labelkonec;
      end;
      Sleep(3000);
    end
    else
    begin
      if flagModem then
      begin
        UpdateLog('Дозвон до концентратора по номеру ' + Form1.massivOprosa[i, 0,
          0, 2] + '. Адрес: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
        if not Dozvon(Form1.massivOprosa[i, 0, 0, 2]) then
        begin
          UpdateLog('Невозможно установить соединение с концентратором по адресу '
            + Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(' ', colorOk);
          UpdateLog(Form1.sRichEdit2.Handle,
            'Не удалось установить соединение с концентратором по адресу ' +
            Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
          goto labelkonec;
        end;
      end;
    end;

    UpdateLog('Программирование концентратора на запись', colorOk);

    Synchronize(PuskTimer);
    DecodeTime(Time, hour, min, sec, msec);
    nachOprosa := 3600 * hour + 60 * min + sec;

    SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR('0')));
    schetchikByte := 0;
    SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(schetchikByte))));
    Inc(schetchikByte);
    //----------------------------------------------
    //  Запись времени и даты
    //---------------------------------------------
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]),
      PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
      3]), PChar('F0000')); //Определение номера последнего разъёма
    SetLength(bufPer, Length(bufPer) + 9);
    bufPer[16] := 8;
    bufPer[17] := CRC(bufPer, 0, 16);
    DecodeTime(Time, hour, min, sec, msec);
    DecodeDateFully(Date, year, month, day, DOW);
    bufper[18] := NumStringToBCD(Pchar(IntToStr(sec)))[0];
    bufper[19] := NumStringToBCD(Pchar(IntToStr(min)))[0];
    bufper[20] := NumStringToBCD(Pchar(IntToStr(hour)))[0];
    bufper[21] := NumStringToBCD(PChar(IntToStr(DOW - 1)))[0];
    bufper[22] := NumStringToBCD(PChar(IntToStr(day)))[0];
    bufper[23] := NumStringToBCD(PChar(IntToStr(month)))[0];
    bufper[24] := NumStringToBCD(PChar(Copy(IntToStr(year), 3, 2)))[0];
    bufper[25] := 128;
    bufper[26] := CRC(bufper, 0, 25);
    if not WriteData(bufper, i) then
    begin
      Razriv;
      LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
      goto labelkonec;
    end;
    UpdateLog('    Записана дата и время', colorRab);
    //**********************************************

    //----------------------------------------------
    //  Запись apn
    //---------------------------------------------
    if flagSetGPRSApn then
    begin
      tempStr := Form1.massivOprosa[i, 0, 0, 11];
      SetLength(bufApn, Length(Form1.massivOprosa[i, 0, 0, 11]) + 1);
      for k := 1 to Length(tempStr) do
      begin
        bufApn[k - 1] := Byte(tempStr[k]);
        bufper[17 + k] := Byte(tempStr[k]);
      end;
      bufApn[k - 1] := $0D;
      adr_write_params := $1F30;
      if WritePass(i, $1F30, bufApn, 0) then
        UpdateLog('    Записаны данные инициализации для GPRS', colorRab)
      else
        goto labelkonec;
    end;

    //***************************

    //-----------------------------------------------
    //| Запись параметров по всем используемым тарифам
    //-----------------------------------------------
    adr_write_params := $3000;
    for k := 1 to 10 do //Перебираем все варианты тарификации
      if EnableVarTar[i].var_tar[k] = true then
      begin
        if WriteParams(i, $0540, KonfigWrite[k].konfig, k) then
        begin
          UpdateLog('    Записана конфигурация варианта тарификации ' +
            IntToStr(k), colorRab);
          adr_write_params := adr_write_params + 32;
        end
        else
          goto labelkonec;

        // Запись количества зон
        if WriteParams(i, $0560, KonfigWrite[k].zone, k) then
        begin
          UpdateLog('    Записаны зоны варианта тарификации ' + IntToStr(k),
            colorRab);
          adr_write_params := adr_write_params + 32;
        end
        else
          goto labelkonec;

        // ЗАпись тарификации сезона 1
        if Length(KonfigWrite[k].sezon1) <> 0 then
        begin
          if WriteParams(i, $0000, KonfigWrite[k].sezon1, k) then
          begin
            UpdateLog('    Записана тарификация сезона 1 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ЗАпись тарификации сезона 2
        if Length(KonfigWrite[k].sezon2) <> 0 then
        begin
          if WriteParams(i, $0064, KonfigWrite[k].sezon2, k) then
          begin
            UpdateLog('    Записана тарификация сезона 2 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ЗАпись тарификации сезона 3
        if Length(KonfigWrite[k].sezon3) <> 0 then
        begin
          if WriteParams(i, $00C8, KonfigWrite[k].sezon3, k) then
          begin
            UpdateLog('    Записана тарификация сезона 3 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ЗАпись тарификации сезона 4
        if Length(KonfigWrite[k].sezon4) <> 0 then
        begin
          if WriteParams(i, $012C, KonfigWrite[k].sezon4, k) then
          begin
            UpdateLog('    Записана тарификация сезона 4 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ЗАпись тарификации сезона 5
        if Length(KonfigWrite[k].sezon5) <> 0 then
        begin
          if WriteParams(i, $0190, KonfigWrite[k].sezon5, k) then
          begin
            UpdateLog('    Записана тарификация сезона 2 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ЗАпись тарификации сезона 6
        if Length(KonfigWrite[k].sezon6) <> 0 then
        begin
          if WriteParams(i, $01F4, KonfigWrite[k].sezon6, k) then
          begin
            UpdateLog('    Записана тарификация сезона 6 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ЗАпись тарификации сезона 7
        if Length(KonfigWrite[k].sezon7) <> 0 then
        begin
          if WriteParams(i, $0258, KonfigWrite[k].sezon7, k) then
          begin
            UpdateLog('    Записана тарификация сезона 7 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ЗАпись тарификации сезона 8
        if Length(KonfigWrite[k].sezon8) <> 0 then
        begin
          if WriteParams(i, $02BC, KonfigWrite[k].sezon8, k) then
          begin
            UpdateLog('    Записана тарификация сезона 8 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ЗАпись тарификации сезона 9
        if Length(KonfigWrite[k].sezon9) <> 0 then
        begin
          if WriteParams(i, $0320, KonfigWrite[k].sezon9, k) then
          begin
            UpdateLog('    Записана тарификация сезона 9 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ЗАпись тарификации сезона 10
        if Length(KonfigWrite[k].sezon10) <> 0 then
        begin
          if WriteParams(i, $0384, KonfigWrite[k].sezon10, k) then
          begin
            UpdateLog('    Записана тарификация сезона 10 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ЗАпись тарификации сезона 11
        if Length(KonfigWrite[k].sezon11) <> 0 then
        begin
          if WriteParams(i, $03E8, KonfigWrite[k].sezon11, k) then
          begin
            UpdateLog('    Записана тарификация сезона 11 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ЗАпись тарификации сезона 12
        if Length(KonfigWrite[k].sezon12) <> 0 then
        begin
          if WriteParams(i, $044C, KonfigWrite[k].sezon12, k) then
          begin
            UpdateLog('    Записана тарификация сезона 12 варианта тарификации '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;

        //Запись фиксированных дат
        if Length(KonfigWrite[k].fixdate) <> 0 then
        begin
          if WriteParams(i, $04C0, KonfigWrite[k].fixdate, k) then
          begin
            UpdateLog('    Записаны фиксировнные даты варианта тарификации ' +
              IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
      end;

    //*****************************************************************

    for j := 1 to Length(Form1.massivOprosa[i]) - 1 do
    begin

      //-----------------------------------------------
      //| Запись в устройство названия разъёма
      //-----------------------------------------------
      configPerNasv := nil;
      SetLength(configPerNasv, 3);
      configPerNasv[0] := PChar(IntToStr(j));
      configPerNasv[1] := PChar(Form1.massivOprosa[i, j, 0, 0]);
      configPerNasv[2] := PChar(IntToStr(Length(Form1.massivOprosa[i, j]) - 1));
      bufper := FormirBuf_SapNazvRas(PChar(Form1.massivOprosa[i, 0, 0, 5]),
        PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
        3]), configPerNasv);
      if not WriteData(bufper, i) then
      begin
        Razriv;
        LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
        goto labelkonec;
      end;

      //***************************************

      //-----------------------------------------------
      //|       Запись номеров счетчиков
      //-----------------------------------------------
      configPerNomSch := nil;
      SetLength(configPerNomSch, 12);
      SetLength(configPerNomSch[0], 2);
      configPerNomSch[0, 1] :=
        PChar(ReverseString(Trim(Copy(ReverseString(Form1.massivOprosa[i, j, 0,
        0]), 1, 2))));
      configPerNomSch[0, 0] := PChar(IntToStr(j)); //Номер адреса для передачи
      for k := 1 to Length(Form1.massivOprosa[i, j]) - 1 do
      begin
        SetLength(configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1])],
          Length(configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1])]) + 1);
        configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1]),
          Length(configPerNomSch[StrToInt(Form1.massivOprosa[i, j, k, 1])]) - 1]
        := PChar(Form1.massivOprosa[i, j, k, 0]);
      end;
      bufper := FormirBuf_SapNomerovSch(PChar(Form1.massivOprosa[i, 0, 0, 5]),
        PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
        3]), configPerNomSch);
      for k := 1 to 10 do
        if Length(configPerNomSch[k]) <> 0 then
          nomVarTar[k - 1] := true;
      if not WriteData(bufper, i) then
      begin
        Razriv;
        LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
        goto labelkonec;
      end;
      UpdateLog('    Запрограммирован на запись ' + Form1.massivOprosa[i, j, 0,
        0], colorRab);

      //*************************************************
    end;

    if not flagGPRS then
      BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]),
      PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
      3]), PChar(IntToStr(Length(Form1.massivOprosa[i]) - 1)));
    //Определение номера последнего разъёма
    SetLength(bufPer, Length(bufPer) + 2);
    bufPer[16] := 1;
    bufPer[17] := CRC(bufPer, 0, 16);
    bufPer[18] := 255;
    bufPer[19] := CRC(bufPer, 0, 18);
    if not WriteData(bufper, i) then
    begin
      Razriv;
      LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
      goto labelkonec;
    end;

    //-----------------------------------------------------
    //    Передача адресов чтения по вариантам тарификации
    //-----------------------------------------------------
    for k := 1 to 10 do //Перебираем все варианты тарификации
      if nomVarTar[k - 1] = true then
      begin
        SetLength(tempBuf, 10 + length(adrWrite[k]) * 3);
        tempBuf2 := NumStrToBCD(PChar(Form1.massivOprosa[i, 0, 0, 4]));
        nomerByte := 0;
        for j := 2 downto 0 do
        begin
          tempBuf[nomerByte] := tempBuf2[j]; //Пароль на счетчики действующий
          Inc(nomerByte);
        end;
        tempBuf[nomerByte] := tempBuf[nomerByte - 3] + tempBuf[nomerByte - 2] +
          tempBuf[nomerByte - 1];
        Inc(nomerByte);

        tempBuf2 := NumStrToBCD(PChar(Form1.massivOprosa[i, 0, 0, 8]));
        for j := 2 downto 0 do
        begin
          tempBuf[nomerByte] := tempBuf2[j]; //Пароль на счетчики новый
          Inc(nomerByte);
        end;
        tempBuf[nomerByte] := tempBuf[nomerByte - 3] + tempBuf[nomerByte - 2] +
          tempBuf[nomerByte - 1];
        Inc(nomerByte);

        tempBuf[nomerByte] := Length(Form1.massivOprosa[i]) - 1;
        //Количество разъёмов
        Inc(nomerByte);
        tempBuf[nomerByte] := length(adrWrite[k]);
        //Количество параметров чтения/записи
        Inc(nomerByte);

        for j := 0 to Length(adrWrite[k]) - 1 do
        begin
          tempBuf[nomerByte] := adrWrite[k][j] and $FF; //Младший байт адреса
          Inc(nomerByte);
          tempBuf[nomerByte] := (adrWrite[k][j] shr 8) and $FF;
          //Старший байт адреса
          Inc(nomerByte);
          tempBuf[nomerByte] := 3; //Количество байт параметра
          Inc(nomerByte);
        end;

        if not (WritePass(i, AdrWriteVarTar[k], tempBuf, k)) then
          goto labelkonec;
      end;
    //***************************************************

    //------------------------------------------------------
    //    Посылка конца передачи
    //------------------------------------------------------

    if not flagGPRS then
      BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]),
      PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
      3]), PChar('1E84'));
    SetLength(bufPer, Length(bufPer) + 4);
    bufPer[16] := 3;
    bufPer[17] := CRC(bufPer, 0, 16);
    bufPer[18] := 1;
    bufPer[19] := 1;
    if flagAutomatCht then
      bufPer[20] := 1
    else
      bufPer[20] := 0;
    bufPer[21] := CRC(bufPer, 0, 20);
    if not WriteData(bufper, i) then
    begin
      Razriv;
      LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
      goto labelkonec;
    end;

    if not flagGPRS then
      BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]),
      PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
      3]), PChar('1E88'));
    SetLength(bufPer, Length(bufPer) + 2);
    bufPer[16] := 1;
    bufPer[17] := CRC(bufPer, 0, 16);
    bufPer[18] := 0;
    bufPer[19] := CRC(bufPer, 0, 18);
    if not WriteData(bufper, i) then
    begin
      Razriv;
      LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
      goto labelkonec;
    end;

    if not flagModem then
    begin
      BComPort.ClearBuffer(true, true);
      bufPer := Shapka(true, PChar(Form1.massivOprosa[0, 0, 0, 5]),
        PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0,
        3]), PChar('1EC8'));
      SetLength(bufPer, Length(bufPer) + 4);
      bufPer[16] := 3;
      bufPer[17] := CRC(bufPer, 0, 16);
      bufPer[18] := 0;
      bufPer[19] := 0;
      bufPer[20] := 0;
      bufPer[21] := CRC(bufPer, 0, 20);
      if not WriteData(bufper, i) then
      begin
        Razriv;
        LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
        goto labelkonec;
      end;

      BComPort.ClearBuffer(true, true);
      bufPer := Shapka(true, PChar(Form1.massivOprosa[0, 0, 0, 5]),
        PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0,
        3]), PChar('1E82'));
      SetLength(bufPer, Length(bufPer) + 2);
      bufPer[16] := 1;
      bufPer[17] := CRC(bufPer, 0, 16);
      bufPer[18] := 0;
      bufPer[19] := CRC(bufPer, 0, 18);
      if not WriteData(bufper, i) then
      begin
        Razriv;
        LogErrorProgram(Form1.massivOprosa[i, 0, 0, 1]);
        goto labelkonec;
      end;
    end;

    //----------------------------------------------
    //    Определение времени необходимого для опроса счетчиков
    //    и количества счетчиков
    //----------------------------------------------
    countSchetchikov := 0;
    DecodeTime(Time, hour, min, sec, msec);
    timeOpr[i] := hour * 3600 + min * 60 + sec; //Начало времени опроса
    for j := 1 to Length(Form1.massivOprosa[i]) - 1 do
      for k := 1 to Length(Form1.massivOprosa[i, j]) - 1 do
        Inc(countSchetchikov); //Каждый счетчик (количество секунд)
    SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(countSchetchikov))));
    //время опроса одного счётчика на количество секунд
    timeOpr[i] := timeOpr[i] + Round(timeOdinSch * countSchetchikov);
    //Добавление времени на инициализацию концентратора
    timeOpr[i] := timeOpr[i] + 20;
    //Если выбран режим смены apn, ждем перезагрузки модема 30сек
    if flagSetGPRSApn then
      timeOpr[i] := timeOpr[i] + 30;

    //***************************************************

    UpdateLog('Концентратор, расположенный по адресу: ' + Form1.massivOprosa[i,
      0, 0, 1] + ', запрограммирован на запись', colorOk);
    SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(0))));
    DecodeTime(Time, hour, min, sec, msec);
    nachOprosa := (3600 * hour + 60 * min + sec) - nachOprosa;
    Synchronize(StopTimer);
    UpdateLog('Время работы с концентратором: ' + (IntToStr(nachOprosa div 60)) +
      ':' + FormatFloat('00', nachOprosa mod 60), colorOk);
    UpdateLog(' ', colorOk);
    Razriv; //разрыв связи с концентратором
    labelkonec:
    if (not flagGPRS) then
    begin
      if BComPort <> nil then
      begin
        BComPort.Close;
        BComPort.Free;
      end;
    end;
    Synchronize(incGauge1); //Увеличение на одну единицу общего прогресса
  end;
end;

procedure TDeviceThread.ProverkaWrite;
var
  hour: Word;
  min: Word;
  sec: word;
  msec: word;
  i: Integer;
  j: integer;
  k: integer;
  t: Integer;
  schitano: integer;
  neschitano: integer;
  nachOprosa: integer;
  tekTime: integer;
  error: integer;
  prinByte: integer;
  tempbuf: TBytes;
  bufper: TBytes;
  bufPriema: TBytes;
  countPovtDozv: integer;
  flagProvAdresa: Boolean;
  adres: string;
  adresPovtor: string;
  nomerSchetcika: string;
  kv: string;
  sql: TpFIBQuery;
  NeschCounter: TStrings;
  tempStr: string;
  tempByte: Byte;
label
  labelKonec, povtor, nachalo;
begin
  {
  if not flagGPRS then
  begin
    BComPort.BeginUpdate;
    BComPort.Timeouts.ReadInterval := -1;
    BComPort.Timeouts.ReadTotalConstant := FormOptions.sSpinEdit2.Value;
    BComPort.Timeouts.ReadTotalMultiplier := -1;
    BComPort.EndUpdate;
  end;
  }
  Form1.sGauge2.Visible := true;
  Form1.sGauge2.Progress := 0;
  NeschCounter := TStringList.Create;
  for i := 0 to Length(Form1.massivOprosa) - 1 do
  begin
    if Form1.massivOprosa[i, 0, 0, 12] = 'GPRS' then
      flagGPRS := True
    else
      flagGPRS := False;
    //------- Проверка состояния опроса. При необходимости ожидание
    if timeOpr[i] <> 0 then
    begin
      DecodeTime(Time, hour, min, sec, msec);
      tekTime := hour * 3600 + min * 60 + sec;
      if tekTime < timeOpr[i] then
        WaitUpdateProgresBar((timeOpr[i] - tekTime));
      //Ожидание работы концентратора
    end
    else
      goto labelKonec;

    if not flagGPRS then
    begin
      BComPort := TComPort.Create(nil);
      //Установка параметров порта и его открытие
      if not NastrPort(flagSchitivatel) then
        goto labelkonec;

      if flagModem then
      begin
        if not IniModem then //Если модем недоступен то выйти из процедуры
          goto labelkonec;
      end;

      BComPort.BeginUpdate;
      BComPort.Timeouts.ReadInterval := -1;
      if flagModem then
        BComPort.Timeouts.ReadTotalConstant := 1500
      else
        BComPort.Timeouts.ReadTotalConstant := 500;
      BComPort.Timeouts.ReadTotalMultiplier := -1;
      BComPort.EndUpdate;
    end;
    //***************************************************
    flagProvAdresa := true;
    //Флаг показывает необходимость проверки правильности опрашиваемого адреса
    adresPovtor := '';
    Synchronize(ObnulSchetchikov);
    SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(Form1.massivOprosa[i, 0, 0, 6])));
    Form1.sGauge2.Progress := 0;
    Form1.sGauge2.MaxValue := StrToInt(Form1.massivOprosa[i, 0, 0, 6]);
    countPovtDozv := 0;
    schitano := 0;
    neschitano := 0;
    prinByte := 0;
    NeschCounter.Clear;
    GLOBAL_DATE_TIME_READED := Now;
    nachalo:
    UpdateLog(' ', colorOk);
    if flagGPRS then
    begin
      UpdateLog('Соединение с концентратором по IP ' + Form1.massivOprosa[i, 0,
        0, 10] + '. Адрес: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
      if not Dozvon(Form1.massivOprosa[i, 0, 0, 10]) then
      begin
        UpdateLog('Невозможно установить соединение с концентратором по адресу '
          + Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(' ', colorOk);
        UpdateLog(Form1.sRichEdit2.Handle,
          'Не удалось установить соединение с концентратором по адресу ' +
          Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
        goto labelkonec;
      end;
      Sleep(3000);
    end
    else
    begin
      if flagModem then
      begin
        UpdateLog('Дозвон до концентратора по номеру ' + Form1.massivOprosa[i, 0,
          0, 2] + '. Адрес: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
        if not Dozvon(Form1.massivOprosa[i, 0, 0, 2]) then
        begin
          UpdateLog('Невозможно установить соединение с концентратором по адресу '
            + Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(' ', colorOk);
          UpdateLog(Form1.sRichEdit2.Handle,
            'Не удалось установить соединение с концентратором по адресу ' +
            Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
          goto labelkonec;
        end;
      end;
    end;

    UpdateLog('Проверка записи', colorOk);
    begin
      Synchronize(PuskTimer);
      DecodeTime(Time, hour, min, sec, msec);
      nachOprosa := hour * 3600 + min * 60 + sec;
      //---------------------------------------------------------
      //          Чтение данных с концентратора
      //---------------------------------------------------------
                //Задание начальных параметров
      if adresPovtor <> '' then
        adres := adresPovtor
      else
        adres := '0000';
      SetLength(bufPriema, 3); //Для младшего байта адреса в первом адресе
      bufPriema[0] := 0; //0
      //*****************************

      repeat
        //Формирование конфигурации запроса
        bufper := Shapka(false, PChar(Form1.massivOprosa[i, 0, 0, 5]),
          PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
          3]), PChar(adres));
        bufper[16] := bufPriema[Length(bufPriema) - 3];
        bufper[17] := CRC(bufper, 0, 16);
        //*********************************
        error := 0;
        k := 0;
        povtor:
        if flagGPRS then
          dmGPRS.SendGPRS(bufper)
        else
        begin
          BComPort.ClearBuffer(true, true); //Очистка буферов
          WriteBufInPort(bufper); //Посылка запроса

          if (not WaitComData(4000)) then //Ожидание поступления данных в порт
          begin
            if k > 3 then
            begin
              PovtorDozvona; //Разрыв свзи для повторного дозвона
              adresPovtor := adres;
              goto nachalo;
            end
            else
            begin
              Inc(k);
              goto povtor
            end;
          end;
        end;

        bufPriema := nil;
        //Прием данных
        k := -1;
        if flagGPRS then
        begin
          while dmGPRS.GetByteGPRS(tempByte) do
          begin
            Inc(k);
            SetLength(bufPriema, Length(bufPriema) + 1);
            bufPriema[k] := tempByte;
            Inc(prinByte);
            SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
              Lparam(LPCTSTR(IntToStr(prinByte))));
            if (k > 18) and (bufPriema[k] = 90) and (bufPriema[k - 1] = 165) and
              (bufPriema[k - 2] = 90) and (bufPriema[k - 3] = 165) and (bufPriema[k
              - 4] = 90) and (bufPriema[k - 5] = 165) and (bufPriema[k - 6] = 90)
              and (bufPriema[k - 7] = 165) and (bufPriema[k - 8] = 90) and
              (bufPriema[k - 9] = 165) and (bufPriema[k - 10] = 90) and (bufPriema[k
              - 11] = 165) and (bufPriema[k - 12] = 90) and (bufPriema[k - 13] = 165) then
            begin
              for j := 0 to 3 do
              begin
                SetLength(bufPriema, Length(bufPriema) + 1);
                Inc(prinByte);
                Inc(k);
                SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
                  Lparam(LPCTSTR(IntToStr(prinByte))));
                dmGPRS.GetByteGPRS(tempByte);
                bufPriema[k] := tempByte;
              end;
              Inc(k);
              SetLength(bufPriema, Length(bufPriema) + 1);
              bufPriema[k] := 0;
              Break //Выход из цикла чтения
            end;
          end;
        end
        else
        begin
          repeat
            if (k > 18) and (bufPriema[k] = 90) and (bufPriema[k - 1] = 165) and
              (bufPriema[k - 2] = 90) and (bufPriema[k - 3] = 165) and (bufPriema[k
              - 4] = 90) and (bufPriema[k - 5] = 165) and (bufPriema[k - 6] = 90)
              and (bufPriema[k - 7] = 165) and (bufPriema[k - 8] = 90) and
              (bufPriema[k - 9] = 165) and (bufPriema[k - 10] = 90) and (bufPriema[k
              - 11] = 165) and (bufPriema[k - 12] = 90) and (bufPriema[k - 13] = 165) then
            begin
              for j := 0 to 3 do
              begin
                SetLength(bufPriema, Length(bufPriema) + 1);
                Inc(prinByte);
                Inc(k);
                SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
                  Lparam(LPCTSTR(IntToStr(prinByte))));
                BComPort.Read(@bufPriema[k], 1);
              end;
              Inc(k);
              SetLength(bufPriema, Length(bufPriema) + 1);
              bufPriema[k] := 0;
              Break //Выход из цикла чтения
            end;
            SetLength(bufPriema, Length(bufPriema) + 1);
            Inc(prinByte);
            Inc(k);
            SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
              Lparam(LPCTSTR(IntToStr(prinByte))));
          until (BComPort.Read(@bufPriema[k], 1) = 0) or (k > 30000);
        end;
        //Пока не прерыв связи

        if bufPriema = nil then
        begin
          Inc(error);
          if error > 3 then
            //Если количеставо попыток чтения одного адреса превышает 10 то повтор дозвона
          begin
            if countPovtDozv > 1 then
            begin
              UpdateLog('Концентратор не отвечает', colorError);
              goto labelKonec;
            end;
            Inc(countPovtDozv);
            PovtorDozvona; //Разрыв свзи для повторного дозвона
            adresPovtor := adres;
            goto nachalo;
          end;
          goto povtor; //Если данные неверные повтор запроса
        end;

        //запись в лог
        if log then
        begin
          Write(logFile, 'ЧТ. ');
          for k := 0 to Length(bufPriema) - 1 do
            Write(logFile, IntToStr(bufPriema[k]) + ', ');
          Writeln(logFile, '');
        end;
        //*********************

        //Опредеение конца приема данных
        if (bufPriema[1] = 255) and (bufPriema[2] = 255) and (bufPriema[3] = 255) then
          break;
        //****************************

        //Проверка правильности принятых данных
        if not ((bufPriema[Length(bufPriema) - 6] = 90) and
          (bufPriema[Length(bufPriema) - 7] = 165)) then
        begin
          Inc(error);
          if error > 10 then
            //Если количеставо попыток чтения одного адреса превышает 10 то повтор дозвона
          begin
            if countPovtDozv > 1 then
            begin
              UpdateLog('Концентратор не отвечает', colorError);
              goto labelKonec;
            end;
            Inc(countPovtDozv);
            PovtorDozvona; //Разрыв свзи для повторного дозвона
            adresPovtor := adres;
            goto nachalo;
          end;
          Sleep(1000);
          goto povtor; //Если данные неверные повтор запроса
        end;
        //*******************************

        //Определение номера счетчика
        tempbuf := nil;
        tempbuf := BCDToNumStr(Copy(bufPriema, 0, 3));
        nomerSchetcika := '';
        for j := 0 to 5 do
          nomerSchetcika := nomerSchetcika + Chr(tempbuf[j]);
        //****************************

        if bufPriema[12] = 0 then //Если ошибок при записи нет
        begin
          UpdateLog('    Счётчик ' + nomerSchetcika + ' записан', colorRab);
          Inc(schitano);
          SendMessage(Form1.sEdit9.Handle, WM_SETTEXT, 0,
            Lparam(LPCSTR(IntToStr(schitano))));
          if flagProvAdresa then
          begin
            sql := TpFIBQuery.Create(nil);
            with sql do
              try
                Database := DBs;
                Transaction := DBs.DefaultTransaction;
                Transaction.StartTransaction;
                SQL.Text := 'select addr from addresmain ' +
                  ' where inc = (select cod from addres ' +
                  ' where inc = (select cod from tmp ' +
                  ' where NS = ''' + nomerSchetcika + '''))';
                ExecQuery;
                tempStr := FN('addr').AsString;
                if not eof then
                begin
                  if Trim(Form1.massivOprosa[i, 0, 0, 1]) <> Trim(tempStr) then
                  begin
                    UpdateLog('    Записываемые счётчики находятся на другом адресе:', colorError);
                    UpdateLog('    ' + FN('addr').AsString, colorError);
                  end;
                  flagProvAdresa := false;
                end;
              finally
                Free;
              end;
          end;
        end
        else
        begin
          sql := TpFIBQuery.Create(nil);
          with sql do
            try
              Database := DBs;
              Transaction := DBs.DefaultTransaction;
              Transaction.StartTransaction;
              SQL.Text := 'select KV from tmp where NS = ''' + nomerSchetcika +
                '''';
              ExecQuery;
              kv := FN('KV').AsString;
            finally
              Free;
            end;
          if bufPriema[12] <> 7 then
          begin
            UpdateLog('    Счётчик ' + nomerSchetcika + DetectError(bufPriema) +
              ' ' + '(кв. ' + kv + ')', colorError);
            NeschCounter.Add('    Счётчик ' + nomerSchetcika +
              DetectError(bufPriema) + ' ' + '(кв. ' + kv + ')');
          end
          else
          begin
            UpdateLog('    Счётчик ' + nomerSchetcika + ' не записан (кв. ' + kv
              + ')', colorError);
            NeschCounter.Add('    Счётчик ' + nomerSchetcika +
              ' не записан (кв. ' + kv + ')');
          end;
          Inc(neschitano);
          UpdateTmpHashr(nomerSchetcika, '0');
          SendMessage(Form1.sEdit10.Handle, WM_SETTEXT, 0,
            Lparam(LPCSTR(IntToStr(neschitano))));
        end;
        Synchronize(UpdateProgress); //Изменение прогрееса считывания
        adres := IntToHex(bufPriema[Length(bufPriema) - 4], 2) +
        IntToHex(bufPriema[Length(bufPriema) - 5], 2);
      until (false);

      DecodeTime(Time, hour, min, sec, msec);
      nachOprosa := (hour * 3600 + min * 60 + sec) - nachOprosa;
      Synchronize(StopTimer);
      //****************Отчёт о опросе*********
      UpdateLog(Form1.sRichEdit2.Handle, 'Запись данных дома по адресу: ',
        colorRab);
      UpdateLog(Form1.sRichEdit2.Handle, Form1.massivOprosa[i, 0, 0, 1],
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  ----------------------------',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | Записано счётчиков: ' +
        IntToStr(schitano), colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | Не записано счётчиков: ' +
        IntToStr(neschitano), colorOk);
      for j := 1 to NeschCounter.Count do
        UpdateLog(Form1.sRichEdit2.Handle, '   - ' + NeschCounter.Strings[j -
          1], colorError);
      UpdateLog(Form1.sRichEdit2.Handle, '  | Время работы с концентратором: ' +
        IntToStr(nachOprosa div 60) + ':' + FormatFloat('00', nachOprosa mod 60),
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | Размер принятых данных: ' +
        IntToStr(StrToInt(Form1.sEdit13.Text)) + ' байт (' +
        FloatToStrF(StrToInt(Form1.sEdit13.Text) / 1024, ffFixed, 7, 2) + ' kb)',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  ----------------------------',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
      //---------------------------------------
      UpdateLog('Запись данных тарифного расписания по адресу: ' +
        Form1.massivOprosa[i, 0, 0, 1] + ' закончено.', colorOk);
      UpdateLog('  ---------------------------', colorOk);
      UpdateLog('  | Записано счётчиков: ' +
        IntToStr(StrToInt(Form1.sEdit9.Text)), colorOk);
      UpdateLog('  | Не записано счётчиков: ' +
        IntToStr(StrToInt(Form1.sEdit10.Text)), colorOk);
      UpdateLog('  ---------------------------', colorOk);
      UpdateLog('Время работы с концентратором: ' + IntToStr(nachOprosa div 60) +
        ':' + FormatFloat('00', nachOprosa mod 60), colorOk);
      Razriv;
    end;

    labelKonec:
    if (not flagGPRS) then
    begin
      if BComPort <> nil then
      begin
        BComPort.Close;
        BComPort.Free;
      end;
    end;
    Synchronize(incGauge1); //Увеличение на одну единицу
  end;
  Form1.sGauge2.Visible := false;

end;

procedure TDeviceThread.PuskTimer;
begin
  Form1.timeOpr := 0;
  Form1.Timer1.Enabled := true;
end;

procedure TDeviceThread.Razriv;
var
  tempStr: string;
begin
  if flagGPRS then
  begin
    dmGPRS.DisconnectGPRS;
  end
  else
  begin
    if flagModem then
    begin
      ent := $0D;
      Sleep(1500);
      BComPort.WriteStr('+++');
      Sleep(1500);
      BComPort.WriteStr('AT');
      BComPort.Write(@ent, 1);
      WaitComData(1000);
      BComPort.ReadStr(tempStr, BComPort.InputCount);

      BComPort.WriteStr('ATH0');
      BComPort.Write(@ent, 1);
      WaitComData(5000);
      BComPort.ReadStr(tempStr, BComPort.InputCount);
    end;
    BComPort.ClearBuffer(true, true);
  end;
end;

procedure TDeviceThread.WriteBufInPort(bufer: TBytes);
var
  i: Integer;
begin
  WriteLog('ЗП. ');
  for i := 0 to Length(bufer) - 1 do
  begin
    BComPort.Write(@bufer[i], 1);
    WriteLog(IntToStr(bufer[i]) + ',');
  end;
  WritelnLog('.');
end;

function TDeviceThread.WriteData(bufer: TBytes; nomAddr: Integer): Boolean;
var
  k: integer;
  n: integer;
  i: Integer;
  j: Integer;
  countReadNull: integer;
  error: integer;
  errorDozv: Integer;
  bufPriema: TBytes;
  bufSend: TBytes;

label
  nach;

begin
  errorDozv := 0;
  Result := False;

  if flagGPRS then
  begin
    for k := 0 to (Length(bufer) - 1) div 51 do
    begin
      for i := 0 to 3 do
      begin
        bufSend := nil;
        j := 0;
        for n := k * 51 to k * 51 + 50 do
        begin
          if n < Length(bufer) then
            SetLength(bufSend, Length(bufSend) + 1);
          bufSend[j] := bufer[n];
          Inc(j);
        end;
        dmGPRS.SendGPRS(bufSend);

        if (dmGPRS.GetDataGPRS(bufPriema, 18)) then
        begin
          schetchikByte := schetchikByte + 18;
          SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
            Lparam(LPCTSTR(IntToStr(schetchikByte))));
          // Проверка контрольной суммы принятого пакета
          if CRC(bufPriema, 0, 16) <> bufPriema[17] then
          begin
            Result := false;
            UpdateLog('ошибка контрольной суммы пакета', colorError);
            UpdateLog(' ', colorError);
            Continue;
          end;

          // Проверка на присутствие ошибки
          if bufPriema[12] = 0 then
          begin
            Result := True;
            Break;
          end
          else
          begin
            Result := False;
            UpdateLog(DetectError(bufPriema), colorError);
            UpdateLog(' ', colorError);
            Continue;
          end;
        end
        else
        begin
          Result := false;
          UpdateLog('Нет ответа от концентратора', colorError);
          UpdateLog(' ', colorError);
          Continue;
        end;
      end;
      if i = 3 then
      begin
        Result := false;
        UpdateLog('Не удалось запрограммировать концентратор', colorError);
        UpdateLog(' ', colorError);
        exit
      end;
    end;
  end
  else
  begin
    nach:

    if errorDozv > 3 then
    begin
      Result := false;
      UpdateLog('Не удалось запрограммировать концентратор', colorError);
      UpdateLog(' ', colorError);
      exit
    end;

    for k := 0 to (Length(bufer) - 1) div 51 do
    begin
      error := 0;
      for i := 0 to 10 do
      begin

        //Ожидание, если не первая попытка чтения
        if i <> 0 then
          Sleep(500);

        //Если пятая попытка записи то повтор дозвона
        if (i = 5) then
        begin
          UpdateLog(' Ошибка при передачи', colorError);
          if flagModem then
          begin
            UpdateLog(' Выполянется повторный дозвон', colorOk);

            if (not Dozvon(Form1.massivOprosa[nomAddr, 0, 0, 2])) then
            begin
              Result := false;
              UpdateLog('Ошибка при повторном дозвоне', colorError);
              UpdateLog(' ', colorError);
              Exit;
            end;
          end;
          Inc(errorDozv);
          goto nach;
        end;

        //Очистка буфера и запись данных в порт
        BComPort.ClearBuffer(true, true);
        WriteLog('ЗП. ');
        for n := k * 51 to k * 51 + 50 do
        begin
          if n < Length(bufer) then
            try
              BComPort.Write(@bufer[n], 1);
              WriteLog(IntToStr(bufer[n]) + ',');
            except
              WriteLog('error_write_0 ')
            end;
        end;
        //              else
        //                break;
        WritelnLog('.');

        //Установка длины буфера приема
        bufPriema := nil;
        SetLength(bufPriema, 18);
        WriteLog('ЧТ. ');

        WaitComData(2000); //Ожидание поступления данных
        //Чтение ответа
        countReadNull := 0;
        n := 0;
        try
          while (BComPort.Read(@bufPriema[n], 1) <> 0) do
          begin
            SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
              Lparam(LPCTSTR(IntToStr(schetchikByte))));
            Inc(schetchikByte);
            WriteLog(IntToStr(bufPriema[n]) + ',');
            if bufPriema[n] = 0 then
              Inc(countReadNull);
            Inc(n);
            if n > 17 then //Если приняты все 18 байт - выход из чтения
              Break;
          end;
        except
          WriteLog('error_read_0 ')
        end;

        WritelnLog('.');

        // Проверка количества принятых байт и количества нулей в пакете
        if (n <> 18) or (countReadNull = 18) then
          Continue;
        // Проверка контрольной суммы принятого пакета
        if CRC(bufPriema, 0, 16) <> bufPriema[17] then
          Continue;
        // Проверка на присутствие ошибки
        if bufPriema[12] = 0 then
        begin
          Result := True;
          Break;
        end
        else
        begin
          Result := False;
          UpdateLog(DetectError(bufPriema), colorError);
          UpdateLog(' ', colorError);
          Continue; //Редакция 07.08.2011
          //Exit;
        end;
      end;
    end;
  end;

  Result := true;
end;

procedure TDeviceThread.WritelnLog(str: string); //Процедура записи в лог файл
begin
  if log then
    Writeln(logFile, str);
end;

procedure TDeviceThread.WriteLog(str: string); //Процедура записи в лог файл
begin
  if log then
    Write(logFile, str);
end;

function TDeviceThread.SaveDataSoSchet(response: TBytes; incAddresmain: Integer): Boolean;
begin
  try
    SaveDataInBase(response, Dbs, incAddresmain);
    {SaveData := TSaveDataSoSchetchikov.Create(true);   //Создание потока сохранениея данных со счетчиков в базу
    SaveData.FreeOnTerminate := True;
    SetLength(SaveData.response, Length(response));
    for i := 0 to Length(response) - 1 do
      SaveData.response[i] := response[i];
    SaveData.Priority := tpNormal;
    SaveData.Resume;}
  finally
    Result := True;
  end;
end;

procedure TDeviceThread.StopTimer;
begin
  Form1.Timer1.Enabled := false;
end;

procedure TDeviceThread.ChtenieSchit;
var
  k: integer;
  j: integer;
  schitano: integer;
  neschitano: integer;
  nomerSchetcika: string;
  adres: string;
  bufPriema: TBytes;
  bufPer: TBytes;
  tempbuf: TBytes;
label
  povtor, labelKonec;
begin
  BComPort := TComPort.Create(nil);
  //Установка параметров порта и его открытие
  if not NastrPort(flagSchitivatel) then
    goto labelkonec;

  BComPort.BeginUpdate;
  BComPort.Timeouts.ReadInterval := -1;
  BComPort.Timeouts.ReadTotalConstant := 30;
  BComPort.Timeouts.ReadTotalMultiplier := -1;
  BComPort.EndUpdate;

  //---------------------------------------------------------
  //          Чтение данных со считывателя
  //---------------------------------------------------------
            //Задание начальных параметров
  UpdateLog('Начало чтения информации со считывателя', colorOk);
  adres := '0000';
  SetLength(bufPriema, 3); //Для младшего байта адреса в первом адресе
  bufPriema[0] := 0; //0
  schitano := 0;
  neschitano := 0;
  //SendMessage(Form1.sEdit9.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR('0')));
  //SendMessage(Form1.sEdit10.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR('0')));
  //SendMessage(Form1.sEdit11.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR('0')));
  //SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR(Form1.massivOprosa[0, 0, 0, 6])));
  //SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR('0')));
  Synchronize(ObnulSchetchikov);
  SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0,
    Lparam(LPCTSTR(Form1.massivOprosa[0, 0, 0, 6])));
  //*****************************
  GLOBAL_DATE_TIME_READED := Now;
  repeat
    //Формирование конфигурации запроса
    bufper := Shapka(false, PChar(Form1.massivOprosa[0, 0, 0, 5]),
      PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0,
      3]), PChar(adres));
    bufper[16] := bufPriema[Length(bufPriema) - 3];
    bufper[17] := CRC(bufper, 0, 16);
    //*********************************

    povtor:
    BComPort.ClearBuffer(true, true); //Очистка буферов
    WriteBufInPort(bufper); //Посылка запроса
    WaitComData(10000); //Ожидание поступления данных в порт
    bufPriema := nil;

    //Прием данных
    k := -1;
    repeat
      SetLength(bufPriema, Length(bufPriema) + 1);
      Inc(k);
      SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
        Lparam(LPCTSTR(IntToStr(k))));
    until (BComPort.Read(@bufPriema[k], 1) = 0);
    //Пока не прерыв связи

    //запись в лог
    Write(logFile, 'ЧТ. ');
    for k := 0 to Length(bufPriema) - 1 do
      Write(logFile, IntToStr(bufPriema[k]) + ', ');
    Writeln(logFile, '');
    //*********************

    //Опредеение конца приема двнных
    if (bufPriema[1] = 255) and (bufPriema[2] = 255) and (bufPriema[3] = 255) then
      break;
    //****************************

    //Проверка правильности принятых данных
    if not ((bufPriema[13] = 170) and (bufPriema[Length(bufPriema) - 6] = 90)
      and (bufPriema[Length(bufPriema) - 7] = 165)) or ((bufPriema[0] = 0) and
      (bufPriema[1] = 0) and (bufPriema[2] = 0)) then
    begin
      Sleep(100);
      goto povtor; //Если данные неверные повтор запроса
    end;
    //*******************************

    //Определение номера счетчика
    tempbuf := nil;
    tempbuf := BCDToNumStr(Copy(bufPriema, 0, 3));
    nomerSchetcika := '';
    for j := 0 to 5 do
      nomerSchetcika := nomerSchetcika + Chr(tempbuf[j]);
    //****************************

    if bufPriema[12] = 0 then //Если ошибок при считывании нет
    begin
      UpdateLog('    Счётчик ' + nomerSchetcika + ' считан', colorRab);
      Inc(schitano);
      SendMessage(Form1.sEdit9.Handle, WM_SETTEXT, 0,
        Lparam(LPCSTR(IntToStr(schitano))));
      UpdateTmpHashr(nomerSchetcika, '1');
      SaveDataSoSchet(bufPriema, 0);
    end
    else
    begin
      UpdateLog('    Счётчик ' + nomerSchetcika + DetectError(bufPriema),
        colorError);
      Inc(neschitano);
      UpdateTmpHashr(nomerSchetcika, '0');
      SendMessage(Form1.sEdit10.Handle, WM_SETTEXT, 0,
        Lparam(LPCSTR(IntToStr(neschitano))));
    end;
    adres := IntToHex(bufPriema[Length(bufPriema) - 4], 2) +
    IntToHex(bufPriema[Length(bufPriema) - 5], 2);
  until (false);
  UpdateLog('Считывание информации закончено.', colorOk);

  labelKonec:
  if BComPort <> nil then
  begin
    BComPort.Close;
    BComPort.Free;
  end;
end;

procedure TDeviceThread.ClearLog;
begin
  Form1.sRichEdit1.Clear;
  Form1.Log.Clear;
  Form1.sRichEdit2.Clear;
end;

procedure TDeviceThread.Chtenie;
var
  hour: Word;
  min: Word;
  sec: word;
  msec: word;
  i: Integer;
  j: integer;
  k: integer;
  t: Integer;
  schitano: integer;
  neschitano: integer;
  nachOprosa: integer;
  tekTime: integer;
  error: integer;
  prinByte: integer;
  tempbuf: TBytes;
  bufper: TBytes;
  bufPriema: TBytes;
  countPovtDozv: integer;
  flagProvAdresa: Boolean;
  adres: string;
  adresPovtor: string;
  nomerSchetcika: string;
  kv: string;
  sql: TpFIBQuery;
  NeschCounter: TStrings;
  tempStr: string;
  tempBool: Boolean;
  tempByte: Byte;
label
  labelKonec, povtor, nachalo;
begin
  //  if (not flagModem)  and (not flagTolkoChtenie) then
  //    NastrPort(False);
  {
  if not flagGPRS then
  begin
    BComPort.BeginUpdate;
    BComPort.Timeouts.ReadInterval := -1;
    BComPort.Timeouts.ReadTotalConstant := FormOptions.sSpinEdit2.Value;
    BComPort.Timeouts.ReadTotalMultiplier := -1;
    BComPort.EndUpdate;
  end;
  }
  Form1.sGauge2.Visible := true;
  Form1.sGauge2.Progress := 0;
  NeschCounter := TStringList.Create;
  if flagTolkoChtenie then
    Form1.sGauge1.MaxValue := Length(Form1.massivOprosa);
  for i := 0 to Length(Form1.massivOprosa) - 1 do
  begin
    if not flagTolkoChtenie then
    begin
      //Проверка на необходимость чтения
      if (Form1.massivOprosa[i, 0, 0, 13] = '2') then
      begin
        Continue;
      end;
    end;
    if Form1.massivOprosa[i, 0, 0, 12] = 'GPRS' then
      flagGPRS := True
    else
      flagGPRS := False;
    //------- Проверка состояния опроса. При необходимости ожидание
    if not flagTolkoChtenie then
      if timeOpr[i] <> 0 then
      begin
        DecodeTime(Time, hour, min, sec, msec);
        tekTime := hour * 3600 + min * 60 + sec;
        if tekTime < timeOpr[i] then
          WaitUpdateProgresBar((timeOpr[i] - tekTime));
        //Ожидание работы концентратора
      end
      else
        goto labelKonec;

    if not flagGPRS then
    begin
      BComPort := TComPort.Create(nil);
      //Установка параметров порта и его открытие
      if not NastrPort(flagSchitivatel) then
        goto labelkonec;

      if flagModem then
      begin
        if not IniModem then //Если модем недоступен то выйти из процедуры
          goto labelkonec;
      end;

      BComPort.BeginUpdate;
      BComPort.Timeouts.ReadInterval := -1;
      if flagModem then
        BComPort.Timeouts.ReadTotalConstant := 1500
      else
        BComPort.Timeouts.ReadTotalConstant := 500;
      BComPort.Timeouts.ReadTotalMultiplier := -1;
      BComPort.EndUpdate;
    end;
    //***************************************************
    flagProvAdresa := true;
    //Флаг показывает необходимость проверки правильности опрашиваемого адреса
    adresPovtor := '';
    Synchronize(ObnulSchetchikov);
    SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(Form1.massivOprosa[i, 0, 0, 6])));
    Form1.sGauge2.Progress := 0;
    Form1.sGauge2.MaxValue := StrToInt(Form1.massivOprosa[i, 0, 0, 6]);
    countPovtDozv := 0;
    schitano := 0;
    neschitano := 0;
    prinByte := 0;
    NeschCounter.Clear;
    GLOBAL_DATE_TIME_READED := Now;

    nachalo:
    //
    if flagGPRS then
    begin
      UpdateLog('Соединение с концентратором по IP ' + Form1.massivOprosa[i, 0, 0, 10] + '. Адрес: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
      if not Dozvon(Form1.massivOprosa[i, 0, 0, 10]) then
      begin
        UpdateLog('Невозможно установить соединение с концентратором по адресу ' + Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(' ', colorOk);
        UpdateLog(Form1.sRichEdit2.Handle,
          'Не удалось установить соединение с концентратором по адресу ' + Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
        goto labelkonec;
      end;
      Sleep(3000);
    end
    else
    begin
      if flagModem then
      begin
        UpdateLog('Дозвон до концентратора по номеру ' + Form1.massivOprosa[i, 0, 0, 2] + '. Адрес: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
        if not Dozvon(Form1.massivOprosa[i, 0, 0, 2]) then
        begin
          UpdateLog('Невозможно установить соединение с концентратором по адресу ' + Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(' ', colorOk);
          UpdateLog(Form1.sRichEdit2.Handle,
            'Не удалось установить соединение с концентратором по адресу ' + Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
          goto labelkonec;
        end;
      end;
    end;

    UpdateLog('Чтение данных с концентратора', colorOk);
    begin
      Synchronize(PuskTimer);
      DecodeTime(Time, hour, min, sec, msec);
      nachOprosa := hour * 3600 + min * 60 + sec;
      //---------------------------------------------------------
      //          Чтение данных с концентратора
      //---------------------------------------------------------
                //Задание начальных параметров
      if adresPovtor <> '' then
        adres := adresPovtor
      else
        adres := '0000';
      SetLength(bufPriema, 3); //Для младшего байта адреса в первом адресе
      bufPriema[0] := 0; //0
      //*****************************

      repeat
        //Формирование конфигурации запроса
        bufper := Shapka(false, PChar(Form1.massivOprosa[i, 0, 0, 5]),
          PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
          3]), PChar(adres));
        bufper[16] := bufPriema[Length(bufPriema) - 3];
        bufper[17] := CRC(bufper, 0, 16);
        //*********************************
        error := 0;
        k := 0;
        povtor:
        if flagGPRS then
        begin
          dmGPRS.SendGPRS(bufper);
        end
        else
        begin
          BComPort.ClearBuffer(true, true); //Очистка буферов
          WriteBufInPort(bufper); //Посылка запроса

          if (not WaitComData(4000)) then //Ожидание поступления данных в порт
          begin
            if k > 3 then
            begin
              PovtorDozvona; //Разрыв свзи для повторного дозвона
              adresPovtor := adres;
              goto nachalo;
            end
            else
            begin
              Inc(k);
              goto povtor
            end;
          end;
        end;

        bufPriema := nil;

        //Прием данных
        k := -1;
        if flagGPRS then
        begin
          while dmGPRS.GetByteGPRS(tempByte) do
          begin
            Inc(k);
            SetLength(bufPriema, Length(bufPriema) + 1);
            bufPriema[k] := tempByte;
            Inc(prinByte);
            SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
              Lparam(LPCTSTR(IntToStr(prinByte))));
            if (k > 18) and (bufPriema[k] = 90) and (bufPriema[k - 1] = 165) and
              (bufPriema[k - 2] = 90) and (bufPriema[k - 3] = 165) and (bufPriema[k
              - 4] = 90) and (bufPriema[k - 5] = 165) and (bufPriema[k - 6] = 90)
              and (bufPriema[k - 7] = 165) and (bufPriema[k - 8] = 90) and
              (bufPriema[k - 9] = 165) and (bufPriema[k - 10] = 90) and (bufPriema[k
              - 11] = 165) and (bufPriema[k - 12] = 90) and (bufPriema[k - 13] = 165) then
            begin
              for j := 0 to 3 do
              begin
                SetLength(bufPriema, Length(bufPriema) + 1);
                Inc(prinByte);
                Inc(k);
                SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
                  Lparam(LPCTSTR(IntToStr(prinByte))));
                dmGPRS.GetByteGPRS(tempByte);
                bufPriema[k] := tempByte;
              end;
              Inc(k);
              SetLength(bufPriema, Length(bufPriema) + 1);
              bufPriema[k] := 0;
              Break //Выход из цикла чтения
            end;
          end;
        end
        else
        begin
          repeat
            if (k > 18) and (bufPriema[k] = 90) and (bufPriema[k - 1] = 165) and
              (bufPriema[k - 2] = 90) and (bufPriema[k - 3] = 165) and (bufPriema[k
              - 4] = 90) and (bufPriema[k - 5] = 165) and (bufPriema[k - 6] = 90)
              and (bufPriema[k - 7] = 165) and (bufPriema[k - 8] = 90) and
              (bufPriema[k - 9] = 165) and (bufPriema[k - 10] = 90) and (bufPriema[k
              - 11] = 165) and (bufPriema[k - 12] = 90) and (bufPriema[k - 13] = 165) then
            begin
              for j := 0 to 3 do
              begin
                SetLength(bufPriema, Length(bufPriema) + 1);
                Inc(prinByte);
                Inc(k);
                SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
                  Lparam(LPCTSTR(IntToStr(prinByte))));
                BComPort.Read(@bufPriema[k], 1);
              end;
              Inc(k);
              SetLength(bufPriema, Length(bufPriema) + 1);
              bufPriema[k] := 0;
              Break //Выход из цикла чтения
            end;
            SetLength(bufPriema, Length(bufPriema) + 1);
            Inc(prinByte);
            Inc(k);
            SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
              Lparam(LPCTSTR(IntToStr(prinByte))));
          until (BComPort.Read(@bufPriema[k], 1) = 0) or (k > 30000);
        end;
        //Пока не прерыв связи

        if bufPriema = nil then
        begin
          Inc(error);
          if error > 3 then
            //Если количеставо попыток чтения одного адреса превышает 10 то повтор дозвона
          begin
            if countPovtDozv > 1 then
            begin
              UpdateLog('Концентратор не отвечает', colorError);
              goto labelKonec;
            end;
            Inc(countPovtDozv);
            PovtorDozvona; //Разрыв свзи для повторного дозвона
            adresPovtor := adres;
            goto nachalo;
          end;
          goto povtor; //Если данные неверные повтор запроса
        end;

        //запись в лог
        if log then
        begin
          Write(logFile, 'ЧТ. ');
          for k := 0 to Length(bufPriema) - 1 do
            Write(logFile, IntToStr(bufPriema[k]) + ', ');
          Writeln(logFile, '');
        end;
        //*********************

        //Опредеение конца приема данных
        if (bufPriema[1] = 255) and (bufPriema[2] = 255) and (bufPriema[3] = 255) then
          break;
        //****************************

        //Проверка на наличие данных о теплосчётчике ТЭМ-104
        if (bufPriema[0] = 170) and (bufPriema[3] = 0) and (bufPriema[4] = 0) then // and (bufPriema[5] = 7)  then
        begin
          if (bufPriema[Length(bufPriema) - 3] = 255) and
          (bufPriema[Length(bufPriema) - 4] = 255) and
          (bufPriema[Length(bufPriema) - 5] = 255) and
          (bufPriema[Length(bufPriema) - 6] = 255) and
          (bufPriema[Length(bufPriema) - 7] = 255) then
          begin
            nomerSchetcika := '';
            if (bufPriema[5] = 7) then
            begin
              nomerSchetcika := IntToHex(bufPriema[152], 2);
              nomerSchetcika := nomerSchetcika + IntToHex(bufPriema[153], 2);
              nomerSchetcika := nomerSchetcika + IntToHex(bufPriema[154], 2);
              nomerSchetcika := IntToStr(StrToInt('$' + nomerSchetcika));
              nomerSchetcika := nomerSchetcika + '#' + IntToStr(bufPriema[1]);
            end
            else if (bufPriema[5] = 8) then
            begin
              for t := 21 to 27 do
                nomerSchetcika := nomerSchetcika + Chr(bufPriema[t]);
            end;

            for t := 6 to 6 + bufPriema[5] - 1 do
            begin
              tempStr := tempStr + Chr(bufPriema[t]);
            end;
            UpdateLog('    Теплосчетчик ' + tempStr + ' ' + nomerSchetcika +
              ' считан', colorRab);
            Inc(schitano);
            SendMessage(Form1.sEdit9.Handle, WM_SETTEXT, 0,
              Lparam(LPCSTR(IntToStr(schitano))));
            UpdateTmpHashr(nomerSchetcika, '1');
            Synchronize(UpdateProgress); //Изменение прогрееса считывания
            SaveDataSoSchet(bufPriema, 0);
          end
          else
            goto povtor;
          break;
        end;
        //***************************************************

        //Проверка правильности принятых данных
        if not ((bufPriema[13] = 170) and (bufPriema[Length(bufPriema) - 6] = 90)
          and (bufPriema[Length(bufPriema) - 7] = 165)) then
        begin
          Inc(error);
          if error > 10 then
            //Если количеставо попыток чтения одного адреса превышает 10 то повтор дозвона
          begin
            if countPovtDozv > 1 then
            begin
              UpdateLog('Концентратор не отвечает', colorError);
              goto labelKonec;
            end;
            Inc(countPovtDozv);
            PovtorDozvona; //Разрыв свзи для повторного дозвона
            adresPovtor := adres;
            goto nachalo;
          end;
          Sleep(1000);
          goto povtor; //Если данные неверные повтор запроса
        end;
        //*******************************

        //Определение номера счетчика
        tempbuf := nil;
        tempbuf := BCDToNumStr(Copy(bufPriema, 0, 3));
        nomerSchetcika := '';
        for j := 0 to 5 do
          nomerSchetcika := nomerSchetcika + Chr(tempbuf[j]);
        //****************************

        if bufPriema[12] = 0 then //Если ошибок при считывании нет
        begin
          //          UpdateLog('    Счётчик ' + nomerSchetcika + ' считан', colorRab);
          UpdateLog('    Счётчик ' + nomerSchetcika + ' считан. ' + TimeToStr(Time), colorRab);
          Inc(schitano);
          SendMessage(Form1.sEdit9.Handle, WM_SETTEXT, 0,
            Lparam(LPCSTR(IntToStr(schitano))));
          UpdateTmpHashr(nomerSchetcika, '1');
          SaveDataSoSchet(bufPriema, StrToInt(Form1.massivOprosa[i, 0, 0, 9]));
          if flagProvAdresa then
          begin
            sql := TpFIBQuery.Create(nil);
            with sql do
              try
                Database := DBs;
                Transaction := DBs.DefaultTransaction;
                Transaction.StartTransaction;
                SQL.Text := 'select addr from addresmain ' + ' where inc in (select cod from addres ' + ' where inc in (select cod from tmp ' +
                  ' where NS = ''' + nomerSchetcika + '''))';
                ExecQuery;
                tempBool := False;
                while not Eof do
                begin
                  tempStr := FN('addr').AsString;
                  if Trim(Form1.massivOprosa[i, 0, 0, 1]) = Trim(tempStr) then
                    tempBool := True;
                  Next;
                  flagProvAdresa := false;
                end;

                if not tempBool then
                begin
                  UpdateLog('    Опрашиваемые счётчики находятся на другом адресе:', colorError);
                  UpdateLog('    ' + FN('addr').AsString, colorError);
                end;
              finally
                Free;
              end;
          end;
        end
        else
        begin
          sql := TpFIBQuery.Create(nil);
          with sql do
            try
              Database := DBs;
              Transaction := DBs.DefaultTransaction;
              Transaction.StartTransaction;
              //SQL.Text := 'select KV from tmp where NS = ''' + nomerSchetcika +  '''';
              SQL.Text := 'select kv from tmp where ns = :ns and tmp.cod in (select inc from addres where cod = :inc)';
              ParamByName('ns').AsString := nomerSchetcika;
              ParamByName('inc').AsInteger := StrToInt(Form1.massivOprosa[i, 0, 0, 9]);
              ExecQuery;
              kv := FN('KV').AsString;
            finally
              Free;
            end;
          UpdateLog('    Счётчик ' + nomerSchetcika + DetectError(bufPriema) +
            ' ' + '(кв. ' + kv + ')', colorError);
          NeschCounter.Add('    Счётчик ' + nomerSchetcika +
            DetectError(bufPriema) + ' ' + '(кв. ' + kv + ')');
          //Установка флага о несчитывании
          if not flagTolkoChtenie then
            AddPovtChtenie(nomerSchetcika, i);
          Inc(neschitano);
          UpdateTmpHashr(nomerSchetcika, '0');
          SendMessage(Form1.sEdit10.Handle, WM_SETTEXT, 0,
            Lparam(LPCSTR(IntToStr(neschitano))));
        end;
        Synchronize(UpdateProgress); //Изменение прогрееса считывания
        adres := IntToHex(bufPriema[Length(bufPriema) - 4], 2) +
        IntToHex(bufPriema[Length(bufPriema) - 5], 2);
      until (false);

      DecodeTime(Time, hour, min, sec, msec);
      nachOprosa := (hour * 3600 + min * 60 + sec) - nachOprosa;
      Synchronize(StopTimer);
      //****************Отчёт о опросе*********
      UpdateLog(Form1.sRichEdit2.Handle, 'Сбор данных с дома по адресу: ',
        colorRab);
      UpdateLog(Form1.sRichEdit2.Handle, Form1.massivOprosa[i, 0, 0, 1],
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  ----------------------------',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | Cчитано счётчиков: ' +
        IntToStr(schitano), colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | Несчитано счётчиков: ' +
        IntToStr(neschitano), colorOk);
      for j := 1 to NeschCounter.Count do
        UpdateLog(Form1.sRichEdit2.Handle, '   - ' + NeschCounter.Strings[j -
          1], colorError);
      UpdateLog(Form1.sRichEdit2.Handle, '  | Сохранено: ' +
        IntToStr(StrToInt(Form1.sEdit11.Text)), colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | Время работы с концентратором: ' +
        IntToStr(nachOprosa div 60) + ':' + FormatFloat('00', nachOprosa mod 60),
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | Дата/время: ' + FormatDateTime('dd/mm/yy hh/nn/ss', Date + Time), colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | Размер принятых данных: ' +
        IntToStr(StrToInt(Form1.sEdit13.Text)) + ' байт (' +
        FloatToStrF(StrToInt(Form1.sEdit13.Text) / 1024, ffFixed, 7, 2) + ' kb)',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  ----------------------------',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
      //---------------------------------------
      UpdateLog('Считывание информации с объекта по адресу: ' +
        Form1.massivOprosa[i, 0, 0, 1] + ' закончено.', colorOk);
      UpdateLog('  ---------------------------', colorOk);
      UpdateLog('  | Считано счётчиков: ' +
        IntToStr(StrToInt(Form1.sEdit9.Text)), colorOk);
      UpdateLog('  | Несчитано счётчиков: ' +
        IntToStr(StrToInt(Form1.sEdit10.Text)), colorOk);
      UpdateLog('  ---------------------------', colorOk);
      UpdateLog('Время работы с концентратором: ' + IntToStr(nachOprosa div 60) +
        ':' + FormatFloat('00', nachOprosa mod 60), colorOk);
      UpdateLog(' ', colorOk);
      FilterNeschit(i);
      Razriv;
    end;

    labelKonec:
    if (not flagGPRS) then
    begin
      if BComPort <> nil then
      begin
        BComPort.Close;
        BComPort.Free;
      end;
    end;
    Synchronize(incGauge1); //Увеличение на одну единицу
  end;
  Form1.sGauge2.Visible := false;
end;

function TDeviceThread.DetectError(response: TBytes): string;
begin
  case response[12] of
    0: Result := '';
    1: Result := '  неверный код функции';
    2: Result := '  неверное количество переданных данных';
    3: Result := '  неверный пароль устройства';
    4: Result := '  неверная CRC';
    5: Result := '  код ошибки не допустим';
    6: Result := '  Неверный номер устройства';
    7: Result := '  не считан';
  else
    Result := ' неизвестная ошибка'
  end;
end;

function TDeviceThread.Dozvon(nomer: string): Boolean;
var
  str: string; //Строка ответа модема при дозвоне
  tempStr: string; //Строка для временного хранения ответа модема
  schetchik: integer; //Счетчик количества попыток дозвона
  i: integer;
begin
  if not flagModem then
  begin
    Result := True;
    Exit;
  end;

  if flagGPRS then
  begin
    if dmGPRS.InitGPRS(nomer, 2020) then
      //    if dmGPRS.InitGPRS(nomer, FormOptions.sEdit4.Text) then
    begin
      Result := True;
      UpdateLog('Связь установлена', colorOk);
    end
    else
    begin
      Result := False;
    end;
  end
  else
  begin
    ent := $0D;
    schetchik := 0;
    //***В зависимости от вида номера строка для модема имеет вид
    //--номер семизначный - AT DP + *******(номер)
    //--номер начинается с 8 - AT W1 M0 E0 DP + 8W + ***(код)*******(номер)
    repeat
      Inc(schetchik);
      BComPort.ClearBuffer(true, true);

      //Кладем трубку
      Sleep(1100);
      BComPort.WriteStr('+++');
      Sleep(1100);
      BComPort.WriteStr('ATE0');
      BComPort.Write(@ent, 1);
      WaitComData(1000);
      BComPort.ReadStr(tempStr, BComPort.InputCount);
      //    Sleep(1100);
      //    BComPort.ReadStr(tempStr, BComPort.InputCount);

      if schetchik <> 1 then
      begin
        Sleep(1000);
        UpdateLog('    Попытка №' + IntToStr(schetchik), colorOk);
      end;

      if (nomer[1] = '8') and (length(nomer) > 7) then
      begin
        BComPort.WriteStr('ATDP ' + '8W' + Copy(nomer, 2, Length(nomer) - 1));
        BComPort.Write(@ent, 1);
      end
      else
      begin
        BComPort.WriteStr('ATDP ' + nomer);
        BComPort.Write(@ent, 1);
      end;
      WaitComData(10000); //Ожидание после набора номера

      str := '';

      //*********Чтение данных с приемного буфера com порта**********
      i := 0;
      //Счетчик для защиты от зависания. Время дозвона ограничивается i/10 сек
      repeat
        BComPort.ReadStr(tempStr, BComPort.InputCount);
        str := str + tempStr;
        Sleep(100);
        if i = 350 then
          UpdateLog('Нет ответа. Ожидание 30 сек', colorRab);
        Inc(i);
      until ((Pos('CONNECT 9600', str) <> 0) or (Pos('CONNECT', str) <> 0) or
        (Pos('NO DIAL', str) <> 0) or (Pos('NO CARRIER', str) <> 0) or
        (Pos('ERROR', str) <> 0) or (Pos('NO ANSWER', str) <> 0) or (Pos('BUSY',
        str) <> 0) or (i > 650));

      //********Проверка ответа модема при дозвоне
      if ((Pos('CONNECT 9600', str) <> 0)) then
      begin
        UpdateLog('Соединение на скорости 9600 ', colorOk);
        Result := true;
      end

      else if (Pos('NO DIAL', str) <> 0) then
      begin
        UpdateLog('NO DIAL', colorError);
        Result := false;
      end

      else if (Pos('NO CARRIER', str) <> 0) then
      begin
        UpdateLog('NO CARRIER', colorError);
        Result := false;
      end

      else if (Pos('NO ANSWER', str) <> 0) then
      begin
        UpdateLog('NO ANSWER', colorError);
        Result := false;
      end

      else if (Pos('ERROR', str) <> 0) then
      begin
        UpdateLog('ERROR', colorError);
        Result := false;
      end

      else if (Pos('BUSY', str) <> 0) then
      begin
        UpdateLog('BUSY', colorOk);
        Result := false;
      end

      else
      begin
        UpdateLog('Связь не установлена', colorError);
        BComPort.ClearBuffer(true, true);
        Sleep(1200);
        BComPort.WriteStr('+++');
        Sleep(1500);
        BComPort.WriteStr('ATZ');
        BComPort.Write(@ent, 1);
        Sleep(1500);
        BComPort.ReadStr(tempStr, BComPort.InputCount);
        BComPort.Close;
        Sleep(500);
        Result := false;
        if not NastrPort(False) then
          Exit;
        IniModem
      end;
    until (result or (schetchik = countDozvon));
  end;

end;

procedure TDeviceThread.Execute;
var
  i: Integer;
begin
  if stop then //Если работа потока не нужна то
    Exit; //завершение потока

  countDozvon := FormOptions.sSpinEdit1.Value; //Количество попыток дозвона
  timeOdinSch := FormOptions.sDecimalSpinEdit1.Value;

  Synchronize(ObnulSchetchikov);
  Synchronize(ClearLog);
  Synchronize(BlokGlOkna); //Блокировка компонентов при работе com порта
  LoadDll; //загрузка библиотеки

  try
    AssignFile(logFile, ExtractFilePath(Application.ExeName) + '\Log\log.txt');
    Rewrite(logFile); //Открытие файла лога
  except

  end;

  //--Создание соединения с базой для потока
  DBs := TpFIBDatabase.Create(nil);
  DBs.DBParams := dm1.database.DBParams;
  DBs.LibraryName := dm1.database.LibraryName;
  DBs.DBName := dm1.database.DBName;
  DBs.SQLDialect := 3;
  DBs.DefaultTransaction := TpFIBTransaction.Create(nil);
  DBs.DefaultTransaction.DefaultDatabase := DBs;
  DBs.Open;
  //----------------------------------------

  if flagSchitivatel then
  begin //--------------------------
    if flagTolkoChtenie then //
      ChtenieSchit // Работа со считывателем
    else //
      ProgrNaChtenieSchit //
  end //--------------------------
  else
  begin
    if flagWrite then // Если запись параметров
    begin
      ProgrWrite;
      ProverkaWrite;
    end
    else
    begin
      //Если только чтение то процедура программирования пропускается
      if flagTolkoChtenie then
        Chtenie
      else
      begin
        // Если разрешено дочитывание счетчиков, то выполняется вторая попытка
        if flagSecondRead then
        begin
          for i := 0 to 1 do
          begin
            if i >= 1 then
              Sleep(15000);
            ProgrNaChtenie; //Програмирование концентраторов на чтение
            Chtenie;
          end;
        end
        else
        begin
          ProgrNaChtenie; //Програмирование концентраторов на чтение
          Chtenie;
        end;
      end;
    end;
  end;

  //--Униятожение обьекта базы
  DBs.DefaultTransaction.Free;
  DBs.Free;
  //-----------------------

  Synchronize(OtmenaBlokGlOkna); //Отмена блокировки
end;

procedure TDeviceThread.FilterNeschit(numAddr: Integer);
var
  i, j: Integer;
  countRaz: Integer;
  countCounter: Integer;
  arrayNesch: array of array of string;
begin
  Form1.massivOprosa[numAddr, 0, 0, 13] := '0';
  countRaz := Length(Form1.massivOprosa[numAddr]) - 1;
  for i := 1 to countRaz do
  begin
    arrayNesch := nil;
    countCounter := Length(Form1.massivOprosa[numAddr, i]) - 1;
    for j := 1 to countCounter do
    begin
      if Form1.massivOprosa[numAddr, i, j, 2] = '1' then
      begin
        SetLength(arrayNesch, Length(arrayNesch) + 1);
        SetLength(arrayNesch[Length(arrayNesch) - 1], 3);
        arrayNesch[Length(arrayNesch) - 1, 0] := Form1.massivOprosa[numAddr, i, j, 0];
        arrayNesch[Length(arrayNesch) - 1, 1] := Form1.massivOprosa[numAddr, i, j, 1];
        arrayNesch[Length(arrayNesch) - 1, 2] := '0';
      end;
    end;
    //Удаление счетчиков из массива
    SetLength(Form1.massivOprosa[numAddr, i], 1);
    if Length(arrayNesch) <> 0 then
    begin
      SetLength(Form1.massivOprosa[numAddr, i], 1 + Length(arrayNesch));
      for j := 0 to Length(arrayNesch) - 1 do
      begin
        SetLength(Form1.massivOprosa[numAddr, i, j + 1], 3);
        Form1.massivOprosa[numAddr, i, j + 1, 0] := arrayNesch[j, 0];
        Form1.massivOprosa[numAddr, i, j + 1, 1] := arrayNesch[j, 1];
        Form1.massivOprosa[numAddr, i, j + 1, 2] := arrayNesch[j, 2];
        Form1.massivOprosa[numAddr, 0, 0, 13] := '1';
      end;
    end;
  end;
end;

procedure TDeviceThread.IncEditNum(handle: HWND);
var
  stroka: AnsiString;
  i: integer;
begin
  i := SendMessage(handle, WM_GETTEXT, 3, Lparam(@stroka[1]));
  SendMessage(handle, WM_SETTEXT, 0,
    Lparam(LPCSTR(IntToStr(StrToInt(Copy(stroka, 1, i)) + 1))));
end;

procedure TDeviceThread.incGauge1;
begin
  Form1.sGauge1.Progress := Form1.sGauge1.Progress + 1;
end;

function TDeviceThread.IniModem(): Boolean; //Процедура инициализации модема
var
  m: integer;
  str: string;
  tempstr: string;
begin
  if not BComPort.Connected then
    if not NastrPort(False) then
    begin
      Result := False;
      Exit;
    end;
  UpdateLog('Инициализация модема...', colorOk);
  ent := $0D;
  BComPort.ClearBuffer(true, true);
  BComPort.WriteStr('ATZ');
  BComPort.Write(@ent, 1); //temp
  str := '';
  m := 0;
  //Счетчик для защиты от зависания. Время дозвона ограничивается i/10 сек
  Sleep(50);

  repeat
    BComPort.ReadStr(tempStr, BComPort.InputCount);
    str := str + tempStr;
    Sleep(100);
    Inc(m);
  until ((Pos('OK', str) <> 0) or (m > 30)); //3 сек
  if Pos('OK', str) = 0 then
  begin
    UpdateLog('Модем не доступен', colorError);
    Result := false;
    BComPort.Close;
    CloseFile(logFile);
    exit;
  end;

  //********* 26.02.2014******

  BComPort.WriteStr('AT');
  BComPort.Write(@ent, 1);
  Sleep(200);
  BComPort.ReadStr(tempStr, BComPort.InputCount);

  BComPort.WriteStr('ATH0');
  BComPort.Write(@ent, 1);
  Sleep(200);
  BComPort.ReadStr(tempStr, BComPort.InputCount);

  BComPort.WriteStr('ATM1');
  BComPort.Write(@ent, 1);
  Sleep(200);
  BComPort.ReadStr(tempStr, BComPort.InputCount);

  BComPort.WriteStr('ATL2');
  BComPort.Write(@ent, 1);
  Sleep(200);
  BComPort.ReadStr(tempStr, BComPort.InputCount);

  BComPort.WriteStr('ATX4');
  BComPort.Write(@ent, 1);
  Sleep(200);
  BComPort.ReadStr(tempStr, BComPort.InputCount);

  BComPort.WriteStr('ATS7=60');
  BComPort.Write(@ent, 1);
  Sleep(200);
  BComPort.ReadStr(tempStr, BComPort.InputCount);

  BComPort.WriteStr('AT&D2');
  BComPort.Write(@ent, 1);
  Sleep(200);
  BComPort.ReadStr(tempStr, BComPort.InputCount);

  BComPort.WriteStr('AT&C1');
  BComPort.Write(@ent, 1);
  Sleep(200);
  BComPort.ReadStr(tempStr, BComPort.InputCount);

  BComPort.WriteStr('AT&S1');
  BComPort.Write(@ent, 1);
  Sleep(200);
  BComPort.ReadStr(tempStr, BComPort.InputCount);

  BComPort.WriteStr('AT+IFC=0,2');
  BComPort.Write(@ent, 1);
  Sleep(200);
  BComPort.ReadStr(tempStr, BComPort.InputCount);

  BComPort.WriteStr('AT+CBST=71,0,1');
  BComPort.Write(@ent, 1);
  Sleep(200);
  BComPort.ReadStr(tempStr, BComPort.InputCount);
  //**************************
  // 19.04.2013  закоментировал
{
  BComPort.WriteStr('ATS7=50');
  //Время ожидания несущей вызывающего модема в секундах
  BComPort.Write(@ent, 1);
  Sleep(50);
  BComPort.ReadStr(tempStr, BComPort.InputCount);
  BComPort.WriteStr('ATS10=25');
  //Время в 1/10 c, в течение которого модем ожидает возвращения сигнала несущей удаленного модема перед разрывом соединения, если несущая потеряна.
  BComPort.Write(@ent, 1);
  Sleep(50);
  BComPort.ReadStr(tempStr, BComPort.InputCount);
}
  Sleep(1200);
  BComPort.WriteStr('+++');
  Sleep(1200);
  m := 0;
  str := '';
  BComPort.WriteStr('ATE0'); //эхо выключено
  BComPort.Write(@ent, 1);
  Sleep(100);
  BComPort.ReadStr(str, BComPort.InputCount);
  while (Pos('OK' + #13 + #10, str) = 0) and (m < 5) do
  begin
    BComPort.ClearBuffer(true, true);
    BComPort.WriteStr('ATE0');
    BComPort.Write(@ent, 1);
    Sleep(100);
    BComPort.ReadStr(str, BComPort.InputCount);
    Inc(m);
  end;
  if Pos('OK' + #13 + #10, str) = 0 then
    //**Если модем ответил OK то инициализация успешная
  begin
    UpdateLog('Модем не доступен', colorError);
    Result := false;
    BComPort.Close;
    CloseFile(logFile);
    exit;
  end
  else
  begin
    UpdateLog('Инициализация прошла успешно', colorOk);
    Result := true;
  end;
end;

procedure TDeviceThread.LoadDll; //Процедура загрузки библиотеки
begin
  try
    DLLHandle := LoadLibrary(PChar(ExtractFilePath(Application.ExeName) +
      '\DLL\formirBuf\formirBuf.dll'));
  except
    exit;
  end;
  if DLLHandle = 0 then
  begin
    UpdateLog('Ошибка при загрузке библиотеки formirBuf.dll. Дальнейшая работа не возможна', colorError);
    Exit;
  end;
  @FormirBuf_SapNazvRas := GetProcAddress(DLLHandle, 'FormirBuf_SapNazvRas');
  if @FormirBuf_SapNazvRas = nil then
  begin
    UpdateLog('Не найдена функция FormirBuf_SaprNaChtenie!', colorError);
    Exit;
  end;
  @FormirBuf_SapNomerovSch := GetProcAddress(DLLHandle,
    'FormirBuf_SapNomerovSch');
  if @FormirBuf_SapNomerovSch = nil then
  begin
    UpdateLog('Не найдена функция FormirBuf_SapNomerovSch!', colorError);
    Exit;
  end;
  @FormirBuf_SapAdrCht_Sapisi := GetProcAddress(DLLHandle,
    'FormirBuf_SapAdrCht_Sapisi');
  if @FormirBuf_SapAdrCht_Sapisi = nil then
  begin
    UpdateLog('Не найдена функция FormirBuf_SapAdrCht_Sapisi!', colorError);
    Exit;
  end;
  @Shapka := GetProcAddress(DLLHandle, 'ShapKa');
  if @Shapka = nil then
  begin
    UpdateLog('Не найдена функция ShapKa!', colorError);
    Exit;
  end;
  @CRC := GetProcAddress(DLLHandle, 'CRC');
  if @CRC = nil then
  begin
    UpdateLog('Не найдена функция CRC!', colorError);
    Exit;
  end;
  @BCDToNumStr := GetProcAddress(DLLHandle, 'BCDToNumStr');
  if @BCDToNumStr = nil then
  begin
    UpdateLog('Не найдена функция BCDToNumStr!', colorError);
    Exit;
  end;
  @NumStringToBCD := GetProcAddress(DLLHandle, 'NumStringToBCD');
  if @NumStringToBCD = nil then
  begin
    UpdateLog('Не найдена функция NumStringToBCD!', colorError);
    Exit;
  end;
  @FormirBufFor_TEM_104 := GetProcAddress(DLLHandle, 'FormirBufFor_TEM_104');
  if @FormirBufFor_TEM_104 = nil then
  begin
    UpdateLog('Не найдена функция FormitBufFor_TEM_104!', colorError);
    Exit;
  end;
end;

function TDeviceThread.NastrPort(schit: Boolean): Boolean;
begin
  if schit then
  begin
    BComPort.BaudRate := Form1.ComPort1.BaudRate;
    BComPort.Port := Form1.ComPort1.Port;
    BComPort.SyncMethod := Form1.ComPort1.SyncMethod;
    BComPort.Events := Form1.ComPort1.Events;
  end
  else
  begin
    BComPort.BaudRate := Form1.ComPort.BaudRate;
    BComPort.Port := Form1.ComPort.Port;
    BComPort.SyncMethod := Form1.ComPort.SyncMethod;
    BComPort.Events := Form1.ComPort.Events;
  end;

  if not BComPort.Connected then
    try
      BComPort.Open;
      Result := true;
    except
      UpdateLog('Попытка открыть занятый COM порт', colorError);
      Result := false;
      BComPort.Close;
    end;
end;

procedure TDeviceThread.UpdateLog(str: string; color: TColor);
//Процедура добавления строки в протокол обмена
var
  Format: TCharFormat; //Переменная для хранения параметров шрифта TRichEdit
begin
  FillChar(Format, SizeOf(TCharFormat), 0);
  Format.cbSize := SizeOf(TCharFormat);
  SendMessage(Form1.Log.Handle, EM_SETSEL, MaxInt, MaxInt);
  SendMessage(Form1.Log.Handle, EM_GETCHARFORMAT, 0, LPARAM(@Format));
  //Получение текущих параметров шрифта
  Format.dwMask := CFM_COLOR;
  Format.crTextColor := ColorToRGB(color);
  SendMessage(Form1.Log.Handle, EM_SETCHARFORMAT, SCF_SELECTION,
    LPARAM(@Format)); //Применение параметров
  SendMessage(Form1.Log.Handle, EM_REPLACESEL, 0, LongInt(PChar(str + #13#10)));
  //Запись новой строки в TRichEdit
end;

procedure TDeviceThread.UpdateLog(hadn: THandle; str: string; color: TColor);
var
  Format: TCharFormat; //Переменная для хранения параметров шрифта TRichEdit
begin
  FillChar(Format, SizeOf(TCharFormat), 0);
  Format.cbSize := SizeOf(TCharFormat);
  SendMessage(hadn, EM_SETSEL, MaxInt, MaxInt);
  SendMessage(hadn, EM_GETCHARFORMAT, 0, LPARAM(@Format));
  //Получение текущих параметров шрифта
  Format.dwMask := CFM_COLOR;
  Format.crTextColor := ColorToRGB(color);
  SendMessage(hadn, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@Format));
  //Применение параметров
  SendMessage(hadn, EM_REPLACESEL, 0, LongInt(PChar(str + #13#10)));
  //Запись ново строки в TRichEdit
end;

procedure TDeviceThread.UpdateProgress;
begin
  Form1.sGauge2.Progress := Form1.sGauge2.Progress + 1;
end;

procedure TDeviceThread.UpdateTmpHashr(ns, val: string);
var
  sql: TpFIBQuery;
begin
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := DBs;
      Transaction := DBs.DefaultTransaction;
      Transaction.StartTransaction;
      SQL.Text := 'update tmp set hashr =' + val + 'where ns = ''' + ns + '''';
      ExecQuery;
      Transaction.Commit;
    finally
      Free
    end;
end;

function TDeviceThread.WaitComData(msec: integer): boolean;
//Процедура ожидания поступления данных в порт
var
  i: integer;
  //  Event: TEvent;
    //ev: POVERLAPPED;
    //evMask: DWORD;
begin
  i := 0;
  msec := msec div 10;
  Result := true;

  //ev.hEvent := CreateEvent(0, false, false, nil);
  //ev.Internal := 0;
  //ev.InternalHigh := 0;
  //ev.Offset := 0;
  //ev.OffsetHigh := 0;
  //WaitCommEvent(BComPort.FHandle, evMask, ev);
  //WaitForSingleObject(BComPort.FHandle, msec);
{  Event := TEvent.Create(nil, True, False, '');

  BComPort.WaitForEvent(Events, Event.Handle, msec);
    if evRxChar in Events then      //!!!
      Result := True
    else
      Result :=False;
  Event.Free;
}
  if flagGPRS then
  begin
    while dmGPRS.InBufEmtyGPRS do
    begin
      Sleep(10);
      Inc(i);
      if i > msec then
      begin
        Result := false;
        break
      end;
    end;
  end
  else
  begin
    while BComPort.InputCount = 0 do
    begin
      Sleep(10);
      Inc(i);
      if i > msec then
      begin
        Result := false;
        break
      end;
    end;
  end;

end;

procedure TDeviceThread.WaitUpdateProgresBar(sec: integer);
//Процедура обновлениея полосы програсса работы концентратора
var
  i: Integer;
  int: integer;
begin
  //ShowWindow(Form1.sProgressBar1.Handle, SW_SHOW);
  ShowWindow(Form1.sProgressBar2.Handle, SW_SHOW);
  //SendMessage(Form1.sProgressBar1.Handle, PBM_SETRANGE, 0, MakeLParam(0, 100));
  //SendMessage(Form1.sProgressBar1.Handle, PBM_SETSTEP, 1, 0);
  //SendMessage(Form1.sProgressBar1.Handle, PBM_SETPOS, 0, 0);
  SendMessage(Form1.sProgressBar2.Handle, PBM_SETRANGE, 0, MakeLParam(0, 100));
  SendMessage(Form1.sProgressBar2.Handle, PBM_SETSTEP, 1, 0);
  SendMessage(Form1.sProgressBar2.Handle, PBM_SETPOS, 0, 0);
  int := sec * 10;
  for i := 1 to 100 do
  begin
    //SendMessage(Form1.sProgressBar1.Handle, PBM_STEPIT, 0, 0);
    SendMessage(Form1.sProgressBar2.Handle, PBM_STEPIT, 0, 0);
    Sleep(int);
  end;
  //ShowWindow(Form1.sProgressBar1.Handle, SW_HIDE);
  ShowWindow(Form1.sProgressBar2.Handle, SW_HIDE);
  //SendMessage(Form1.sProgressBar1.Handle, PBM_SETPOS, 0, 0);
  SendMessage(Form1.sProgressBar2.Handle, PBM_SETPOS, 0, 0);
end;

end.

