library formirBuf;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes;

//������ ��������
const
  //�������� ������� ��������
RusKod: array[0..255] of byte = (0,1,2,3,4,5,6,7,8,9,10,11,12,
  13,14,15,
  16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,
  32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,
  48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,
  64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,
  80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,
  96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,
  112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,
  128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,
  144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,
  160,161,162,163,164,165,166,167,$A2,169,170,171,172,173,174,175,
  176,177,178,179,180,181,182,183,$B5,185,186,187,188,189,190,191,
  $41,$A0,$42,$A1,$E0,$45,$A3,$A4,$A5,$A6,$4B,$A7,$4D,$48,$4F,$A8,  
  $50,$43,$54,$A9,$AA,$58,$E1,$AB,$AC,$E2,$AD,$AE,$62,$AF,$B0,$B1,
  $61,$B2,$B3,$B4,$E3,$65,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$6F,$BE,
  $70,$63,$BF,$79,$E4,$78,$E5,$C0,$C1,$E6,$C2,$C3,$c4,$C5,$C6,$C7);
  //**************������ ��������*********************
  AdresRaz: array [1..16] of PChar = ('0000', //������ 1
                                      '00C0', //������ 2
                                      '0180', //������ 3
                                      '0240', //������ 4
                                      '0300', //������ 5
                                      '03C0', //������ 6
                                      '0480', //������ 7
                                      '0540', //������ 8
                                      '0600', //������ 9
                                      '06C0', //������ 10
                                      '0780', //������ 11
                                      '0840', //������ 12
                                      '0900', //������ 13
                                      '09C0', //������ 14
                                      '0A80', //������ 15
                                      '0B40'); //������ 16

  //**********������ ������ ��������� �����������
  AdresSapVarTar: array [1..10] of integer =
                                     ($2080, //������� ����������� 1
                                      $2180, //������� ����������� 2
                                      $2280, //������� ����������� 3
                                      $2380, //������� ����������� 4
                                      $2480, //������� ����������� 5
                                      $2580, //������� ����������� 6
                                      $2680, //������� ����������� 7
                                      $2780, //������� ����������� 8
                                      $2880, //������� ����������� 9
                                      $2980); //������� ����������� 10

  //**********������ ������ ��������� �����������
  AdresChteniaVarTar: array [1..10] of integer =
                                     ($2000, //������� ����������� 1
                                      $2100, //������� ����������� 2
                                      $2200, //������� ����������� 3
                                      $2300, //������� ����������� 4
                                      $2400, //������� ����������� 5
                                      $2500, //������� ����������� 6
                                      $2600, //������� ����������� 7
                                      $2700, //������� ����������� 8
                                      $2800, //������� ����������� 9
                                      $2900); //������� ����������� 10

  //******���� ������ ��� ����������/������
  KodError: array [0..7] of PChar =  ('������ �����������',
                                      '�������� ��� �������',
                                      '�������� ���������� ���������� ����',
                                      '�������� ������',
                                      '�������� ����������� �����',
                                      '��� ������ ����������',
                                      '�������� ����� ����������',
                                      '������� �� ������');
//����� ������� ��������

type
  buf = array of byte;
  bufPchar = array of PChar;


function NumStringToBCD(const inStr: PChar): buf;  //������� �������������� ������ � BCD ������
  function Pack(ch1, ch2: Char): byte;
  begin
    //Assert((ch1 > '0') and (ch1 < '9'));
    //Assert((ch2 > '0') and (ch2 < '9'));
    Result := (Ord(ch1) and $F) or ((Ord(ch2) and $F) shl 4)
  end;
var
  i: Integer;
begin
    if Odd(Length(inStr)) then
      Result := NumStringToBCD(PChar('0' + String(instr)))
    else
    begin
      SetLength(Result, Length(inStr) div 2);
      for i := 1 to Length(Result) do
        Result[i-1] := Pack(inStr[2*i-1], inStr[2*i-2]);
    end;
end;

function BCDToNumStr(const bufer: buf):buf;
var
  i: integer;
  k: integer;
