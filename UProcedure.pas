unit UProcedure;

interface

uses pFIBQuery, FIBQuery, DB, Forms, Windows, SysUtils, StrUtils, Classes, ShellAPI, pFIBProps;

procedure tmp_3fxAppend;
procedure addresmainAppend;
procedure addresAppend;
procedure koncenAppend;
procedure tmpAppend;
procedure townAppend(town: string);
procedure FindSchetchik(strFind: string; vid: string);  //Процедура нахождения счётчика и показа его в окне данных о счетчике
function GetMyVersion: string;
function WinToDOS(S: string): string;
function DOSToWin(S: string): string;
function Crypt(CryptStr: string): string;
function Decrypt(DecryptStr: String): String;
function DelDir(dir: string): Boolean;
//procedure CopyArray(var sou)

implementation

uses Udm1, Unit1;

//Добавление новой строки в таблицу tmp_3fx
procedure tmp_3fxAppend;
begin
  if not dm1.tmp_3xf.Active then
    dm1.tmp_3xf.Open;
  dm1.tmp_3xf.Append;
  if dm1.tmp_3xfINC.AsString = '' then
    begin
      dm1.updateTransact.StartTransaction;
      dm1.sp_tmp_3fx.Execproc;
      dm1.tmp_3xfINC.AsInteger := dm1.sp_tmp_3fx.ParamByName('num').AsInteger;
    end;
end;

//Процедура добавления новой запииси в таблицу адресов
procedure addresmainAppend;
begin
  if not dm1.addresmain.Active then
    dm1.addresmain.Open;
  dm1.addresmain.Append;
  if dm1.addresmainINC.AsString = '' then
    begin
      dm1.updateTransact.StartTransaction;
      dm1.sp_addresmain.ExecProc;
      dm1.addresmainINC.AsInteger := dm1.sp_addresmain.ParamByName('num').AsInteger;
    end;
end;

//Процедура добавления новой записи в таблицу разъёмов
procedure addresAppend;
begin
  if not dm1.addres_korrekt.Active then
    dm1.addres_korrekt.Open;
  dm1.addres_korrekt.Append;
  if dm1.addres_korrektINC.AsString = '' then
    begin
      dm1.updateTransact.StartTransaction;
      dm1.sp_addres.ExecProc;
      dm1.addres_korrektINC.AsInteger := dm1.sp_addres.ParamByName('num').AsInteger;
    end;  
end;

//Процедура добавления новой записи в таблицу концентратор
procedure koncenAppend;
begin
  if not dm1.koncen.Active then
    dm1.koncen.Open;
  dm1.koncen.Append;
  if dm1.koncenINC.AsString = '' then
    begin
      dm1.updateTransact.StartTransaction;
      dm1.sp_koncen.ExecProc;
      dm1.koncenINC.AsInteger := dm1.sp_koncen.ParamByName('num').AsInteger;
    end;
end;

//Процедура добавления нового города
procedure townAppend(town: string);
begin
  dm1.townAdd.Append;
  if dm1.townAddINC.AsString = '' then
    begin
      dm1.updateTransact.StartTransaction;
      dm1.sp_townAdd.ExecProc;
      dm1.townAddINC.AsInteger := dm1.sp_townAdd.ParamByName('num').AsInteger;
      dm1.townAddTOWN.AsString := town;
      dm1.townAdd.Post;
    end;
  dm1.town.CloseOpen(True);
  dm1.town.Locate('INC', dm1.townAddINC.AsInteger, []);
  Form1.DBLookupComboboxEh1.KeyValue := dm1.townINC.AsInteger;
end;

//Процедура добавления пустой записи в таблицу счётчиков
procedure tmpAppend;
begin
  if not dm1.tmp_korrekt.Active then
    dm1.tmp_korrekt.Open;
  dm1.tmp_korrekt.Append;
  if dm1.tmp_korrektINC.AsString = '' then
    begin
      dm1.updateTransact.StartTransaction;
      dm1.sp_tmp.ExecProc;
      dm1.tmp_korrektINC.AsInteger := dm1.sp_tmp.ParamByName('num').AsInteger;
      dm1.tmp_korrektCOD.AsInteger := dm1.addres_korrektINC.AsInteger;
    end;
end;

