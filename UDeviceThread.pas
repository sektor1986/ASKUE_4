unit UDeviceThread;

// 26.02.2014
// �������� ������������� ������ ��� ����������� ������ � USB-GSM ��������
// ��������� ������ Huawei E1550

interface

uses
  Classes, Graphics, Messages, Windows, RichEdit, SysUtils, StrUtils, commctrl,
  Forms,
  pFIBQuery, pFIBDatabase, FIBDatabase, SyncObjs, UTypes, CPort, CPortTypes;

type
  buf = array of byte;
  bufPchar = array of PChar;
  ProcDll1 = function(nomConc: PChar; //����� �������������
    passwConcOld: PChar; //������ ������������� ������
    passwConcNew: PChar; //������ ������������� �����
    ConfigPer: array of PChar): TBytes;
  //������������ ������������ ������ (��������� ������)
//--0---����� ������� (16 ��������)
//--1-----�������� �������
//--2-----���������� ��������� � �������

  ProcDll2 = function(nomConc: PChar;
    passwConcOld: PChar;
    passwConcNew: Pchar;
    ConfigPer: array of bufPChar): TBytes; //������������ ������������ ������
  //-0,0-����� �������
  //-1,0-���������� ��������� � 1-�� ��������� ���
  //-1,1-����� �������� � 1-�� ���������
  //-1,2-����� ��������� 1-�� ���
  //-2,0-���������� ��������� �� ������ ���������
  //-2,1-�����
  //--.........
  //-10,0

  ProcDll3 = function(nomConc: PChar; //����� �������������
    passwConcOld: PChar; //������ ������������� ������
    passwConcNew: PChar; //������ ������������� �����
    passwSchOld: PChar; //������ �� �������� ������
    passwSchNew: PChar; //�������� �������� �����
    varTar: byte; //����� �������� �����������
    countRas: byte; //���������� ��������
    adrChtSap: array of PChar;
    //������ ������/������ (4 �����) + ���������� ���� ��������� (2 �����)
    read: Boolean): TBytes; //���� ������ ��� ������)

  ProcDll4 = function(read: Boolean; //������� ������������ ����� �������
    nomConc: PChar;
    passwConcOld: Pchar;
    passwConcNew: Pchar;
    addr: Pchar): TBytes;

  ProcDll5 = function(mass: TBytes; nach: integer; konec: integer): byte;
  ProcDll6 = function(const inStr: PChar): TBytes;
  ProcDll7 = function(response: TBytes): TBytes;
  ProcDll8 = function(nomConc: PChar; //����� �������������
    passwConcOld: PChar; //������ ������������� ������
    passwConcNew: PChar; //������ ������������� �����
    local_number: Byte;
    countRead_Flash512K: Byte;
    addr_Flash512K: integer;
    type_counter: Byte): TBytes;

  TDeviceThread = class(TThread)

    //����������� ��������� � �������
    procedure Razriv; //������� ������� �����
    procedure LoadDll; //�������� ������������ ���������
    procedure ProgrNaChtenieSchit;
    //��������� ���������������� �� ������ �����������
    procedure Chtenie; //��������� ������ ������ � �������������
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
    //��������� ���������������� ������������� �� ������
    procedure ProgrWrite; // ��������� ���������������� ������������� �� ������
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
    function Dozvon(nomer: string): Boolean; //������� ������� �� ������ nome
    function NastrPort(schit: Boolean): Boolean; //��������� ��������� com �����
    function WaitComData(msec: integer): boolean;

    //��������� �������� ��������� ������ � �������� ������ �����
    function IniModem(): Boolean; //��������� ������������� ������
  protected
    procedure Execute; override;
  public
    massivOprosa: TmassivOpr;
    KonfigWrite: array[1..10] of RKonfigZap;
    EnableVarTar: array of REnableVarTar;
    //massivOprosa: array of array of array of array of string;                     //������ �������� ������
    ParOprosa: array of array of string;
    //������ ������� ������ �� ��������� �����������                                              //�������� � 1 �� 10 ��� ����������� �������� �����������
    flagTolkoChtenie: Boolean;
    //��� ����������� ���� ������ (����� �� ���������������� �� ������)
    flagWrite: Boolean;
    stop: Boolean;
    GLOBAL_DATE_TIME_READED: TDateTime;
    CRsection: TCriticalSection;
    flagSchitivatel: Boolean; //���� ������ �� ������������
    flagModem: Boolean;
    flagGPRS: Boolean;
    flagSetGPRSApn: Boolean;
    flagSecondRead: Boolean;

    procedure IncEditNum(handle: HWND);
    procedure BlokGlOkna;
    //��������� ���������� ����������� ��� ������ � com ������
    procedure OtmenaBlokGlOkna; //������ ����������
    procedure UpdateLog(str: string; color: TColor); overload;
    //���������� ����� ������ � �������� ������
    procedure UpdateLog(hadn: THandle; str: string; color: TColor); overload;
  end;

implementation
uses Unit1, UOptions, UFormOpr, UFunction, Udm1, USaveData, UGPRS;
const
  colorError = clred;
  colorOk = clBlue;
  colorRab = clGreen;
  ojid = 30; //��������� ������� �������� ��� ���������������� �����������
var
  ent: integer; //���������� ��� #0D
  countDozvon: integer; //���������� ������� �������
  timeOdinSch: Real;
  logFile: TextFile;
  timeOpr: array of integer;
  //������ ������� �������� ��� ������� ������������� �������
  flagAutomatCht: Boolean;
  schetchikByte: integer;
  log: Boolean;
  BComPort: TComPort; //**�������� ���������� ���������� TBComPort
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
//��������� ���������� ����������� ��� ������ � com ������
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
    UpdateLog('����� ��������', colorError);
    Razriv;
    UpdateLog('����������� ��������� ����������', colorOk);
  end
  else
  begin
    UpdateLog('����� ��������', colorError);
    UpdateLog(' ', colorOk);
    if flagModem then
      UpdateLog('����������� ��������� ������', colorOk);
  end;
end;