begin
  Result := nil;
  SetLength(Result, Length(bufer)*2);
  k := Length(bufer) - 1;
  for i := 0 to Length(bufer) - 1 do
    begin
      Result[i*2] :=  ((Ord(Chr(bufer[k])) shr 4) and $F) + $30;
      Result[i*2+1] := (Ord(bufer[k]) and $F) + $30;
      Dec(k);
    end;
end;

function CRC(mass: buf; nach: integer; konec: integer):byte;  //������� �������� ����������� �����
var
  i: integer;
begin
  Result := 0;
  for i := nach to konec do
    Result := Result + mass[i];
end;


function ShapKa(read: Boolean;           //������� ������������ ����� �������
                nomConc: PChar;
                passwConcOld: Pchar;
                passwConcNew: Pchar;
                addr: Pchar):buf;
var
  tempBuf: buf;
begin
  Result := nil;
  SetLength(Result, 18);          //����� ����� 18 ����
  tempBuf := NumStringToBCD(nomConc); //  ����������� � ������ ����� �������������
  Result[0] := tempBuf[2];        //
  Result[1] := tempBuf[1];        // \ ����� ������������� � BCD �������
  Result[2] := tempBuf[0];        // / 3 ����� + 1 �����. �����
  Result[3] := CRC(Result, 0, 2); //

  tempBuf := NumStringToBCD(passwConcOld);
  Result[4] := tempBuf[2];        //
  Result[5] := tempBuf[1];        // \ ������ ������������� ������ � BCD
  Result[6] := tempBuf[0];        // / 3 ����� + 1 �����. �����
  Result[7] := CRC(Result, 4, 6); //

  tempBuf := NumStringToBCD(passwConcNew);
  Result[8] := tempBuf[2];        //
  Result[9] := tempBuf[1];        // \ ������ ������������� ����� � BCD
  Result[10] := tempBuf[0];       // / 3 ����� + 1 �����. �����
  Result[11] := CRC(Result, 8, 10);//
  Result[12] := 0;                //��� ������ - 0

  if read then
    Result[13] := $55             //��� �������
  else                            //� ����������� �� ������ ��� ������
    Result[13] := $33;
  if Length(addr) < 3 then
    addr := AdresRaz[StrToint(addr)+1]; 
  Result[14] := StrToInt('$' + Copy(addr, 3, 2)); //����� ������ ��� ������ ������� ����
  Result[15] := StrToInt('$' + Copy(addr, 1, 2)); //������� ����
  Result[16] := 0;                //���������� ������������ ���� (���������������� � ����������)
  Result[17] := CRC(Result, 0, 16); //����������� ����� (���������������� � ����������)
end;


function BufNazvanieRaz(nazvanie: string;       //������� ������������ ������ �������� �������
                        countSch: string):buf;//16 ���� �������� �����
var
  i:      integer;
  nazvUl: string;
  dom:    string;
  korpus: string;
  raz:    string;
