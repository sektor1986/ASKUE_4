unit UFormOpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, GridsEh, DBGridEh, StdCtrls, Buttons, sBitBtn,
  DBCtrls, Menus, sMemo, sBevel, pFIBQuery, QExport4, QExport4DBF,
  DBGridEhGrouping;

type
  massiv =  array of array of array of array of string;
  TFormOpr = class(TForm)
    sPanel1: TsPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    sBitBtn2: TsBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    sBitBtn1: TsBitBtn;
    sBevel1: TsBevel;
    procedure DelAddr;
    procedure DelRaz;
    procedure sBitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    function FormirMassiva():Boolean;
    procedure sBitBtn1Click(Sender: TObject);
  private
  public
    procedure StopTComThread;
    function FormirParamOpr():Boolean;
  end;

var
  FormOpr: TFormOpr;

implementation

uses Udm1, Udm2, UPassKoncSchit, UDeviceThread, Unit1, UFunction, UOptions;

{$R *.dfm}

{ TFormOpr }



{ TFormOpr }

procedure TFormOpr.DelAddr;
begin
  dm2.addresmain_konc.Delete;
end;

procedure TFormOpr.DelRaz;
begin
  dm2.addres_konc.Delete;
end;

procedure TFormOpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm2.transact.Active := false;
end;

function TFormOpr.FormirMassiva: Boolean;
var
  i, j, k, m: integer;
  flag: Boolean;
  flagvibora: Boolean;
  sql: TpFIBQuery;