procedure FindSchetchik(strFind: string; vid: string);  //Процедура нахождения счётчика и показа его в окне данных о счетчике
var
  sql: TpFIBQuery;
  codTmp,
  incAddresMain,
  incTown: string;
begin
  strFind := Trim(strFind);
  if strFind <> '' then
    begin
    sql := TpFIBQuery.Create(nil);
    with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultTransaction;
      SQL.Text := 'select cod from tmp where ' + vid + '= ''' + strFind + '''';
      ExecQuery;
      codTmp := FN('cod').AsString;
      Close;
      if codTmp <> '' then
        begin
          SQL.Text := 'select cod from addres where inc = ' + codTmp;
          ExecQuery;
          incAddresmain := FN('cod').AsString;
          Close;
          SQL.Text := 'select rez from addresmain where inc = ' + incAddresMain;
          ExecQuery;
          incTown := FN('rez').AsString;
          Close;
          dm1.addresmain.DetailConditions := [dcForceOpen];
          dm1.town.Locate('inc', incTown, []);
          dm1.addresmain.Locate('inc', incAddresMain, []);
          LockWindowUpdate(Form1.Handle); //Запрет обновления окна
          Form1.ActionDannieSoSchetchikovExecute(Form1);
          Form1.sPageControl1.ActivePageIndex := 0;
          Form1.sPageControl1Change(Form1);
          dm1.addres_1.Locate('inc', codTmp,[]);
          dm1.tmp_1.Locate(vid, strFind, []);
          dm1.addresmain.DetailConditions := [dcForceOpen, dcWaitEndMasterScroll];
        end
      else
        Application.MessageBox('Счётчик не найден!', 'Предупреждение!', 1)
    finally
      Free;
      LockWindowUpdate(0);  //Разрешение обновления окна
    end;
    end;
end;

function WinToDOS(S: string): string;
var pS: PChar;
begin
     pS := PChar(S);
     CharToOem(pS, pS);
     Result := pS;
end;

function DOSToWin(S: string): string;
var pS: PChar;
begin
     pS := PChar(S);
     OemToChar(pS, pS);
     Result := pS;
end;

function Crypt(CryptStr: string): string;
var
  s: string;
  i: integer;
begin
  if CryptStr<>EmptyStr then
    for i:=1 to Length(CryptStr) do
      begin
        s:=LeftStr(CryptStr,1);
        CryptStr:=RightStr(CryptStr,Length(CryptStr)-1);
        //ШИФРОВКА:
        s:=chr(ord(s[1]) - i + 211543);
        result:=result+s;
      end;
  result:=ReverseString(result);
end;

function Decrypt(DecryptStr: String): String;
var
  i: integer;
  s: String;
begin
  DecryptStr:=ReverseString(DecryptStr);
  if DecryptStr<>EmptyStr then
    for i:=1 to Length(DeCryptStr) do
      begin
        s:=LeftStr(DeCryptStr,1);
        DeCryptStr:=RightStr(DeCryptStr,Length(DeCryptStr)-1);
        //ДЕШИФРОВКА:
        result:=result+chr(ord(s[1]) + i - 211543);
      end;
end;

function GetMyVersion: string;
type
  TVerInfo=packed record
    Nevazhno: array[0..47] of byte; // ненужные нам 48 байт
    Minor,Major,Build,Release: word; // а тут версия
  end;
var
  s: TResourceStream;
  v: TVerInfo;
begin
  result := '';
  try
    s := TResourceStream.Create(HInstance,'#1',RT_VERSION); // достаём ресурс
    if s.Size > 0 then
      begin
        s.Read(v, SizeOf(v)); // читаем нужные нам байты
        result := IntToStr(v.Major)+'.'+IntToStr(v.Minor)+'.'+ // вот и версия...
              IntToStr(v.Release)+'.'+IntToStr(v.Build);
      end;
    s.Free;
  except;
  end;
end;

function DelDir(dir: string): Boolean; 
var 
  fos: TSHFileOpStruct; 
begin 
  ZeroMemory(@fos, SizeOf(fos)); 
  with fos do 
  begin 
    wFunc  := FO_DELETE; 
    fFlags := FOF_SILENT or FOF_NOCONFIRMATION; 
    pFrom  := PChar(dir + #0); 
  end; 
  Result := (0 = ShFileOperation(fos)); 
end;

end.