begin
  //����������� ������ nazvanie �� ���������
  // nazvUl -  �������� ����� (��. ������)
  // dom - ���
  // korpus - ������
  // raz - ����� �������
  //***********************
  nazvUl := Trim(Copy(nazvanie, 1, Pos(',', nazvanie)-1));
  dom := Trim(Copy(nazvanie, Pos('���', nazvanie)+4, Pos(', ������', nazvanie)-Pos('���', nazvanie)-4));
  korpus := Trim(Copy(nazvanie, Pos('������', nazvanie)+6, Pos(', ������', nazvanie)-Pos('������', nazvanie)-6));
  raz := Trim(Copy(nazvanie, Length(nazvanie)-1, 2));
  if nazvUl = '' then
    nazvUl := '�����������';
  if dom = '' then
    dom := '0';
  if korpus = '' then
    korpus := '0';
  //**************************

  SetLength(Result, 32);                            //��������� ����� ������ 32 �����

  //********������������ ������******
  //�������� �����
  if Length(nazvUl) < 16 then                       //���������� ������ �������� �����
    begin                                           //������ 16 ����
      for i := 0 to Length(nazvUl)-1 do             //���� �������� ������ 16 ���� �� ���������� �� ����� ���������
        Result[i] := RusKod[integer(nazvUl[i+1])];
      for i := Length(nazvUl) to 15 do
        Result[i] := RusKod[integer(' ')]
    end
  else                                              //���� ������, �� ���������� ������ 16 ����
    for i := 0 to 15 do
      Result[i] := RusKod[integer(nazvUl[i+1])];

  //����� ����
  Result[16] := RusKod[integer('�')];              //������ � - ���
  for i := 19-Length(dom)+1 to 19 do                      //���������� ������ ������ ����
    Result[i] := RusKod[integer(dom[i-19+Length(dom)])];  //3 �����. ���� ����� ������ 3 ���� � ������ ����
  for i := 17 to 19-Length(dom) do
    Result[i] := RusKod[integer('0')];

  Result[20] := RusKod[integer(' ')];               //������ ����� ������� ���� � �������

  //����� �������
  Result[21] := RusKod[integer('�')];               //����� ������� 2 �����
  if Length(korpus) = 1 then                        //����� ����� 1 �����, �� ������� �����
    begin
      Result[22] := RusKod[integer('0')];
      Result[23] := RusKod[integer(korpus[1])];
    end
  else
    for i := 22 to 23 do
      Result[i] := RusKod[integer(korpus[i-21])];

  //����� �������
  Result[24] := RusKod[integer('�')];                 //���������� ������� ��� � ������ �������
  if Length(raz) = 1 then
    begin
      Result[25] := RusKod[integer('0')];
      Result[26] := RusKod[integer(raz[1])];
    end
  else
    for i := 25 to 26 do
      Result[i] := RusKod[integer(raz[i-24])];

  Result[27] := RusKod[integer(' ')];                 //������ ����� ������� ������� � ����������� ���������

  //���������� ��������� � �������
  Result[28] := RusKod[integer('�')];
  for i := 31-Length(countSch)+1 to 31 do                           //���������� ������ ���������� ���������
    Result[i] := RusKod[integer(countSch[i-31+Length(countSch)])];  //3 ����� ���� ����� ������ 3 ���� � ������ ����
  for i := 29 to 31-Length(countSch) do
    Result[i] := RusKod[integer('0')];

end;

  //������� ������������ ������� ��� ������ � ������������ �������� �������
  //���������� ������ ���� ��� ��������
function FormirBuf_SapNazvRas   (nomConc: PChar;           //����� �������������
                                 passwConcOld: PChar;      //������ ������������� ������
                                 passwConcNew: PChar;      //������ ������������� �����
                                 ConfigPer: array of PChar):buf; //������������ ������������ ������ (��������� ������)
                                                            //---0---����� ������� (�� 1 �� 16)
                                                            //---1---�������� �������
                                                            //---2---���������� ��������� � �������

var
  i: integer;
  tempBuf: buf;
begin
  Result := nil;
  SetLength(Result, 51);
  tempBuf := ShapKa(true, nomConc, passwConcOld, passwConcNew, AdresRaz[StrToInt(configPer[0])]);
  for i := 0 to 17 do                 //����� 18 ����
    Result[i] := tempBuf[i];
  Result[16] := 32;                   //���������� ���� ��������
  Result[17] := CRC(Result, 0, 16);   //����������� ����� �����

  tempBuf := BufNazvanieRaz(configPer[1], configPer[2]);
  for i := 0 to 31 do             //�������� �����, �������, ������ ����, ���������� ��������� � �������
    Result[i+18] := tempBuf[i];   //32 �����

  Result[50] := CRC(Result, 0, 49);    //����� ����������� �����
end;


//������� ������������ ������ ��� ������ ������� ��������� �� ��������� �����������
function FormirBuf_SapNomerovSch(nomConc: PChar;           //����� �������������
                        passwConcOld: PChar;      //������ ������������� ������
                        passwConcNew: PChar;      //������ ������������� �����
                        ConfigPer: array of bufPchar): buf; //������������ ������������ ������ (��������� ������)
                                                      //---0,0---����� ������
                                                      //---0,1---����� �������
                                                      //---1,0---����� �������� � ������ ���������
                                                      //---1,1---����� �������� (�� 32 ���������)
                                                      //---1,2---����� ��������
                                                      //---------.......
                                                      //---2,0---����� �������� �������� ����������� 2
                                                      //---------.......
                                                      //---10,0---����� �������� � ��������� ����������� 10