procedure TDeviceThread.ProgrNaChtenie;
  procedure LogErrorProgram(adr: string);
  begin
    UpdateLog(Form1.sRichEdit2.Handle,
      '�� ������� ���������� ���������� � �������������� �� ������ ' + adr,
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
  //������ ��� �������� ������ � ���. � ����� ��������� �����������
  bufper: TBytes;
  bufPriema: TBytes;
  configPerNasv: array of PChar;
  configPerAdr: array of PChar;
  configPerNomSch: array of bufPchar;
label
  labelkonec;
begin
  //------------------------------------------
  //   Form1.massivOprosa - ������������ ������
  //   x - ����� ������������� �������
  //   y - � ����������� �� ���������� �������� (�� 1 �� 15)
  //   z - � ����������� �� ���������� ��������� � ������� (������� � 1)
  //   Form1.massivOprosa[x, 0, 0, 1] - ����� ������������� �������
  //   Form1.massivOprosa[x, 0, 0, 2] - ����� SIM ����� �������������
  //   Form1.massivOprosa[x, 0, 0, 3] - ������ �������������
  //   Form1.massivOprosa[x, 0, 0, 4] - ������ ���������
  //   Form1.massivOprosa[x, 0, 0, 5] - ����� �������������
  //
  //   Form1.massivOprosa[x, y, 0, 0] - �������� �������
  //
  //   Form1.massivOprosa[x, y, z, 0] - ����� ��������
  //   Form1.massivOprosa[x, y, z, 1] - ������� ����������� ��������
  //
  //******************************************
  //  0 - 0 - 0 - 0     - �����
  //   |   |   |- 1     - ����� ������������� �������
  //   |   |   |- 2     - ����� SIM ����� �������������
  //   |   |   |- 3     - ������ �������������
  //   |   |   |- 4     - ������ ���������
  //   |   |   |- 5     - ����� �������������
  //   |   |   |- 6     - ���������� ��������� � ������
  //   |   |   |- 10     - IP ����� �������������
  //   |   |
  //   |   |- 1 - 0     - ����� ������������� ���-104
  //   |       |- 1     - ����� ������ �� ������� ���������� ������������
  //   |
  //   |- 1 - 0 - 0     - �������� �������
  //   |   |
  //   |   |- 1 - 0     - ����� ��������
  //   |   |   |- 1     - ������� �����������
  //   |   ........
  //   |   |- n - 0
  //   |       |- 1
  //   ............
  //   |- m - 0 - 0
  //       |
  //       |- 1 - 0     - ����� ��������
  //       |   |- 1     - ������� �����������
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
    //�������� �� ������������� ����������������
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
      //��������� ���������� ����� � ��� ��������
      if not NastrPort(flagSchitivatel) then
        goto labelkonec;

      if flagModem then
      begin
        if not IniModem then //���� ����� ���������� �� ����� �� ���������
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
    //------��������� ��������� ����������-----
    timeOpr[i] := 0; //��������� ���������� ������� ������ ���������
    nomVarTar := nil;
    SetLength(nomVarTar, 10);
    povtorDozvona := 0;
    for k := 0 to 9 do
      nomVarTar[k] := false;
    //------------------------------------------

    if flagGPRS then
    begin
      UpdateLog('���������� � �������������� �� IP ' + Form1.massivOprosa[i, 0,
        0, 10] + '. �����: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
      if not Dozvon(Form1.massivOprosa[i, 0, 0, 10]) then
      begin
        UpdateLog('���������� ���������� ���������� � �������������� �� ������ '
          + Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(' ', colorOk);
        UpdateLog(Form1.sRichEdit2.Handle,
          '�� ������� ���������� ���������� � �������������� �� ������ ' +
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
        UpdateLog('������ �� ������������� �� ������ ' + Form1.massivOprosa[i, 0,
          0, 2] + '. �����: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
        if not Dozvon(Form1.massivOprosa[i, 0, 0, 2]) then
        begin
          UpdateLog('���������� ���������� ���������� � �������������� �� ������ '
            + Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(' ', colorOk);
          UpdateLog(Form1.sRichEdit2.Handle,
            '�� ������� ���������� ���������� � �������������� �� ������ ' +
            Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
          goto labelkonec;
        end;
      end;
    end;

    UpdateLog('���������������� ������������� �� ������', colorOk);
    Synchronize(PuskTimer);
    DecodeTime(Time, hour, min, sec, msec);
    nachOprosa := 3600 * hour + 60 * min + sec;
    //----------------------------------------------
    //  ������ ������� � ����
    //---------------------------------------------
    SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR('0')));
    schetchikByte := 0;
    SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(schetchikByte))));
    Inc(schetchikByte);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]),
      PChar('F0000')); //����������� ������ ���������� �������
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
    UpdateLog('    �������� ���� � �����', colorRab);
    //*****************************************************************

    //------------------------------------------------------
    //****************���������������� �������������*****************
    //------------------------------------------------------
    if Length(Form1.massivOprosa[i, 0]) = 2 then
    begin
      case FormOptions.sRadioGroup2.ItemIndex of
        //����� �������� ������ ���� ���-104 � ����������� �� ��������
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
      UpdateLog('    ������������ ���������������� �� ������ ���-104',
        colorRab);
    end;

    //***************************************************************

    countRaz := 0;
    for j := 1 to Length(Form1.massivOprosa[i]) - 1 do
    begin
      //���� � ��������������� ������� ��� �� ������ �������� - ������� �� ��������� ������
      if (Length(Form1.massivOprosa[i, j]) <= 1) then
        Continue;
      Inc(countRaz);
      //-----------------------------------------------
      //| ������ � ���������� �������� �������
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
      //|       ������ ������� ���������
      //-----------------------------------------------
      configPerNomSch := nil;
      SetLength(configPerNomSch, 12);
      SetLength(configPerNomSch[0], 2);
      configPerNomSch[0, 1] := PChar(ReverseString(Trim(Copy(ReverseString(Form1.massivOprosa[i, j, 0, 0]), 1, 2))));
      //      configPerNomSch[0, 0] := PChar(IntToStr(j)); //����� ������ ��� ��������
      configPerNomSch[0, 0] := PChar(IntToStr(countRaz)); //����� ������ ��� ��������
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
      UpdateLog('    ���������������� �� ������ ' + Form1.massivOprosa[i, j, 0, 0], colorRab);
      //*************************************************
    end;

    if not flagGPRS then
      BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]),
      PChar(IntToStr(countRaz)));
    //      PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(IntToStr(Length(Form1.massivOprosa[i]) - 1)));

        //����������� ������ ���������� �������
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
    //    �������� ������� ������ �� ��������� �����������
    //-----------------------------------------------------
    for k := 1 to 10 do //���������� ��� �������� �����������
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
    //    ������� ����� ��������
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
    //    ����������� ������� ������������ ��� ������ ���������
    //    � ���������� ���������
    //----------------------------------------------
    countSchetchikov := 0;
    DecodeTime(Time, hour, min, sec, msec);
    timeOpr[i] := hour * 3600 + min * 60 + sec; //������ ������� ������
    for j := 1 to Length(Form1.massivOprosa[i]) - 1 do
      for k := 1 to Length(Form1.massivOprosa[i, j]) - 1 do
        Inc(countSchetchikov); //������ ������� (���������� ������)
    SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(countSchetchikov))));
    //����� ������ ������ �������� �� ���������� ������
    timeOpr[i] := timeOpr[i] + Round(timeOdinSch * countSchetchikov);
    //���� � ������ ������������ ������������
    if Length(Form1.massivOprosa[i, 0]) = 2 then
      //����� �� ����� �������������
      timeOpr[i] := timeOpr[i] + 30 + Round(FormOptions.sSpinEdit3.Value / 2);
    //���������� ������� �� ������������� �������������
    timeOpr[i] := timeOpr[i] + 20;
    //***************************************************

    UpdateLog('������������, ������������� �� ������: ' + Form1.massivOprosa[i,
      0, 0, 1] + ', ���������������� �� ������', colorOk);
    SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(0))));
    DecodeTime(Time, hour, min, sec, msec);
    nachOprosa := (3600 * hour + 60 * min + sec) - nachOprosa;
    Synchronize(StopTimer);
    UpdateLog('����� ������ � ��������������: ' + (IntToStr(nachOprosa div 60)) +
      ':' + FormatFloat('00', nachOprosa mod 60), colorOk);
    UpdateLog(' ', colorOk);
    Razriv; //������ ����� � ��������������
    labelkonec:
    if (not flagGPRS) then
    begin
      if BComPort <> nil then
      begin
        BComPort.Close;
        BComPort.Free;
      end;
    end;
    Synchronize(incGauge1); //���������� �� ���� ������� ������ ���������
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
  //������� ��� �������� ������ � ���. � ����� ��������� �����������
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
  //   Form1.massivOprosa - ������������ ������
  //   x - ����� ������������� �������
  //   y - � ����������� �� ���������� �������� (�� 1 �� 15)
  //   z - � ����������� �� ���������� ��������� � ������� (������� � 1)
  //   Form1.massivOprosa[x, 0, 0, 1] - ����� ������������� �������
  //   Form1.massivOprosa[x, 0, 0, 2] - ����� SIM ����� �������������
  //   Form1.massivOprosa[x, 0, 0, 3] - ������ �������������
  //   Form1.massivOprosa[x, 0, 0, 4] - ������ ���������
  //   Form1.massivOprosa[x, 0, 0, 5] - ����� �������������
  //
  //   Form1.massivOprosa[x, y, 0, 0] - �������� �������
  //
  //   Form1.massivOprosa[x, y, z, 0] - ����� ��������
  //   Form1.massivOprosa[x, y, z, 1] - ������� ����������� ��������
  //
  //******************************************
  //  0 - 0 - 0 - 0     - �����
  //   |       |- 1     - ����� ������������� �������
  //   |       |- 2     - ����� SIM ����� �������������
  //   |       |- 3     - ������ �������������
  //   |       |- 4     - ������ ���������
  //   |       |- 5     - ����� �������������
  //   |       |- 6     - ���������� ��������� � ������
  //   |
  //   |- 1 - 0 - 0     - �������� �������
  //   |   |
  //   |   |- 1 - 0     - ����� ��������
  //   |   |   |- 1     - ������� �����������
  //   |   ........
  //   |   |- n - 0
  //   |       |- 1
  //   ............
  //   |- m - 0 - 0
  //       |
  //       |- 1 - 0     - ����� ��������
  //       |   |- 1     - ������� �����������
  //       ........
  //       |- n - 0
  //           |- 1

  BComPort := TComPort.Create(nil);
  //��������� ���������� ����� � ��� ��������
  if not NastrPort(flagSchitivatel) then
    goto labelkonec;
  BComPort.BeginUpdate;
  BComPort.Timeouts.ReadInterval := -1;
  BComPort.Timeouts.ReadTotalConstant := 500;
  BComPort.Timeouts.ReadTotalMultiplier := -1;
  BComPort.EndUpdate;
  SetLength(timeOpr, Length(Form1.massivOprosa));

  UpdateLog('���������������� ����������� �� ������', colorOk);
  //----------------------------------------------
  //  ������ ������� � ����
  //---------------------------------------------
  SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR('0')));
  schetchikByte := 0;
  SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
    Lparam(LPCTSTR(IntToStr(schetchikByte))));
  Inc(schetchikByte);
  bufPer := Shapka(true, PChar(Form1.massivOprosa[0, 0, 0, 5]),
    PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0, 3]),
    PChar('F0000')); //����������� ������ ���������� �������
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
    WriteLog('��. ');
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
  UpdateLog('    �������� ���� � �����', colorRab);
  //****************************************************************

  nomVarTar := nil;
  SetLength(nomVarTar, 10);
  for k := 0 to 9 do
    nomVarTar[k] := false;
  countRaz := 0;

  for i := 0 to Length(Form1.massivOprosa) - 1 do
  begin
    //------------------------------------------------------
    //****************���������������� �������������*****************
    //------------------------------------------------------
    {
          if Length(Form1.massivOprosa[i, 0]) = 2 then
            begin
               case FormOptions.sRadioGroup2.ItemIndex of
                //����� �������� ������ ���� ���-104 � ����������� �� ��������
                0: bufper := FormirBufFor_TEM_104(PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]), StrToInt(Form1.massivOprosa[i, 0, 1, 0][9]), FormOptions.sSpinEdit3.Value, $00000000);
                1: bufper := FormirBufFor_TEM_104(PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]), StrToInt(Form1.massivOprosa[i, 0, 1, 0][9]), FormOptions.sSpinEdit3.Value, $00060000);
                2: bufper := FormirBufFor_TEM_104(PChar(Form1.massivOprosa[i, 0, 0, 5]), PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0, 3]), StrToInt(Form1.massivOprosa[i, 0, 1, 0][9]), FormOptions.sSpinEdit3.Value, $00078000);
              end;
              for k := 0 to (Length(bufper)-1) div 51  do
                begin
                  BComPort.ClearBuffer(true, true);
                  WriteLog('��. ');
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
              UpdateLog('    ������������ ���������������� �� ������ ���-104', colorRab);
            end;
    }

    for j := 1 to Length(Form1.massivOprosa[i]) - 1 do
    begin
      //-----------------------------------------------
      //| ������ � ���������� �������� �������
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
        WriteLog('��. ');
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
      //|       ������ ������� ���������
      //-----------------------------------------------
      configPerNomSch := nil;
      SetLength(configPerNomSch, 12);
      SetLength(configPerNomSch[0], 2);
      configPerNomSch[0, 1] :=
        PChar(ReverseString(Trim(Copy(ReverseString(Form1.massivOprosa[i, j, 0,
        0]), 1, 2))));
      configPerNomSch[0, 0] := PChar(IntToStr(j)); //����� ������ ��� ��������
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
          WriteLog('��. ');
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
          WriteLog('��. ');
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
      UpdateLog('    ���������������� �� ������ ' + Form1.massivOprosa[i, j, 0,
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
    WriteLog('��. ');
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
  //    �������� ������� ������ �� ��������� �����������
  //-----------------------------------------------------
  for k := 1 to 10 do //���������� ��� �������� �����������
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
          WriteLog('��. ');
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
          WriteLog('��. ');
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
  //    ������� ����� ��������
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
    WriteLog('��. ');
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
    WriteLog('��. ');
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
    WriteLog('��. ');
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
    WriteLog('��. ');
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

  UpdateLog('����������� ���������������� �� ������', colorOk);
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
      '�� ������� ���������� ���������� � �������������� �� ������ ' + adr,
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
  //������ ��� �������� ������ � ���. � ����� ��������� �����������
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
    //���� ������ ��� �������� ������ �� ���� �����
    if Length(bufWrite) <= 29 then
    begin
      SetLength(bufper, length(bufper) + 4 + length(bufWrite));
      bufper[16] := length(bufWrite) + 3; //���������� ����������� ����
      bufper[17] := CRC(bufper, 0, 16);
      bufper[18] := adrParams and $FF;
      ; //�����
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
      bufper[16] := 32; //���������� ����������� ����
      bufper[17] := CRC(bufper, 0, 16);
      bufper[18] := adrParams and $FF;
      ; //�����
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
        //���� ������� ����� �� ������
        if (Length(bufWrite) - temp_endByte) < 32 then
        begin
          SetLength(bufper, length(bufper) + (Length(bufWrite) - temp_endByte) +
            1);
          bufper[16] := Length(bufWrite) - temp_endByte;
          //���������� ����������� ����
          bufper[17] := CRC(bufper, 0, 16);
          for m := 18 to (bufper[16] + 18 - 1) do
          begin
            bufper[m] := bufWrite[temp_endByte];
            Inc(temp_endByte);
          end;
          bufper[High(bufper)] := CRC(bufper, 0, High(bufper) - 1);
        end
          // ���� ����� ������
        else
        begin
          SetLength(bufper, 51);
          bufper[16] := 32; //���������� ������������ ����
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
    //���� ������ ��� �������� ������ �� ���� �����
    if Length(bufWrite) <= 32 then
    begin
      SetLength(bufper, length(bufper) + 1 + length(bufWrite));
      bufper[16] := length(bufWrite); //���������� ����������� ����
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
      bufper[16] := 32; //���������� ����������� ����
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
        //���� ������� ����� �� ������
        if (Length(bufWrite) - temp_endByte) < 32 then
        begin
          SetLength(bufper, length(bufper) + (Length(bufWrite) - temp_endByte) +
            1);
          bufper[16] := Length(bufWrite) - temp_endByte;
          //���������� ����������� ����
          bufper[17] := CRC(bufper, 0, 16);
          for m := 18 to (bufper[16] + 18 - 1) do
          begin
            bufper[m] := bufWrite[temp_endByte];
            Inc(temp_endByte);
          end;
          bufper[High(bufper)] := CRC(bufper, 0, High(bufper) - 1);
        end
          // ���� ����� ������
        else
        begin
          SetLength(bufper, 51);
          bufper[16] := 32; //���������� ������������ ����
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
  //   Form1.massivOprosa - ������������ ������
  //   x - ����� ������������� �������
  //   y - � ����������� �� ���������� �������� (�� 1 �� 15)
  //   z - � ����������� �� ���������� ��������� � ������� (������� � 1)
  //   Form1.massivOprosa[x, 0, 0, 1] - ����� ������������� �������
  //   Form1.massivOprosa[x, 0, 0, 2] - ����� SIM ����� �������������
  //   Form1.massivOprosa[x, 0, 0, 3] - ������ �������������
  //   Form1.massivOprosa[x, 0, 0, 4] - ������ ���������
  //   Form1.massivOprosa[x, 0, 0, 5] - ����� �������������
  //
  //   Form1.massivOprosa[x, y, 0, 0] - �������� �������
  //
  //   Form1.massivOprosa[x, y, z, 0] - ����� ��������
  //   Form1.massivOprosa[x, y, z, 1] - ������� ����������� ��������
  //
  //******************************************
  //  0 - 0 - 0 - 0     - �����
  //   |   |   |- 1     - ����� ������������� �������
  //   |   |   |- 2     - ����� SIM ����� �������������
  //   |   |   |- 3     - ������ �������������
  //   |   |   |- 4     - ������ ���������
  //   |   |   |- 5     - ����� �������������
  //   |   |   |- 6     - ���������� ��������� � ������
  //   |   |
  //   |   |- 1 - 0     - ����� ������������� ���-104
  //   |       |- 1     - ����� ������ �� ������� ���������� ������������
  //   |
  //   |- 1 - 0 - 0     - �������� �������
  //   |   |
  //   |   |- 1 - 0     - ����� ��������
  //   |   |   |- 1     - ������� �����������
  //   |   ........
  //   |   |- n - 0
  //   |       |- 1
  //   ............
  //   |- m - 0 - 0
  //       |
  //       |- 1 - 0     - ����� ��������
  //       |   |- 1     - ������� �����������
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
      //��������� ���������� ����� � ��� ��������
      if not NastrPort(flagSchitivatel) then
        goto labelkonec;

      if flagModem then
      begin
        if not IniModem then //���� ����� ���������� �� ����� �� ���������
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
    //------��������� ��������� ����������-----
    timeOpr[i] := 0; //��������� ���������� ������� ������  ���������
    nomVarTar := nil;
    SetLength(nomVarTar, 10);
    povtorDozvona := 0;
    for k := 0 to 9 do
      nomVarTar[k] := false;
    //------------------------------------------
    if flagGPRS then
    begin
      UpdateLog('���������� � �������������� �� IP ' + Form1.massivOprosa[i, 0,
        0, 10] + '. �����: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
      if not Dozvon(Form1.massivOprosa[i, 0, 0, 10]) then
      begin
        UpdateLog('���������� ���������� ���������� � �������������� �� ������ '
          + Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(' ', colorOk);
        UpdateLog(Form1.sRichEdit2.Handle,
          '�� ������� ���������� ���������� � �������������� �� ������ ' +
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
        UpdateLog('������ �� ������������� �� ������ ' + Form1.massivOprosa[i, 0,
          0, 2] + '. �����: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
        if not Dozvon(Form1.massivOprosa[i, 0, 0, 2]) then
        begin
          UpdateLog('���������� ���������� ���������� � �������������� �� ������ '
            + Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(' ', colorOk);
          UpdateLog(Form1.sRichEdit2.Handle,
            '�� ������� ���������� ���������� � �������������� �� ������ ' +
            Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
          goto labelkonec;
        end;
      end;
    end;

    UpdateLog('���������������� ������������� �� ������', colorOk);

    Synchronize(PuskTimer);
    DecodeTime(Time, hour, min, sec, msec);
    nachOprosa := 3600 * hour + 60 * min + sec;

    SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0, Lparam(LPCTSTR('0')));
    schetchikByte := 0;
    SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(schetchikByte))));
    Inc(schetchikByte);
    //----------------------------------------------
    //  ������ ������� � ����
    //---------------------------------------------
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]),
      PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
      3]), PChar('F0000')); //����������� ������ ���������� �������
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
    UpdateLog('    �������� ���� � �����', colorRab);
    //**********************************************

    //----------------------------------------------
    //  ������ apn
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
        UpdateLog('    �������� ������ ������������� ��� GPRS', colorRab)
      else
        goto labelkonec;
    end;

    //***************************

    //-----------------------------------------------
    //| ������ ���������� �� ���� ������������ �������
    //-----------------------------------------------
    adr_write_params := $3000;
    for k := 1 to 10 do //���������� ��� �������� �����������
      if EnableVarTar[i].var_tar[k] = true then
      begin
        if WriteParams(i, $0540, KonfigWrite[k].konfig, k) then
        begin
          UpdateLog('    �������� ������������ �������� ����������� ' +
            IntToStr(k), colorRab);
          adr_write_params := adr_write_params + 32;
        end
        else
          goto labelkonec;

        // ������ ���������� ���
        if WriteParams(i, $0560, KonfigWrite[k].zone, k) then
        begin
          UpdateLog('    �������� ���� �������� ����������� ' + IntToStr(k),
            colorRab);
          adr_write_params := adr_write_params + 32;
        end
        else
          goto labelkonec;

        // ������ ����������� ������ 1
        if Length(KonfigWrite[k].sezon1) <> 0 then
        begin
          if WriteParams(i, $0000, KonfigWrite[k].sezon1, k) then
          begin
            UpdateLog('    �������� ����������� ������ 1 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ������ ����������� ������ 2
        if Length(KonfigWrite[k].sezon2) <> 0 then
        begin
          if WriteParams(i, $0064, KonfigWrite[k].sezon2, k) then
          begin
            UpdateLog('    �������� ����������� ������ 2 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ������ ����������� ������ 3
        if Length(KonfigWrite[k].sezon3) <> 0 then
        begin
          if WriteParams(i, $00C8, KonfigWrite[k].sezon3, k) then
          begin
            UpdateLog('    �������� ����������� ������ 3 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ������ ����������� ������ 4
        if Length(KonfigWrite[k].sezon4) <> 0 then
        begin
          if WriteParams(i, $012C, KonfigWrite[k].sezon4, k) then
          begin
            UpdateLog('    �������� ����������� ������ 4 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ������ ����������� ������ 5
        if Length(KonfigWrite[k].sezon5) <> 0 then
        begin
          if WriteParams(i, $0190, KonfigWrite[k].sezon5, k) then
          begin
            UpdateLog('    �������� ����������� ������ 2 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ������ ����������� ������ 6
        if Length(KonfigWrite[k].sezon6) <> 0 then
        begin
          if WriteParams(i, $01F4, KonfigWrite[k].sezon6, k) then
          begin
            UpdateLog('    �������� ����������� ������ 6 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ������ ����������� ������ 7
        if Length(KonfigWrite[k].sezon7) <> 0 then
        begin
          if WriteParams(i, $0258, KonfigWrite[k].sezon7, k) then
          begin
            UpdateLog('    �������� ����������� ������ 7 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ������ ����������� ������ 8
        if Length(KonfigWrite[k].sezon8) <> 0 then
        begin
          if WriteParams(i, $02BC, KonfigWrite[k].sezon8, k) then
          begin
            UpdateLog('    �������� ����������� ������ 8 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ������ ����������� ������ 9
        if Length(KonfigWrite[k].sezon9) <> 0 then
        begin
          if WriteParams(i, $0320, KonfigWrite[k].sezon9, k) then
          begin
            UpdateLog('    �������� ����������� ������ 9 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ������ ����������� ������ 10
        if Length(KonfigWrite[k].sezon10) <> 0 then
        begin
          if WriteParams(i, $0384, KonfigWrite[k].sezon10, k) then
          begin
            UpdateLog('    �������� ����������� ������ 10 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ������ ����������� ������ 11
        if Length(KonfigWrite[k].sezon11) <> 0 then
        begin
          if WriteParams(i, $03E8, KonfigWrite[k].sezon11, k) then
          begin
            UpdateLog('    �������� ����������� ������ 11 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;
        // ������ ����������� ������ 12
        if Length(KonfigWrite[k].sezon12) <> 0 then
        begin
          if WriteParams(i, $044C, KonfigWrite[k].sezon12, k) then
          begin
            UpdateLog('    �������� ����������� ������ 12 �������� ����������� '
              + IntToStr(k), colorRab);
            adr_write_params := adr_write_params + 32;
          end
          else
            goto labelkonec;
        end;

        //������ ������������� ���
        if Length(KonfigWrite[k].fixdate) <> 0 then
        begin
          if WriteParams(i, $04C0, KonfigWrite[k].fixdate, k) then
          begin
            UpdateLog('    �������� ������������ ���� �������� ����������� ' +
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
      //| ������ � ���������� �������� �������
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
      //|       ������ ������� ���������
      //-----------------------------------------------
      configPerNomSch := nil;
      SetLength(configPerNomSch, 12);
      SetLength(configPerNomSch[0], 2);
      configPerNomSch[0, 1] :=
        PChar(ReverseString(Trim(Copy(ReverseString(Form1.massivOprosa[i, j, 0,
        0]), 1, 2))));
      configPerNomSch[0, 0] := PChar(IntToStr(j)); //����� ������ ��� ��������
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
      UpdateLog('    ���������������� �� ������ ' + Form1.massivOprosa[i, j, 0,
        0], colorRab);

      //*************************************************
    end;

    if not flagGPRS then
      BComPort.ClearBuffer(true, true);
    bufPer := Shapka(true, PChar(Form1.massivOprosa[i, 0, 0, 5]),
      PChar(Form1.massivOprosa[i, 0, 0, 3]), PChar(Form1.massivOprosa[i, 0, 0,
      3]), PChar(IntToStr(Length(Form1.massivOprosa[i]) - 1)));
    //����������� ������ ���������� �������
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
    //    �������� ������� ������ �� ��������� �����������
    //-----------------------------------------------------
    for k := 1 to 10 do //���������� ��� �������� �����������
      if nomVarTar[k - 1] = true then
      begin
        SetLength(tempBuf, 10 + length(adrWrite[k]) * 3);
        tempBuf2 := NumStrToBCD(PChar(Form1.massivOprosa[i, 0, 0, 4]));
        nomerByte := 0;
        for j := 2 downto 0 do
        begin
          tempBuf[nomerByte] := tempBuf2[j]; //������ �� �������� �����������
          Inc(nomerByte);
        end;
        tempBuf[nomerByte] := tempBuf[nomerByte - 3] + tempBuf[nomerByte - 2] +
          tempBuf[nomerByte - 1];
        Inc(nomerByte);

        tempBuf2 := NumStrToBCD(PChar(Form1.massivOprosa[i, 0, 0, 8]));
        for j := 2 downto 0 do
        begin
          tempBuf[nomerByte] := tempBuf2[j]; //������ �� �������� �����
          Inc(nomerByte);
        end;
        tempBuf[nomerByte] := tempBuf[nomerByte - 3] + tempBuf[nomerByte - 2] +
          tempBuf[nomerByte - 1];
        Inc(nomerByte);

        tempBuf[nomerByte] := Length(Form1.massivOprosa[i]) - 1;
        //���������� ��������
        Inc(nomerByte);
        tempBuf[nomerByte] := length(adrWrite[k]);
        //���������� ���������� ������/������
        Inc(nomerByte);

        for j := 0 to Length(adrWrite[k]) - 1 do
        begin
          tempBuf[nomerByte] := adrWrite[k][j] and $FF; //������� ���� ������
          Inc(nomerByte);
          tempBuf[nomerByte] := (adrWrite[k][j] shr 8) and $FF;
          //������� ���� ������
          Inc(nomerByte);
          tempBuf[nomerByte] := 3; //���������� ���� ���������
          Inc(nomerByte);
        end;

        if not (WritePass(i, AdrWriteVarTar[k], tempBuf, k)) then
          goto labelkonec;
      end;
    //***************************************************

    //------------------------------------------------------
    //    ������� ����� ��������
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
    //    ����������� ������� ������������ ��� ������ ���������
    //    � ���������� ���������
    //----------------------------------------------
    countSchetchikov := 0;
    DecodeTime(Time, hour, min, sec, msec);
    timeOpr[i] := hour * 3600 + min * 60 + sec; //������ ������� ������
    for j := 1 to Length(Form1.massivOprosa[i]) - 1 do
      for k := 1 to Length(Form1.massivOprosa[i, j]) - 1 do
        Inc(countSchetchikov); //������ ������� (���������� ������)
    SendMessage(Form1.sEdit12.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(countSchetchikov))));
    //����� ������ ������ �������� �� ���������� ������
    timeOpr[i] := timeOpr[i] + Round(timeOdinSch * countSchetchikov);
    //���������� ������� �� ������������� �������������
    timeOpr[i] := timeOpr[i] + 20;
    //���� ������ ����� ����� apn, ���� ������������ ������ 30���
    if flagSetGPRSApn then
      timeOpr[i] := timeOpr[i] + 30;

    //***************************************************

    UpdateLog('������������, ������������� �� ������: ' + Form1.massivOprosa[i,
      0, 0, 1] + ', ���������������� �� ������', colorOk);
    SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
      Lparam(LPCTSTR(IntToStr(0))));
    DecodeTime(Time, hour, min, sec, msec);
    nachOprosa := (3600 * hour + 60 * min + sec) - nachOprosa;
    Synchronize(StopTimer);
    UpdateLog('����� ������ � ��������������: ' + (IntToStr(nachOprosa div 60)) +
      ':' + FormatFloat('00', nachOprosa mod 60), colorOk);
    UpdateLog(' ', colorOk);
    Razriv; //������ ����� � ��������������
    labelkonec:
    if (not flagGPRS) then
    begin
      if BComPort <> nil then
      begin
        BComPort.Close;
        BComPort.Free;
      end;
    end;
    Synchronize(incGauge1); //���������� �� ���� ������� ������ ���������
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
    //------- �������� ��������� ������. ��� ������������� ��������
    if timeOpr[i] <> 0 then
    begin
      DecodeTime(Time, hour, min, sec, msec);
      tekTime := hour * 3600 + min * 60 + sec;
      if tekTime < timeOpr[i] then
        WaitUpdateProgresBar((timeOpr[i] - tekTime));
      //�������� ������ �������������
    end
    else
      goto labelKonec;

    if not flagGPRS then
    begin
      BComPort := TComPort.Create(nil);
      //��������� ���������� ����� � ��� ��������
      if not NastrPort(flagSchitivatel) then
        goto labelkonec;

      if flagModem then
      begin
        if not IniModem then //���� ����� ���������� �� ����� �� ���������
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
    //���� ���������� ������������� �������� ������������ ������������� ������
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
      UpdateLog('���������� � �������������� �� IP ' + Form1.massivOprosa[i, 0,
        0, 10] + '. �����: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
      if not Dozvon(Form1.massivOprosa[i, 0, 0, 10]) then
      begin
        UpdateLog('���������� ���������� ���������� � �������������� �� ������ '
          + Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(' ', colorOk);
        UpdateLog(Form1.sRichEdit2.Handle,
          '�� ������� ���������� ���������� � �������������� �� ������ ' +
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
        UpdateLog('������ �� ������������� �� ������ ' + Form1.massivOprosa[i, 0,
          0, 2] + '. �����: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
        if not Dozvon(Form1.massivOprosa[i, 0, 0, 2]) then
        begin
          UpdateLog('���������� ���������� ���������� � �������������� �� ������ '
            + Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(' ', colorOk);
          UpdateLog(Form1.sRichEdit2.Handle,
            '�� ������� ���������� ���������� � �������������� �� ������ ' +
            Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
          goto labelkonec;
        end;
      end;
    end;

    UpdateLog('�������� ������', colorOk);
    begin
      Synchronize(PuskTimer);
      DecodeTime(Time, hour, min, sec, msec);
      nachOprosa := hour * 3600 + min * 60 + sec;
      //---------------------------------------------------------
      //          ������ ������ � �������������
      //---------------------------------------------------------
                //������� ��������� ����������
      if adresPovtor <> '' then
        adres := adresPovtor
      else
        adres := '0000';
      SetLength(bufPriema, 3); //��� �������� ����� ������ � ������ ������
      bufPriema[0] := 0; //0
      //*****************************

      repeat
        //������������ ������������ �������
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
          BComPort.ClearBuffer(true, true); //������� �������
          WriteBufInPort(bufper); //������� �������

          if (not WaitComData(4000)) then //�������� ����������� ������ � ����
          begin
            if k > 3 then
            begin
              PovtorDozvona; //������ ���� ��� ���������� �������
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
        //����� ������
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
              Break //����� �� ����� ������
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
              Break //����� �� ����� ������
            end;
            SetLength(bufPriema, Length(bufPriema) + 1);
            Inc(prinByte);
            Inc(k);
            SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
              Lparam(LPCTSTR(IntToStr(prinByte))));
          until (BComPort.Read(@bufPriema[k], 1) = 0) or (k > 30000);
        end;
        //���� �� ������ �����

        if bufPriema = nil then
        begin
          Inc(error);
          if error > 3 then
            //���� ����������� ������� ������ ������ ������ ��������� 10 �� ������ �������
          begin
            if countPovtDozv > 1 then
            begin
              UpdateLog('������������ �� ��������', colorError);
              goto labelKonec;
            end;
            Inc(countPovtDozv);
            PovtorDozvona; //������ ���� ��� ���������� �������
            adresPovtor := adres;
            goto nachalo;
          end;
          goto povtor; //���� ������ �������� ������ �������
        end;

        //������ � ���
        if log then
        begin
          Write(logFile, '��. ');
          for k := 0 to Length(bufPriema) - 1 do
            Write(logFile, IntToStr(bufPriema[k]) + ', ');
          Writeln(logFile, '');
        end;
        //*********************

        //���������� ����� ������ ������
        if (bufPriema[1] = 255) and (bufPriema[2] = 255) and (bufPriema[3] = 255) then
          break;
        //****************************

        //�������� ������������ �������� ������
        if not ((bufPriema[Length(bufPriema) - 6] = 90) and
          (bufPriema[Length(bufPriema) - 7] = 165)) then
        begin
          Inc(error);
          if error > 10 then
            //���� ����������� ������� ������ ������ ������ ��������� 10 �� ������ �������
          begin
            if countPovtDozv > 1 then
            begin
              UpdateLog('������������ �� ��������', colorError);
              goto labelKonec;
            end;
            Inc(countPovtDozv);
            PovtorDozvona; //������ ���� ��� ���������� �������
            adresPovtor := adres;
            goto nachalo;
          end;
          Sleep(1000);
          goto povtor; //���� ������ �������� ������ �������
        end;
        //*******************************

        //����������� ������ ��������
        tempbuf := nil;
        tempbuf := BCDToNumStr(Copy(bufPriema, 0, 3));
        nomerSchetcika := '';
        for j := 0 to 5 do
          nomerSchetcika := nomerSchetcika + Chr(tempbuf[j]);
        //****************************

        if bufPriema[12] = 0 then //���� ������ ��� ������ ���
        begin
          UpdateLog('    ������� ' + nomerSchetcika + ' �������', colorRab);
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
                    UpdateLog('    ������������ �������� ��������� �� ������ ������:', colorError);
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
            UpdateLog('    ������� ' + nomerSchetcika + DetectError(bufPriema) +
              ' ' + '(��. ' + kv + ')', colorError);
            NeschCounter.Add('    ������� ' + nomerSchetcika +
              DetectError(bufPriema) + ' ' + '(��. ' + kv + ')');
          end
          else
          begin
            UpdateLog('    ������� ' + nomerSchetcika + ' �� ������� (��. ' + kv
              + ')', colorError);
            NeschCounter.Add('    ������� ' + nomerSchetcika +
              ' �� ������� (��. ' + kv + ')');
          end;
          Inc(neschitano);
          UpdateTmpHashr(nomerSchetcika, '0');
          SendMessage(Form1.sEdit10.Handle, WM_SETTEXT, 0,
            Lparam(LPCSTR(IntToStr(neschitano))));
        end;
        Synchronize(UpdateProgress); //��������� ��������� ����������
        adres := IntToHex(bufPriema[Length(bufPriema) - 4], 2) +
        IntToHex(bufPriema[Length(bufPriema) - 5], 2);
      until (false);

      DecodeTime(Time, hour, min, sec, msec);
      nachOprosa := (hour * 3600 + min * 60 + sec) - nachOprosa;
      Synchronize(StopTimer);
      //****************����� � ������*********
      UpdateLog(Form1.sRichEdit2.Handle, '������ ������ ���� �� ������: ',
        colorRab);
      UpdateLog(Form1.sRichEdit2.Handle, Form1.massivOprosa[i, 0, 0, 1],
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  ----------------------------',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | �������� ���������: ' +
        IntToStr(schitano), colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | �� �������� ���������: ' +
        IntToStr(neschitano), colorOk);
      for j := 1 to NeschCounter.Count do
        UpdateLog(Form1.sRichEdit2.Handle, '   - ' + NeschCounter.Strings[j -
          1], colorError);
      UpdateLog(Form1.sRichEdit2.Handle, '  | ����� ������ � ��������������: ' +
        IntToStr(nachOprosa div 60) + ':' + FormatFloat('00', nachOprosa mod 60),
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | ������ �������� ������: ' +
        IntToStr(StrToInt(Form1.sEdit13.Text)) + ' ���� (' +
        FloatToStrF(StrToInt(Form1.sEdit13.Text) / 1024, ffFixed, 7, 2) + ' kb)',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  ----------------------------',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
      //---------------------------------------
      UpdateLog('������ ������ ��������� ���������� �� ������: ' +
        Form1.massivOprosa[i, 0, 0, 1] + ' ���������.', colorOk);
      UpdateLog('  ---------------------------', colorOk);
      UpdateLog('  | �������� ���������: ' +
        IntToStr(StrToInt(Form1.sEdit9.Text)), colorOk);
      UpdateLog('  | �� �������� ���������: ' +
        IntToStr(StrToInt(Form1.sEdit10.Text)), colorOk);
      UpdateLog('  ---------------------------', colorOk);
      UpdateLog('����� ������ � ��������������: ' + IntToStr(nachOprosa div 60) +
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
    Synchronize(incGauge1); //���������� �� ���� �������
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
  WriteLog('��. ');
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
          // �������� ����������� ����� ��������� ������
          if CRC(bufPriema, 0, 16) <> bufPriema[17] then
          begin
            Result := false;
            UpdateLog('������ ����������� ����� ������', colorError);
            UpdateLog(' ', colorError);
            Continue;
          end;

          // �������� �� ����������� ������
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
          UpdateLog('��� ������ �� �������������', colorError);
          UpdateLog(' ', colorError);
          Continue;
        end;
      end;
      if i = 3 then
      begin
        Result := false;
        UpdateLog('�� ������� ����������������� ������������', colorError);
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
      UpdateLog('�� ������� ����������������� ������������', colorError);
      UpdateLog(' ', colorError);
      exit
    end;

    for k := 0 to (Length(bufer) - 1) div 51 do
    begin
      error := 0;
      for i := 0 to 10 do
      begin

        //��������, ���� �� ������ ������� ������
        if i <> 0 then
          Sleep(500);

        //���� ����� ������� ������ �� ������ �������
        if (i = 5) then
        begin
          UpdateLog(' ������ ��� ��������', colorError);
          if flagModem then
          begin
            UpdateLog(' ����������� ��������� ������', colorOk);

            if (not Dozvon(Form1.massivOprosa[nomAddr, 0, 0, 2])) then
            begin
              Result := false;
              UpdateLog('������ ��� ��������� �������', colorError);
              UpdateLog(' ', colorError);
              Exit;
            end;
          end;
          Inc(errorDozv);
          goto nach;
        end;

        //������� ������ � ������ ������ � ����
        BComPort.ClearBuffer(true, true);
        WriteLog('��. ');
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

        //��������� ����� ������ ������
        bufPriema := nil;
        SetLength(bufPriema, 18);
        WriteLog('��. ');

        WaitComData(2000); //�������� ����������� ������
        //������ ������
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
            if n > 17 then //���� ������� ��� 18 ���� - ����� �� ������
              Break;
          end;
        except
          WriteLog('error_read_0 ')
        end;

        WritelnLog('.');

        // �������� ���������� �������� ���� � ���������� ����� � ������
        if (n <> 18) or (countReadNull = 18) then
          Continue;
        // �������� ����������� ����� ��������� ������
        if CRC(bufPriema, 0, 16) <> bufPriema[17] then
          Continue;
        // �������� �� ����������� ������
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
          Continue; //�������� 07.08.2011
          //Exit;
        end;
      end;
    end;
  end;

  Result := true;
end;

procedure TDeviceThread.WritelnLog(str: string); //��������� ������ � ��� ����
begin
  if log then
    Writeln(logFile, str);
end;

procedure TDeviceThread.WriteLog(str: string); //��������� ������ � ��� ����
begin
  if log then
    Write(logFile, str);
end;

function TDeviceThread.SaveDataSoSchet(response: TBytes; incAddresmain: Integer): Boolean;
begin
  try
    SaveDataInBase(response, Dbs, incAddresmain);
    {SaveData := TSaveDataSoSchetchikov.Create(true);   //�������� ������ ����������� ������ �� ��������� � ����
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
  //��������� ���������� ����� � ��� ��������
  if not NastrPort(flagSchitivatel) then
    goto labelkonec;

  BComPort.BeginUpdate;
  BComPort.Timeouts.ReadInterval := -1;
  BComPort.Timeouts.ReadTotalConstant := 30;
  BComPort.Timeouts.ReadTotalMultiplier := -1;
  BComPort.EndUpdate;

  //---------------------------------------------------------
  //          ������ ������ �� �����������
  //---------------------------------------------------------
            //������� ��������� ����������
  UpdateLog('������ ������ ���������� �� �����������', colorOk);
  adres := '0000';
  SetLength(bufPriema, 3); //��� �������� ����� ������ � ������ ������
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
    //������������ ������������ �������
    bufper := Shapka(false, PChar(Form1.massivOprosa[0, 0, 0, 5]),
      PChar(Form1.massivOprosa[0, 0, 0, 3]), PChar(Form1.massivOprosa[0, 0, 0,
      3]), PChar(adres));
    bufper[16] := bufPriema[Length(bufPriema) - 3];
    bufper[17] := CRC(bufper, 0, 16);
    //*********************************

    povtor:
    BComPort.ClearBuffer(true, true); //������� �������
    WriteBufInPort(bufper); //������� �������
    WaitComData(10000); //�������� ����������� ������ � ����
    bufPriema := nil;

    //����� ������
    k := -1;
    repeat
      SetLength(bufPriema, Length(bufPriema) + 1);
      Inc(k);
      SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
        Lparam(LPCTSTR(IntToStr(k))));
    until (BComPort.Read(@bufPriema[k], 1) = 0);
    //���� �� ������ �����

    //������ � ���
    Write(logFile, '��. ');
    for k := 0 to Length(bufPriema) - 1 do
      Write(logFile, IntToStr(bufPriema[k]) + ', ');
    Writeln(logFile, '');
    //*********************

    //���������� ����� ������ ������
    if (bufPriema[1] = 255) and (bufPriema[2] = 255) and (bufPriema[3] = 255) then
      break;
    //****************************

    //�������� ������������ �������� ������
    if not ((bufPriema[13] = 170) and (bufPriema[Length(bufPriema) - 6] = 90)
      and (bufPriema[Length(bufPriema) - 7] = 165)) or ((bufPriema[0] = 0) and
      (bufPriema[1] = 0) and (bufPriema[2] = 0)) then
    begin
      Sleep(100);
      goto povtor; //���� ������ �������� ������ �������
    end;
    //*******************************

    //����������� ������ ��������
    tempbuf := nil;
    tempbuf := BCDToNumStr(Copy(bufPriema, 0, 3));
    nomerSchetcika := '';
    for j := 0 to 5 do
      nomerSchetcika := nomerSchetcika + Chr(tempbuf[j]);
    //****************************

    if bufPriema[12] = 0 then //���� ������ ��� ���������� ���
    begin
      UpdateLog('    ������� ' + nomerSchetcika + ' ������', colorRab);
      Inc(schitano);
      SendMessage(Form1.sEdit9.Handle, WM_SETTEXT, 0,
        Lparam(LPCSTR(IntToStr(schitano))));
      UpdateTmpHashr(nomerSchetcika, '1');
      SaveDataSoSchet(bufPriema, 0);
    end
    else
    begin
      UpdateLog('    ������� ' + nomerSchetcika + DetectError(bufPriema),
        colorError);
      Inc(neschitano);
      UpdateTmpHashr(nomerSchetcika, '0');
      SendMessage(Form1.sEdit10.Handle, WM_SETTEXT, 0,
        Lparam(LPCSTR(IntToStr(neschitano))));
    end;
    adres := IntToHex(bufPriema[Length(bufPriema) - 4], 2) +
    IntToHex(bufPriema[Length(bufPriema) - 5], 2);
  until (false);
  UpdateLog('���������� ���������� ���������.', colorOk);

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
      //�������� �� ������������� ������
      if (Form1.massivOprosa[i, 0, 0, 13] = '2') then
      begin
        Continue;
      end;
    end;
    if Form1.massivOprosa[i, 0, 0, 12] = 'GPRS' then
      flagGPRS := True
    else
      flagGPRS := False;
    //------- �������� ��������� ������. ��� ������������� ��������
    if not flagTolkoChtenie then
      if timeOpr[i] <> 0 then
      begin
        DecodeTime(Time, hour, min, sec, msec);
        tekTime := hour * 3600 + min * 60 + sec;
        if tekTime < timeOpr[i] then
          WaitUpdateProgresBar((timeOpr[i] - tekTime));
        //�������� ������ �������������
      end
      else
        goto labelKonec;

    if not flagGPRS then
    begin
      BComPort := TComPort.Create(nil);
      //��������� ���������� ����� � ��� ��������
      if not NastrPort(flagSchitivatel) then
        goto labelkonec;

      if flagModem then
      begin
        if not IniModem then //���� ����� ���������� �� ����� �� ���������
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
    //���� ���������� ������������� �������� ������������ ������������� ������
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
      UpdateLog('���������� � �������������� �� IP ' + Form1.massivOprosa[i, 0, 0, 10] + '. �����: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
      if not Dozvon(Form1.massivOprosa[i, 0, 0, 10]) then
      begin
        UpdateLog('���������� ���������� ���������� � �������������� �� ������ ' + Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(' ', colorOk);
        UpdateLog(Form1.sRichEdit2.Handle,
          '�� ������� ���������� ���������� � �������������� �� ������ ' + Form1.massivOprosa[i, 0, 0, 1], colorError);
        UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
        goto labelkonec;
      end;
      Sleep(3000);
    end
    else
    begin
      if flagModem then
      begin
        UpdateLog('������ �� ������������� �� ������ ' + Form1.massivOprosa[i, 0, 0, 2] + '. �����: ' + Form1.massivOprosa[i, 0, 0, 1], colorOk);
        if not Dozvon(Form1.massivOprosa[i, 0, 0, 2]) then
        begin
          UpdateLog('���������� ���������� ���������� � �������������� �� ������ ' + Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(' ', colorOk);
          UpdateLog(Form1.sRichEdit2.Handle,
            '�� ������� ���������� ���������� � �������������� �� ������ ' + Form1.massivOprosa[i, 0, 0, 1], colorError);
          UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
          goto labelkonec;
        end;
      end;
    end;

    UpdateLog('������ ������ � �������������', colorOk);
    begin
      Synchronize(PuskTimer);
      DecodeTime(Time, hour, min, sec, msec);
      nachOprosa := hour * 3600 + min * 60 + sec;
      //---------------------------------------------------------
      //          ������ ������ � �������������
      //---------------------------------------------------------
                //������� ��������� ����������
      if adresPovtor <> '' then
        adres := adresPovtor
      else
        adres := '0000';
      SetLength(bufPriema, 3); //��� �������� ����� ������ � ������ ������
      bufPriema[0] := 0; //0
      //*****************************

      repeat
        //������������ ������������ �������
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
          BComPort.ClearBuffer(true, true); //������� �������
          WriteBufInPort(bufper); //������� �������

          if (not WaitComData(4000)) then //�������� ����������� ������ � ����
          begin
            if k > 3 then
            begin
              PovtorDozvona; //������ ���� ��� ���������� �������
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

        //����� ������
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
              Break //����� �� ����� ������
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
              Break //����� �� ����� ������
            end;
            SetLength(bufPriema, Length(bufPriema) + 1);
            Inc(prinByte);
            Inc(k);
            SendMessage(Form1.sEdit13.Handle, WM_SETTEXT, 0,
              Lparam(LPCTSTR(IntToStr(prinByte))));
          until (BComPort.Read(@bufPriema[k], 1) = 0) or (k > 30000);
        end;
        //���� �� ������ �����

        if bufPriema = nil then
        begin
          Inc(error);
          if error > 3 then
            //���� ����������� ������� ������ ������ ������ ��������� 10 �� ������ �������
          begin
            if countPovtDozv > 1 then
            begin
              UpdateLog('������������ �� ��������', colorError);
              goto labelKonec;
            end;
            Inc(countPovtDozv);
            PovtorDozvona; //������ ���� ��� ���������� �������
            adresPovtor := adres;
            goto nachalo;
          end;
          goto povtor; //���� ������ �������� ������ �������
        end;

        //������ � ���
        if log then
        begin
          Write(logFile, '��. ');
          for k := 0 to Length(bufPriema) - 1 do
            Write(logFile, IntToStr(bufPriema[k]) + ', ');
          Writeln(logFile, '');
        end;
        //*********************

        //���������� ����� ������ ������
        if (bufPriema[1] = 255) and (bufPriema[2] = 255) and (bufPriema[3] = 255) then
          break;
        //****************************

        //�������� �� ������� ������ � ������������� ���-104
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
            UpdateLog('    ������������ ' + tempStr + ' ' + nomerSchetcika +
              ' ������', colorRab);
            Inc(schitano);
            SendMessage(Form1.sEdit9.Handle, WM_SETTEXT, 0,
              Lparam(LPCSTR(IntToStr(schitano))));
            UpdateTmpHashr(nomerSchetcika, '1');
            Synchronize(UpdateProgress); //��������� ��������� ����������
            SaveDataSoSchet(bufPriema, 0);
          end
          else
            goto povtor;
          break;
        end;
        //***************************************************

        //�������� ������������ �������� ������
        if not ((bufPriema[13] = 170) and (bufPriema[Length(bufPriema) - 6] = 90)
          and (bufPriema[Length(bufPriema) - 7] = 165)) then
        begin
          Inc(error);
          if error > 10 then
            //���� ����������� ������� ������ ������ ������ ��������� 10 �� ������ �������
          begin
            if countPovtDozv > 1 then
            begin
              UpdateLog('������������ �� ��������', colorError);
              goto labelKonec;
            end;
            Inc(countPovtDozv);
            PovtorDozvona; //������ ���� ��� ���������� �������
            adresPovtor := adres;
            goto nachalo;
          end;
          Sleep(1000);
          goto povtor; //���� ������ �������� ������ �������
        end;
        //*******************************

        //����������� ������ ��������
        tempbuf := nil;
        tempbuf := BCDToNumStr(Copy(bufPriema, 0, 3));
        nomerSchetcika := '';
        for j := 0 to 5 do
          nomerSchetcika := nomerSchetcika + Chr(tempbuf[j]);
        //****************************

        if bufPriema[12] = 0 then //���� ������ ��� ���������� ���
        begin
          //          UpdateLog('    ������� ' + nomerSchetcika + ' ������', colorRab);
          UpdateLog('    ������� ' + nomerSchetcika + ' ������. ' + TimeToStr(Time), colorRab);
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
                  UpdateLog('    ������������ �������� ��������� �� ������ ������:', colorError);
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
          UpdateLog('    ������� ' + nomerSchetcika + DetectError(bufPriema) +
            ' ' + '(��. ' + kv + ')', colorError);
          NeschCounter.Add('    ������� ' + nomerSchetcika +
            DetectError(bufPriema) + ' ' + '(��. ' + kv + ')');
          //��������� ����� � ������������
          if not flagTolkoChtenie then
            AddPovtChtenie(nomerSchetcika, i);
          Inc(neschitano);
          UpdateTmpHashr(nomerSchetcika, '0');
          SendMessage(Form1.sEdit10.Handle, WM_SETTEXT, 0,
            Lparam(LPCSTR(IntToStr(neschitano))));
        end;
        Synchronize(UpdateProgress); //��������� ��������� ����������
        adres := IntToHex(bufPriema[Length(bufPriema) - 4], 2) +
        IntToHex(bufPriema[Length(bufPriema) - 5], 2);
      until (false);

      DecodeTime(Time, hour, min, sec, msec);
      nachOprosa := (hour * 3600 + min * 60 + sec) - nachOprosa;
      Synchronize(StopTimer);
      //****************����� � ������*********
      UpdateLog(Form1.sRichEdit2.Handle, '���� ������ � ���� �� ������: ',
        colorRab);
      UpdateLog(Form1.sRichEdit2.Handle, Form1.massivOprosa[i, 0, 0, 1],
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  ----------------------------',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | C������ ���������: ' +
        IntToStr(schitano), colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | ��������� ���������: ' +
        IntToStr(neschitano), colorOk);
      for j := 1 to NeschCounter.Count do
        UpdateLog(Form1.sRichEdit2.Handle, '   - ' + NeschCounter.Strings[j -
          1], colorError);
      UpdateLog(Form1.sRichEdit2.Handle, '  | ���������: ' +
        IntToStr(StrToInt(Form1.sEdit11.Text)), colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | ����� ������ � ��������������: ' +
        IntToStr(nachOprosa div 60) + ':' + FormatFloat('00', nachOprosa mod 60),
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | ����/�����: ' + FormatDateTime('dd/mm/yy hh/nn/ss', Date + Time), colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  | ������ �������� ������: ' +
        IntToStr(StrToInt(Form1.sEdit13.Text)) + ' ���� (' +
        FloatToStrF(StrToInt(Form1.sEdit13.Text) / 1024, ffFixed, 7, 2) + ' kb)',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, '  ----------------------------',
        colorOk);
      UpdateLog(Form1.sRichEdit2.Handle, ' ', colorOk);
      //---------------------------------------
      UpdateLog('���������� ���������� � ������� �� ������: ' +
        Form1.massivOprosa[i, 0, 0, 1] + ' ���������.', colorOk);
      UpdateLog('  ---------------------------', colorOk);
      UpdateLog('  | ������� ���������: ' +
        IntToStr(StrToInt(Form1.sEdit9.Text)), colorOk);
      UpdateLog('  | ��������� ���������: ' +
        IntToStr(StrToInt(Form1.sEdit10.Text)), colorOk);
      UpdateLog('  ---------------------------', colorOk);
      UpdateLog('����� ������ � ��������������: ' + IntToStr(nachOprosa div 60) +
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
    Synchronize(incGauge1); //���������� �� ���� �������
  end;
  Form1.sGauge2.Visible := false;
end;

function TDeviceThread.DetectError(response: TBytes): string;
begin
  case response[12] of
    0: Result := '';
    1: Result := '  �������� ��� �������';
    2: Result := '  �������� ���������� ���������� ������';
    3: Result := '  �������� ������ ����������';
    4: Result := '  �������� CRC';
    5: Result := '  ��� ������ �� ��������';
    6: Result := '  �������� ����� ����������';
    7: Result := '  �� ������';
  else
    Result := ' ����������� ������'
  end;
end;

function TDeviceThread.Dozvon(nomer: string): Boolean;
var
  str: string; //������ ������ ������ ��� �������
  tempStr: string; //������ ��� ���������� �������� ������ ������
  schetchik: integer; //������� ���������� ������� �������
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
      UpdateLog('����� �����������', colorOk);
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
    //***� ����������� �� ���� ������ ������ ��� ������ ����� ���
    //--����� ����������� - AT DP + *******(�����)
    //--����� ���������� � 8 - AT W1 M0 E0 DP + 8W + ***(���)*******(�����)
    repeat
      Inc(schetchik);
      BComPort.ClearBuffer(true, true);

      //������ ������
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
        UpdateLog('    ������� �' + IntToStr(schetchik), colorOk);
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
      WaitComData(10000); //�������� ����� ������ ������

      str := '';

      //*********������ ������ � ��������� ������ com �����**********
      i := 0;
      //������� ��� ������ �� ���������. ����� ������� �������������� i/10 ���
      repeat
        BComPort.ReadStr(tempStr, BComPort.InputCount);
        str := str + tempStr;
        Sleep(100);
        if i = 350 then
          UpdateLog('��� ������. �������� 30 ���', colorRab);
        Inc(i);
      until ((Pos('CONNECT 9600', str) <> 0) or (Pos('CONNECT', str) <> 0) or
        (Pos('NO DIAL', str) <> 0) or (Pos('NO CARRIER', str) <> 0) or
        (Pos('ERROR', str) <> 0) or (Pos('NO ANSWER', str) <> 0) or (Pos('BUSY',
        str) <> 0) or (i > 650));

      //********�������� ������ ������ ��� �������
      if ((Pos('CONNECT 9600', str) <> 0)) then
      begin
        UpdateLog('���������� �� �������� 9600 ', colorOk);
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
        UpdateLog('����� �� �����������', colorError);
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
  if stop then //���� ������ ������ �� ����� ��
    Exit; //���������� ������

  countDozvon := FormOptions.sSpinEdit1.Value; //���������� ������� �������
  timeOdinSch := FormOptions.sDecimalSpinEdit1.Value;

  Synchronize(ObnulSchetchikov);
  Synchronize(ClearLog);
  Synchronize(BlokGlOkna); //���������� ����������� ��� ������ com �����
  LoadDll; //�������� ����������

  try
    AssignFile(logFile, ExtractFilePath(Application.ExeName) + '\Log\log.txt');
    Rewrite(logFile); //�������� ����� ����
  except

  end;

  //--�������� ���������� � ����� ��� ������
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
      ChtenieSchit // ������ �� ������������
    else //
      ProgrNaChtenieSchit //
  end //--------------------------
  else
  begin
    if flagWrite then // ���� ������ ����������
    begin
      ProgrWrite;
      ProverkaWrite;
    end
    else
    begin
      //���� ������ ������ �� ��������� ���������������� ������������
      if flagTolkoChtenie then
        Chtenie
      else
      begin
        // ���� ��������� ����������� ���������, �� ����������� ������ �������
        if flagSecondRead then
        begin
          for i := 0 to 1 do
          begin
            if i >= 1 then
              Sleep(15000);
            ProgrNaChtenie; //��������������� �������������� �� ������
            Chtenie;
          end;
        end
        else
        begin
          ProgrNaChtenie; //��������������� �������������� �� ������
          Chtenie;
        end;
      end;
    end;
  end;

  //--����������� ������� ����
  DBs.DefaultTransaction.Free;
  DBs.Free;
  //-----------------------

  Synchronize(OtmenaBlokGlOkna); //������ ����������
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
    //�������� ��������� �� �������
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

function TDeviceThread.IniModem(): Boolean; //��������� ������������� ������
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
  UpdateLog('������������� ������...', colorOk);
  ent := $0D;
  BComPort.ClearBuffer(true, true);
  BComPort.WriteStr('ATZ');
  BComPort.Write(@ent, 1); //temp
  str := '';
  m := 0;
  //������� ��� ������ �� ���������. ����� ������� �������������� i/10 ���
  Sleep(50);

  repeat
    BComPort.ReadStr(tempStr, BComPort.InputCount);
    str := str + tempStr;
    Sleep(100);
    Inc(m);
  until ((Pos('OK', str) <> 0) or (m > 30)); //3 ���
  if Pos('OK', str) = 0 then
  begin
    UpdateLog('����� �� ��������', colorError);
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
  // 19.04.2013  ��������������
{
  BComPort.WriteStr('ATS7=50');
  //����� �������� ������� ����������� ������ � ��������
  BComPort.Write(@ent, 1);
  Sleep(50);
  BComPort.ReadStr(tempStr, BComPort.InputCount);
  BComPort.WriteStr('ATS10=25');
  //����� � 1/10 c, � ������� �������� ����� ������� ����������� ������� ������� ���������� ������ ����� �������� ����������, ���� ������� ��������.
  BComPort.Write(@ent, 1);
  Sleep(50);
  BComPort.ReadStr(tempStr, BComPort.InputCount);
}
  Sleep(1200);
  BComPort.WriteStr('+++');
  Sleep(1200);
  m := 0;
  str := '';
  BComPort.WriteStr('ATE0'); //��� ���������
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
    //**���� ����� ������� OK �� ������������� ��������
  begin
    UpdateLog('����� �� ��������', colorError);
    Result := false;
    BComPort.Close;
    CloseFile(logFile);
    exit;
  end
  else
  begin
    UpdateLog('������������� ������ �������', colorOk);
    Result := true;
  end;
end;

procedure TDeviceThread.LoadDll; //��������� �������� ����������
begin
  try
    DLLHandle := LoadLibrary(PChar(ExtractFilePath(Application.ExeName) +
      '\DLL\formirBuf\formirBuf.dll'));
  except
    exit;
  end;
  if DLLHandle = 0 then
  begin
    UpdateLog('������ ��� �������� ���������� formirBuf.dll. ���������� ������ �� ��������', colorError);
    Exit;
  end;
  @FormirBuf_SapNazvRas := GetProcAddress(DLLHandle, 'FormirBuf_SapNazvRas');
  if @FormirBuf_SapNazvRas = nil then
  begin
    UpdateLog('�� ������� ������� FormirBuf_SaprNaChtenie!', colorError);
    Exit;
  end;
  @FormirBuf_SapNomerovSch := GetProcAddress(DLLHandle,
    'FormirBuf_SapNomerovSch');
  if @FormirBuf_SapNomerovSch = nil then
  begin
    UpdateLog('�� ������� ������� FormirBuf_SapNomerovSch!', colorError);
    Exit;
  end;
  @FormirBuf_SapAdrCht_Sapisi := GetProcAddress(DLLHandle,
    'FormirBuf_SapAdrCht_Sapisi');
  if @FormirBuf_SapAdrCht_Sapisi = nil then
  begin
    UpdateLog('�� ������� ������� FormirBuf_SapAdrCht_Sapisi!', colorError);
    Exit;
  end;
  @Shapka := GetProcAddress(DLLHandle, 'ShapKa');
  if @Shapka = nil then
  begin
    UpdateLog('�� ������� ������� ShapKa!', colorError);
    Exit;
  end;
  @CRC := GetProcAddress(DLLHandle, 'CRC');
  if @CRC = nil then
  begin
    UpdateLog('�� ������� ������� CRC!', colorError);
    Exit;
  end;
  @BCDToNumStr := GetProcAddress(DLLHandle, 'BCDToNumStr');
  if @BCDToNumStr = nil then
  begin
    UpdateLog('�� ������� ������� BCDToNumStr!', colorError);
    Exit;
  end;
  @NumStringToBCD := GetProcAddress(DLLHandle, 'NumStringToBCD');
  if @NumStringToBCD = nil then
  begin
    UpdateLog('�� ������� ������� NumStringToBCD!', colorError);
    Exit;
  end;
  @FormirBufFor_TEM_104 := GetProcAddress(DLLHandle, 'FormirBufFor_TEM_104');
  if @FormirBufFor_TEM_104 = nil then
  begin
    UpdateLog('�� ������� ������� FormitBufFor_TEM_104!', colorError);
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
      UpdateLog('������� ������� ������� COM ����', colorError);
      Result := false;
      BComPort.Close;
    end;
end;

procedure TDeviceThread.UpdateLog(str: string; color: TColor);
//��������� ���������� ������ � �������� ������
var
  Format: TCharFormat; //���������� ��� �������� ���������� ������ TRichEdit
begin
  FillChar(Format, SizeOf(TCharFormat), 0);
  Format.cbSize := SizeOf(TCharFormat);
  SendMessage(Form1.Log.Handle, EM_SETSEL, MaxInt, MaxInt);
  SendMessage(Form1.Log.Handle, EM_GETCHARFORMAT, 0, LPARAM(@Format));
  //��������� ������� ���������� ������
  Format.dwMask := CFM_COLOR;
  Format.crTextColor := ColorToRGB(color);
  SendMessage(Form1.Log.Handle, EM_SETCHARFORMAT, SCF_SELECTION,
    LPARAM(@Format)); //���������� ����������
  SendMessage(Form1.Log.Handle, EM_REPLACESEL, 0, LongInt(PChar(str + #13#10)));
  //������ ����� ������ � TRichEdit
end;

procedure TDeviceThread.UpdateLog(hadn: THandle; str: string; color: TColor);
var
  Format: TCharFormat; //���������� ��� �������� ���������� ������ TRichEdit
begin
  FillChar(Format, SizeOf(TCharFormat), 0);
  Format.cbSize := SizeOf(TCharFormat);
  SendMessage(hadn, EM_SETSEL, MaxInt, MaxInt);
  SendMessage(hadn, EM_GETCHARFORMAT, 0, LPARAM(@Format));
  //��������� ������� ���������� ������
  Format.dwMask := CFM_COLOR;
  Format.crTextColor := ColorToRGB(color);
  SendMessage(hadn, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@Format));
  //���������� ����������
  SendMessage(hadn, EM_REPLACESEL, 0, LongInt(PChar(str + #13#10)));
  //������ ���� ������ � TRichEdit
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
//��������� �������� ����������� ������ � ����
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
//��������� ����������� ������ ��������� ������ �������������
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