begin
//------------------------------------------
//   massivOprosa - конфигурация опроса
//   x - номер опрашиваемого объекта
//   y - в зависимости от количества разъёмов (от 1 до 15)
//   z - в зависимости от количества счётчиков в разъёме (начиная с 1)
//   massivOprosa[x, 0, 0, 1] - адрес опрашиваемого объекта
//   massivOprosa[x, 0, 0, 2] - номер SIM карты концентратора
//   massivOprosa[x, 0, 0, 3] - пароль концентратора старый
//   massivOprosa[x, 0, 0, 4] - пароль счетчиков старый
//   massivOprosa[x, 0, 0, 5] - номер концентратора
//   massivOprosa[x, 0, 0, 6] - количество опрашиваемых счетчиков
//   massivOprosa[x, 0, 0, 7] - пароль концентратора новый
//   massivOprosa[x, 0, 0, 8] - пароль счетчиков новый
//   massivOprosa[x, 0, 0, 10] - IP адрес
//   massivOprosa[x, 0, 0, 11] - apn
//
//   massivOprosa[x, y, 0, 0] - название разъёма
//
//   massivOprosa[x, y, z, 0] - номер счётчика
//   massivOprosa[x, y, z, 1] - вариант тарификачии счётчика
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
  i := 0;
  flagvibora := false;
  Form1.Port.massivOprosa := nil;   //очистка массива
  Form1.massivOprosa := nil;
  with  dm2 do
  begin
    addresmain_konc.First;
    while not addresmain_konc.Eof do
      begin
        if (not addres_konc.IsEmpty) and (addresmain_koncPHONE.AsString <> '') then
        begin
        flag := false;
        SetLength(Form1.Port.massivOprosa, i+1);
        SetLength(Form1.Port.EnableVarTar, i+1);
        SetLength(Form1.Port.massivOprosa[i], 1);
        SetLength(Form1.Port.massivOprosa[i, 0], 1);
        SetLength(Form1.Port.massivOprosa[i, 0, 0], 14);
        SetLength(Form1.massivOprosa, i+1);
        SetLength(Form1.EnableVarTar, i+1);
        for m := 1 to 10 do
          begin
            Form1.Port.EnableVarTar[i].var_tar[m] := False;
            Form1.EnableVarTar[i].var_tar[m] := False;
          end;

        SetLength(Form1.massivOprosa[i], 1);
        SetLength(Form1.massivOprosa[i, 0], 1);
        SetLength(Form1.massivOprosa[i, 0, 0], 14);
        Form1.Port.massivOprosa[i, 0, 0, 0] := addresmain_koncTOWN.AsString;
        Form1.Port.massivOprosa[i, 0, 0, 1] := addresmain_koncADDR.AsString;
        Form1.Port.massivOprosa[i, 0, 0, 2] := addresmain_koncPHONE.AsString;
        Form1.Port.massivOprosa[i, 0, 0, 9] := addresmain_koncINC.AsString;
        Form1.Port.massivOprosa[i, 0, 0, 10] := addresmain_koncIP_ADDRES.AsString;
   //     Form1.Port.massivOprosa[i, 0, 0, 10] := '10.24.215.19';
        Form1.Port.massivOprosa[i, 0, 0, 11] := '"'+ Form1.sEdit15.Text +'", "'+ Form1.sEdit23.Text+ '", "'+ Form1.sEdit24.Text +'"' ;

        if (dm2.addresmain_koncREZHIM.AsInteger = 0) or (Form1.Port.flagModem = False) then
        begin
           Form1.Port.massivOprosa[i, 0, 0, 12] := 'CSD';
        end
        else
        begin
           Form1.Port.massivOprosa[i, 0, 0, 12] := 'GPRS';
        end;

        //Флаг, указывающий на необходимость повторного программирования на чтение
        Form1.Port.massivOprosa[i, 0, 0, 13] := '1';

        Form1.massivOprosa[i, 0, 0, 0] := Form1.Port.massivOprosa[i, 0, 0, 0];
        Form1.massivOprosa[i, 0, 0, 1] := Form1.Port.massivOprosa[i, 0, 0, 1];
        Form1.massivOprosa[i, 0, 0, 2] := Form1.Port.massivOprosa[i, 0, 0, 2];
        Form1.massivOprosa[i, 0, 0, 9] := Form1.Port.massivOprosa[i, 0, 0, 9];
        Form1.massivOprosa[i, 0, 0, 10] := Form1.Port.massivOprosa[i, 0, 0, 10];
        Form1.massivOprosa[i, 0, 0, 11] := Form1.Port.massivOprosa[i, 0, 0, 11];
        Form1.massivOprosa[i, 0, 0, 12] := Form1.Port.massivOprosa[i, 0, 0, 12];
        Form1.massivOprosa[i, 0, 0, 13] := Form1.Port.massivOprosa[i, 0, 0, 13];

        Form1.Port.massivOprosa[i, 0, 0, 3] := '000001';
        Form1.Port.massivOprosa[i, 0, 0, 4] := '000001';
        Form1.Port.massivOprosa[i, 0, 0, 7] := '000001';
        Form1.Port.massivOprosa[i, 0, 0, 8] := '000001';
        if Length(addresmain_koncTIME_.AsString) <> 6   then
          Form1.Port.massivOprosa[i, 0, 0, 5] := '000001'
        else
          Form1.Port.massivOprosa[i, 0, 0, 5] := addresmain_koncTIME_.AsString;
        Form1.massivOprosa[i, 0, 0, 3] := '000001';
        Form1.massivOprosa[i, 0, 0, 4] := '000001';
        Form1.massivOprosa[i, 0, 0, 7] := '000001';
        Form1.massivOprosa[i, 0, 0, 8] := '000001';
        Form1.massivOprosa[i, 0, 0, 5] := Form1.Port.massivOprosa[i, 0, 0, 5];
        //Определение количества счётчиков в адресе
        sql := TpFIBQuery.Create(nil);
        with sql do
        try
          Database := dm1.database;
          Transaction := dm1.database.DefaultTransaction;
          SQL.Text := 'select count (*) from tmp where cod in (select inc from addres where cod = ' + addresmain_koncINC.AsString + ')';
          ExecQuery;
          //Количество прашиваемых счетчиков
          Form1.Port.massivOprosa[i, 0, 0, 6] := FN('count').AsString;
          Form1.massivOprosa[i, 0, 0, 6] := Form1.Port.massivOprosa[i, 0, 0, 6];
        finally
          Free
        end;
        //****************************************
        //*****************************************
        addres_konc.First;
        j := 1;
        while not addres_konc.Eof do
          begin
            if not tmp_konc.IsEmpty then
            begin
              SetLength(Form1.Port.massivOprosa[i], j+1);
              SetLength(Form1.Port.massivOprosa[i, j], 1);
              SetLength(Form1.Port.massivOprosa[i, j, 0], 1);
              SetLength(Form1.massivOprosa[i], j+1);
              SetLength(Form1.massivOprosa[i, j], 1);
              SetLength(Form1.massivOprosa[i, j, 0], 1);
              Form1.Port.massivOprosa[i, j, 0, 0] := addres_koncSTREET.AsString;
              Form1.massivOprosa[i, j, 0, 0] := Form1.Port.massivOprosa[i, j, 0, 0];
              tmp_konc.First;
              k := 1;
              while not tmp_konc.Eof do
                begin
                  flag := true;
                  flagvibora := true;
                  //Проверка на нахождение в разъёме теплосчётчика ТЭМ-104
                  if tmp_koncSDF.AsInteger = 5 then
                    begin
                      SetLength(Form1.Port.massivOprosa[i, 0], 2);
                      SetLength(Form1.Port.massivOprosa[i, 0, 1], 2);
                      SetLength(Form1.massivOprosa[i, 0], 2);
                      SetLength(Form1.massivOprosa[i, 0, 1], 2);
                      Form1.Port.massivOprosa[i, 0, 1, 0] := tmp_koncNS.AsString;
                      Form1.Port.massivOprosa[i, 0, 1, 1] := Trim(Copy(addres_koncSTREET.AsString, Length(addres_koncSTREET.AsString)-1, 2));
                      Form1.massivOprosa[i, 0, 1, 0] := Form1.Port.massivOprosa[i, 0, 1, 0];
                      Form1.massivOprosa[i, 0, 1, 1] := Form1.Port.massivOprosa[i, 0, 1, 1];
                    end;

                  SetLength(Form1.Port.massivOprosa[i,j], k+1);
                  SetLength(Form1.Port.massivOprosa[i, j, k], 3);
                  SetLength(Form1.massivOprosa[i,j], k+1);
                  SetLength(Form1.massivOprosa[i, j, k], 3);
                  Form1.Port.massivOprosa[i, j, k, 0] := tmp_koncNS.AsString;
                  Form1.Port.massivOprosa[i, j, k, 1] := tmp_koncPHONE.AsString;
                  Form1.Port.massivOprosa[i, j, k, 2] := '0';
                  Form1.Port.EnableVarTar[i].var_tar[tmp_koncPHONE.AsInteger] := True;
                  Form1.EnableVarTar[i].var_tar[tmp_koncPHONE.AsInteger] := True;
                  Form1.massivOprosa[i, j, k, 0] := Form1.Port.massivOprosa[i, j, k, 0];
                  Form1.massivOprosa[i, j, k, 1] := Form1.Port.massivOprosa[i, j, k, 1];
                  Form1.massivOprosa[i, j, k, 2] := Form1.Port.massivOprosa[i, j, k, 2];
                  Inc(k);
                  tmp_konc.Next;
                end;
              addres_konc.Next;
              Inc(j);
            end
            else
              addres_konc.Next;
          end;
        addresmain_konc.Next;
        if flag then
          Inc(i);
        end
        else
          addresmain_konc.Next;
      end;
  end;
  if Length(Form1.Port.massivOprosa[i-1]) = 1 then     //Если в последней записи нет разъёмов, то удаляем её
    begin
      SetLength(Form1.Port.massivOprosa, i);
      SetLength(Form1.massivOprosa, i)
    end;

  Result := flagvibora;
end;



function TFormOpr.FormirParamOpr: Boolean;
function CRC(bufer: TBytes; nach, konec: integer): Byte;
  var
    l: Integer;
  begin
    Result := 0;
    for l := nach to konec do
      Result := Result + bufer[l]
  end;