var
  tempBuf: buf;
  addres: integer;
  nomerByte: integer;
  i,j,k: integer;
procedure Proverka();    //��������� �������� ����� ������ (32 �����)
var
  tempBufer: buf;
  i: integer;
begin
  if Length(Result) in [50, 101, 152, 203, 254] then
    begin
      Result[nomerByte-34] := 32;
      Result[nomerByte-33] := CRC(Result, nomerByte-50, nomerByte-34);
      SetLength(Result, Length(result)+1);
      Result[nomerByte] := CRC(Result, nomerByte-50, nomerByte-1);
      Inc(nomerByte);
      addres := addres + 32;
      tempBufer := ShapKa(true, nomConc, passwConcOld, passwConcNew, Pchar(IntToHex(addres, 4)));
      SetLength(Result, Length(result)+18);
      for i := 0 to 17 do
        begin
          Result[nomerByte] := tempBufer[i];
          Inc(nomerByte);
        end;
    end;
end;

begin
  Result := nil;
  SetLength(Result, 19);
  addres := StrToInt('$' + AdresRaz[StrToInt(ConfigPer[0,0])]) + 32;
  tempBuf := ShapKa(true, nomConc, passwConcOld, passwConcNew, PChar(IntToHex(addres, 4)));

  for i := 0 to 17 do
    Result[i] := tempBuf[i];

  nomerByte := 18;
  Result[nomerByte] := StrToInt(ConfigPer[0,1]);      //����� �������
  Inc(nomerByte);


//**********��������� � ����� ���-�� ��������� � i-�� ��������� �����������
//********** + ������������� ���������� + ������ ��������� � BCD � CRC (3+1)
  for i := 1 to 11 do
    if Length(ConfigPer[i]) <> 0 then
      begin
        Proverka();
        SetLength(Result, Length(Result)+1);
        Result[nomerByte] := Length(ConfigPer[i]);    //���������� ��������� � i-��� ��������� �����������
        Inc(nomerByte);
        Proverka();
        SetLength(Result, Length(Result)+1);
        Result[nomerByte] := i;                       //����� �������� �����������
        Inc(nomerByte);
        for j := 0 to Length(ConfigPer[i]) - 1 do
          begin
            if StrToIntDef(configPer[i, j], 0) = 0 then
              tempBuf := NumStringToBCD(PChar('000000'))
            else
              tempBuf := NumStringToBCD(configPer[i, j]);
            for k := 2  downto 0 do
              begin
                Proverka();
                SetLength(Result, Length(Result)+1);
                Result[nomerByte] := tempBuf[k];
                Inc(nomerByte);
              end;
            Proverka();
            SetLength(Result, Length(Result)+1);
            Result[nomerByte] := CRC(tempBuf, 0, 2);    //������������ ����� ������� ���������
            Inc(nomerByte);
          end;
      end;
  if (((nomerByte mod 51) - 18) mod 2) = 1 then
    begin
      SetLength(Result, Length(Result)+1);
      Result[nomerByte] := 0;
      Inc(nomerByte);
    end;

  Result[nomerByte-(nomerByte mod 51)+16] := (nomerByte mod 51) - 18;
  Result[nomerByte-(nomerByte mod 51)+17] := CRC(Result, nomerByte-(nomerByte mod 51), nomerByte-(nomerByte mod 51)+16);
  SetLength(Result, Length(Result)+1);
  Result[nomerByte] := CRC(Result, nomerByte-(nomerByte mod 51), nomerByte-1);

end;


//������� ������������ ������ ��� ������ ���������� ������ ��� ������
function FormirBuf_SapAdrCht_Sapisi(nomConc: PChar;           //����� �������������
                        passwConcOld: PChar;      //������ ������������� ������
                        passwConcNew: PChar;      //������ ������������� �����
                        passwSchOld:  PChar;      //������ �� �������� ������
                        passwSchNew:  PChar;      //�������� �������� �����
                        varTar:       byte;      //����� �������� �����������
                        countRas:     byte;      //���������� ��������
                        adrChtSap: array of PChar;//������ ������/������ (4 �����) + ���������� ���� ��������� (3 �����)
                        read: Boolean):buf;       //���� ������ ��� ������
var
  i: integer;
  nomerByte: integer;
  tempBuf: buf;
  addres: integer;
procedure Proverka();    //��������� �������� ����� ������ (32 �����)
var
  tempBuf: buf;
  i: integer;
begin
  if Length(Result) in [50, 101, 152, 203, 254] then
    begin
      Result[nomerByte-34] := 32;
      Result[nomerByte-33] := CRC(Result, nomerByte-50, nomerByte-34);
      SetLength(Result, Length(result)+1);
      Result[nomerByte] := CRC(Result, nomerByte-50, nomerByte-1);
      Inc(nomerByte);
      addres := addres + 32;
      tempBuf := ShapKa(true, nomConc, passwConcOld, passwConcNew, PChar(IntToHex(addres, 4)));
      SetLength(Result, Length(result)+18);
      for i := 0 to 17 do
        begin
          Result[nomerByte] := tempBuf[i];
          Inc(nomerByte);
        end;
    end;
end;
begin
  Result := nil;
  SetLength(Result, 28);
  if read then
    addres := AdresChteniaVarTar[varTar]
  else
    addres := AdresSapVarTar[varTar];

  tempBuf := ShapKa(true, nomConc, passwConcOld, passwConcNew, PChar(IntToHex(addres, 4)));
  for i := 0 to 17 do
    Result[i] := tempBuf[i];

  nomerByte := 18;
  tempBuf := NumStringToBCD(passwSchOld);
  for i := 2 downto 0 do
    begin
      Result[nomerByte] := tempbuf[i];        //������ �� �������� �����������
      Inc(nomerByte);
    end;
  Result[nomerByte] := CRC(Result, nomerByte-3, nomerByte-1);
  Inc(nomerByte);

  tempBuf := NumStringToBCD(passwSchNew);
  for i := 2 downto 0 do
    begin                                    //������ �� �������� �����
      Result[nomerByte] := tempBuf[i];
      Inc(nomerByte);
    end;
  Result[nomerByte] := CRC(Result, nomerByte-3, nomerByte-1);
  Inc(nomerByte);

  Result[nomerByte] := countRas;      //���������� ��������
  Inc(nomerByte);
  Result[nomerByte] := Length(adrChtSap);       //���������� ���������� ������/������
  Inc(nomerByte);

  for i := 0 to Length(adrChtSap) - 1 do
    begin
      Proverka();
      SetLength(Result, Length(result)+1);
      Result[nomerByte] := StrToInt('$' + Copy(adrChtSap[i], 3, 2));    //������� ���� ������
      Inc(nomerByte);
      Proverka();
      SetLength(Result, Length(result)+1);
      Result[nomerByte] := StrToInt('$' + Copy(adrChtSap[i], 1, 2));    //������� ���� ������
      Inc(nomerByte);
      Proverka();
      SetLength(Result, Length(result)+1);
      Result[nomerByte] := StrToInt(Copy(adrChtSap[i], 5, 3));    //���������� ���� ���������
      Inc(nomerByte);
    end;

  Result[nomerByte-(nomerByte mod 51)+16] := (nomerByte mod 51) - 18;
  Result[nomerByte-(nomerByte mod 51)+17] := CRC(Result, nomerByte-(nomerByte mod 51), nomerByte-(nomerByte mod 51)+16);
  SetLength(Result, Length(Result)+1);
  Result[nomerByte] := CRC(Result, nomerByte-(nomerByte mod 51), nomerByte-1);  //����� ����������� �����
end;

//������� ������������ ������ ��� ������� �������������� ���-104
function FormirBufFor_TEM_104(nomConc: PChar;           //����� �������������
                        passwConcOld: PChar;            //������ ������������� ������
                        passwConcNew: PChar;            //������ ������������� �����
                        local_number: Byte;
                        countRead_Flash512K: Byte;
                        addr_Flash512K: integer;
                        type_counter: byte):buf;
var
  i: integer;
  nomerByte: integer;
  tempBuf: buf;
  addres: integer;
  addr_TEM_104: integer;