var
  i: integer;
  j: Integer;
  k: integer;
  m: Integer;
  blodVarTar: TStrings;
  nomSez: Integer;
  procedure IncLengthParOprosa(j:integer);   //Процедура увеличения длины массива для параметров опроса
  begin
    SetLength(Form1.Port.ParOprosa[j], Length(Form1.Port.ParOprosa[j])+1);
    SetLength(Form1.ParOprosa[j], Length(Form1.ParOprosa[j])+1);
  end;
begin
  Form1.Port.ParOprosa := nil;
  Form1.ParOprosa := nil;
  SetLength(Form1.Port.ParOprosa, 11);
  SetLength(Form1.ParOprosa, 11);
  i := 0;

  IncLengthParOprosa(0);
  Form1.Port.ParOprosa[0, i] := 'F0008';
  Form1.ParOprosa[0, i] := Form1.Port.ParOprosa[0, i];
  Inc(i);

  if Form1.EditPassCounter then
    Form1.sCheckBox3.Checked := True;

  if Form1.sCheckBox3.Checked then
    begin
      IncLengthParOprosa(0);
      Form1.Port.ParOprosa[0, i] := '054032';
      Form1.ParOprosa[0, i] := Form1.Port.ParOprosa[0, i];
      Inc(i);
      dm2.sys_bd.Open;
      blodVarTar := TStringList.Create;
      for j := 1 to 10 do
        begin
          k := 0;
          blodVarTar.Clear;
          blodVarTar.Text := dm2.sys_bd.FBN('VarTar_' + IntToStr(j)).AsString;
          if blodVarTar.Count < 100 then
            Break;

          // Конфигурация сезона
          with Form1 do
            begin
              SetLength(KonfigWrite[j].konfig, 11);
              KonfigWrite[j].konfig[0] := StrToInt(blodVarTar.Strings[0]); //Количество сезонов
              KonfigWrite[j].konfig[1] := StrToInt(blodVarTar.Strings[1]); //Время вывода на дисплей
              KonfigWrite[j].konfig[2] := StrToInt(blodVarTar.Strings[2]); //Количество тарифов
              KonfigWrite[j].konfig[3] := 0;
              if blodVarTar.Strings[3] = '1'  then                          //Вывод времени
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $80;
              if blodVarTar.Strings[4] = '1'  then                          //Вывод тариф 1
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $40;
              if blodVarTar.Strings[5] = '1'  then                          //Вывод тариф 2
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $20;
              if blodVarTar.Strings[6] = '1'  then                          //Вывод тариф 3
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $10;
              if blodVarTar.Strings[7] = '1'  then                          //Вывод тариф 4
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $08;
              if blodVarTar.Strings[8] = '1'  then                          //Вывод суммарной энергии
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $04;
              if blodVarTar.Strings[9] = '1'  then                          //Вывод мощности
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $02;
              if blodVarTar.Strings[11] = '1'  then                          //даты
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $01;
              
              KonfigWrite[j].konfig[4] := 0;
              KonfigWrite[j].konfig[5] := StrToInt(Copy(blodVarTar.Strings[13], 4, 2));   // Лимит
              KonfigWrite[j].konfig[6] := StrToInt(Copy(blodVarTar.Strings[13], 1, 2));
              KonfigWrite[j].konfig[7] := StrToInt(blodVarTar.Strings[14]);               //К-во фиксированных дат
              KonfigWrite[j].konfig[8] := StrToInt(blodVarTar.Strings[15]);               //Признак перехода лето зима
              KonfigWrite[j].konfig[9] := StrToInt(blodVarTar.Strings[16]);               // Признак отключения нагрузки
              KonfigWrite[j].konfig[10] := CRC(KonfigWrite[j].konfig, 0, 9);  //Контрольная сумма
            end;
          with Form1.Port do
            begin
              SetLength(KonfigWrite[j].konfig, 11);
              KonfigWrite[j].konfig[0] := StrToInt(blodVarTar.Strings[0]); //Количество сезонов
              KonfigWrite[j].konfig[1] := StrToInt(blodVarTar.Strings[1]); //Время вывода на дисплей
              KonfigWrite[j].konfig[2] := StrToInt(blodVarTar.Strings[2]); //Количество тарифов
              KonfigWrite[j].konfig[3] := 0;
              if blodVarTar.Strings[3] = '1'  then                          //Вывод времени
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $80;
              if blodVarTar.Strings[4] = '1'  then                          //Вывод тариф 1
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $40;
              if blodVarTar.Strings[5] = '1'  then                          //Вывод тариф 2
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $20;
              if blodVarTar.Strings[6] = '1'  then                          //Вывод тариф 3
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $10;
              if blodVarTar.Strings[7] = '1'  then                          //Вывод тариф 4
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $08;
              if blodVarTar.Strings[8] = '1'  then                          //Вывод суммарной энергии
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $04;
              if blodVarTar.Strings[9] = '1'  then                          //Вывод мощности
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $02;
              if blodVarTar.Strings[11] = '1'  then                          //даты
                KonfigWrite[j].konfig[3] := KonfigWrite[j].konfig[3] or $01;

              KonfigWrite[j].konfig[4] := 0;
              KonfigWrite[j].konfig[5] := StrToInt(Copy(blodVarTar.Strings[13], 4, 2));   // Лимит
              KonfigWrite[j].konfig[6] := StrToInt(Copy(blodVarTar.Strings[13], 1, 2));
              KonfigWrite[j].konfig[7] := StrToInt(blodVarTar.Strings[14]);               //К-во фиксированных дат
              KonfigWrite[j].konfig[8] := StrToInt(blodVarTar.Strings[15]);               //Признак перехода лето зима
              KonfigWrite[j].konfig[9] := StrToInt(blodVarTar.Strings[16]);               // Признак отключения нагрузки
              KonfigWrite[j].konfig[10] := CRC(KonfigWrite[j].konfig, 0, 9);  //Контрольная сумма
            end;

          //Количество зон
          SetLength(Form1.Port.ParOprosa[j], 1);
          SetLength(Form1.ParOprosa[j], 1);
          Form1.Port.ParOprosa[j, k] := '0560' + IntToStr(StrToInt(blodVarTar.Strings[0])*3);
          Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
          Inc(k);

          with Form1 do
            begin
              SetLength(KonfigWrite[j].zone, StrToInt(blodVarTar.Strings[0])*3 + 1);  //Количестов сезонов * 3 + 1CRC
              for m := 0 to StrToInt(blodVarTar.Strings[0])- 1 do
                begin
                  KonfigWrite[j].zone[m*3] := StrToInt(blodVarTar.Strings[24 + m*3]);
                  KonfigWrite[j].zone[m*3+1] := StrToInt(blodVarTar.Strings[25 + m*3]);
                  KonfigWrite[j].zone[m*3+2] := StrToInt(blodVarTar.Strings[26 + m*3]);
                end;
              KonfigWrite[j].zone[Length(KonfigWrite[j].zone)-1] := CRC(KonfigWrite[j].zone, 0, Length(KonfigWrite[j].zone)-2);
            end;

          with Form1.Port do
            begin
              SetLength(KonfigWrite[j].zone, StrToInt(blodVarTar.Strings[0])*3 + 1);  //Количестов сезонов * 3 + 1CRC
              for m := 0 to StrToInt(blodVarTar.Strings[0])- 1 do
                begin
                  KonfigWrite[j].zone[m*3] := StrToInt(blodVarTar.Strings[24 + m*3]);
                  KonfigWrite[j].zone[m*3+1] := StrToInt(blodVarTar.Strings[25 + m*3]);
                  KonfigWrite[j].zone[m*3+2] := StrToInt(blodVarTar.Strings[26 + m*3]);
                end;
              KonfigWrite[j].zone[Length(KonfigWrite[j].zone)-1] := CRC(KonfigWrite[j].zone, 0, Length(KonfigWrite[j].zone)-2);
            end;

          //Фиксированные даты
          if blodVarTar.Strings[14] <> '0' then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '04C0' + IntTostr(StrToInt(blodVarTar.Strings[14])*4);
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
              Inc(k);
            end;

          with Form1 do
            begin
              SetLength(KonfigWrite[j].fixdate, StrToInt(blodVarTar.Strings[14])*4);  //Количестов фиксированных дат * 4
              for m := 0 to StrToInt(blodVarTar.Strings[14]) - 1 do
                begin
                  KonfigWrite[j].fixdate[m*4] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[360+m], 6, 2)))[0];
                  KonfigWrite[j].fixdate[m*4+1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[360+m], 3, 2)))[0];
                  KonfigWrite[j].fixdate[m*4+2] := Ord(blodVarTar.Strings[360+m][1]);
                  KonfigWrite[j].fixdate[m*4+3] := CRC( KonfigWrite[j].fixdate, m*4, m*4+2);
                end;
            end;
          with Form1.Port do
            begin
              SetLength(KonfigWrite[j].fixdate, StrToInt(blodVarTar.Strings[14])*4);  //Количестов фиксированных дат * 4
              for m := 0 to StrToInt(blodVarTar.Strings[14]) - 1 do
                begin
                  KonfigWrite[j].fixdate[m*4] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[360+m], 6, 2)))[0];
                  KonfigWrite[j].fixdate[m*4+1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[360+m], 3, 2)))[0];
                  KonfigWrite[j].fixdate[m*4+2] := Ord(blodVarTar.Strings[360+m][1]);
                  KonfigWrite[j].fixdate[m*4+3] := CRC( KonfigWrite[j].fixdate, m*4, m*4+2);
                end;
            end;

          IncLengthParOprosa(j);
          Form1.Port.ParOprosa[j, k] := '0000' + IntToStr(4 + (StrToInt(blodVarTar.Strings[24]) + StrToInt(blodVarTar.Strings[25]) + StrToInt(blodVarTar.Strings[26]))*4); //Сезон 1
          Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
          Inc(k);

          // Сезон 1
          nomSez := 1;
          with Form1.KonfigWrite[j] do
            begin
              SetLength(sezon1, 4);
              //Дата начала сезона
              sezon1[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
              sezon1[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
              sezon1[2] := $20;
              sezon1[3] := CRC(sezon1, 0, 2);
              for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                begin
                  SetLength(sezon1, Length(sezon1)+4);
                  sezon1[High(sezon1)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                  sezon1[High(sezon1)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                  sezon1[High(sezon1)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                  sezon1[High(sezon1)] := CRC(sezon1, High(sezon1)-3, High(sezon1)-1);
                end;
              for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                begin
                  SetLength(sezon1, Length(sezon1)+4);
                  sezon1[High(sezon1)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                  sezon1[High(sezon1)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                  sezon1[High(sezon1)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                  sezon1[High(sezon1)] := CRC(sezon1, High(sezon1)-3, High(sezon1)-1);
                end;
              for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                begin
                  SetLength(sezon1, Length(sezon1)+4);
                  sezon1[High(sezon1)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                  sezon1[High(sezon1)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                  sezon1[High(sezon1)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                  sezon1[High(sezon1)] := CRC(sezon1, High(sezon1)-3, High(sezon1)-1);
                end;
            end;
          with Form1.Port.KonfigWrite[j] do
            begin
              SetLength(sezon1, Length(Form1.KonfigWrite[j].sezon1));
              for m := 0 to High(sezon1) do
                sezon1[m] := Form1.KonfigWrite[j].sezon1[m];
            end;

          // Сезон 2
          if StrToInt(blodVarTar.Strings[0]) > 1 then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '0064' + IntToStr(4 + (StrToInt(blodVarTar.Strings[27]) + StrToInt(blodVarTar.Strings[28]) + StrToInt(blodVarTar.Strings[29]))*4); //Сезон 2
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
              Inc(k);



              nomSez := 2;
              with Form1.KonfigWrite[j] do
                begin
                  SetLength(sezon2, 4);
                  //Дата начала сезона
                  sezon2[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
                  sezon2[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
                  sezon2[2] := $20;
                  sezon2[3] := CRC(sezon2, 0, 2);
                  for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon2, Length(sezon2)+4);
                      sezon2[High(sezon2)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon2[High(sezon2)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon2[High(sezon2)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                      sezon2[High(sezon2)] := CRC(sezon2, High(sezon2)-3, High(sezon2)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon2, Length(sezon2)+4);
                      sezon2[High(sezon2)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon2[High(sezon2)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon2[High(sezon2)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                      sezon2[High(sezon2)] := CRC(sezon2, High(sezon2)-3, High(sezon2)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon2, Length(sezon2)+4);
                      sezon2[High(sezon2)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon2[High(sezon2)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon2[High(sezon2)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                      sezon2[High(sezon2)] := CRC(sezon2, High(sezon2)-3, High(sezon2)-1);
                    end;
                end;
              with Form1.Port.KonfigWrite[j] do
                begin
                  SetLength(sezon2, Length(Form1.KonfigWrite[j].sezon2));
                  for m := 0 to High(sezon2) do
                    sezon2[m] := Form1.KonfigWrite[j].sezon2[m];
                end;
            end;

          // Сезон 3
          if StrToInt(blodVarTar.Strings[0]) > 2 then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '00C8' + IntToStr(4 + (StrToInt(blodVarTar.Strings[30]) + StrToInt(blodVarTar.Strings[31]) + StrToInt(blodVarTar.Strings[32]))*4); //Сезон 3
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
              Inc(k);

              nomSez := 3;
              with Form1.KonfigWrite[j] do
                begin
                  SetLength(sezon3, 4);
                  //Дата начала сезона
                  sezon3[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
                  sezon3[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
                  sezon3[2] := $20;
                  sezon3[3] := CRC(sezon3, 0, 2);
                  for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon3, Length(sezon3)+4);
                      sezon3[High(sezon3)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon3[High(sezon3)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon3[High(sezon3)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                      sezon3[High(sezon3)] := CRC(sezon3, High(sezon3)-3, High(sezon3)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon3, Length(sezon3)+4);
                      sezon3[High(sezon3)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon3[High(sezon3)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon3[High(sezon3)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                      sezon3[High(sezon3)] := CRC(sezon3, High(sezon3)-3, High(sezon3)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon3, Length(sezon3)+4);
                      sezon3[High(sezon3)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon3[High(sezon3)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon3[High(sezon3)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                      sezon3[High(sezon3)] := CRC(sezon3, High(sezon3)-3, High(sezon3)-1);
                    end;
                end;
              with Form1.Port.KonfigWrite[j] do
                begin
                  SetLength(sezon3, Length(Form1.KonfigWrite[j].sezon3));
                  for m := 0 to High(sezon3) do
                    sezon3[m] := Form1.KonfigWrite[j].sezon3[m];
                end;
            end;

          // Сезон 4
          if StrToInt(blodVarTar.Strings[0]) > 3 then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '012C' + IntToStr(4 + (StrToInt(blodVarTar.Strings[33]) + StrToInt(blodVarTar.Strings[34]) + StrToInt(blodVarTar.Strings[35]))*4); //Сезон 4
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
              Inc(k);

              nomSez := 4;
              with Form1.KonfigWrite[j] do
                begin
                  SetLength(sezon4, 4);
                  //Дата начала сезона
                  sezon4[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
                  sezon4[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
                  sezon4[2] := $20;
                  sezon4[3] := CRC(sezon4, 0, 2);
                  for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon4, Length(sezon4)+4);
                      sezon4[High(sezon4)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon4[High(sezon4)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon4[High(sezon4)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                      sezon4[High(sezon4)] := CRC(sezon4, High(sezon4)-3, High(sezon4)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon4, Length(sezon4)+4);
                      sezon4[High(sezon4)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon4[High(sezon4)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon4[High(sezon4)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                      sezon4[High(sezon4)] := CRC(sezon4, High(sezon4)-3, High(sezon4)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon4, Length(sezon4)+4);
                      sezon4[High(sezon4)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon4[High(sezon4)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon4[High(sezon4)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                      sezon4[High(sezon4)] := CRC(sezon4, High(sezon4)-3, High(sezon4)-1);
                    end;
                end;
              with Form1.Port.KonfigWrite[j] do
                begin
                  SetLength(sezon4, Length(Form1.KonfigWrite[j].sezon4));
                  for m := 0 to High(sezon4) do
                    sezon4[m] := Form1.KonfigWrite[j].sezon4[m];
                end;
            end;

           // Сезон 5
          if StrToInt(blodVarTar.Strings[0]) > 4 then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '0190' + IntToStr(4 + (StrToInt(blodVarTar.Strings[36]) + StrToInt(blodVarTar.Strings[37]) + StrToInt(blodVarTar.Strings[38]))*4); //Сезон 5
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
              Inc(k);

              nomSez := 5;
              with Form1.KonfigWrite[j] do
                begin
                  SetLength(sezon5, 4);
                  //Дата начала сезона
                  sezon5[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
                  sezon5[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
                  sezon5[2] := $20;
                  sezon5[3] := CRC(sezon5, 0, 2);
                  for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon5, Length(sezon5)+4);
                      sezon5[High(sezon5)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon5[High(sezon5)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon5[High(sezon5)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                      sezon5[High(sezon5)] := CRC(sezon5, High(sezon5)-3, High(sezon5)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon5, Length(sezon5)+4);
                      sezon5[High(sezon5)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon5[High(sezon5)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon5[High(sezon5)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                      sezon5[High(sezon5)] := CRC(sezon5, High(sezon5)-3, High(sezon5)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon5, Length(sezon5)+4);
                      sezon5[High(sezon5)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon5[High(sezon5)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon5[High(sezon5)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                      sezon5[High(sezon5)] := CRC(sezon5, High(sezon5)-3, High(sezon5)-1);
                    end;
                end;
              with Form1.Port.KonfigWrite[j] do
                begin
                  SetLength(sezon5, Length(Form1.KonfigWrite[j].sezon5));
                  for m := 0 to High(sezon5) do
                    sezon5[m] := Form1.KonfigWrite[j].sezon5[m];
                end;
            end;

           // Сезон 6
          if StrToInt(blodVarTar.Strings[0]) > 5 then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '01F4' + IntToStr(4 + (StrToInt(blodVarTar.Strings[39]) + StrToInt(blodVarTar.Strings[40]) + StrToInt(blodVarTar.Strings[41]))*4); //Сезон 6
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
              Inc(k);

              nomSez := 6;
              with Form1.KonfigWrite[j] do
                begin
                  SetLength(sezon6, 4);
                  //Дата начала сезона
                  sezon6[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
                  sezon6[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
                  sezon6[2] := $20;
                  sezon6[3] := CRC(sezon6, 0, 2);
                  for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon6, Length(sezon6)+4);
                      sezon6[High(sezon6)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon6[High(sezon6)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon6[High(sezon6)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                      sezon6[High(sezon6)] := CRC(sezon6, High(sezon6)-3, High(sezon6)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon6, Length(sezon6)+4);
                      sezon6[High(sezon6)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon6[High(sezon6)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon6[High(sezon6)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                      sezon6[High(sezon6)] := CRC(sezon6, High(sezon6)-3, High(sezon6)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon6, Length(sezon6)+4);
                      sezon6[High(sezon6)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon6[High(sezon6)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon6[High(sezon6)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                      sezon6[High(sezon6)] := CRC(sezon6, High(sezon6)-3, High(sezon6)-1);
                    end;
                end;
              with Form1.Port.KonfigWrite[j] do
                begin
                  SetLength(sezon6, Length(Form1.KonfigWrite[j].sezon6));
                  for m := 0 to High(sezon6) do
                    sezon6[m] := Form1.KonfigWrite[j].sezon6[m];
                end;
            end;

          // Сезон 7
          if StrToInt(blodVarTar.Strings[0]) > 6 then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '0258' + IntToStr(4 + (StrToInt(blodVarTar.Strings[42]) + StrToInt(blodVarTar.Strings[43]) + StrToInt(blodVarTar.Strings[44]))*4); //Сезон 7
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
              Inc(k);

              nomSez := 7;
              with Form1.KonfigWrite[j] do
                begin
                  SetLength(sezon7, 4);
                  //Дата начала сезона
                  sezon7[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
                  sezon7[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
                  sezon7[2] := $20;
                  sezon7[3] := CRC(sezon7, 0, 2);
                  for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon7, Length(sezon7)+4);
                      sezon7[High(sezon7)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon7[High(sezon7)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon7[High(sezon7)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                      sezon7[High(sezon7)] := CRC(sezon7, High(sezon7)-3, High(sezon7)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon7, Length(sezon7)+4);
                      sezon7[High(sezon7)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon7[High(sezon7)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon7[High(sezon7)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                      sezon7[High(sezon7)] := CRC(sezon7, High(sezon7)-3, High(sezon7)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon7, Length(sezon7)+4);
                      sezon7[High(sezon7)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon7[High(sezon7)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon7[High(sezon7)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                      sezon7[High(sezon7)] := CRC(sezon7, High(sezon7)-3, High(sezon7)-1);
                    end;
                end;
              with Form1.Port.KonfigWrite[j] do
                begin
                  SetLength(sezon7, Length(Form1.KonfigWrite[j].sezon7));
                  for m := 0 to High(sezon7) do
                    sezon7[m] := Form1.KonfigWrite[j].sezon7[m];
                end;
            end;

          // Сезон 8
          if StrToInt(blodVarTar.Strings[0]) > 7 then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '02BC' + IntToStr(4 + (StrToInt(blodVarTar.Strings[45]) + StrToInt(blodVarTar.Strings[46]) + StrToInt(blodVarTar.Strings[47]))*4); //Сезон 8
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
              Inc(k);

              nomSez := 8;
              with Form1.KonfigWrite[j] do
                begin
                  SetLength(sezon8, 4);
                  //Дата начала сезона
                  sezon8[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
                  sezon8[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
                  sezon8[2] := $20;
                  sezon8[3] := CRC(sezon8, 0, 2);
                  for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon8, Length(sezon8)+4);
                      sezon8[High(sezon8)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon8[High(sezon8)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon8[High(sezon8)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                      sezon8[High(sezon8)] := CRC(sezon8, High(sezon8)-3, High(sezon8)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon8, Length(sezon8)+4);
                      sezon8[High(sezon8)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon8[High(sezon8)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon8[High(sezon8)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                      sezon8[High(sezon8)] := CRC(sezon8, High(sezon8)-3, High(sezon8)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon8, Length(sezon8)+4);
                      sezon8[High(sezon8)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon8[High(sezon8)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon8[High(sezon8)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                      sezon8[High(sezon8)] := CRC(sezon8, High(sezon8)-3, High(sezon8)-1);
                    end;
                end;
              with Form1.Port.KonfigWrite[j] do
                begin
                  SetLength(sezon8, Length(Form1.KonfigWrite[j].sezon8));
                  for m := 0 to High(sezon8) do
                    sezon8[m] := Form1.KonfigWrite[j].sezon8[m];
                end;
            end;

          // Сезон 9
          if StrToInt(blodVarTar.Strings[0]) > 8 then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '0320' + IntToStr(4 + (StrToInt(blodVarTar.Strings[48]) + StrToInt(blodVarTar.Strings[49]) + StrToInt(blodVarTar.Strings[50]))*4); //Сезон 9
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
              Inc(k);

              nomSez := 9;
              with Form1.KonfigWrite[j] do
                begin
                  SetLength(sezon9, 4);
                  //Дата начала сезона
                  sezon9[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
                  sezon9[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
                  sezon9[2] := $20;
                  sezon9[3] := CRC(sezon9, 0, 2);
                  for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon9, Length(sezon9)+4);
                      sezon9[High(sezon9)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon9[High(sezon9)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon9[High(sezon9)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                      sezon9[High(sezon9)] := CRC(sezon9, High(sezon9)-3, High(sezon9)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon9, Length(sezon9)+4);
                      sezon9[High(sezon9)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon9[High(sezon9)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon9[High(sezon9)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                      sezon9[High(sezon9)] := CRC(sezon9, High(sezon9)-3, High(sezon9)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon9, Length(sezon9)+4);
                      sezon9[High(sezon9)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon9[High(sezon9)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon9[High(sezon9)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                      sezon9[High(sezon9)] := CRC(sezon9, High(sezon9)-3, High(sezon9)-1);
                    end;
                end;
              with Form1.Port.KonfigWrite[j] do
                begin
                  SetLength(sezon9, Length(Form1.KonfigWrite[j].sezon9));
                  for m := 0 to High(sezon9) do
                    sezon9[m] := Form1.KonfigWrite[j].sezon9[m];
                end;
            end;

          // Сезон 10
          if StrToInt(blodVarTar.Strings[0]) > 9 then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '0384' + IntToStr(4 + (StrToInt(blodVarTar.Strings[51]) + StrToInt(blodVarTar.Strings[52]) + StrToInt(blodVarTar.Strings[53]))*4); //Сезон 10
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
              Inc(k);

              nomSez := 10;
              with Form1.KonfigWrite[j] do
                begin
                  SetLength(sezon10, 4);
                  //Дата начала сезона
                  sezon10[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
                  sezon10[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
                  sezon10[2] := $20;
                  sezon10[3] := CRC(sezon10, 0, 2);
                  for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon10, Length(sezon10)+4);
                      sezon10[High(sezon10)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon10[High(sezon10)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon10[High(sezon10)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                      sezon10[High(sezon10)] := CRC(sezon10, High(sezon10)-3, High(sezon10)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon10, Length(sezon10)+4);
                      sezon10[High(sezon10)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon10[High(sezon10)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon10[High(sezon10)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                      sezon10[High(sezon10)] := CRC(sezon10, High(sezon10)-3, High(sezon10)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon10, Length(sezon10)+4);
                      sezon10[High(sezon10)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon10[High(sezon10)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon10[High(sezon10)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                      sezon10[High(sezon10)] := CRC(sezon10, High(sezon10)-3, High(sezon10)-1);
                    end;
                end;
              with Form1.Port.KonfigWrite[j] do
                begin
                  SetLength(sezon10, Length(Form1.KonfigWrite[j].sezon10));
                  for m := 0 to High(sezon10) do
                    sezon10[m] := Form1.KonfigWrite[j].sezon10[m];
                end;
            end;

          // Сезон 11
          if StrToInt(blodVarTar.Strings[0]) > 10 then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '03E8' + IntToStr(4 + (StrToInt(blodVarTar.Strings[54]) + StrToInt(blodVarTar.Strings[55]) + StrToInt(blodVarTar.Strings[56]))*4); //Сезон 11
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
              Inc(k);

              nomSez := 11;
              with Form1.KonfigWrite[j] do
                begin
                  SetLength(sezon11, 4);
                  //Дата начала сезона
                  sezon11[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
                  sezon11[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
                  sezon11[2] := $20;
                  sezon11[3] := CRC(sezon11, 0, 2);
                  for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon11, Length(sezon11)+4);
                      sezon11[High(sezon11)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon11[High(sezon11)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon11[High(sezon11)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                      sezon11[High(sezon11)] := CRC(sezon11, High(sezon11)-3, High(sezon11)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon11, Length(sezon11)+4);
                      sezon11[High(sezon11)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon11[High(sezon11)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon11[High(sezon11)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                      sezon11[High(sezon11)] := CRC(sezon11, High(sezon11)-3, High(sezon11)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon11, Length(sezon11)+4);
                      sezon11[High(sezon11)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon11[High(sezon11)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon11[High(sezon11)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                      sezon11[High(sezon11)] := CRC(sezon11, High(sezon11)-3, High(sezon11)-1);
                    end;
                end;
              with Form1.Port.KonfigWrite[j] do
                begin
                  SetLength(sezon11, Length(Form1.KonfigWrite[j].sezon11));
                  for m := 0 to High(sezon11) do
                    sezon11[m] := Form1.KonfigWrite[j].sezon11[m];
                end;
            end;

          // Сезон 12
          if StrToInt(blodVarTar.Strings[0]) > 11 then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '044C' + IntToStr(4 + (StrToInt(blodVarTar.Strings[57]) + StrToInt(blodVarTar.Strings[58]) + StrToInt(blodVarTar.Strings[59]))*4); //Сезон 12
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];

              nomSez := 12;
              with Form1.KonfigWrite[j] do
                begin
                  SetLength(sezon12, 4);
                  //Дата начала сезона
                  sezon12[0] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 4, 2)))[0];
                  sezon12[1] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+(nomSez-1)*25], 1, 2)))[0];
                  sezon12[2] := $20;
                  sezon12[3] := CRC(sezon12, 0, 2);
                  for m := 1 to (StrToInt(blodVarTar.Strings[24+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon12, Length(sezon12)+4);
                      sezon12[High(sezon12)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon12[High(sezon12)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[60+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon12[High(sezon12)-1] := Ord(blodVarTar.Strings[60+m+(nomSez-1)*25][2]);
                      sezon12[High(sezon12)] := CRC(sezon12, High(sezon12)-3, High(sezon12)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[25+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon12, Length(sezon12)+4);
                      sezon12[High(sezon12)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon12[High(sezon12)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[68+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon12[High(sezon12)-1] := Ord(blodVarTar.Strings[68+m+(nomSez-1)*25][2]);
                      sezon12[High(sezon12)] := CRC(sezon12, High(sezon12)-3, High(sezon12)-1);
                    end;
                  for m := 1 to (StrToInt(blodVarTar.Strings[26+(nomSez-1)*3])) do
                    begin
                      SetLength(sezon12, Length(sezon12)+4);
                      sezon12[High(sezon12)-3] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 7, 2)))[0];
                      sezon12[High(sezon12)-2] := NumStrToBCD(Pchar(Copy(blodVarTar.Strings[76+m+(nomSez-1)*25], 4, 2)))[0];
                      sezon12[High(sezon12)-1] := Ord(blodVarTar.Strings[76+m+(nomSez-1)*25][2]);
                      sezon12[High(sezon12)] := CRC(sezon12, High(sezon12)-3, High(sezon12)-1);
                    end;
                end;
              with Form1.Port.KonfigWrite[j] do
                begin
                  SetLength(sezon12, Length(Form1.KonfigWrite[j].sezon12));
                  for m := 0 to High(sezon12) do
                    sezon12[m] := Form1.KonfigWrite[j].sezon12[m];
                end;
            end;

          if Form1.sCheckBox11.Checked and (blodVarTar.Strings[385] = '1') then
            begin
              IncLengthParOprosa(j);
              Form1.Port.ParOprosa[j, k] := '8000' + Form1.sSpinEdit1.Text;
              Form1.ParOprosa[j, k] := Form1.Port.ParOprosa[j, k];
            end;
        end;
      dm2.sys_bd.Close;
    end;

  if Form1.EditPassCounter then
    begin
      Result := True;
      Exit;
    end;

  if Form1.sCheckBox4.Checked then
    begin
      IncLengthParOprosa(0);
      Form1.Port.ParOprosa[0, i] := '05A068';
      Form1.ParOprosa[0, i] := Form1.Port.ParOprosa[0, i];
      Inc(i);
    end;

  if Form1.sCheckBox5.Checked then
    begin
      IncLengthParOprosa(0);
      Form1.Port.ParOprosa[0, i] := '05F012';
      Form1.ParOprosa[0, i] := Form1.Port.ParOprosa[0, i];
      Inc(i);
    end;

  if Form1.sCheckBox6.Checked then
    begin
      IncLengthParOprosa(0);
      Form1.Port.ParOprosa[0, i] := '060065';
      Form1.ParOprosa[0, i] := Form1.Port.ParOprosa[0, i];
      Inc(i);
    end;

  if Form1.sCheckBox7.Checked then
    begin
      IncLengthParOprosa(0);
      Form1.Port.ParOprosa[0, i] := '064165';
      Form1.ParOprosa[0, i] := Form1.Port.ParOprosa[0, i];
      Inc(i);
    end;

  if Form1.sCheckBox8.Checked then
    begin
      IncLengthParOprosa(0);
      Form1.Port.ParOprosa[0, i] := '068265';
      Form1.ParOprosa[0, i] := Form1.Port.ParOprosa[0, i];
      Inc(i);
    end;

  if Form1.sCheckBox9.Checked then
    begin
      IncLengthParOprosa(0);
      Form1.Port.ParOprosa[0, i] := '06C365';
      Form1.ParOprosa[0, i] := Form1.Port.ParOprosa[0, i];
      Inc(i);
    end;

  if Form1.sCheckBox10.Checked then
    begin
      SetLength(Form1.Port.ParOprosa[0], Length(Form1.Port.ParOprosa[0])+3);
      SetLength(Form1.ParOprosa[0], Length(Form1.ParOprosa[0])+3);
      Form1.Port.ParOprosa[0, i] := '072060';
      Form1.ParOprosa[0, i] := Form1.Port.ParOprosa[0, i];
      Inc(i);
      Form1.Port.ParOprosa[0, i] := '075C60';
      Form1.ParOprosa[0, i] := Form1.Port.ParOprosa[0, i];
      Inc(i);
      Form1.Port.ParOprosa[0, i] := '079860';
      Form1.ParOprosa[0, i] := Form1.Port.ParOprosa[0, i];
    end;
  Result := true;
end;

procedure TFormOpr.MenuItem1Click(Sender: TObject);
begin
  try
    dm2.tmp_konc.Delete;
  finally

  end;
end;

procedure TFormOpr.N1Click(Sender: TObject);
begin
  try
    DelAddr;
  except
    ShowMessage('Ошибка при удалении адреса!');
  end;
end;

procedure TFormOpr.N2Click(Sender: TObject);
begin
  try
    DelRaz;
  except
    ShowMessage('Ошибка при удалении разъёма!');
  end;
end;

procedure TFormOpr.sBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormOpr.sBitBtn2Click(Sender: TObject);
begin
  try
    Form1.Port := TDeviceThread.Create(true);
    Form1.Port.FreeOnTerminate := true;
    Form1.Port.flagTolkoChtenie := false;
    Form1.flagTolkoChtenie := false;
    if (Form1.sBitBtn51.Tag = 3) then
    begin
      Form1.Port.flagModem := False;
      Form1.Port.flagWrite := True;
    end
    else
    begin
      Form1.Port.flagModem := Form1.sCheckBox2.Checked;
      Form1.Port.flagWrite := (Form1.sBitBtn51.Tag = 1);

      if Form1.sCheckBox14.Checked = False then
      begin
        Form1.Port.flagSetGPRSApn := False;
      end
      else
      begin
        Form1.Port.flagSetGPRSApn := True;
      end;

    end;
    Form1.Port.flagSchitivatel := (Form1.sBitBtn51.Tag = 4);

    Form1.Port.flagSecondRead := FormOptions.schkSecondRead.Checked;

    FormirParamOpr;
    if FormirMassiva then
    begin
    FormPassKonsSchit.Show;
    dm2.transact.RollbackRetaining;
    end;
  except
    if Application.MessageBox('Ошибка при формировании буфера опроса!', 'Ошибка!', MB_RETRYCANCEL + MB_ICONWARNING) = 4 then
      sBitBtn2Click(self);
    StopTComThread;                         //Завершение потока
  end;
end;

procedure TFormOpr.StopTComThread;
begin
  Form1.Port.stop := true;
  Form1.Port.Priority := tpHigher;
  Form1.Port.Resume;
end;

end.