procedure Proverka();    //��������� �������� ����� ������ (32 �����)
var
  tempBuf: buf;
  i: integer;
begin
  if (Length(Result) + 1) mod 51 = 0 then
    begin
      Result[nomerByte-34] := 32;
      Result[nomerByte-33] := CRC(Result, nomerByte-50, nomerByte-34);
      SetLength(Result, Length(result)+1);
      Result[nomerByte] := CRC(Result, nomerByte-50, nomerByte-1);
      Inc(nomerByte);
      addres := addres + 32;
      tempBuf := ShapKa(true, nomConc, passwConcOld, passwConcNew, PChar(IntToHex(addres , 4)));
      SetLength(Result, Length(result)+18);
      for i := 0 to 17 do
        begin
          Result[nomerByte] := tempBuf[i];
          Inc(nomerByte);
        end;
    end;
end;
procedure Init_TEM_104();
var
  countRead: Word;
  i: integer;
begin
  Result := nil;
  SetLength(Result, 28);
  tempBuf := ShapKa(true, nomConc, passwConcOld, passwConcNew, PChar('5000'));
  for i := 0 to 17 do
    Result[i] := tempBuf[i];
  Result[18] := 1;                //���������� ��������
  if type_counter = 0 then
    countRead := 1 + 1 + 32 + 5 + countRead_Flash512K * 4  //���������� ������
  else
    countRead := 1 + 1 + 8 + 5 + countRead_Flash512K * 4;
  Result[19] := countRead and $FF;          //���������� ������ ������� ����
  Result[20] := (countRead shr 8) and $FF;  //���������� ������ ������� ����
  Result[21] := 85;               //������� ������ ������ $55
  Result[22] := local_number;     //������� �����
  Result[23] := not Result[22];   //NOT ������� �����
  Result[24] := 0;                //������ ������
  Result[25] := 0;                //������������� ����������
  Result[26] := 0;                //����� ���������� ����
  Result[27] := not CRC(Result, 21, 26);
  nomerByte := 28;
end;

procedure Timer128(adr: integer);
var
  CRC: Byte;
begin
  Proverka;
  SetLength(Result, Length(Result) + 1);
  CRC := 0;
  Result[nomerByte] := 85;                  //������� ������ ������ $55
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := local_number;        //������� �����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := not Result[22];      //NOT ������� �����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 15;                  //������ ������  $0F
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 2;                   //������ ������ �������
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 2;                   //����� ���������� ����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := adr; //��������� ����� ����������
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 64;                  //���������� ������������ ����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := not CRC;           //����������� ����� �������
  Inc(nomerByte);
end;

procedure Timer2K(adr: integer);
var
  CRC: Byte;
begin
  Proverka;
  SetLength(Result, Length(Result) + 1);
  CRC := 0;
  Result[nomerByte] := $55;                  //������� ������ ������ $55
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := local_number;         //������� �����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := not Result[22];      //NOT ������� �����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := $0F;                  //������ ������  $0F
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 1;                   //������ 2K ������ �������
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 3;                   //����� ���������� ����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := StrToInt('$' + Copy(IntToHex(adr, 4), 1, 2)); //��������� ����� ���������� (������� ����)
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := StrToInt('$' + Copy(IntToHex(adr, 4), 3, 2)); //��������� ����� ���������� (������� ����)
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 64;      //���������� ������������ ����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := not CRC;           //����������� ����� �������
  Inc(nomerByte);
end;

procedure Flash512K(adr: integer);
var
  CRC: Byte;
begin
  Proverka;
  SetLength(Result, Length(Result) + 1);
  CRC := 0;
  Result[nomerByte] := $55;                  //������� ������ ������ $55
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := local_number;         //������� �����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := not Result[22];      //NOT ������� �����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := $0F;                  //������ ������  $0F
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 3;                   //������ Flash ������ �������
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 5;                   //����� ���������� ����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 64;     //���������� ������������ ����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := StrToInt('$' + Copy(IntToHex(adr, 8), 1, 2)); //��������� ����� ���������� (������� ����)
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := StrToInt('$' + Copy(IntToHex(adr, 8), 3, 2)); //��������� ����� ���������� (������� ����)
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := StrToInt('$' + Copy(IntToHex(adr, 8), 5, 2)); //��������� ����� ���������� (������� ����)
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := StrToInt('$' + Copy(IntToHex(adr, 8), 7, 2)); //��������� ����� ���������� (������� ����)
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := not CRC;           //����������� ����� �������
  Inc(nomerByte);
end;

procedure Mimemory(adr: integer);
var
  CRC: Byte;
begin
  Proverka;
  SetLength(Result, Length(Result) + 1);
  CRC := 0;
  Result[nomerByte] := $55;                  //������� ������ ������ $55
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := local_number;        //������� �����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := not Result[22];      //NOT ������� �����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := $0C;                  //������ ������  $0�
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 1;                   //������ ����������� ������ �������
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 3;                   //����� ���������� ����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := StrToInt('$' + Copy(IntToHex(adr, 4), 1, 2)); //��������� ����� ���������� (������� ����)
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := StrToInt('$' + Copy(IntToHex(adr, 4), 3, 2)); //��������� ����� ���������� (������� ����)
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := 64;      //���������� ������������ ����
  CRC := CRC + Result[nomerByte];

  Inc(nomerByte);
  Proverka;
  SetLength(Result, Length(Result) + 1);
  Result[nomerByte] := not CRC;           //����������� ����� �������
  Inc(nomerByte);
end;

begin
  addres := $5000;        //��������� ����� ������ � ������������
  Init_TEM_104;

  //����� ��� ������ ������ 2K ��� 512 ����
  addr_TEM_104 := $0000;
  if type_counter = 0 then
    begin
      for i :=  1 to 32 do
        begin
          Timer2K(addr_TEM_104);
          addr_TEM_104 := addr_TEM_104 + 64;
        end;
    end
  else
    begin
      for i :=  1 to 8 do
        begin
          Timer2K(addr_TEM_104);
          addr_TEM_104 := addr_TEM_104 + 64;
        end;
    end;

  //����� ��� ������ 128
  addr_TEM_104 := $00;
  Timer128(addr_TEM_104);

  //����� ��� ������ ����������� ������
  if type_counter = 0 then
    addr_TEM_104 := $2200
  else
    addr_TEM_104 := $0000;
  for i :=  1 to 5 do
    begin
      Mimemory(addr_TEM_104);
      addr_TEM_104 := addr_TEM_104 + 64;
    end;

  //����� ��� ������ ������ Flash_512K
  addr_TEM_104 := addr_Flash512K;
  for i :=  1 to countRead_Flash512K * 4 do
    begin
      Flash512K(addr_TEM_104);
      addr_TEM_104 := addr_TEM_104 + 64
    end;

  Result[nomerByte-(nomerByte mod 51)+16] := (nomerByte mod 51) - 18;
  Result[nomerByte-(nomerByte mod 51)+17] := CRC(Result, nomerByte-(nomerByte mod 51), nomerByte-(nomerByte mod 51)+16);
  SetLength(Result, Length(Result)+1);
  Result[nomerByte] := CRC(Result, nomerByte-(nomerByte mod 51), nomerByte-1);  //����� ����������� �����
end;

function DetectError(response: buf):PChar;    //������� ����������� ������ � ������
begin
  case response[12] of
    0: Result := '';
    1: Result := '�������� ��� �������';
    2: Result := '�������� ���������� ���������� ������';
    3: Result := '�������� ������ ����������';
    4: Result := '�������� CRC';
    5: Result := '��� ������ �� ��������';
    6: Result := '�������� ����� ����������';
    7: Result := ' �� ������';
    else
      Result := '����������� ������'
  end;

end;

exports
  FormirBuf_SapNazvRas,         //������� ������������ ������ ��� �������� �������
  FormirBuf_SapNomerovSch,      //������� ������������ ������ ��� ������� ���������
  FormirBuf_SapAdrCht_Sapisi,   //������� ������������ ������ ��� �������� ���������� ������/������
  ShapKa,
  CRC,
  DetectError,
  BCDToNumStr,
  NumStringToBCD,
  FormirBufFor_TEM_104;
{$R *.res}


begin

end.
