unit Excel;
interface

uses //f,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtnrs, StdCtrls, activex, comobj, Db, Grids, DBGrids, DBCtrls, ComCtrls, Menus, Buttons, ExtCtrls, query,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, Variants, Mask, IniFiles,
  DBGridEh, DBCtrlsEh, DBLookupEh, FIBQuery, pFIBQuery;

type
  TFormDLL1 = class(TForm)
    Notebook1: TNotebook;
    Label5: TLabel;
    Label6: TLabel;
    BalButton1: TButton;
    Memo_tar_nak_summ: TMemo;
    Memo_tar_nak_kvart: TMemo;
    Memo_mes_pot_kvart: TMemo;
    NacMesac: TDateTimePicker;
    BalButton3: TBitBtn;
    tekMesac: TDateTimePicker;
    BalanceMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SaveDialog1: TSaveDialog;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Button1: TButton;
    BalButton2: TButton;
    LogMemo: TRichEdit;
    ProgressBar1: TProgressBar;
    Memo_mes_pot_summ: TMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    konSrok: TDateTimePicker;
    nacSrok: TDateTimePicker;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    editId: TEdit;
    nacSrokposl: TComboBox;
    konSrokposl: TComboBox;
    Label4: TLabel;
    Label7: TLabel;
    mm1: TDateTimePicker;
    mm2: TDateTimePicker;
    graph: TCheckBox;
    Button2: TButton;
    Button3: TButton;
    IBDatabase2: TpFIBDatabase;
    Qkv_konfig_arh: TpFIBDataSet;
    Qkv_konfig_arh_z: TpFIBDataSet;
    select_kvart: TpFIBDataSet;
    bal_summ: TpFIBDataSet;
    transact: TpFIBTransaction;
    bal_kvart: TpFIBDataSet;
    DataSource3: TDataSource;
    DataSource2: TDataSource;
    Label8: TLabel;
    SobstPotr: TMaskEdit;
    transact2: TpFIBTransaction;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    pFIBQuery1: TpFIBQuery;
    procedure BalButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure nacSrokChange(Sender: TObject);
    procedure konSrokChange(Sender: TObject);
    procedure BalButton2Click(Sender: TObject);
    procedure BalButton3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    //    procedure Button4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Balance_Period;
    procedure Qkv_konfig_arh_zapros_summ;
    procedure Qkv_konfig_arh_zapros_kvart;
    procedure Button2Click(Sender: TObject);
    procedure ExcelGraph(ExcelApp_, WorkBook_: variant; column1, column2: string; kind, period: integer);
    procedure DateAndTime(dt1, dt2: string);
    procedure DateAskueToData(str: string; var dat: TDateTimePicker);
  private
    { Private declarations }
  public
    //   s_summ,s_kvart:string;
        { Public declarations }
  end;

var
  FormDLL1: TFormDLL1;
  now, prom: TDate;
  nowDay, nowMonth, nowYear, konSrokDay, konSrokMonth, konSrokYear: word;
  nacSrokDay, nacSrokMonth, nacSrokYear: word;
  dat: string;
  exit_bal: boolean;
  ArrayData: variant;
  formatSettings: TFormatSettings;
  //    ExcelApp,WorkBook,Range,Cell1,Cell2,cell3,ArrayData:variant;
  //  bal_summ,bal_kvart:TIBQuery;

  //  Memo1:TMEMO;
implementation

{$R *.DFM}

procedure NotReaded3x; // Если 3-фазный не считан
begin
  ArrayData[1, 5] := 0;
  ArrayData[1, 6] := 0;
  ArrayData[1, 7] := 0;
  ArrayData[1, 8] := 0;
  ArrayData[1, 10] := 0;
  ArrayData[1, 11] := 0;
  ArrayData[1, 12] := 0;
  ArrayData[1, 13] := 0;
  ArrayData[1, 16] := 0;
  ArrayData[1, 17] := 0;
  ArrayData[1, 18] := 0;
  ArrayData[1, 19] := 0;
  ArrayData[1, 20] := '-----------------';
end;

procedure NotReaded1x(tmp: integer); // Если 1-фазный не считан
begin
  ArrayData[tmp, 5] := 0;
  ArrayData[tmp, 6] := 0;
  ArrayData[tmp, 7] := 0;
  ArrayData[tmp, 8] := 0;
  ArrayData[tmp, 10] := 0;
  ArrayData[tmp, 11] := 0;
  ArrayData[tmp, 12] := 0;
  ArrayData[tmp, 13] := 0;
  ArrayData[tmp, 16] := 0;
  ArrayData[tmp, 17] := 0;
  ArrayData[tmp, 18] := 0;
  ArrayData[tmp, 19] := 0;

  ArrayData[tmp, 20] := '-----------------';
end;

function Get_Date(str_date: string): TDate;
var
  u: 8..16;
  sd: string;
begin
  sd := '';
  for u := 8 to 15 do
    sd := sd + str_date[u];
  // ShowMessage(sd);
  Get_Date := StrToDate(sd);
end;

function Encode_Date(yy, mm, dd: word): string;
begin
  Encode_Date := IntToStr(dd) + '.' + IntToStr(mm) + '.' + IntToStr(yy);
end;

function IsOleObjectInstalled(Name: string): boolean;
var
  ClassId: TCLSID;
  Rez: HRESULT;
begin
  Rez := CLSIDFromProgID(PWideChar(WideString(Name)), ClassID);
  if Rez = S_OK then
    Result := true
  else
    Result := false;
end;

function opr(mes_: word): string;
begin
  case mes_ of
    0: opr := 'декабрь';
    1: opr := 'январь';
    2: opr := 'февраль';
    3: opr := 'март';
    4: opr := 'апрель';
    5: opr := 'май';
    6: opr := 'июнь';
    7: opr := 'июль';
    8: opr := 'август';
    9: opr := 'сентябрь';
    10: opr := 'октябрь';
    11: opr := 'ноябрь';
    12: opr := 'декабрь';
  end;
end;

function zagolDate(mes1, mes2: word): string;
var
  me1, me2: string;
begin
  me1 := opr(mes1);
  me2 := opr(mes2 - 1);
  if (mes2 - mes1 = 1) or (mes2 - mes1 = -11) then
    zagolDate := me1
  else
    zagolDate := me1 + '-' + me2;
end;

procedure TFormDLL1.BalButton1Click(Sender: TObject);
label
  metka1, nescitan1x, nescitan3x;
var
  ExcelApp, WorkBook, Range, Cell1, Cell2, cell3 {,ArrayData}: variant;
  TmplateFile: string;
  BeginCol, BeginRow, i, j, PorNomer: integer;
  RowCount, ColCount: Integer;
  kolSumScet, kolvo: integer;
  SumScet, kvartScet, nomerSumm: integer;
  tmp: integer;
  kt: integer; //коэффициент трансформации
  stroka: string;
  ItogoPoDomu, BalansPoDomu, PotrSumm: array[1..6] of string;
  izmenNom: boolean;
  nomDay, nomMonth, nomYear: word;
  tmp1: real;
  promSumm, promSummAll: array[1..5] of real;
  ColorCell: byte; //цвет ячеек для итого
  kol3x, kol1x: integer;
  kolscetProgressbar: integer; //количество счётчиков для прогрессбара
  tmpstroka: string; //Временная строка
  kolicmesacev: byte; //количество месяцев, за которые строится баланс
  NotRead: boolean; // true-счётчик не считан
  //    tmp081106,tmp081106_2:string;
  columnbal1, columnbal2: string; // для построения гистограммы
  tmp6_02_07: integer;
  Not_Readed_Of_date: boolean; // Проверка того, считан ли счётчик. Если не считан, поля заполняются '----------'
  i_not_readed, lengthSumScet: integer;
begin
  NotRead := false;
  //ProgressBar1.Position:=0;
  ProgressBar1.Position := 15;
  BalButton1.Enabled := false;
  BalButton3.Enabled := false;
  columnbal1 := '';
  columnbal2 := '';
  kol1x := 0;
  ColorCell := 15;
  exit_bal := false;
  ExcelApp := Null;
  nomDay := 1;
  LogMemo.Lines.Clear;
  LogMemo.SelAttributes.Color := clBlack;
  LogMemo.Lines.Add('Идёт построение баланса...');
  Application.ProcessMessages;
  IBDatabase2.Connected := true;

  now := konSrok.Date;

  DecodeDate(now, konSrokYear, konSrokMonth, konSrokDay);
  DecodeDate(now, nomYear, nomMonth, nomDay);
  now := nacSrok.Date;
  if nacSrok.Date <= konSrok.Date then
  begin
    DecodeDate(now, nacSrokYear, nacSrokMonth, nacSrokDay);

    bal_summ.Open;
    bal_summ.First;

    stroka := bal_summ.FieldByName('TIME_SUMM_NS').asString;
    if (stroka <> '') and (stroka <> 'Нет') and (stroka <> 'Нет информации') and (stroka <> 'Пусто') then
      prom := get_date(stroka)
    else
    begin
      LogMemo.SelAttributes.Color := clRed;
      LogMemo.Lines.Add('Построение баланса невозможно');
      Application.ProcessMessages;
      LogMemo.SelAttributes.Color := clRed;
      LogMemo.Lines.Add('В базе данных не содержится информация о суммирующем счётчике ' +
        bal_summ.FieldByName('SUMM_NS').asString);
      LogMemo.SelAttributes.Color := clRed;
      LogMemo.Lines.Add(' Заново проведите опрос счётчика');
      Application.ProcessMessages;
      //    bal_summ.Close;
          //exit_bal:=true;
      prom := Date;
      NotRead := true;
    end;

    if exit_bal = true then
      goto metka1;
    if prom < konSrok.date then
    begin
      LogMemo.SelAttributes.Color := clRed;
      LogMemo.Lines.Add('Данные за этот срок не содержатся в базе данных');
      Application.ProcessMessages;

      bal_summ.Close;
      goto metka1;
    end;
    //проверка того, введен ли срок, не превышающий год
    prom := StrToDate(Encode_Date(konSrokYear - 1, konSrokMonth, konSrokDay));
    //  if ProgressBar1.Position<70 then   ProgressBar1.StepIt;//ProgressBar1.StepIt
    if (nacSrok.Date < prom) then
    begin
      LogMemo.SelAttributes.Color := clRed;
      LogMemo.Lines.Add('Данные за этот срок не содержатся в базе данных');
      Application.ProcessMessages;

      bal_summ.Close;
      goto metka1;
    end;
    bal_kvart.Open;
    //   if ProgressBar1.Position<70 then    ProgressBar1.StepIt;//ProgressBar1.StepIt
    if not IsOleObjectInstalled('Excel.Application') then
    begin
      LogMemo.SelAttributes.Color := clRed;
      LogMemo.Lines.Add('Построение баланса невозможно.Установите Excel');
      Application.ProcessMessages;
    end
    else
    begin
      SumScet := 11;
      kvartScet := 13;
      BeginCol := 1;
      BeginRow := 13;
      ColCount := 21;
      bal_summ.Last;
      kolSumScet := bal_summ.RecordCount;
      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.Application.EnableEvents := false;
      WorkBook := ExcelApp.WorkBooks.Add(ExtractFilePath(Application.ExeName) + 'balance.xls');
      // ExcelApp.Visible:=true;//#########################################

      for i := 1 to 5 do
      begin
        ItogoPoDomu[i] := '=';
        BalansPoDomu[i] := '=(';
      end;
      ItogoPoDomu[6] := '=';
      kolvo := 0;
      bal_summ.First;
      try
        kt := bal_summ.FieldByName('KT').asInteger;
      except
        kt := 1;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Для суммирующего счётчика ' + bal_summ.FieldByName('SUMM_NS').asString +
          ' не введён коэффициент трансформации');
        LogMemo.Lines.Add('Построение правильного баланса невозможно');
        Application.ProcessMessages;

      end;
      WorkBook.WorkSheets[1].Cells[5, 1].value := bal_kvart.FieldByName('ADDR').asString;
      WorkBook.WorkSheets[1].Cells[3, 4].value := bal_kvart.FieldByName('ADDR').asString;
      WorkBook.WorkSheets[1].Cells[7, 6].value := DateToStr(nacSrok.Date);
      WorkBook.WorkSheets[1].Cells[7, 11].value := DateToStr(konSrok.Date);
      WorkBook.WorkSheets[1].Cells[7, 16].value := zagolDate(nacSrokMonth, konSrokMonth);
      memo_Tar_nak_summ.lines.Clear;
      memo_Tar_nak_summ.lines.add(bal_summ.FieldByName('Tar_nak').asString);

      memo_Mes_pot_summ.lines.Clear;
      memo_Mes_pot_summ.lines.add(bal_summ.FieldByName('Mes_pot').asString);
      //     if ProgressBar1.Position<70 then    ProgressBar1.StepIt;//ProgressBar1.StepIt

      while not bal_summ.EOF do
      begin
        NotRead := false;
        Not_Readed_Of_date := false;
        try
          kt := bal_summ.FieldByName('KT').asInteger;
        except
          kt := 1;
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Для суммирующего счётчика ' + bal_summ.FieldByName('SUMM_NS').asString +
            ' не введён коэффициент трансформации');
          LogMemo.Lines.Add('Построение правильного баланса невозможно');
          Application.ProcessMessages;

        end;

        kolvo := kolvo + 1;
        if kolvo > 1 then
        begin
          SumScet := SumScet + RowCount + 8;
          kvartScet := kvartScet + RowCount + 8;
          BeginRow := BeginRow + RowCount + 8;
        end;
        columnbal1 := columnbal1 + 'd' + IntToStr(kvartScet) + ':'; // ряд для гистограммы
        columnbal2 := columnbal2 + 'i' + IntToStr(kvartScet) + ':'; // ряд для гистограммы

        //данные с суммирующего счётчика
        ArrayData := VarArrayCreate([1, 1, 1, ColCount], varVariant);
        ArrayData[1, 1] := '-'; //поле № п/п в excel
        ArrayData[1, 2] := '-'; //поле квартира в excel
        try
          ArrayData[1, 3] := bal_summ.FieldByName('SUMM_NS').asString; //поле номер счётчика в excel
          stroka := bal_summ.FieldByName('TIME_SUMM_NS').asString;
          Delete(stroka, 1, 7);
          Delete(stroka, 9, 6);
          ArrayData[1, 20] := stroka;
        except
          LogMemo.Lines.add('Ошибка');
        end;
        memo_Tar_nak_summ.lines.Clear;
        memo_Tar_nak_summ.lines.add(bal_summ.FieldByName('Tar_nak').asString);

        memo_Mes_pot_summ.lines.Clear;
        memo_Mes_pot_summ.lines.add(bal_summ.FieldByName('Mes_pot').asString);
        //     nomMonth:=konSrokMonth;
        //  ExcelApp.Visible:=true;
        stroka := bal_summ.FieldByName('TIME_SUMM_NS').asString;
        if (stroka <> '') and (stroka <> 'Нет') and (stroka <> 'Пусто') then
          prom := get_date(stroka)
        else
        begin
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('В базе данных не содержится информация о суммирующем счётчике ' +
            bal_summ.FieldByName('SUMM_NS').asString);
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Построение баланса невозможно');
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Заново проведите опрос счётчика');
          Application.ProcessMessages;
          //         bal_summ.Close;
          NotRead := true;
        end;
        if exit_bal = true then
          goto metka1;
        //       prom:=get_date(stroka);
        if prom < konSrok.Date then
        begin
          //         LogMemo.Visible:=true;
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Построение правильного баланса невозможно');
          Application.ProcessMessages;
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Суммирующий счётчик ' + ArrayData[1, 3] + ' считан ' + DateToStr(prom));
          //         Application.ProcessMessages;
          LogMemo.SelAttributes.Color := clBlack;
          Not_Readed_Of_date := true;
        end;
        Bal_kvart.Last;
        RowCount := bal_kvart.RecordCount;
        if Not_Readed_Of_date = true then
        begin
          for i_not_readed := 4 to 19 do
            if i_not_readed <> 14 then
              ArrayData[1, i_not_readed] := '-----------';
        end
        else
        begin
          if (konSrokMonth > nacSrokMonth) then
            kolicmesacev := konSrokMonth - nacsrokmonth
          else //$$$$$$$$$$$$$$$$
            kolicmesacev := konSrokMonth - 1 + nacSrokMonth - 11;
          if NotRead = true then
          begin
            NotReaded3x;
            goto nescitan3x;
          end;
          for j := 5 to 8 do
          begin
            DecodeDate(prom, nomYear, nomMonth, nomDay);
            //показания на 1-ое число текущего месяца
            if (bal_summ.FieldByName('ADDR').asString <> '2') and (bal_summ.FieldByName('ADDR').asString <> '3') then
              //если трёхфазник старый
            begin
              try
                if ((memo_Tar_nak_summ.lines[j - 5] = '') or (memo_Tar_nak_summ.Lines[j - 1] = '')) then
                  tmp1 := 0
                else
                  tmp1 := (StrToFloat(memo_Tar_nak_summ.lines[j - 5]) - StrToFloat(memo_Tar_nak_summ.Lines[j - 1])) *
                    kt;
              except
                tmp1 := 10000;
                LogMemo.SelAttributes.Color := clRed;
                LogMemo.Lines.Add('При считывании суммирующего счётчика ' + ArrayData[1, 3] + ' произошла ошибка ');
                Application.ProcessMessages;
              end;

              while nomMonth <> konSrokMonth do //%%%%%%%%%%%%%%поменял > на <>
              begin
                dec(nomMonth);
                if nomMonth <= 0 then
                begin
                  nomMonth := nomMonth + 12;
                  dec(nomYear);
                end;
                try
                  if memo_Mes_pot_summ.Lines[13 * (j - 5) + nomMonth - 1] = '' then
                    tmp1 := 0
                  else
                    tmp1 := tmp1 - StrToFloat(memo_Mes_pot_summ.Lines[13 * (j - 5) + nomMonth - 1]) * kt;
                except
                  tmp1 := tmp1 - 1;
                  LogMemo.SelAttributes.Color := clRed;
                  LogMemo.Lines.Add('При считывании суммирующего счётчика ' + ArrayData[1, 3] + ' произошла ошибка ');
                  Application.ProcessMessages;
                end;
              end;
              if tmp1 < 0.0001 then
                tmp1 := 0;
              ArrayData[1, j + 5] := tmp1;

            end //if bal_summ.FieldByName('ADDR').....
            else
            begin //Если трёхфазник новый(Вместо помесячного потребления новые счётчики показывают показания на первое число месяца)
              try
                if konSrokMonth - 2 < 0 then
                begin
                  if memo_Mes_pot_summ.Lines[13 * (j - 5) + 11] = '' then
                    tmp1 := 0
                  else
                    tmp1 := StrToFloat(memo_Mes_pot_summ.Lines[13 * (j - 5) + 11]) * kt
                    // 03.01.07 11- поле декабря(показание на 1-ое число января)
                end
                else
                begin
                  if memo_Mes_pot_summ.Lines[13 * (j - 5) + konSrokMonth - 2] = '' then
                    tmp1 := 0
                  else
                    tmp1 := StrToFloat(memo_Mes_pot_summ.Lines[13 * (j - 5) + konSrokMonth - 2]) * kt;
                  // 3.08.06 Заменил -1 на -2, т. к. в ячейке июля помесячного потребления находится показание счётчика на 1.08
                end
              except
                tmp1 := 10000;
                LogMemo.SelAttributes.Color := clRed;
                LogMemo.Lines.Add('При считывании суммирующего счётчика ' + ArrayData[1, 3] + ' произошла ошибка ');
                Application.ProcessMessages;
              end;
              //           if konSrokMonth<>nomMonth then tmp1:=tmp1-StrToFloat(memo_Mes_pot_summ.Lines[13*(j-5)+konSrokMonth-1])*kt
              ArrayData[1, j + 5] := tmp1;
              //           ShowMessage('22');
            end;
            //показания на 1-ое число  прошедшего месяца
            if (bal_summ.FieldByName('ADDR').asString <> '2') and (bal_summ.FieldByName('ADDR').asString <> '3') then
              //если трёхфазник старый
            begin
              DecodeDate(prom, nomYear, nomMonth, nomDay);
              nomMonth := konSrokMonth - 1;
              if nomMonth <= 0 then
              begin
                nomMonth := 12;
                dec(NomYear);
              end;
              try
                if memo_Mes_pot_summ.Lines[13 * (j - 5) + nomMonth - 1] = '' then
                  ArrayData[1, j] := ArrayData[1, j + 5]
                else
                  ArrayData[1, j] := ArrayData[1, j + 5] - StrToFloat(memo_Mes_pot_summ.Lines[13 * (j - 5) + nomMonth -
                    1]) * kt;
              except
                LogMemo.SelAttributes.Color := clRed;
                LogMemo.Lines.Add('При считывании суммирующего счётчика ' + ArrayData[1, 3] + ' произошла ошибка');
                Application.ProcessMessages;
              end;
              kolicmesacev := 1;
              while nomMonth <> nacSrokMonth do
              begin
                inc(kolicmesacev);
                nomMonth := nomMonth - 1;
                if nomMonth <= 0 then
                begin
                  nomMonth := nomMonth + 13;
                  dec(nomYear);
                end;
                if memo_Mes_pot_summ.Lines[13 * (j - 5) + nomMonth - 1] = '' then
                  ArrayData[1, j] := ArrayData[1, j]
                else
                  ArrayData[1, j] := ArrayData[1, j] - StrToFloat(memo_Mes_pot_summ.Lines[13 * (j - 5) + nomMonth - 1])
                  * kt;
                //       ShowMessage(ArrayData[1,j]);
              end;
              if real(ArrayData[1, j]) < 0.0001 then
                ArrayData[1, j] := 0
            end // bal_summ.FieldByName('ADDR').asString<>'3'
            else //если трёхфазник новый
            begin
              try
                //           ShowMessage('ok1');
                tmp6_02_07 := nacSrokMonth - 2;
                if tmp6_02_07 = -1 then
                  tmp6_02_07 := 11;
                if tmp6_02_07 = -2 then
                  tmp6_02_07 := 10;
                if memo_Mes_pot_summ.Lines[13 * (j - 5) + tmp6_02_07] = '' then
                  tmp1 := 0
                else
                  tmp1 := StrToFloat(memo_Mes_pot_summ.Lines[13 * (j - 5) + tmp6_02_07]) * kt;
                // 3.08.06 Заменил -1 на -2, т. к. в ячейке июля помесячного потребления находится показание счётчика на 1.08

              except
                //           ShowMessage('ok2');
                LogMemo.SelAttributes.Color := clRed;
                LogMemo.Lines.Add('При считывании суммирующего счётчика ' + ArrayData[1, 3] + ' произошла ошибка');
                Application.ProcessMessages;
                ArrayData[1, j] := tmp1 - 1;
              end;
              ArrayData[1, j] := tmp1;
              if real(ArrayData[1, j]) < 0.0001 then
                ArrayData[1, j] := 0

            end;
          end;
          ArrayData[1, 14] := kt; //поле ктр в excel
          for j := 79 to 83 do //коды симвлов o,p,q,r,s
          begin
            //Считаем потребление всех суммирующих счётчиков
            PotrSumm[j - 78] := PotrSumm[j - 78] + '+' + chr(j) + IntToStr(SumScet);
            //j-64 - 15,16,17,18,19 столбцы
          end;
          //     if ProgressBar1.Position<70 then      ProgressBar1.StepIt;
          //     ShowMessage(IntToStr(SumScet)+' '+IntToStr(BeginCol)+' '+IntToStr(ColCount));
          nescitan3x:
          Cell1 := WorkBook.WorkSheets[1].Cells[SumScet, BeginCol];
          Cell2 := WorkBook.WorkSheets[1].Cells[SumScet, ColCount];
          Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
          //     if NotRead=true then NotReaded3x;
          try
            Range.Value := ArrayData;
          except
            LogMemo.SelAttributes.Color := clRed;
            LogMemo.Lines.Add('Построение баланса невозможно');
            Application.ProcessMessages;
            LogMemo.SelAttributes.Color := clRed;
            LogMemo.Lines.Add('Ошибка при экспорте данных в Excel');
            Application.ProcessMessages;
            exit_bal := true;
          end;
          stroka := '=SUM(E' + IntToStr(SumScet) + ':H' + IntToStr(SumScet) + ')'; //Cумма по тарифам за месяцы
          WorkBook.WorkSheets[1].Cells[SumScet, 4].Formula := stroka;
          stroka := '=SUM(J' + IntToStr(SumScet) + ':M' + IntToStr(SumScet) + ')';
          WorkBook.WorkSheets[1].Cells[SumScet, 9].Formula := stroka;

          //Строка потребление за месяц
          //     if CheckBox1.Checked=false then
          begin
            for i := 79 to 83 do //коды симвлов o,p,q,r,s
            begin
              stroka := '=' + chr(i - 6) + IntToStr(SumScet) + '-' + chr(i - 11) + IntToStr(SumScet);
              WorkBook.WorkSheets[1].Cells[SumScet, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы
            end;
          end;
        end; // Not_Readed_Of_DATE

        //промежуточные значения для ввода баланса в excel
        for i := 2 to 5 do
        begin
          promSumm[i] := ArrayData[1, i + 8] - ArrayData[1, i + 3];
          promSumm[1] := promSumm[1] + promSumm[i];
          promSummAll[i] := promSummAll[i] + promSumm[i];
        end;
        promSummAll[1] := promSummAll[1] + promSumm[1];
        Range.Borders.LineStyle := 1;
        //данные с квартирных счётчиков
        Bal_kvart.Last;
        RowCount := bal_kvart.RecordCount;
        columnbal1 := columnbal1 + 'd' + IntToStr(kvartScet + RowCount - 1) + ';';
        columnbal2 := columnbal2 + 'i' + IntToStr(kvartScet + RowCount - 1) + ';';
        //     lengthSumScet:=trunc(ProgressBar1.Max/kolSumScet);
        ProgressBar1.step := trunc(ProgressBar1.Max / kolSumScet / RowCount);

        kol1x := kol1x + RowCount; //Количество однофазных счётчиков в адресе
        ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
        bal_kvart.First;
        i := 1;
        PorNomer := 1;
        nomerSumm := bal_summ.FieldByName('inc').asInteger;
        while not (bal_kvart.EOF) do
        begin
          Not_Readed_of_Date := false;
          NotRead := false;
          memo_Tar_nak_kvart.lines.Clear;
          memo_Tar_nak_kvart.lines.add(bal_kvart.FieldByName('Tar_nak').asString);

          memo_Mes_pot_kvart.lines.Clear;
          memo_Mes_pot_kvart.lines.add(bal_kvart.FieldByName('Mes_pot').asString);
          ProgressBar1.StepIt;
          begin
            ArrayData[i, 1] := PorNomer;
            ArrayData[i, 2] := bal_kvart.fieldByName('kv').asString;
            ArrayData[i, 3] := ' ' + bal_kvart.FieldByName('kvart_ns').asString;
            stroka := bal_kvart.FieldByName('TIME_KVART_NS').asString;
            Delete(stroka, 1, 7);
            Delete(stroka, 9, 6);
            ArrayData[i, 20] := stroka;
            stroka := '=SUM(E' + IntToStr(kvartScet + i - 1) + ':' + 'H' + IntToStr(kvartScet + i - 1) + ')';
            ArrayData[i, 4] := stroka;
            stroka := '=SUM(J' + IntToStr(kvartScet + i - 1) + ':' + 'M' + IntToStr(kvartScet + i - 1) + ')';
            ArrayData[i, 9] := stroka;
            stroka := '=SUM(P' + IntToStr(kvartScet + i - 1) + ':' + 'S' + IntToStr(kvartScet + i - 1) + ')';
            ArrayData[i, 15] := stroka;
            // Собственное потребление квартирных счётчиков
            //          ArrayData[i,20]:='=1,5/1000*24*30*'+IntToStr(kolicmesacev);

            //--------------------------new------------------------------------------------------------------
            stroka := bal_kvart.FieldByName('TIME_KVART_NS').asString;
            {         tmp081106:=bal_kvart.FieldByName('KVART_NS').asString;
                     if pos('443462',tmp081106)<>0 then ShowMessage('443462');
                     if pos('439557',tmp081106)<>0 then ShowMessage('439557');}

            if (stroka <> '') and (stroka <> 'Нет') and (stroka <> 'Пусто') then
              prom := get_date(stroka)
            else
            begin
              LogMemo.SelAttributes.Color := clRed;
              LogMemo.Lines.Add('В базе данных не содержится информация о квартирном счётчике ' +
                bal_kvart.FieldByName('KVART_NS').asString);
              LogMemo.SelAttributes.Color := clRed;
              LogMemo.Lines.Add('Заново проведите опрос счётчика');
              Application.ProcessMessages;
              //         bal_summ.Close;
              //         exit_bal:=true;
              NotRead := true;
            end;
            if NotRead = true then
            begin
              NotReaded1x(i);
              goto nescitan1x;
            end;
            if exit_bal = true then
              goto metka1;
            if prom < konSrok.Date then
            begin
              //         LogMemo.Visible:=true;
              LogMemo.SelAttributes.Color := clRed;
              LogMemo.Lines.Add('Построение правильного баланса невозможно');
              Application.ProcessMessages;
              LogMemo.SelAttributes.Color := clRed;
              LogMemo.Lines.Add('квартирный счётчик ' + ArrayData[i, 3] + ' считан ' + DateToStr(prom));
              Application.ProcessMessages;
              LogMemo.SelAttributes.Color := clBlack;
              Not_Readed_Of_Date := true;
            end;
            if Not_Readed_Of_Date = true then
            begin
              for i_not_readed := 4 to 19 do
                if i_not_readed <> 14 then
                  ArrayData[i, i_not_readed] := '-----------';
            end
            else
            begin
              for j := 5 to 8 do
              begin
                DecodeDate(prom, nomYear, nomMonth, nomDay);
                //показания на 1-ое число текущего месяца

                if (bal_kvart.FieldByName('ADDR_1').AsString <> '2') and (bal_kvart.FieldByName('ADDR_1').AsString <>
                  '3') then
                begin
                  //           Showmessage('старый');
                  try
                    tmp1 := (StrToFloat(memo_Tar_nak_kvart.lines[j - 5]) - StrToFloat(memo_Tar_nak_kvart.Lines[j -
                      1]));
                  except
                    tmp1 := 10000;
                    LogMemo.SelAttributes.Color := clRed;
                    LogMemo.Lines.Add('При считывании квартирного счётчика ' + ArrayData[i, 3] + ' произошла ошибка');
                    Application.ProcessMessages;
                  end;
                  while nomMonth <> konSrokMonth do
                  begin
                    dec(nomMonth);
                    //             ShowMessage(IntToStr(nomMonth));
                    if nomMonth <= 0 then
                    begin
                      nomMonth := nomMonth + 12;
                      dec(nomYear);
                    end; // заменил +13 на +12
                    try
                      if memo_Mes_pot_kvart.Lines[13 * (j - 5) + nomMonth - 1] <> '' then
                        tmp1 := tmp1 - StrToFloat(memo_Mes_pot_kvart.Lines[13 * (j - 5) + nomMonth - 1])
                    except
                      tmp1 := tmp1 - 1;
                      LogMemo.SelAttributes.Color := clRed;
                      LogMemo.Lines.Add('При считывании квартирного счётчика ' + ArrayData[i, 3] +
                        ' произошла ошибка');
                      Application.ProcessMessages;
                    end;
                  end;
                  if tmp1 < 0.0001 then
                    tmp1 := 0;
                  //           ShowMessage('kvart '+FloatToStr(tmp1));
                  ArrayData[i, j + 5] := tmp1;
                end
                else
                begin //Если однофазник новый
                  //           Showmessage('новый');
                  try
                    if konSrokMonth - 2 < 0 then
                    begin
                      if memo_Mes_pot_kvart.Lines[13 * (j - 5) + 11] = '' then
                      begin
                        tmp1 := 0;
                        //          ShowMessage(memo_Mes_pot_kvart.Lines[13*(j-5)+konSrokMonth-2]);
                        //          ShowMessage(IntToStr(j));
                      end
                      else
                        tmp1 := StrToFloat(memo_Mes_pot_kvart.Lines[13 * (j - 5) + 11]) // 03.01.07 11- ячейка декабря
                    end
                    else
                    begin
                      if memo_Mes_pot_kvart.Lines[13 * (j - 5) + konSrokMonth - 2] = '' then
                      begin
                        tmp1 := 0;
                        // ShowMessage(memo_Mes_pot_kvart.Lines[13*(j-5)+konSrokMonth-2]);
                        // ShowMessage(IntToStr(j));
                      end
                      else
                        tmp1 := StrToFloat(memo_Mes_pot_kvart.Lines[13 * (j - 5) + konSrokMonth - 2]);
                      // 3.08.06 Заменил -1 на -2, т. к. в ячейке июля помесячного потребления находится показание счётчика на 1.08
                    end;
                  except
                    tmp1 := 10000;
                    LogMemo.SelAttributes.Color := clRed;
                    LogMemo.Lines.Add('При считывании квартирного счётчика ' + ArrayData[i, 3] + ' произошла ошибка');
                    Application.ProcessMessages;
                  end;

                  ArrayData[i, j + 5] := FloatTOStr(tmp1);
                  //           ShowMessage(ArrayData[i,j+5]+' kvart');
                end;

                //показания на 1-ое число  прошедшего месяца
                DecodeDate(prom, nomYear, nomMonth, nomDay);
                nomMonth := konSrokMonth - 1;
                // Если счетчик старый
                if (bal_kvart.FieldByName('ADDR_1').AsString <> '2') and (bal_kvart.FieldByName('ADDR_1').AsString <>
                  '3') then
                begin
                  if nomMonth <= 0 then
                  begin
                    nomMonth := 12;
                    dec(nomYear);
                  end;

                  try
                    if memo_Mes_pot_kvart.Lines[13 * (j - 5) + nomMonth - 1] = '' then
                      ArrayData[i, j] := ArrayData[i, j + 5]
                    else
                      ArrayData[i, j] := ArrayData[i, j + 5] - StrToFloat(memo_Mes_pot_kvart.Lines[13 * (j - 5) +
                        nomMonth - 1]);
                  except
                    LogMemo.SelAttributes.Color := clRed;
                    LogMemo.Lines.Add('При считывании квартирного счётчика ' + ArrayData[i, 3] + ' произошла ошибка');
                    Application.ProcessMessages;
                  end;
                  while nomMonth <> nacSrokMonth do
                  begin
                    nomMonth := nomMonth - 1;

                    if nomMonth <= 0 then
                    begin
                      nomMonth := nomMonth + 13;
                      dec(nomYear);
                    end;
                    try
                      if memo_Mes_pot_kvart.Lines[13 * (j - 5) + nomMonth - 1] = '' then
                        ArrayData[i, j] := ArrayData[i, j]
                      else
                        ArrayData[i, j] := ArrayData[i, j] - StrToFloat(memo_Mes_pot_kvart.Lines[13 * (j - 5) + nomMonth
                          - 1]);
                    except
                      LogMemo.SelAttributes.Color := clRed;
                      LogMemo.Lines.Add('При считывании квартирного счётчика ' + ArrayData[i, 3] +
                        ' произошла ошибка');
                      Application.ProcessMessages;
                    end;
                  end;

                end //if bal_kvart.FieldByName('ADDR')
                else //если однофазник новый(Вместо помесячного потребления новые счётчики показывают показания на первое число месяца)
                begin
                  try
                    //           if nacSrokMonth-2<0 then
                    tmp6_02_07 := nacSrokMonth - 2;
                    if tmp6_02_07 = -1 then
                      tmp6_02_07 := 11;
                    if tmp6_02_07 = -2 then
                      tmp6_02_07 := 10;
                    if memo_Mes_pot_kvart.Lines[13 * (j - 5) + tmp6_02_07] = '' then
                      ArrayData[i, j] := 0
                    else
                      ArrayData[i, j] := StrToFloat(memo_Mes_pot_kvart.Lines[13 * (j - 5) + tmp6_02_07]);
                    // 3.08.06 Заменил -1 на -2, т. к. в ячейке июля помесячного потребления находится показание счётчика на 1.08
                //            ArrayData[i,j]:=StrToFloat(memo_Mes_pot_kvart.Lines[13*(j-5)+11])
                //          else

               //           if ArrayData[i,1]=19 then ShowMessage(memo_Mes_pot_kvart.Lines[13*(j-5)+nacSrokMonth-2]);
                  except
                    LogMemo.SelAttributes.Color := clRed;
                    LogMemo.Lines.Add('При считывании квартирного счётчика ' + ArrayData[i, 3] + ' произошла ошибка');
                    Application.ProcessMessages;
                  end;
                  if ArrayData[i, j] < 0.0001 then
                    ArrayData[i, j] := 0;

                end;
                if ArrayData[i, j] < 0.0001 then
                  ArrayData[i, j] := 0;
              end;
              //---------------new-------------------------------------------------------------------------------------------------
              {          for j:=5 to 8 do
                         begin
                          ArrayData[i,j+5]:=StrToFloat(memo_Tar_nak_kvart.lines[j-5])-StrToFloat(memo_Tar_nak_kvart.Lines[j-1]);//показания на 1-ое число текущего месяца
                          stroka:=memo_Mes_pot_kvart.lines[13*(j-5)+nacSrokMonth-1];
                          ArrayData[i,j]:=ArrayData[i,j+5]-StrToFloat(stroka);//показания на 1-ое число предыдущего месяца
                         end;}
              //---------Показания за месяц для квартирных счётчиков-----------------------------
              for j := 80 to 83 do
              begin
                stroka := '=$' + chr(j - 6) + '$' + IntToStr(kvartScet + i - 1) + '-$' + chr(j - 11) + '$' +
                  IntToStr(kvartScet + i - 1);
                ArrayData[i, j - 64] := stroka; //показания за месяц
                //            promSummAll[j-78]:=promSummAll[j-78]+ArrayData[i,j-70]-ArrayData[i,j-75];
                //            promSummAll[1]:=promSummAll[1]+promSummAll[j-78];

              end;

            end; // if Not_readed_of_date=true;

            //--------------------------------------------------------------------------------
            {     Cell1:=WorkBook.WorkSheets[1].Cells[BeginRow,BeginCol];
                 Cell2:=WorkBook.WorkSheets[1].Cells[BeginRow+RowCount-1,BeginCol+ColCount-1];
                 Range:=WorkBook.WorkSheets[1].Range[Cell1,Cell2];
                 Range.FormulaArray:=ArrayData;}
            //--------------------------------------------------------------------------------
            nescitan1x:
            //          if ProgressBar1.Position<70 then           ProgressBar1.StepIt;
            bal_kvart.Next;
            i := i + 1;
            //  ExcelApp.Visible:=true;
            PorNomer := PorNomer + 1;
          end //else izmenNom:=true;
        end;
        Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];
        Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount - 1, BeginCol + ColCount - 1];
        Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
        try
          Range.Formula := ArrayData; // FormulaArray заменил на formula
        except
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Построение баланса невозможно');
          Application.ProcessMessages;
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Не для всех суммирующих счётчиков введены квартирные');
          Application.ProcessMessages;
          exit_bal := true;
        end;
        if kolvo < kolSumScet then
        begin
          //строка суммирующий счётчик
          Cell1 := WorkBook.WorkSheets[1].Cells[SumScet + RowCount + 8 - 1, 1];
          Cell2 := WorkBook.WorkSheets[1].Cells[SumScet + RowCount + 8 - 1, 19];
          WorkBook.Worksheets[1].Range[Cell1, Cell2].Merge;
          WorkBook.WorkSheets[1].Range['A10:S10'].Copy;
          WorkBook.ActiveSheet.Paste(Destination := WorkBook.Worksheets[1].Range[Cell1, Cell2]);
          //строка квартирные счётчики
          Cell1 := WorkBook.WorkSheets[1].Cells[kvartScet + RowCount + 8 - 1, 1];
          Cell2 := WorkBook.WorkSheets[1].Cells[kvartScet + RowCount + 8 - 1, 19];
          WorkBook.Worksheets[1].Range[Cell1, Cell2].Merge;
          WorkBook.WorkSheets[1].Range['A12:S12'].Copy;
          WorkBook.ActiveSheet.Paste(Destination := WorkBook.Worksheets[1].Range[Cell1, Cell2]);
        end;
        //Строка "Итого"
        Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 1];
        Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 14];
        WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
        WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
        ArrayData := 'Итого (кВт/ч)';
        WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
        Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 15];
        Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 19];
        WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
        //Ввод формул сумм в итого
        for i := 79 to 83 do //коды симвлов o,p,q,r,s
        begin
          tmp := BeginRow + RowCount - 1;
          stroka := '=SUM(' + chr(i) + IntToStr(BeginRow) + ':' + chr(i) + IntToStr(tmp) + ')';
          WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, i - 64].Formula := stroka; //i-64 - 15,16,17,18,19 столбцы
          ItogoPoDomu[i - 78] := ItogoPoDomu[i - 78] + '+' + chr(i) + IntToStr(tmp + 1);
          WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек

          //  ExcelApp.Visible:=true;
        end;
        //Строка "Баланс"
       //     ShowMessage('FormulaArray1');
        Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 1];
        Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 14];
        WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
        WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
        if CheckBox1.Checked = false then
          ArrayData := 'Баланс без учёта собственного потребления квартирных счётчиков(+/- %)'
        else
          ArrayData := 'Баланс с учётом собственного потребления квартирных счётчиков(+/- %)';
        WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
        Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 15];
        Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 19];
        WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
        //     ItogoPoDomu:=ItogoPoDomu+
        //Ввод формулы в строке "баланс"
        for i := 79 to 83 do //коды симвлов o,p,q,r,s
        begin
          if promSumm[i - 78] < 0.0001 then
            WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, i - 64].Value := '----------'
              //i-64 - 15,16,17,18,19 столбцы
          else
          begin
            if CheckBox1.Checked = false then
            begin
              stroka := '=100*(' + chr(i) + IntToStr(SumScet) + '-' + Chr(i) + IntToStr(BeginRow + RowCount) + ')/' +
                chr(i) + IntToStr(SumScet);
              WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, i - 64].FormulaArray := stroka;
              //i-64 - 15,16,17,18,19 столбцы
              WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек
            end
            else
            begin
              // T - собственное потребление квартирных счётчиков
              stroka := '=100*(' + chr(i) + IntToStr(SumScet) + '-K' + IntToStr(BeginRow + RowCount + 2) + '-' + Chr(i)
                + IntToStr(BeginRow + RowCount) + ')/' + chr(i) + IntToStr(SumScet);
              WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, i - 64].FormulaArray := stroka;
              //i-64 - 15,16,17,18,19 столбцы
              WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек
            end;
          end;
        end;
        // Итого собственное потребление квартирных счётчиков
        Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 2, 1];
        Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 2, 10];
        WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
        WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
        ArrayData := 'Собственное потребление квартирных счётчиков (кВт/ч)';

        //       stroka:='=1,5/1000*24*30*'+IntToStr(kolicmesacev)+'*'+IntToStr(RowCount);
        stroka := FloatToStr(StrToFloat(SobstPotr.Text) / 1000 * 24 * 30 * kolicmesacev * RowCount, formatSettings);
        //       ShowMessage(IntToStr(kolicmesacev)+' '+IntTOStr(RowCount));
        WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 2, 11].FormulaArray := stroka;
        WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
        ItogoPoDomu[6] := ItogoPoDomu[6] + '+' + chr(75) + IntToStr(tmp + 3); // формула для итого по дому

        Range.Borders.LineStyle := 1;

        bal_summ.Next;
      end;
      //строка "Итого по дому"
      tmp := BeginRow + RowCount + 3;
      Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 14];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      ArrayData := 'Итого по дому (кВт/ч)';
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
      for i := 79 to 83 do
      begin
        stroka := ItogoPoDomu[i - 78];
        Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 15];
        Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 19];
        //      ShowMessage('Formula_Array_');
        WorkBook.WorkSheets[1].Cells[tmp, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы
        WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      end;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек
      //строка "Баланс по дому"
      tmp := BeginRow + RowCount + 4;
      Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 14];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      if CheckBox1.Checked = false then
        ArrayData := 'Баланс по дому без учёта собственного потребления квартирных счётчиков(+/- %)'
      else
        ArrayData := 'Баланс по дому с учётом собственного потребления квартирных счётчиков(+/- %)';
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
      for i := 79 to 83 do
      begin
        if CheckBox1.Checked = false then
        begin
          BalansPoDomu[i - 78] := '=100*(' + PotrSumm[i - 78] + '-' + chr(i) + IntToStr(tmp - 1) + ')/(' + PotrSumm[i -
            78] + ')'; //chr(i)+IntToStr(tmp-1);
          stroka := BalansPoDomu[i - 78];
          Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 15];
          Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 19];
          if promSummAll[i - 78] < 0.0001 then
            WorkBook.WorkSheets[1].Cells[tmp, i - 64].Value := '----------' //i-64 - 15,16,17,18,19 столбцы
          else
            WorkBook.WorkSheets[1].Cells[tmp, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы

          WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек


        end
        else
        begin
          BalansPoDomu[i - 78] := '=100*(' + PotrSumm[i - 78] + '-K' + IntToStr(tmp + 1) + '-' + chr(i) + IntToStr(tmp
            - 1) + ')/(' + PotrSumm[i - 78] + ')'; //chr(i)+IntToStr(tmp-1);
          stroka := BalansPoDomu[i - 78];
          Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 15];
          Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 19];

          if promSummAll[i - 78] < 0.0001 then
            WorkBook.WorkSheets[1].Cells[tmp, i - 64].Value := '----------' //i-64 - 15,16,17,18,19 столбцы
          else
            WorkBook.WorkSheets[1].Cells[tmp, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы
          WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек
        end;
        WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;

       end;
      // собственное потребление квартирных счётчиков по дому
      Cell2 := WorkBook.WorkSheets[1].Cells[tmp + 1, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[tmp + 1, 10];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      ArrayData := 'Собственное потребление квартирных счётчиков по дому(кВт/ч)';
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
      WorkBook.WorkSheets[1].Cells[tmp + 1, 11].FormulaArray := ItogoPoDomu[6];

      //   WorkBook.WorkSheets[1].Range[Cell2,Cell3].Interior.ColorIndex:=ColorCell;//цвет ячеек

      //-------------Количество счётчиков по дому
      tmp := BeginRow + RowCount + 6;
      Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 5];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      ArrayData := 'Суммирующих счётчиков: ' + IntToStr(kolSumScet);
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;

      tmp := BeginRow + RowCount + 7;
      Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 5];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      ArrayData := 'Квартирных счётчиков: ' + IntToStr(kol1x);
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;

      tmp := BeginRow + RowCount + 8;
      Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 5];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      ArrayData := 'Всего счётчиков: ' + IntToStr(kol1x + kolSumScet);
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;

      Application.ProcessMessages;
      LogMemo.SelAttributes.Color := clBlack;
      LogMemo.Lines.Add('Баланс построен');
      ProgressBar1.Position := ProgressBar1.Max;
      ExcelApp.Run('NotReadedCounters', tmp); // Выполнение макроса(выделение несчитанных счётчиков)
      ExcelApp.Visible := true;
      if graph.Checked = true then
        ExcelGraph(ExcelApp, WorkBook, columnbal1, columnbal2, 0, 1);
    end;
  end // if nacSrok.Date<=konSrokDate
  else
  begin
    //     MessageBox(0,'Введите правильно дату','Ошибка',MB_OK);
    LogMemo.SelAttributes.Color := clRed;
    LogMemo.Lines.Add('Введите правильно дату');
    Application.ProcessMessages;

  end;

        if promSummAll[i - 78] >= 0.0001 then
      begin
        tmp := BeginRow + RowCount + 4;
        pFIBQuery1.SQL.Clear;
        DecimalSeparator := '.';
        pFIBQuery1.SQL.Text:= 'UPDATE ADDRESMAIN SET BALANS =' + FloatToStrF(WorkBook.WorkSheets[1].Cells[tmp, 15].value, ffFixed, 7, 3) + ' WHERE INC =' + editId.Text;
        pFIBQuery1.ExecQuery;
      end;


  metka1:
  if (exit_bal = true) and (VarIsNull(ExcelApp) = false) then
  begin
    ExcelApp.DisplayAlerts := False;
    ExcelApp.Quit;
  end;
 // ExcelApp.Visible := false;

  IBDatabase2.Connected := false;
  BalButton1.Enabled := true;
  BalButton3.Enabled := true;

end;

procedure TFormDLL1.FormCreate(Sender: TObject);
var
  date_: TDate;
  Year_, Month_, Day_: word;
  IniFile: TIniFile;
begin
  DecimalSeparator := ',';
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);

  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'options.ini');
  SobstPotr.Text := IniFile.ReadString('Balans', 'PowerSobst', '2,4');
  IniFile.Free;

  date_ := date;
  DecodeDate(date_, Year_, Month_, Day_);
  konSrok.Date := StrToDate(Encode_Date(Year_, Month_, 1));
  Month_ := Month_ - 1;
  if Month_ = 0 then
  begin
    Month_ := 12;
    Year_ := Year_ - 1
  end;
  nacSrok.Date := StrToDate(Encode_Date(Year_, Month_, 1));
  NoteBook1.PageIndex := 1;
  if RadioButton2.Checked then
    RadioButton2Click(self);
end;

procedure TFormDLL1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  IniFile: TIniFile;
begin
  //  FormDLL1.Release;
  IBDatabase2.Connected := false;
  QueryForm.Release;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'options.ini');
  IniFile.WriteString('Balans', 'PowerSobst', SobstPotr.Text);
  IniFile.Free;
  
end;

procedure TFormDLL1.nacSrokChange(Sender: TObject);
begin
  now := nacSrok.Date;
  DecodeDate(now, nacSrokYear, nacSrokMonth, nacSrokDay);
  nacSrokDay := 01;
  dat := Encode_Date(nacSrokYear, nacSrokMonth, nacSrokDay);
  nacSrok.Date := StrToDate(dat);
end;

procedure TFormDLL1.konSrokChange(Sender: TObject);
begin
  if RadioButton2.Checked <> true then
  begin
    now := konSrok.Date;
    DecodeDate(now, konSrokYear, konSrokMonth, konSrokDay);
    konSrokDay := 01;
    dat := Encode_Date(konSrokYear, konSrokMonth, konSrokDay);
    konSrok.Date := StrToDate(dat);
  end
  else
  begin
    now := date;
    DecodeDate(now, konSrokYear, konSrokMonth, konSrokDay);
    konSrok.Date := StrToDate(Encode_Date(konSrokYear, konSrokMonth, konSrokDay));
    nacSrok.Date := StrToDate(Encode_Date(konSrokYear, konSrokMonth, 1));
  end;

end;


procedure TFormDLL1.BalButton2Click(Sender: TObject);
begin
  // Form1.Close;
   //FormDll1.Close;
  Close;
end;

procedure TFormDLL1.BalButton3Click(Sender: TObject);
label
  metka1, nescitan1x, nescitan3x, FroZ1;
var
  balance_temp: Double;
  nomDay, nomMonth, nomYear: word;
  ExcelApp, WorkBook, Range, Cell1, Cell2, cell3 {,ArrayData}: variant;
  now: TDate;
  stroka: string;
  SumScet, RowCount, kolvo, kvartScet, BeginCol, BeginRow, ColCount, kolSumScet, i, j: integer;
  PorNomer, nomerSumm, tmp: integer;
  tmp1: real;
  promSumm, promSummAll: array[1..5] of real;
  kt: integer; //коэффициент трансформации
  ItogoPoDomu, BalansPoDomu, PotrSumm: array[1..6] of string;
  ColorCell: byte; //цвет ячеек для итого
  kol1x: integer; //rколичество квартирных счётчиков
  NotRead: boolean;
  columnbal1, columnbal2: string;
  Not_Readed_of_Date: boolean;
  i_not_readed: integer;
begin
  ProgressBar1.Position := 0;
  BalButton1.Enabled := false;
  BalButton3.Enabled := false;
  columnbal1 := '';
  columnbal2 := '';
  kol1x := 0;
  exit_bal := false;
  ColorCell := 15;

  ExcelApp := Null;
  bal_summ.Open;
  bal_summ.First;
  bal_kvart.Open;
  bal_kvart.First;
  // ProgressBar1.Position:=0;
  LogMemo.Lines.Clear;
  LogMemo.SelAttributes.Color := clBlack;
  LogMemo.Lines.Add('Идёт построение баланса...');
  Application.ProcessMessages;
  ProgressBar1.Position := 15;
  IBDatabase2.Connected := true;

  stroka := bal_summ.FieldByName('TIME_SUMM_NS').asString;
  now := nacSrok.Date;
  DecodeDate(now, nacSrokYear, nacSrokMonth, nacSrokDay);
  if (stroka <> '') and (stroka <> 'Нет') and (stroka <> 'Пусто') then
  begin
    DateAskueToData(stroka, tekMesac);
    prom := get_date(stroka)
  end
  else
  begin
    //      Application.ProcessMessages;
    LogMemo.SelAttributes.Color := clRed;
    LogMemo.Lines.Add('В базе данных не содержится информация о суммирующем счётчике ' +
      bal_summ.FieldByName('SUMM_NS').asString);
    Application.ProcessMessages;
    LogMemo.SelAttributes.Color := clRed;
    LogMemo.Lines.Add('Построение правильного баланса невозможно');
    Application.ProcessMessages;
    LogMemo.SelAttributes.Color := clRed;
    LogMemo.Lines.Add('Заново проведите опрос счётчика');
    Application.ProcessMessages;
    //      bal_summ.Close;
    //      exit_bal:=true;
  end;
  if exit_bal = true then
    goto metka1;
  // ShowMessage(stroka);
  // prom:=get_date(stroka);
  tekMesac.Date := prom;
  DecodeDate(prom, nomYear, nomMonth, nomDay);
  // ShowMessage(IntToStr(nacSrokDay)+' '+IntToStr(konSrokDay));
  // now:=konSrok.Date;
  DecodeDate(prom, konSrokYear, konSrokMonth, konSrokDay);

  stroka := Encode_Date(nomYear, nomMonth, 1);
  prom := StrToDate(stroka);
  NacMesac.Date := prom;

  if not IsOleObjectInstalled('Excel.Application') then
  begin
    LogMemo.SelAttributes.Color := clRed;
    LogMemo.Lines.Add('Построение баланса невозможно.Установите Excel');
    Application.ProcessMessages;
    //ShowMessage('Класс не зарегестрирован')
  end
  else
  begin
    //     if ProgressBar1.Position<70 then  ProgressBar1.StepIt;
    SumScet := 11;
    kvartScet := 13;
    BeginCol := 1;
    BeginRow := 13;
    ColCount := 21;
    bal_summ.Last;
    kolSumScet := bal_summ.RecordCount;
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Application.EnableEvents := false;

    WorkBook := ExcelApp.WorkBooks.Add(ExtractFilePath(Application.ExeName) + 'balance.xls');
    for i := 1 to 5 do
    begin
      ItogoPoDomu[i] := '=';
      BalansPoDomu[i] := '=(';
    end;
    ItogoPoDomu[6] := '=';
    kolvo := 0;
    bal_summ.First;
    try
      kt := bal_summ.FieldByName('KT').asInteger;
    except
      kt := 1;
      LogMemo.SelAttributes.Color := clRed;
      LogMemo.Lines.Add('Для суммирующего счётчика ' + bal_summ.FieldByName('SUMM_NS').asString +
        ' не введён коэффициент трансформации');
      LogMemo.Lines.Add('Построение правильного баланса невозможно');
      Application.ProcessMessages;

    end;
   WorkBook.WorkSheets[1].Cells[5, 1].value := 'г.' + bal_kvart.FieldByName('TOWN').asString +', ' + bal_kvart.FieldByName('ADDR').asString;
   WorkBook.WorkSheets[1].Cells[3, 4].value := 'г.' + bal_kvart.FieldByName('TOWN').asString +', ' + bal_kvart.FieldByName('ADDR').asString;

    WorkBook.WorkSheets[1].Cells[7, 6].value := DateToStr(nacMesac.Date);
    WorkBook.WorkSheets[1].Cells[7, 11].value := DateToStr(tekMesac.Date);
    WorkBook.WorkSheets[1].Cells[7, 16].value := 'Текущий месяц';
    memo_Tar_nak_summ.lines.Clear;
    memo_Tar_nak_summ.lines.add(bal_summ.FieldByName('Tar_nak').asString);
    memo_Mes_pot_summ.lines.Clear;
    memo_Mes_pot_summ.lines.add(bal_summ.FieldByName('Mes_pot').asString);
    //     if ProgressBar1.Position<70 then ProgressBar1.StepIt;
    while not bal_summ.EOF do
    begin
      NotRead := false;
      try
        kt := bal_summ.FieldByName('KT').asInteger;
      except
        kt := 1;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Для суммирующего счётчика ' + bal_summ.FieldByName('SUMM_NS').asString +
          ' не введён коэффициент трансформации');
        LogMemo.Lines.Add('Построение правильного баланса невозможно');
        Application.ProcessMessages;
      end;

      kolvo := kolvo + 1;
      //    ShowMessage('проверка');
      if kolvo > 1 then
      begin
        SumScet := SumScet + RowCount + 8;
        kvartScet := kvartScet + RowCount + 8;
        BeginRow := BeginRow + RowCount + 8;
      end;
      columnbal1 := columnbal1 + 'd' + IntToStr(kvartScet) + ':'; // ряд для гистограммы
      columnbal2 := columnbal2 + 'i' + IntToStr(kvartScet) + ':'; // ряд для гистограммы

      //данные с суммирующего счётчика
      ArrayData := VarArrayCreate([1, 1, 1, ColCount], varVariant);
      ArrayData[1, 1] := '-'; //поле № п/п в excel
      ArrayData[1, 2] := '-'; //поле квартира в excel
      try
        ArrayData[1, 3] := bal_summ.FieldByName('SUMM_NS').asString; //поле номер счётчика в excel
        stroka := bal_summ.FieldByName('TIME_SUMM_NS').asString;
        Delete(stroka, 1, 7);
        Delete(stroka, 9, 6);
        ArrayData[1, 20] := stroka;
      except
        LogMemo.Lines.add('Ошибка');
      end;
      memo_Tar_nak_summ.lines.Clear;
      memo_Tar_nak_summ.lines.add(bal_summ.FieldByName('Tar_nak').asString);

      memo_Mes_pot_summ.lines.Clear;
      memo_Mes_pot_summ.lines.add(bal_summ.FieldByName('Mes_pot').asString);
      //     nomMonth:=konSrokMonth;
      //  ExcelApp.Visible:=true;//++++++++++++++++++++++++==============++++++++++++++++++++__
      stroka := bal_summ.FieldByName('TIME_SUMM_NS').asString;
      if (stroka <> '') and (stroka <> 'Нет') and (stroka <> 'Пусто') then
        prom := get_date(stroka)
      else
      begin
        //      Application.ProcessMessages;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('В базе данных не содержится информация о суммирующем счётчике ' +
          bal_summ.FieldByName('SUMM_NS').asString);
        Application.ProcessMessages;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Постороение баланса невозможно');
        Application.ProcessMessages;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Заново проведите опрос счётчика');
        Application.ProcessMessages;
        //        bal_summ.Close;
        //        exit_bal:=true;
        NotRead := true;
      end;
      if NotRead = true then
      begin
        NotReaded3x;
        goto nescitan3x
      end;
      if exit_bal = true then
        goto metka1;

      //       prom:=get_date(stroka);
      DecodeDate(prom, nomYear, nomMonth, nomDay);
      if nomMonth <> konSrokMonth then
      begin
        goto FroZ1;
        for i_not_readed := 4 to 19 do
          if i_not_readed <> 14 then
            ArrayData[1, i_not_readed] := '----------';

        Cell1 := WorkBook.WorkSheets[1].Cells[SumScet, BeginCol];
        Cell2 := WorkBook.WorkSheets[1].Cells[SumScet, ColCount];
        Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
        try
          Range.Value := ArrayData;
        except
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Построение баланса невозможно');
          Application.ProcessMessages;
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Не для всех суммирующих счётчиков введены квартирные');
          Application.ProcessMessages;
          exit_bal := true;
        end;

      end
      else
      begin
        Froz1:
        for j := 5 to 8 do
        begin
          //показания на 1-ое число текущего месяца
          try
            tmp1 := (StrToFloat(memo_Tar_nak_summ.lines[j - 5]) - StrToFloat(memo_Tar_nak_summ.Lines[j - 1])) * kt;
          except
            tmp1 := 10000;
            LogMemo.SelAttributes.Color := clRed;
            LogMemo.Lines.Add('При считывании суммирующего счётчика ' + ArrayData[1, 3] + ' произошла ошибка ');
            Application.ProcessMessages;
          end;

          if tmp1 < 0.0001 then
            tmp1 := 0;
          ArrayData[1, j] := tmp1;
          //показания на  текущее число месяца
          try
            tmp1 := StrToFloat(memo_Tar_nak_summ.lines[j - 5]) * kt;
          except
            tmp1 := 10000;
            LogMemo.SelAttributes.Color := clRed;
            LogMemo.Lines.Add('При считывании суммирующего счётчика ' + ArrayData[1, 3] + ' произошла ошибка ');
            Application.ProcessMessages;
          end;
          if tmp1 < 0.0001 then
            tmp1 := 0;
          ArrayData[1, j + 5] := tmp1;

        end;
        ArrayData[1, 14] := kt; //поле ктр в excel
        for j := 79 to 83 do //коды симвлов o,p,q,r,s
        begin
          //Считаем потребление всех суммирующих счётчиков
          PotrSumm[j - 78] := PotrSumm[j - 78] + '+' + chr(j) + IntToStr(SumScet);
          //j-64 - 15,16,17,18,19 столбцы
        end;
        nescitan3x:
        Cell1 := WorkBook.WorkSheets[1].Cells[SumScet, BeginCol];
        Cell2 := WorkBook.WorkSheets[1].Cells[SumScet, ColCount];
        Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
        try
          Range.Value := ArrayData;
        except
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Построение баланса невозможно');
          Application.ProcessMessages;
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Не для всех суммирующих счётчиков введены квартирные');
          Application.ProcessMessages;
          exit_bal := true;
        end;

        //     if ProgressBar1.Position<70 then ProgressBar1.StepIt;

        stroka := '=SUM(E' + IntToStr(SumScet) + ':H' + IntToStr(SumScet) + ')'; //Cумма по тарифам за месяцы
        WorkBook.WorkSheets[1].Cells[SumScet, 4].Formula := stroka;
        stroka := '=SUM(J' + IntToStr(SumScet) + ':M' + IntToStr(SumScet) + ')';
        WorkBook.WorkSheets[1].Cells[SumScet, 9].Formula := stroka;
        //Строка потребление за месяц
        Bal_kvart.Last;
        RowCount := bal_kvart.RecordCount;

        //     if CheckBox1.Checked=false then
        begin
          for i := 79 to 83 do //коды симвлов o,p,q,r,s
          begin
            stroka := '=' + chr(i - 6) + IntToStr(SumScet) + '-' + chr(i - 11) + IntToStr(SumScet);
            WorkBook.WorkSheets[1].Cells[SumScet, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы
          end;
        end;
      end; // if nomMonth<>konSrokMonth then

      //промежуточные значения для ввода баланса в excel
      for i := 2 to 5 do
      begin
        promSumm[i] := ArrayData[1, i + 8] - ArrayData[1, i + 3];
        promSumm[1] := promSumm[1] + promSumm[i];
        promSummAll[i] := promSummAll[i] + promSumm[i];
      end;
      promSummAll[1] := promSummAll[1] + promSumm[1];
      Range.Borders.LineStyle := 1;
      //данные с квартирных счётчиков
      Bal_kvart.Last;
      RowCount := bal_kvart.RecordCount;
      columnbal1 := columnbal1 + 'd' + IntToStr(kvartScet + RowCount - 1) + ';';
      columnbal2 := columnbal2 + 'i' + IntToStr(kvartScet + RowCount - 1) + ';';
      ProgressBar1.step := trunc(ProgressBar1.Max / kolSumScet / RowCount);
      kol1x := kol1x + RowCount;
      ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
      bal_kvart.First;
      i := 1;
      PorNomer := 1;
      nomerSumm := bal_summ.FieldByName('inc').asInteger;
      while not (bal_kvart.EOF) do
      begin
        NotRead := false;
        memo_Tar_nak_kvart.lines.Clear;
        memo_Tar_nak_kvart.lines.add(bal_kvart.FieldByName('Tar_nak').asString);
        ProgressBar1.StepIt;
        memo_Mes_pot_kvart.lines.Clear;
        memo_Mes_pot_kvart.lines.add(bal_kvart.FieldByName('Mes_pot').asString);

        begin
          ArrayData[i, 1] := PorNomer;
          ArrayData[i, 2] := bal_kvart.fieldByName('kv').asString;
          ArrayData[i, 3] := ' ' + bal_kvart.FieldByName('kvart_ns').asString;
          stroka := bal_kvart.FieldByName('TIME_KVART_NS').asString;
          Delete(stroka, 1, 7);
          Delete(stroka, 9, 6);
          ArrayData[i, 20] := stroka;

          stroka := '=SUM(E' + IntToStr(kvartScet + i - 1) + ':' + 'H' + IntToStr(kvartScet + i - 1) + ')';
          ArrayData[i, 4] := stroka;
          stroka := '=SUM(J' + IntToStr(kvartScet + i - 1) + ':' + 'M' + IntToStr(kvartScet + i - 1) + ')';
          ArrayData[i, 9] := stroka;
          stroka := '=SUM(P' + IntToStr(kvartScet + i - 1) + ':' + 'S' + IntToStr(kvartScet + i - 1) + ')';
          ArrayData[i, 15] := stroka;

          // Собственное потребление квартирных счётчиков
          //          ArrayData[i,20]:='=1,5/1000*24*'+IntToStr(konSrokDay-nacSrokDay);

          //------------new---------------------------------------------------------------------------------------------
          stroka := bal_kvart.FieldByName('TIME_KVART_NS').asString;
          if (stroka <> '') and (stroka <> 'Нет') and (stroka <> 'Пусто') then
            prom := get_date(stroka)
          else
          begin
            LogMemo.SelAttributes.Color := clRed;
            LogMemo.Lines.Add('В базе данных не содержится информация о счётчике ' +
              bal_kvart.FieldByName('KVART_NS').asString);
            Application.ProcessMessages;
            LogMemo.SelAttributes.Color := clRed;
            LogMemo.Lines.Add('Заново проведите опрос счётчика');
            Application.ProcessMessages;
            //          bal_kvart.Close;
            //          exit_bal:=true;
            NotRead := true;
          end;
          if exit_bal = true then
            goto metka1;

          DecodeDate(prom, nomYear, nomMonth, nomDay);
          if nomMonth <> konSrokMonth then
          begin
            for i_not_readed := 4 to 19 do
              if i_not_readed <> 14 then
                ArrayData[i, i_not_readed] := '-----------';
            goto nescitan1x;
          end;
          //11.01.08      if NotRead=true then begin NotReaded1x(i);goto nescitan1x; end;

          for j := 5 to 8 do
          begin
            //показания на 1-ое число текущего месяца

            try
              tmp1 := (StrToFloat(memo_Tar_nak_kvart.lines[j - 5]) - StrToFloat(memo_Tar_nak_kvart.Lines[j - 1]));
            except
              tmp1 := 10000;
              LogMemo.SelAttributes.Color := clRed;
              LogMemo.Lines.Add('При считывании квартирного счётчика ' + ArrayData[i, 3] + ' произошла ошибка');
              Application.ProcessMessages;
            end;
            {           While nomMonth<>konSrokMonth do
                        begin
                         dec(nomMonth);
            //             ShowMessage(IntToStr(nomMonth));
                         if nomMonth<=0 then begin nomMonth:=nomMonth+13;dec(nomYear);end;
                         try
                          tmp1:=tmp1-StrToFloat(memo_Mes_pot_kvart.Lines[13*(j-5)+nomMonth-1]);
                         except
                           tmp1:=tmp1-1;
                           LogMemo.SelAttributes.Color := clRed;
                           LogMemo.Lines.Add('При считывании квартирного счётчика '+ArrayData[i,3]+' произошла ошибка');
                           Application.ProcessMessages;
                         end;
                        end;}
            if tmp1 < 0.0001 then
              tmp1 := 0;
            ArrayData[i, j] := tmp1;
            //показания на число текущего месяца
            try
              tmp1 := StrToFloat(memo_Tar_nak_kvart.lines[j - 5]);
            except
              tmp1 := 10000;
              LogMemo.SelAttributes.Color := clRed;
              LogMemo.Lines.Add('При считывании квартирного счётчика ' + ArrayData[i, 3] + ' произошла ошибка');
              Application.ProcessMessages;
            end;
            if tmp1 < 0.0001 then
              tmp1 := 0;
            ArrayData[i, j + 5] := tmp1;

          end;
          //---------------new-------------------------------------------------------------------------------------------------
          {          for j:=5 to 8 do
                     begin
                      ArrayData[i,j+5]:=StrToFloat(memo_Tar_nak_kvart.lines[j-5])-StrToFloat(memo_Tar_nak_kvart.Lines[j-1]);//показания на 1-ое число текущего месяца
                      stroka:=memo_Mes_pot_kvart.lines[13*(j-5)+nacSrokMonth-1];
                      ArrayData[i,j]:=ArrayData[i,j+5]-StrToFloat(stroka);//показания на 1-ое число предыдущего месяца
                     end;}
          //---------Показания за месяц для квартирных счётчиков-----------------------------
          for j := 80 to 83 do
          begin
            stroka := '=$' + chr(j - 6) + '$' + IntToStr(kvartScet + i - 1) + '-$' + chr(j - 11) + '$' +
              IntToStr(kvartScet + i - 1);
            ArrayData[i, j - 64] := stroka; //показания за месяц
            //            promSummAll[j-78]:=promSummAll[j-78]+ArrayData[i,j-70]-ArrayData[i,j-75];
            //            promSummAll[1]:=promSummAll[1]+promSummAll[j-78];

          end;

          //--------------------------------------------------------------------------------
          {     Cell1:=WorkBook.WorkSheets[1].Cells[BeginRow,BeginCol];
               Cell2:=WorkBook.WorkSheets[1].Cells[BeginRow+RowCount-1,BeginCol+ColCount-1];
               Range:=WorkBook.WorkSheets[1].Range[Cell1,Cell2];
               Range.FormulaArray:=ArrayData;}
          //--------------------------------------------------------------------------------
          nescitan1x:
          bal_kvart.Next;
          i := i + 1;
          //          if ProgressBar1.Position<70 then  ProgressBar1.StepIt;
          //  ExcelApp.Visible:=true;
          PorNomer := PorNomer + 1;
        end //else izmenNom:=true;
      end;
      Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount - 1, BeginCol + ColCount - 1];
      Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
      try
        Range.Formula := ArrayData; // FormulaArray заменил на Formula
      except
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Построение баланса невозможно');
        Application.ProcessMessages;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Не для всех суммирующих счётчиков введены квартирные');
        Application.ProcessMessages;
        exit_bal := true;
      end;
      //  end; // If nomMonth<>konSrokMonth
      if kolvo < kolSumScet then
      begin
        //строка суммирующий счётчик
        Cell1 := WorkBook.WorkSheets[1].Cells[SumScet + RowCount + 8 - 1, 1];
        Cell2 := WorkBook.WorkSheets[1].Cells[SumScet + RowCount + 8 - 1, 19];
        WorkBook.Worksheets[1].Range[Cell1, Cell2].Merge;
        WorkBook.WorkSheets[1].Range['A10:S10'].Copy;
        WorkBook.ActiveSheet.Paste(Destination := WorkBook.Worksheets[1].Range[Cell1, Cell2]);
        //строка квартирные счётчики
        Cell1 := WorkBook.WorkSheets[1].Cells[kvartScet + RowCount + 8 - 1, 1];
        Cell2 := WorkBook.WorkSheets[1].Cells[kvartScet + RowCount + 8 - 1, 19];
        WorkBook.Worksheets[1].Range[Cell1, Cell2].Merge;
        WorkBook.WorkSheets[1].Range['A12:S12'].Copy;
        WorkBook.ActiveSheet.Paste(Destination := WorkBook.Worksheets[1].Range[Cell1, Cell2]);
      end;
      //Строка "Итого"
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 14];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      ArrayData := 'Итого (кВт/ч)';
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 15];
      Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 19];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;

      //Ввод формул сумм в итого
      for i := 79 to 83 do //коды симвлов o,p,q,r,s
      begin
        tmp := BeginRow + RowCount - 1;
        stroka := '=SUM(' + chr(i) + IntToStr(BeginRow) + ':' + chr(i) + IntToStr(tmp) + ')';
        WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, i - 64].Formula := stroka; //i-64 - 15,16,17,18,19 столбцы
        ItogoPoDomu[i - 78] := ItogoPoDomu[i - 78] + '+' + chr(i) + IntToStr(tmp + 1);

        //  ExcelApp.Visible:=true;
      end;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек

      //Строка "Баланс"
     //     ShowMessage('FormulaArray1');
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 14];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      if CheckBox1.Checked = false then
        ArrayData := 'Баланс без учёта собственного потребления квартирных счётчиков(+/- %)'
      else
        ArrayData := 'Баланс с учётом собственного потребления квартирных счётчиков(+/- %)';
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 15];
      Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 19];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      //     ItogoPoDomu:=ItogoPoDomu+
      //Ввод формулы в строке "баланс"
      for i := 79 to 83 do //коды симвлов o,p,q,r,s
      begin
        if promSumm[i - 78] < 0.0001 then
          WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, i - 64].Value := '----------'
            //i-64 - 15,16,17,18,19 столбцы
        else
        begin
          if CheckBox1.Checked = false then
          begin
            stroka := '=100*(' + chr(i) + IntToStr(SumScet) + '-' + Chr(i) + IntToStr(BeginRow + RowCount) + ')/' +
              chr(i) + IntToStr(SumScet);
            WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, i - 64].FormulaArray := stroka;
            //i-64 - 15,16,17,18,19 столбцы
          end
          else
          begin
            // K - собственное потребление квартирных счётчиков
            stroka := '=100*(' + chr(i) + IntToStr(SumScet) + '-K' + IntToStr(BeginRow + RowCount + 2) + '-' + Chr(i) +
              IntToStr(BeginRow + RowCount) + ')/' + chr(i) + IntToStr(SumScet);
            WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, i - 64].FormulaArray := stroka;
            //i-64 - 15,16,17,18,19 столбцы
          end;
        end;
      end;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек
      // Итого собственное потребление квартирных счётчиков
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 2, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 2, 10];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      ArrayData := 'Собственное потребление квартирных счётчиков (кВт/ч)';

      //       stroka:='=1,5/1000*24*'+IntToStr(konSrokDay-nacSrokDay)+'*'+IntToStr(RowCount);
      stroka := FloatToStr(StrToFloat(SobstPotr.Text) / 1000 * 24 * (tekMesac.Date - nacSrok.Date) * RowCount,
        formatSettings);
      //stroka:=FloatToStr(StrToFloat(SobstPotr.Text)/1000*24*(konSrokDay-nacSrokDay)*RowCount, formatSettings);
      WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 2, 11].FormulaArray := stroka;
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
      ItogoPoDomu[6] := ItogoPoDomu[6] + '+' + chr(75) + IntToStr(tmp + 3); // формула для итого по дому

      Range.Borders.LineStyle := 1;
      //     WorkBook.WorkSheets[1].Range[Cell2,Cell3].Interior.ColorIndex:=ColorCell;//цвет ячеек

      Range.Borders.LineStyle := 1;
      //     WorkBook.WorkSheets[1].Range[Cell2,Cell3].Interior.ColorIndex:=ColorCell;//цвет ячеек
      //     RowCount:=round(random(30));
      {     SumScet:=SumScet+RowCount+5;
           kvartScet:=kvartScet+RowCount+5;
           BeginRow:=BeginRow+RowCount+5;
           RowCount:=round(random(30));}
      //     if ProgressBar1.Position<70 then   ProgressBar1.StepIt;
      bal_summ.Next;
    end;
    //Итого по дому
    tmp := BeginRow + RowCount + 3;
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 14];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    ArrayData := 'Итого по дому (кВт/ч)';
    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
    for i := 79 to 83 do
    begin
      stroka := ItogoPoDomu[i - 78];
      Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 15];
      Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 19];
      //      ShowMessage('Formula_Array_');
      WorkBook.WorkSheets[1].Cells[tmp, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    end;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек
    //строка "Баланс по дому"
    tmp := BeginRow + RowCount + 4;
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 14];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    if CheckBox1.Checked = false then
      ArrayData := 'Баланс по дому без учёта собственного потребления квартирных счётчиков(+/- %)'
    else
      ArrayData := 'Баланс по дому с учётом собственного потребления квартирных счётчиков(+/- %)';

    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
    for i := 79 to 83 do
    begin
      if CheckBox1.Checked = false then
      begin
        BalansPoDomu[i - 78] := '=100*(' + PotrSumm[i - 78] + '-' + chr(i) + IntToStr(tmp - 1) + ')/(' + PotrSumm[i -
          78] + ')'; //chr(i)+IntToStr(tmp-1);
        stroka := BalansPoDomu[i - 78];
        Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 15];
        Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 19];
        if promSummAll[i - 78] < 0.0001 then
          WorkBook.WorkSheets[1].Cells[tmp, i - 64].Value := '----------' //i-64 - 15,16,17,18,19 столбцы
        else
          WorkBook.WorkSheets[1].Cells[tmp, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы

      end
      else
      begin
        BalansPoDomu[i - 78] := '=100*(' + PotrSumm[i - 78] + '-K' + IntToStr(tmp + 1) + '-' + chr(i) + IntToStr(tmp -
          1) + ')/(' + PotrSumm[i - 78] + ')'; //chr(i)+IntToStr(tmp-1);
        stroka := BalansPoDomu[i - 78];
        Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 15];
        Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 19];
        if promSummAll[i - 78] < 0.0001 then
          WorkBook.WorkSheets[1].Cells[tmp, i - 64].Value := '----------' //i-64 - 15,16,17,18,19 столбцы
        else
          WorkBook.WorkSheets[1].Cells[tmp, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы

      end;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек
    end;
    // собственное потребление квартирных счётчиков по дому
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp + 1, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp + 1, 10];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    ArrayData := 'Собственное потребление квартирных счётчиков по дому(кВт/ч)';
    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
    WorkBook.WorkSheets[1].Cells[tmp + 1, 11].FormulaArray := ItogoPoDomu[6];

    //     WorkBook.WorkSheets[1].Range[Cell2,Cell3].Interior.ColorIndex:=ColorCell;//цвет ячеек

    //-------------Количество счётчиков по дому
    tmp := BeginRow + RowCount + 6;
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 5];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    ArrayData := 'Суммирующих счётчиков: ' + IntToStr(kolSumScet);
    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;

    tmp := BeginRow + RowCount + 7;
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 5];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    ArrayData := 'Квартирных счётчиков: ' + IntToStr(kol1x);
    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;

    tmp := BeginRow + RowCount + 8;
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 5];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    ArrayData := 'Всего счётчиков: ' + IntToStr(kol1x + kolSumScet);
    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
    ProgressBar1.Position := ProgressBar1.Max;

    Application.ProcessMessages;
    LogMemo.SelAttributes.Color := clBlack;
    LogMemo.Lines.Add('Баланс построен');
    ExcelApp.Run('NotReadedCounters', tmp); // Выполнение макроса(выделение несчитанных счётчиков)
    ExcelApp.Visible := true;
    if graph.Checked = true then
      ExcelGraph(ExcelApp, WorkBook, columnbal1, columnbal2, 0, 1);


      if promSummAll[i - 78] >= 0.0001 then
      begin
        tmp := BeginRow + RowCount + 4;
        pFIBQuery1.SQL.Clear;
        DecimalSeparator := '.';
        pFIBQuery1.SQL.Text:= 'UPDATE ADDRESMAIN SET BALANS =' + FloatToStrF(WorkBook.WorkSheets[1].Cells[tmp, 15].value, ffFixed, 7, 3) + ' WHERE INC =' + editId.Text;
        pFIBQuery1.ExecQuery;
      end;


    metka1:
    if (exit_bal = true) and (VarIsNull(ExcelApp) = false) then
    begin
      ExcelApp.DisplayAlerts := False;
      ExcelApp.Quit;
    end;
 // ExcelApp.Visible := false;
 IBDatabase2.Connected := false;

  end;
  BalButton1.Enabled := true;
  BalButton3.Enabled := true;

end;

procedure TFormDLL1.N3Click(Sender: TObject);
begin
  Close;
end;

procedure TFormDLL1.N2Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    //   SaveDialog1.DefaultExt:=
    LogMemo.Lines.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TFormDLL1.FormDestroy(Sender: TObject);
begin
  // FormDll1.Release;
end;

procedure TFormDLL1.RadioButton2Click(Sender: TObject);
begin
  Button1.Enabled := true;
  CheckBox1.Enabled := true;
  nacSrok.Visible := true;
  konSrok.Visible := true;
  nacSrokposl.Visible := false;
  konSrokPosl.Visible := false;
  Label1.Visible := true;
  Label2.Visible := true;
  Label7.Visible := false;
  Label4.Visible := false;
  label3.Visible := true;
  label2.Visible := true;
  now := date;
  DecodeDate(now, konSrokYear, konSrokMonth, konSrokDay);
  konSrok.Date := StrToDate(Encode_Date(konSrokYear, konSrokMonth, konSrokDay));
  nacSrok.Date := StrToDate(Encode_Date(konSrokYear, konSrokMonth, 1));
end;

procedure TFormDLL1.Button1Click(Sender: TObject);
var
  k, s, arh: string;
begin
{
    k := 'SELECT ADDRESMAIN.ADDR, tmp_3xf.sdf as ADDR_1, tmp_3xf.cod, tmp_3xf.addr as kv, tmp_3xf.ns as kvart_ns, kv_konfig.mes_pot , kv_konfig.tar_nak, kv_konfig.mes_pot_time as time_kvart_ns,tmp.inc as svaz'
      + '  FROM addresmain, tmp_3xf, kv_konfig,tmp where addresmain.inc = ' + EditId.Text +
      ' and tmp_3xf.ns in (select ns from tmp where tmp.cod in (select inc from addres where addres.cod = ' + EditID.Text
      +
      ')) and kv_konfig.cod in (select inc from tmp where tmp.ns = tmp_3xf.ns) and tmp_3xf.cod = tmp.inc and tmp_3xf.cod = :inc ORDER BY tmp_3xf.addr ASC';
}

{ k := 'SELECT ADDRESMAIN.ADDR, addresmain.balans, tmp_3xf.sdf as ADDR_1, tmp_3xf.cod, tmp_3xf.addr as kv, tmp_3xf.ns as kvart_ns, tmp_3xf.id_tmp, kv_konfig.mes_pot , kv_konfig.tar_nak, kv_konfig.mes_pot_time as time_kvart_ns '
    + 'from addresmain ' +
    'inner join addres on addresmain.inc = addres.cod ' +
    'inner join tmp on addres.inc = tmp.cod ' +
    'inner join tmp_3xf on tmp.inc = tmp_3xf.cod and tmp_3xf.cod = :inc ' +
    'inner join kv_konfig on kv_konfig.cod = tmp_3xf.id_tmp ' +
    'where addresmain.inc = :inc_addresmain ' +
    'order by tmp_3xf.addr';    }

  k := 'SELECT ADDRESMAIN.ADDR, town.inc, town.town, addresmain.rez, addresmain.balans, tmp_3xf.sdf as ADDR_1, tmp_3xf.cod, tmp_3xf.addr as kv, tmp_3xf.ns as kvart_ns, tmp_3xf.id_tmp, kv_konfig.mes_pot , kv_konfig.tar_nak, kv_konfig.mes_pot_time as time_kvart_ns '
    + 'from addresmain ' +
    'inner join town on addresmain.rez = town.inc ' +
    'inner join addres on addresmain.inc = addres.cod ' +
    'inner join tmp on addres.inc = tmp.cod ' +
    'inner join tmp_3xf on tmp.inc = tmp_3xf.cod and tmp_3xf.cod = :inc ' +
    'inner join kv_konfig on kv_konfig.cod = tmp_3xf.id_tmp ' +
    'where addresmain.inc = :inc_addresmain ' +
    'order by tmp_3xf.addr';
{
    s := 'SELECT tmp.inc, tmp.addr, tmp.ns as summ_ns, tmp.spol as kt,kv_konfig.mes_pot , kv_konfig.tar_nak, kv_konfig.mes_pot_time as time_summ_ns  FROM addresmain,tmp, kv_konfig where addresmain.inc = '
      + EditId.Text + ' and tmp.sdf =3 and tmp.cod in (select inc from addres where addres.cod = ' + EditId.Text +
      ') and kv_konfig.cod = tmp.inc';
}
  s := 'SELECT tmp.inc, tmp.addr, tmp.ns as summ_ns, tmp.spol as kt,kv_konfig.mes_pot , kv_konfig.tar_nak, kv_konfig.mes_pot_time as time_summ_ns '
     + 'from addres ' +
    'inner join tmp on tmp.cod = addres.inc and tmp.sdf = 3 ' +
    'inner join kv_konfig on tmp.inc = kv_konfig.cod ' +
    'where  addres.cod = :inc_addresmain';

  if FormDLL1.bal_summ.Active then
    FormDLL1.bal_summ.close;
  if FormDLL1.bal_kvart.Active then
    FormDLL1.bal_kvart.close;

  if not FormDLL1.IBDatabase2.Connected then
    FormDLL1.IBDatabase2.Connected := true;

  if RadioButton1.Checked = true then
  begin
    FormDLL1.bal_summ.SQLs.SelectSql.Clear;
    FormDLL1.bal_kvart.SQLs.SelectSql.Clear;
    FormDLL1.bal_summ.SQLs.SelectSql.Add(s);
    FormDLL1.bal_kvart.SQLs.SelectSql.Add(k);
    FormDLL1.bal_kvart.ParamByName('inc_addresmain').AsInteger := StrToInt(EditID.Text);
    FormDLL1.bal_summ.ParamByName('inc_addresmain').AsInteger := StrToInt(EditID.Text);
    FormDll1.BalButton1Click(self); // баланс за предыдущие месяцы
  end;

  if RadioButton2.Checked = true then
  begin
    FormDLL1.bal_summ.SQLs.SelectSql.Clear;
    FormDLL1.bal_kvart.SQLs.SelectSql.Clear;
    FormDLL1.bal_summ.SQLs.SelectSql.Add(s);
    FormDLL1.bal_kvart.SQLs.SelectSql.Add(k);
    FormDLL1.bal_kvart.ParamByName('inc_addresmain').AsInteger := StrToInt(EditID.Text);
    FormDLL1.bal_summ.ParamByName('inc_addresmain').AsInteger := StrToInt(EditID.Text);
    FormDll1.BalButton3Click(self); // баланс за текущий месяц
  end;

  if RadioButton3.Checked = true then
  begin
    //FormDLL1.bal_summ.SQLs.SelectSql.Clear;
    //FormDLL1.bal_kvart.SQLs.SelectSql.Clear;
    //FormDLL1.bal_summ.SQLs.SelectSql.Add(s);
    //FormDLL1.bal_kvart.SQLs.SelectSql.Add(k);
    //FormDll1.Qkv_konfig_arh.SQLs.SelectSql.Clear;

    FormDll1.Balance_Period;
  end;

end;

procedure TFormDLL1.RadioButton1Click(Sender: TObject);
begin
  Button1.Enabled := true;
  CheckBox1.Enabled := true;
  nacSrok.Visible := true;
  konSrok.Visible := true;
  nacSrokposl.Visible := false;
  konSrokPosl.Visible := false;
  Label1.Visible := true;
  Label2.Visible := true;
  Label7.Visible := false;
  Label4.Visible := false;
  label3.Visible := true;
  label2.Visible := true;
  FormDll1.FormCreate(self);
end;

procedure TFormDll1.ExcelGraph(ExcelApp_, WorkBook_: variant; column1, column2: string; kind, period: integer);
// kind=0 баланс строится из базы данных, kind=1- диаграммы по файлам из Excel
var
  XLRowCount: integer;
  name1, name2, ss: string;
  oChart: variant;
  Sheet: variant;
  xlCategory, xlSeries, xlValue: integer;
  column_kv: string; // колонка квартир
  tmpi: integer;
  kvartira: variant;
  rad1, rad2: variant;
begin
  xlCategory := 1;
  xlSeries := 1;
  xlValue := 1;
  if kind = 0 then
  begin
    xlRowCount := 30;
    //  ShowMESSAGE(column1);
    // ShowMessage(column2);
    name1 := ExcelApp_.Charts.Add.Name; // Создание диаграммы
    ExcelApp_.Charts.Item[name1].HasTitle := true; //Заголовок
    ExcelApp_.Charts.Item[name1].ChartTitle.Text := 'Потребление квартирых счётчиков';

    ExcelApp_.Charts.Item[name1].HasLegend := True;
    //ActiveChart.Legend.Select
    //    Selection.Position = xlTop
    ExcelApp_.ActiveChart.Legend.Select;
    kvartira := 'xlTop';
    // Selection.Position:=kvartira;
   //___________Подписи___________________
    ExcelApp_.Charts.Item[name1].Axes[xlCategory].HasTitle := True;
    ExcelApp_.Charts.Item[name1].Axes[xlSeries].HasTitle := True;
    ExcelApp_.Charts.Item[name1].Axes[xlValue].HasTitle := True;

    ExcelApp_.Charts.Item[name1].Axes[xlCategory].AxisTitle.Text := '6778768';
    ExcelApp_.Charts.Item[name1].Axes[xlSeries].AxisTitle.Text := 'Ряд';
    ExcelApp_.Charts.Item[name1].Axes[xlValue].AxisTitle.Text := 'Квартиры';
    //______________________________________

    ExcelApp_.Charts.Item[name1].ChartType := 51;
    Sheet := 2;
    delete(column1, length(column1), 1);
    delete(column2, length(column2), 1);
    //  column1:='d13:d52;d61:d66';
    ExcelApp_.ActiveWorkbook.Charts.Item[name1].SetSourceData
      (Source := ExcelApp_.ActiveWorkbook.Sheets.Item[Sheet].Range[column1], PlotBy := 2);
    //  column2:='i13:i52;i61:i66';
    column_kv := column1;
    //  ShowMessage('1 '+column1);
    //  ShowMessage('2 '+column2);
    for tmpi := 1 to length(column_kv) do
    begin
      if column_kv[tmpi] = 'd' then
        column_kv[tmpi] := 'b';
      if column_kv[tmpi] = ';' then
      begin
        column_kv[tmpi] := ','; {Insert('баланс!',column_kv,tmpi+1)}
        ;
      end;
    end;
    ExcelApp_.ActiveWorkbook.Charts.Item[name1].SeriesCollection.Add(Source :=
      ExcelApp_.ActiveWorkbook.Sheets.Item[Sheet].Range[column2]);
    //  ShowMessage(column_kv);

    // подписи оси Ох
    //  (oChart.SeriesCollection(1, lcid) as Series).XValues :=
    //        oSheet.Range['C2:C6', EmptyParam];
     //ActiveChart.PlotArea.Select
    // ExcelApp_.ActiveWorkbook.Charts.Item[name1].PlotArea.Select;
    // column_kv:='_Array(1,3,5,7,9,11,13,15,17,19)';
    kvartira := WorkBook_.WorkSheets[1].Range[column_kv];
    // column_kv:='=(Лист1!R1C1:R7C1,Лист1!R9C1:R10C1)';
    ExcelApp_.ActiveWorkbook.Charts.Item[name1].SeriesCollection(1).XValues := kvartira;
    //WorkBook_.WorkSheets[1].Range[column_kv];
    if period <> 3 then // баланс с начала месяца и за месяцы
    begin
      rad1 := WorkBook_.WorkSheets[1].Cells[7, 6].value;
      rad2 := WorkBook_.WorkSheets[1].Cells[7, 11].value;
    end
    else
    begin
      rad1 := WorkBook_.WorkSheets[1].Cells[7, 4].value;
      rad2 := WorkBook_.WorkSheets[1].Cells[7, 9].value;
    end;
    kvartira := '="Показания на: ' + rad1 + '"';
    ExcelApp_.ActiveWorkBook.ActiveChart.SeriesCollection(1).Name := kvartira;
    kvartira := '="Показания на: ' + rad2 + '"';
    ExcelApp_.ActiveWorkBook.ActiveChart.SeriesCollection(2).Name := kvartira;
    // ExcelApp_.ActiveWorkbook.Charts.Item[name1].SeriesCollection(1).Points(1).DataLabel.Text:='b13:b17';
  end
  else
  begin

  end;


end;

procedure TFormDll1.DateAndTime(dt1, dt2: string);
var
  time_1, time_2: TDateTime;
  posldata_, preddata_: TDate;
  tmp_s, tmp_s1: string;
begin
  tmp_s := copy(dt1, 1, 10);
  delete(tmp_s, 7, 2);
  posldata_ := StrToDate(tmp_s);
  tmp_s1 := copy(dt2, 1, 10);
  delete(tmp_s, 7, 2);
  preddata_ := StrToDate(tmp_s1);
  tmp_s := copy(dt1, 12, 8);
  time_1 := StrToTime(tmp_s);
  tmp_s1 := copy(dt2, 12, 8);
  time_2 := StrToTime(tmp_s1);
  mm1.Kind := dtkTime;
  mm1.Time := time_1;
  mm1.Kind := dtkDate;
  mm1.Date := posldata_;
  mm2.Kind := dtkTime;
  mm2.Time := time_2;
  mm2.Kind := dtkDate;
  mm2.Date := preddata_;
end;

procedure TFormDLL1.DateAskueToData(str: string; var dat: TDateTimePicker);
var
  time_1: TDateTime;
  posldata_: TDate;
  tmp_s: string;
begin
  tmp_s := copy(str, 8, 8);
  posldata_ := StrToDate(tmp_s);
  tmp_s := copy(str, 25, 8);
  time_1 := StrToTime(tmp_s);
  dat.Kind := dtkTime;
  dat.Time := time_1;
  dat.Kind := dtkDate;
  dat.Date := posldata_;
end;

procedure TFormDll1.Balance_period; // Срезы по балансу
label
  metka1, nescitan1x, nescitan3x;
var
  nomDay, nomMonth, nomYear: word;
  ExcelApp, WorkBook, Range, Cell1, Cell2, cell3 {,ArrayData}: variant;
  now: TDate;
  stroka: string;
  SumScet, RowCount, kolvo, kvartScet, BeginCol, BeginRow, ColCount, kolSumScet, i, j: integer;
  PorNomer, nomerSumm, tmp: integer;
  tmp1: real;
  promSumm, promSummAll: array[1..5] of real;
  kt: integer; //коэффициент трансформации
  ItogoPoDomu, BalansPoDomu, PotrSumm: array[1..6] of string;
  ColorCell: byte; //цвет ячеек для итого
  kol1x: integer; //количество квартирных счётчиков
  NotRead: boolean;
  tmpstr, tmpstr1, za1: string;
  posldata, preddata: TDate;
  time1, time2: TDateTime; //TDateTime
  NCOUNT_1, NCOUNT_2, NCOUNT_11, NCOUNT_21: string; // номера записей в kv_konfig_arh, по которым будем строить баланс
  //      mm1,mm2:TDateTimePicker;
  srok, dni, chasy: real;
  columnbal1, columnbal2: string;
  qwe: integer; //удалить

begin
  //time1:=STrToTime('12:12:12');
  //mm1:=nacSrok.DateTime;
  //mm2:=konSrok.DateTime;
  //mm1:=mm2-mm1;
  //ShowMessage('прошло дней:'+FloatToStr(mm1));
  //ShowMessage(timeToStr(time1));
  ProgressBar1.Position := 0;
  BalButton1.Enabled := false;
  BalButton3.Enabled := false;
  mm1.Kind := dtkTime;
  mm2.Kind := dtkTime;
  kol1x := 0;
  exit_bal := false;
  ColorCell := 15;
  IBDatabase2.Connected := true;
  ProgressBar1.Position := 15;
  ExcelApp := Null;
  bal_summ.Open;
  bal_summ.First;
  bal_kvart.Open;
  bal_kvart.First;
  ProgressBar1.Position := 0;

  // if ProgressBar1.Position<70 then ProgressBar1.StepIt;
  LogMemo.Lines.Clear;
  LogMemo.SelAttributes.Color := clBlack;
  LogMemo.Lines.Add('Идёт построение баланса...');
  Application.ProcessMessages;

  stroka := bal_summ.FieldByName('TIME_SUMM_NS').asString;
  now := nacSrok.Date;
  DecodeDate(now, nacSrokYear, nacSrokMonth, nacSrokDay);
  if (stroka <> '') and (stroka <> 'Нет') and (stroka <> 'Пусто') then
  begin
    prom := get_date(stroka);
    tmpstr := copy(konSrokposl.text, 1, 10);
    delete(tmpstr, 7, 2);
    posldata := StrToDate(tmpstr);
    tmpstr1 := copy(nacSrokposl.text, 1, 10);
    delete(tmpstr, 7, 2);
    preddata := StrToDate(tmpstr1);
    tmpstr := copy(konSrokposl.text, 12, 8);
    time1 := StrToTime(tmpstr);
    tmpstr1 := copy(nacSrokposl.text, 12, 8);
    time2 := StrToTime(tmpstr1);
    mm1.Kind := dtkTime;
    mm1.Time := time1;
    mm1.Kind := dtkDate;
    mm1.Date := posldata;
    mm2.Kind := dtkTime;
    mm2.Time := time2;
    mm2.Kind := dtkDate;
    mm2.Date := preddata;
  end
  else
  begin
    //      Application.ProcessMessages;
    LogMemo.SelAttributes.Color := clRed;
    LogMemo.Lines.Add('В базе данных не содержится информация о суммирующем счётчике ' +
      bal_summ.FieldByName('SUMM_NS').asString);
    Application.ProcessMessages;
    LogMemo.SelAttributes.Color := clRed;
    LogMemo.Lines.Add('Построение правильного баланса невозможно');
    Application.ProcessMessages;
    LogMemo.SelAttributes.Color := clRed;
    LogMemo.Lines.Add('Заново проведите опрос счётчика');
    Application.ProcessMessages;
    //      bal_summ.Close;
    exit_bal := true;
  end;
  srok := (mm1.DateTime - mm2.DateTime);
  { if (konSrokPosl.Text='') and (nacSrokposl.Text='') then
    begin
     MessageBox(Application.Handle,'Счётчики не были считаны','Ошибка построения баланса',MB_ICONERROR);
     exit;
    end;}
  if srok <= 0 then
  begin
    MessageBox(Application.Handle, 'Период построения баланса введён неправильно', 'Ошибка', MB_ICONERROR);
    exit_bal := true;
  end;

  if exit_bal = true then
    goto metka1;
  // ShowMessage(stroka);
  // prom:=get_date(stroka);
  tekMesac.Date := prom;
  DecodeDate(prom, nomYear, nomMonth, nomDay);
  // ShowMessage(IntToStr(nacSrokDay)+' '+IntToStr(konSrokDay));
  // now:=konSrok.Date;
  DecodeDate(prom, konSrokYear, konSrokMonth, konSrokDay);
  stroka := Encode_Date(nomYear, nomMonth, 1);
  prom := StrToDate(stroka);
  NacMesac.Date := prom;

  if not IsOleObjectInstalled('Excel.Application') then
  begin
    LogMemo.SelAttributes.Color := clRed;
    LogMemo.Lines.Add('Построение баланса невозможно.Установите Excel');
    Application.ProcessMessages;
    //ShowMessage('Класс не зарегестрирован')
  end
  else
  begin
    //     if ProgressBar1.Position<70 then  ProgressBar1.StepIt;
    SumScet := 11;
    kvartScet := 13;
    BeginCol := 1;
    BeginRow := 13;
    ColCount := 21;
    bal_summ.Last;

    kolSumScet := bal_summ.RecordCount;
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Application.EnableEvents := false;
    ExcelApp.DisplayAlerts := false;
    WorkBook := ExcelApp.WorkBooks.Add(ExtractFilePath(Application.ExeName) + 'balance.xls');
    //     ExcelApp.visible:=true; //__________===========================___________________________
    for i := 1 to 5 do
    begin
      ItogoPoDomu[i] := '=';
      BalansPoDomu[i] := '=(';
    end;
    ItogoPoDomu[6] := '=';
    kolvo := 0;
    bal_summ.First;
    try
      kt := bal_summ.FieldByName('KT').asInteger;
    except
      kt := 1;
      LogMemo.SelAttributes.Color := clRed;
      LogMemo.Lines.Add('Для суммирующего счётчика ' + bal_summ.FieldByName('SUMM_NS').asString +
        ' не введён коэффициент трансформации');
      LogMemo.Lines.Add('Построение правильного баланса невозможно');
      Application.ProcessMessages;

    end;
    WorkBook.WorkSheets[1].Cells[5, 1].value := bal_kvart.FieldByName('ADDR').asString;
    WorkBook.WorkSheets[1].Cells[3, 4].value := bal_kvart.FieldByName('ADDR').asString;
    //       Cell1:=WorkBook.WorkSheets[1].Cells[7,5];
    //       Cell2:=WorkBook.WorkSheets[1].Cells[7,8];
    //       WorkBook.Worksheets[1].Range[Cell1,Cell2].Merge;
    WorkBook.Worksheets[1].Range['D7:H7'].Merge;
    tmpstr := nacSrokposl.text;
    insert(' Время - ', tmpstr, 11);
    tmpstr := ' Дата - ' + tmpstr;
    WorkBook.WorkSheets[1].Cells[7, 4].value := tmpstr;
    Workbook.WorkSheets[1].Range['D7:H7'].HorizontalAlignment := -4108; // выравнивание текста по центру
    Workbook.WorkSheets[1].Range['D7:H7'].Interior.ColorIndex := 6; // цвет ячейки
    //       Cell1:=WorkBook.WorkSheets[1].Cells[7,10];
    //       Cell2:=WorkBook.WorkSheets[1].Cells[7,14];
    //       WorkBook.Worksheets[1].Range[Cell1,Cell2].Merge;
    WorkBook.Worksheets[1].Range['I7:M7'].Merge;
    Workbook.WorkSheets[1].Range['I7:M7'].HorizontalAlignment := -4108; // выравнивание текста по центру
    Workbook.WorkSheets[1].Range['I7:M7'].Interior.ColorIndex := 6; // цвет ячейки

    tmpstr := konSrokposl.text;
    insert(' Время - ', tmpstr, 11);
    tmpstr := ' Дата - ' + tmpstr;
    WorkBook.WorkSheets[1].Cells[7, 9].value := tmpstr;
    WorkBook.WorkSheets[1].Cells[7, 16].value := 'период';
    WorkBook.WorkSheets[1].Cells[7, 19].value := 'месяца';
    memo_Tar_nak_summ.lines.Clear;
    memo_Tar_nak_summ.lines.add(bal_summ.FieldByName('Tar_nak').asString);
    memo_Mes_pot_summ.lines.Clear;
    memo_Mes_pot_summ.lines.add(bal_summ.FieldByName('Mes_pot').asString);
    //     if ProgressBar1.Position<70 then ProgressBar1.StepIt;
    columnbal1 := ''; // ряд для гистограммы
    columnbal2 := ''; // ряд для гистограммы
    while not bal_summ.EOF do
    begin
      NotRead := false;
      try
        kt := bal_summ.FieldByName('KT').asInteger;
      except
        kt := 1;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Для суммирующего счётчика ' + bal_summ.FieldByName('SUMM_NS').asString +
          ' не введён коэффициент трансформации');
        LogMemo.Lines.Add('Построение правильного баланса невозможно');
        Application.ProcessMessages;
      end;
      kolvo := kolvo + 1;
      //    ShowMessage('проверка');
      if kolvo > 1 then
      begin
        SumScet := SumScet + RowCount + 8;
        kvartScet := kvartScet + RowCount + 8;
        BeginRow := BeginRow + RowCount + 8;
      end;
      columnbal1 := columnbal1 + 'd' + IntToStr(kvartScet) + ':'; // ряд для гистограммы
      columnbal2 := columnbal2 + 'i' + IntToStr(kvartScet) + ':'; // ряд для гистограммы
      Qkv_konfig_arh_zapros_summ; // в таблице 10 предыдущих считываний
      //        za1:=CHR()+konSrokposl.Text+#DE;
      //        za1:=Qkv_konfig_arh.SQL.GetText;
      //        ShowMessage('za1='+za1);
      tmpstr := 'select COD,TAR_NAK,NS_TIME, NCOUNT,date_time from kv_konfig_arh where ((date_time=''' +
        konsrokposl.Text + ''') or (date_time=''' + nacsrokposl.Text + ''')) and (COD=' +
        FormDll1.bal_summ.FieldByName('INC').AsString + ') Order by NCOUNT desc';
      Qkv_konfig_arh_z.Close;
      Qkv_konfig_arh_z.SQLs.SelectSql.Clear;
      Qkv_konfig_arh_z.SQLs.SelectSql.Add(tmpstr);
      Qkv_konfig_arh_z.Open;
      Qkv_konfig_arh_z.First;
      //данные с суммирующего счётчика
      ArrayData := VarArrayCreate([1, 1, 1, ColCount], varVariant);
      ArrayData[1, 1] := '-'; //поле № п/п в excel   //испавить
      ArrayData[1, 2] := '-'; //поле квартира в excel
      try
        ArrayData[1, 3] := bal_summ.FieldByName('SUMM_NS').asString; //поле номер счётчика в excel
        stroka := bal_summ.FieldByName('TIME_SUMM_NS').asString;
        Delete(stroka, 1, 7);
        Delete(stroka, 9, 6);
        ArrayData[1, 20] := stroka;
      except
        LogMemo.Lines.add('Ошибка');
      end;
      //table.params.parambyname('олпрлп').asdatetime
      NCOUNT_11 := Qkv_konfig_arh_z.FieldByName('DATE_TIME').AsString;
      Qkv_konfig_arh_z.Next;
      NCOUNT_21 := Qkv_konfig_arh_z.FieldByName('DATE_TIME').AsString;
      Qkv_konfig_arh_z.First;
      if (NCOUNT_11 <> '') or (NCOUNT_21 <> '') then // ввёл 19.04.07
      begin
        DateAndTime(NCOUNT_11, NCOUNT_21);
        if (mm1.DateTime - mm2.DateTime) <= 0 then
        begin
          //        ShowMessage(FloatToStr(mm1.DateTime-mm2.DateTime));
          memo_Tar_nak_summ.lines.Clear;
          memo_Tar_nak_summ.lines.add(Qkv_konfig_arh_z.FieldByName('Tar_nak').asString); // c
          NCOUNT_1 := Qkv_konfig_arh_z.FieldByName('NCOUNT').AsString;
          // номер записей в kv_konfig_arh, по которым будем строить баланс
          Qkv_konfig_arh_z.Next;
          memo_Mes_pot_summ.lines.Clear;
          memo_Mes_pot_summ.lines.add(Qkv_konfig_arh_z.FieldByName('Tar_Nak').asString); // по
          NCOUNT_2 := Qkv_konfig_arh_z.FieldByName('NCOUNT').AsString;
          // номер записей в kv_konfig_arh, по которым будем строить баланс
        end
        else
        begin
          memo_Mes_pot_summ.lines.Clear;
          memo_Mes_pot_summ.lines.add(Qkv_konfig_arh_z.FieldByName('Tar_nak').asString); // c
          NCOUNT_1 := Qkv_konfig_arh_z.FieldByName('NCOUNT').AsString;
          // номер записей в kv_konfig_arh, по которым будем строить баланс
          Qkv_konfig_arh_z.Next;
          memo_Tar_nak_summ.lines.Clear;
          memo_Tar_nak_summ.lines.add(Qkv_konfig_arh_z.FieldByName('Tar_Nak').asString); // по
          NCOUNT_2 := Qkv_konfig_arh_z.FieldByName('NCOUNT').AsString;
          // номер записей в kv_konfig_arh, по которым будем строить баланс
        end;
        //     nomMonth:=konSrokMonth;
        //  ExcelApp.Visible:=true;
        stroka := bal_summ.FieldByName('TIME_SUMM_NS').asString;
      end // для   if (NCOUNT_11<>'')or (NCOUNT_21<>'')then
      else
        stroka := '';
      if (stroka <> '') and (stroka <> 'Нет') and (stroka <> 'Пусто') then
        prom := get_date(stroka)
      else
      begin
        //      Application.ProcessMessages;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('В базе данных не содержится информация о суммирующем счётчике ' +
          bal_summ.FieldByName('SUMM_NS').asString);
        Application.ProcessMessages;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Постороение баланса невозможно');
        Application.ProcessMessages;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Заново проведите опрос счётчика');
        Application.ProcessMessages;
        //        bal_summ.Close;
        //        exit_bal:=true;
        NotRead := true;
      end;
      if NotRead = true then
      begin
        NotReaded3x;
        goto nescitan3x
      end;
      if exit_bal = true then
        goto metka1;

      //       prom:=get_date(stroka);
      DecodeDate(prom, nomYear, nomMonth, nomDay);
      for j := 5 to 8 do
      begin
        //первая дата считывания (с)
        try
          tmp1 := (StrToFloat(memo_Tar_nak_summ.lines[j - 5])) * kt;
        except
          tmp1 := 10000;
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('При считывании суммирующего счётчика ' + ArrayData[1, 3] + ' произошла ошибка ');
          Application.ProcessMessages;
        end;

        {            While nomMonth>konSrokMonth do
                    begin
                     dec(nomMonth);
                     if nomMonth<=0 then begin nomMonth:=nomMonth+12;dec(nomYear);end;
                     try
                      tmp1:=tmp1-StrToFloat(memo_Mes_pot_summ.Lines[13*(j-5)+nomMonth-1])*kt;
                     except
                      tmp1:=tmp1-1;
                      LogMemo.SelAttributes.Color := clRed;
                      LogMemo.Lines.Add('При считывании суммирующего счётчика '+ArrayData[1,3]+' произошла ошибка ');
                      Application.ProcessMessages;
                     end;
                    end; }
        if tmp1 < 0.0001 then
          tmp1 := 0;
        ArrayData[1, j] := tmp1;
        //показания вторая дата (по)
        try
          tmp1 := StrToFloat(memo_Mes_Pot_summ.lines[j - 5]) * kt;
        except
          tmp1 := 10000;
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('При считывании суммирующего счётчика ' + ArrayData[1, 3] + ' произошла ошибка ');
          Application.ProcessMessages;
        end;
        if tmp1 < 0.0001 then
          tmp1 := 0;
        ArrayData[1, j + 5] := tmp1;

        {//показания на 1-ое число  прошедшего месяца
               DecodeDate(prom,nomYear,nomMonth,nomDay);
               nomMonth:=konSrokMonth-1;
               try
                ArrayData[1,j]:=ArrayData[1,j+5]-StrToFloat(memo_Mes_pot_summ.Lines[13*(j-5)+nomMonth-1])*kt;
               except
                LogMemo.SelAttributes.Color := clRed;
                LogMemo.Lines.Add('При считывании суммирующего счётчика '+ArrayData[1,3]+' произошла ошибка');
                Application.ProcessMessages;
               end;
             while nomMonth<>nacSrokMonth do
              begin
               nomMonth:=nomMonth-1;
               if nomMonth<=0 then begin nomMonth:=nomMonth+13;dec(nomYear);end;
               ArrayData[1,j]:=ArrayData[1,j]-StrToFloat(memo_Mes_pot_summ.Lines[13*(j-5)+nomMonth-1])*kt;
              end;
             if ArrayData[1,j]<0.0001 then ArrayData[1,j]:=0;
        //         tmp1:=ArrayData[1,j+5]-StrToFloat(stroka)*bal_summ.FieldByName('KT').asInteger;
        //         ArrayData[1,j]:=tmp1;

              }
      end;
      ArrayData[1, 14] := kt; //поле ктр в excel
      for j := 79 to 83 do //коды симвлов o,p,q,r,s
      begin
        //Считаем потребление всех суммирующих счётчиков
        PotrSumm[j - 78] := PotrSumm[j - 78] + '+' + chr(j) + IntToStr(SumScet);
        //j-64 - 15,16,17,18,19 столбцы
      end;
      nescitan3x:
      Cell1 := WorkBook.WorkSheets[1].Cells[SumScet, BeginCol];
      Cell2 := WorkBook.WorkSheets[1].Cells[SumScet, ColCount];
      Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
      //     if ProgressBar1.Position<70 then ProgressBar1.StepIt;
      try
        Range.Value := ArrayData;
      except
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Построение баланса невозможно');
        Application.ProcessMessages;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Не для всех суммирующих счётчиков введены квартирные');
        Application.ProcessMessages;
        exit_bal := true;
      end;

      stroka := '=SUM(E' + IntToStr(SumScet) + ':H' + IntToStr(SumScet) + ')'; //Cумма по тарифам за месяцы
      WorkBook.WorkSheets[1].Cells[SumScet, 4].Formula := stroka;
      stroka := '=SUM(J' + IntToStr(SumScet) + ':M' + IntToStr(SumScet) + ')';
      WorkBook.WorkSheets[1].Cells[SumScet, 9].Formula := stroka;
      //Строка потребление за месяц
      Bal_kvart.Last;
      RowCount := bal_kvart.RecordCount;
      columnbal1 := columnbal1 + 'd' + IntToStr(kvartScet + RowCount - 1) + ';';
      columnbal2 := columnbal2 + 'i' + IntToStr(kvartScet + RowCount - 1) + ';';
      //     balkvart
      //     if CheckBox1.Checked=false then
      begin
        for i := 79 to 83 do //коды симвлов o,p,q,r,s
        begin
          stroka := '=' + chr(i - 6) + IntToStr(SumScet) + '-' + chr(i - 11) + IntToStr(SumScet);
          WorkBook.WorkSheets[1].Cells[SumScet, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы
        end;
      end;
      { else
       begin
        for i:=79 to 83 do //коды симвлов o,p,q,r,s
         begin
          if i=79 then
           stroka:='='+chr(i-6) +IntToStr(SumScet)+ '-'+chr(i-11)+IntToStr(SumScet)+'-1,5/1000*24*'+IntToStr(konSrokDay-nacSrokDay)+'*'+IntToStr(RowCount)
           else
           stroka:='='+chr(i-6) +IntToStr(SumScet)+ '-'+chr(i-11)+IntToStr(SumScet);
          WorkBook.WorkSheets[1].Cells[SumScet,i-64].FormulaArray:=stroka;  //i-64 - 15,16,17,18,19 столбцы
         end;
       end;}
//промежуточные значения для ввода баланса в excel
      for i := 2 to 5 do
      begin
        promSumm[i] := ArrayData[1, i + 8] - ArrayData[1, i + 3];
        promSumm[1] := promSumm[1] + promSumm[i];
        promSummAll[i] := promSummAll[i] + promSumm[i];
      end;
      promSummAll[1] := promSummAll[1] + promSumm[1];
      Range.Borders.LineStyle := 1;
      //данные с квартирных счётчиков
      Bal_kvart.Last;
      RowCount := bal_kvart.RecordCount;
      kol1x := kol1x + RowCount;
      ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
      ProgressBar1.step := trunc(ProgressBar1.Max / kolSumScet / RowCount);
      bal_kvart.First;
      i := 1;
      PorNomer := 1;
      nomerSumm := bal_summ.FieldByName('inc').asInteger;
      //      Button2Click(self);
      NCOUNT_1 := chr(39) + konsrokposl.Text + chr(39);
      NCOUNT_2 := chr(39) + nacsrokposl.Text + chr(39);
      while not (bal_kvart.EOF) do
      begin
        //                ShowMessage('111');
        ProgressBar1.StepIt;
        Qkv_konfig_arh_zapros_kvart; // в таблице 10 предыдущих считываний
        //                ShowMessage('222');
        //        tmpstr:='select COD,TAR_NAK,NS_TIME, NCOUNT from kv_konfig_arh where ((ns_time='+chr(39)+konsrokposl.Text+chr(39)+')or (ns_time='+chr(39)+nacsrokposl.Text+chr(39)+'))and(COD='+FormDll1.bal_kvart.FieldByName('svaz').AsString+')';
        //tmpstr1 := 'select inc from tmp where ns=' + chr(39) + FormDll1.bal_kvart.FieldByName('kvart_ns').AsString +
        //  chr(39);
        //        ShowMessage(tmpstr1);
        //Select_kvart.Close;
        //select_kvart.SQLs.SelectSql.Clear;
        //select_kvart.SQLs.SelectSql.Add(tmpstr1);
        Application.ProcessMessages;
        //select_kvart.Open;
        //tmpstr1 := select_kvart.fieldByName('INC').AsString;
        //        ShowMessage('квартира: '+bal_kvart.fieldByName('kv').asString+' счётчик: '+FormDll1.bal_kvart.FieldByName('kvart_ns').AsString+' inc: '+tmpstr1);
        //        ShowMessage('tmp.inc='+tmpstr1);
        //tmpstr := 'select COD,TAR_NAK,NS_TIME,DATE_TIME FROM kv_konfig_arh where ((DATE_TIME= ' + NCOUNT_1 +
        //  ') or (DATE_TIME= ' + NCOUNT_2 + ')) and (COD=' + tmpstr1 + ') ORDER BY NCOUNT desc';
        tmpstr := 'select COD,TAR_NAK,NS_TIME,DATE_TIME FROM kv_konfig_arh where ((DATE_TIME= ' + NCOUNT_1 +
          ') or (DATE_TIME= ' + NCOUNT_2 + ')) and (COD = :id_tmp) ORDER BY NCOUNT desc';
        Qkv_konfig_arh_z.Close;
        Qkv_konfig_arh_z.SQLs.SelectSql.Clear;
        //        ShowMessage('кварт');
        //        ShowMessage('kvart '+tmpstr);
        Qkv_konfig_arh_z.SQLs.SelectSql.Add(tmpstr);
        Qkv_konfig_arh_z.ParamByName('id_tmp').AsInteger := FormDll1.bal_kvart.FieldByName('id_tmp').AsInteger;
        Qkv_konfig_arh_z.Open;
        Qkv_konfig_arh_z.First;
        NotRead := false;
        NCOUNT_11 := Qkv_konfig_arh_z.FieldByName('DATE_TIME').AsString;
        Qkv_konfig_arh_z.Next;
        NCOUNT_21 := Qkv_konfig_arh_z.FieldByName('DATE_TIME').AsString;
        Qkv_konfig_arh_z.First;
        if (NCOUNT_11 <> '') or (NCOUNT_21 <> '') then
        begin
          DateAndTime(NCOUNT_11, NCOUNT_21);

          if (mm1.DateTime - mm2.DateTime) <= 0 then
          begin
            memo_MES_pot_kvart.lines.Clear;
            memo_MEs_pot_kvart.lines.add(Qkv_konfig_arh_z.FieldByName('Tar_nak').asString);
            Qkv_konfig_arh_z.Next;
            memo_TAR_NAK_kvart.lines.Clear;
            memo_TAR_NAK_kvart.lines.add(Qkv_konfig_arh_z.FieldByName('Tar_nak').asString);
          end
          else
          begin
            memo_Tar_Nak_kvart.lines.Clear;
            memo_Tar_Nak_kvart.lines.add(Qkv_konfig_arh_z.FieldByName('Tar_nak').asString);
            Qkv_konfig_arh_z.Next;
            memo_Mes_pot_kvart.lines.Clear;
            memo_Mes_pot_kvart.lines.add(Qkv_konfig_arh_z.FieldByName('Tar_nak').asString);
          end;
          //        begin // закомментировал 19/04/07
          ArrayData[i, 1] := PorNomer;
          ArrayData[i, 2] := bal_kvart.fieldByName('kv').asString;
          ArrayData[i, 3] := ' ' + bal_kvart.FieldByName('kvart_ns').asString;
          stroka := bal_kvart.FieldByName('TIME_KVART_NS').asString;
          Delete(stroka, 1, 7);
          Delete(stroka, 9, 6);
          ArrayData[i, 20] := stroka;

          stroka := '=SUM($e$' + IntToStr(kvartScet + i - 1) + ':' + '$h$' + IntToStr(kvartScet + i - 1) + ')';
          ArrayData[i, 4] := stroka;
          stroka := '=SUM($j$' + IntToStr(kvartScet + i - 1) + ':' + '$m$' + IntToStr(kvartScet + i - 1) + ')';
          ArrayData[i, 9] := stroka;
          stroka := '=SUM($p$' + IntToStr(kvartScet + i - 1) + ':' + '$s$' + IntToStr(kvartScet + i - 1) + ')';
          ArrayData[i, 15] := stroka;

          // Собственное потребление квартирных счётчиков
          //          ArrayData[i,20]:='=1,5/1000*24*'+IntToStr(konSrokDay-nacSrokDay);

          //------------new---------------------------------------------------------------------------------------------
          stroka := bal_kvart.FieldByName('TIME_KVART_NS').asString;
        end
        else
        begin
          stroka := '';
          ArrayData[i, 1] := PorNomer;
          ArrayData[i, 2] := bal_kvart.fieldByName('kv').asString;
          ArrayData[i, 3] := ' ' + bal_kvart.FieldByName('kvart_ns').asString;
        end;
        if (stroka <> '') and (stroka <> 'Нет') and (stroka <> 'Пусто') then
          prom := get_date(stroka)
        else
        begin
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('В базе данных не содержится информация о счётчике ' +
            bal_kvart.FieldByName('KVART_NS').asString);
          Application.ProcessMessages;
          LogMemo.SelAttributes.Color := clRed;
          LogMemo.Lines.Add('Заново проведите опрос счётчика');
          Application.ProcessMessages;
          //          bal_kvart.Close;
          //          exit_bal:=true;
          NotRead := true;
        end;
        if exit_bal = true then
          goto metka1;
        {       if prom<konSrok.Date then
       begin
       LogMemo.Visible:=true;
       LogMemo.SelAttributes.Color := clRed;
       LogMemo.Lines.Add('Построение правильного баланса невозможно');
       Application.ProcessMessages;
       LogMemo.SelAttributes.Color := clRed;
       LogMemo.Lines.Add('квартирный счётчик '+ArrayData[i,3]+' считан '+DateToStr(prom));
       Application.ProcessMessages;
       LogMemo.SelAttributes.Color := clBlack;
       end;  }// закоментировал 4.01.06
        DecodeDate(prom, nomYear, nomMonth, nomDay);
        if NotRead = true then
        begin
          NotReaded1x(i);
          goto nescitan1x;
        end;
        for j := 5 to 8 do
        begin
          //показания первого считывания (с)

          try
            tmp1 := (StrToFloat(memo_Mes_pot_kvart.lines[j - 5]));
          except
            tmp1 := 10000;
            LogMemo.SelAttributes.Color := clRed;
            LogMemo.Lines.Add('При считывании квартирного счётчика ' + ArrayData[i, 3] + ' произошла ошибка');
            Application.ProcessMessages;
          end;
          {           While nomMonth<>konSrokMonth do
                      begin
                       dec(nomMonth);
          //             ShowMessage(IntToStr(nomMonth));
                       if nomMonth<=0 then begin nomMonth:=nomMonth+13;dec(nomYear);end;
                       try
                        tmp1:=tmp1-StrToFloat(memo_Mes_pot_kvart.Lines[13*(j-5)+nomMonth-1]);
                       except
                         tmp1:=tmp1-1;
                         LogMemo.SelAttributes.Color := clRed;
                         LogMemo.Lines.Add('При считывании квартирного счётчика '+ArrayData[i,3]+' произошла ошибка');
                         Application.ProcessMessages;
                       end;
                      end;}
          if tmp1 < 0.0001 then
            tmp1 := 0;
          ArrayData[i, j] := tmp1;
          //показания последнего считываия (по)
          try
            tmp1 := StrToFloat(memo_Tar_nak_kvart.lines[j - 5]);
          except
            tmp1 := 10000;
            LogMemo.SelAttributes.Color := clRed;
            LogMemo.Lines.Add('При считывании квартирного счётчика ' + ArrayData[i, 3] + ' произошла ошибка');
            Application.ProcessMessages;
          end;
          if tmp1 < 0.0001 then
            tmp1 := 0;
          ArrayData[i, j + 5] := tmp1;

          //показания на 1-ое число  прошедшего месяца
          {           DecodeDate(prom,nomYear,nomMonth,nomDay);
                     nomMonth:=konSrokMonth-1;
                     try
                      ArrayData[i,j]:=ArrayData[i,j+5]-StrToFloat(memo_Mes_pot_kvart.Lines[13*(j-5)+nomMonth-1]);
                     except
                      LogMemo.SelAttributes.Color := clRed;
                      LogMemo.Lines.Add('При считывании квартирного счётчика '+ArrayData[i,3]+' произошла ошибка');
                      Application.ProcessMessages;
                     end;
                     while nomMonth<>nacSrokMonth do
                      begin
                       nomMonth:=nomMonth-1;
          //             LogMemo.SelAttributes.Color := clGreen;
          //             LogMemo.lines.add(IntToStr(nomMonth));
          //             Application.ProcessMessages;
                       if nomMonth<=0 then begin nomMonth:=nomMonth+13;dec(nomYear);end;
                       try
                        ArrayData[i,j]:=ArrayData[i,j]-StrToFloat(memo_Mes_pot_kvart.Lines[13*(j-5)+nomMonth-1]);
                       except
                         LogMemo.SelAttributes.Color := clRed;
                         LogMemo.Lines.Add('При считывании квартирного счётчика '+ArrayData[i,3]+' произошла ошибка');
                         Application.ProcessMessages;
                       end;
                      end;
                    if ArrayData[i,j]<0.0001 then ArrayData[i,j]:=0;}
        end;
        //---------------new-------------------------------------------------------------------------------------------------
        {          for j:=5 to 8 do
                   begin
                    ArrayData[i,j+5]:=StrToFloat(memo_Tar_nak_kvart.lines[j-5])-StrToFloat(memo_Tar_nak_kvart.Lines[j-1]);//показания на 1-ое число текущего месяца
                    stroka:=memo_Mes_pot_kvart.lines[13*(j-5)+nacSrokMonth-1];
                    ArrayData[i,j]:=ArrayData[i,j+5]-StrToFloat(stroka);//показания на 1-ое число предыдущего месяца
                   end;}
        //---------Показания за месяц для квартирных счётчиков-----------------------------
        for j := 80 to 83 do
        begin
          stroka := '=$' + chr(j - 6) + '$' + IntToStr(kvartScet + i - 1) + '-$' + chr(j - 11) + '$' +
            IntToStr(kvartScet + i - 1);
          ArrayData[i, j - 64] := stroka; //показания за месяц
          //            promSummAll[j-78]:=promSummAll[j-78]+ArrayData[i,j-70]-ArrayData[i,j-75];
          //            promSummAll[1]:=promSummAll[1]+promSummAll[j-78];

        end;

        //--------------------------------------------------------------------------------
        {     Cell1:=WorkBook.WorkSheets[1].Cells[BeginRow,BeginCol];
             Cell2:=WorkBook.WorkSheets[1].Cells[BeginRow+RowCount-1,BeginCol+ColCount-1];
             Range:=WorkBook.WorkSheets[1].Range[Cell1,Cell2];
             Range.FormulaArray:=ArrayData;}
        //--------------------------------------------------------------------------------
        nescitan1x:
        bal_kvart.Next;
        i := i + 1;
        //          if ProgressBar1.Position<70 then  ProgressBar1.StepIt;
        //  ExcelApp.Visible:=true;
        PorNomer := PorNomer + 1;
        //        end //закомментировал 19.04.07 else izmenNom:=true;
      end;
      Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount - 1, BeginCol + ColCount - 1];
      Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
      try
        Range.Formula := ArrayData;
      except
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Построение баланса невозможно');
        Application.ProcessMessages;
        LogMemo.SelAttributes.Color := clRed;
        LogMemo.Lines.Add('Не для всех суммирующих счётчиков введены квартирные');
        Application.ProcessMessages;
        exit_bal := true;
      end;

      if kolvo < kolSumScet then
      begin
        //строка суммирующий счётчик
        Cell1 := WorkBook.WorkSheets[1].Cells[SumScet + RowCount + 8 - 1, 1];
        Cell2 := WorkBook.WorkSheets[1].Cells[SumScet + RowCount + 8 - 1, 19];
        WorkBook.Worksheets[1].Range[Cell1, Cell2].Merge;
        WorkBook.WorkSheets[1].Range['A10:S10'].Copy;
        WorkBook.ActiveSheet.Paste(Destination := WorkBook.Worksheets[1].Range[Cell1, Cell2]);
        //строка квартирные счётчики
        Cell1 := WorkBook.WorkSheets[1].Cells[kvartScet + RowCount + 8 - 1, 1];
        Cell2 := WorkBook.WorkSheets[1].Cells[kvartScet + RowCount + 8 - 1, 19];
        WorkBook.Worksheets[1].Range[Cell1, Cell2].Merge;
        WorkBook.WorkSheets[1].Range['A12:S12'].Copy;
        WorkBook.ActiveSheet.Paste(Destination := WorkBook.Worksheets[1].Range[Cell1, Cell2]);
      end;
      //Строка "Итого"
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 14];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      ArrayData := 'Итого (кВт/ч)';
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 15];
      Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, 19];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;

      //Ввод формул сумм в итого
      for i := 79 to 83 do //коды симвлов o,p,q,r,s
      begin
        tmp := BeginRow + RowCount - 1;
        stroka := '=SUM(' + chr(i) + IntToStr(BeginRow) + ':' + chr(i) + IntToStr(tmp) + ')';
        WorkBook.WorkSheets[1].Cells[BeginRow + RowCount, i - 64].Formula := stroka; //i-64 - 15,16,17,18,19 столбцы
        ItogoPoDomu[i - 78] := ItogoPoDomu[i - 78] + '+' + chr(i) + IntToStr(tmp + 1);

        //  ExcelApp.Visible:=true;
      end;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек

      //Строка "Баланс"
     //     ShowMessage('FormulaArray1');
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 14];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      if CheckBox1.Checked = false then
        ArrayData := 'Баланс без учёта собственного потребления квартирных счётчиков с начала месяца(+/- %)'
      else
        ArrayData := 'Баланс с учётом собственного потребления квартирных счётчиков(+/- %)';
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 15];
      Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, 19];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      //     ItogoPoDomu:=ItogoPoDomu+
      //Ввод формулы в строке "баланс"
      for i := 79 to 83 do //коды симвлов o,p,q,r,s
      begin
        if promSumm[i - 78] < 0.0001 then
          WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, i - 64].Value := '----------'
            //i-64 - 15,16,17,18,19 столбцы
        else
        begin
          if CheckBox1.Checked = false then
          begin
            stroka := '=100*(' + chr(i) + IntToStr(SumScet) + '-' + Chr(i) + IntToStr(BeginRow + RowCount) + ')/' +
              chr(i) + IntToStr(SumScet);
            WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, i - 64].FormulaArray := stroka;
            //i-64 - 15,16,17,18,19 столбцы
          end
          else
          begin
            // K - собственное потребление квартирных счётчиков
            stroka := '=100*(' + chr(i) + IntToStr(SumScet) + '-K' + IntToStr(BeginRow + RowCount + 2) + '-' + Chr(i) +
              IntToStr(BeginRow + RowCount) + ')/' + chr(i) + IntToStr(SumScet);
            WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 1, i - 64].FormulaArray := stroka;
            //i-64 - 15,16,17,18,19 столбцы
          end;
        end;
      end;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек
      // Итого собственное потребление квартирных счётчиков
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 2, 1];
      Cell3 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 2, 10];
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      ArrayData := 'Собственное потребление квартирных счётчиков (кВт/ч)';

      //       stroka:='=1,5/1000*24*'+IntToStr(konSrokDay-nacSrokDay)+'*'+IntToStr(RowCount);
      srok := abs(mm1.DateTime - mm2.DateTime);
      dni := int(srok);
      chasy := (srok - dni) * 24;
      stroka := FloatToStr(StrToFloat(SobstPotr.Text) / 1000 * 24 * dni * RowCount + StrToFloat(SobstPotr.Text) / 1000
        * chasy * RowCount, formatSettings);
      WorkBook.WorkSheets[1].Cells[BeginRow + RowCount + 2, 11].FormulaArray := stroka;
      WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
      ItogoPoDomu[6] := ItogoPoDomu[6] + '+' + chr(75) + IntToStr(tmp + 3); // формула для итого по дому

      Range.Borders.LineStyle := 1;
      //     WorkBook.WorkSheets[1].Range[Cell2,Cell3].Interior.ColorIndex:=ColorCell;//цвет ячеек

      Range.Borders.LineStyle := 1;
      //     WorkBook.WorkSheets[1].Range[Cell2,Cell3].Interior.ColorIndex:=ColorCell;//цвет ячеек
      //     RowCount:=round(random(30));
      {     SumScet:=SumScet+RowCount+5;
           kvartScet:=kvartScet+RowCount+5;
           BeginRow:=BeginRow+RowCount+5;
           RowCount:=round(random(30));}
      //     if ProgressBar1.Position<70 then   ProgressBar1.StepIt;
      bal_summ.Next;
    end;
    //Итого по дому
    tmp := BeginRow + RowCount + 3;
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 14];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    ArrayData := 'Итого по дому (кВт/ч)';
    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
    for i := 79 to 83 do
    begin
      stroka := ItogoPoDomu[i - 78];
      Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 15];
      Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 19];
      //      ShowMessage('Formula_Array_');
      WorkBook.WorkSheets[1].Cells[tmp, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    end;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек
    //строка "Баланс по дому"
    tmp := BeginRow + RowCount + 4;
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 14];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    if CheckBox1.Checked = false then
      ArrayData := 'Баланс по дому без учёта собственного потребления квартирных счётчиков(+/- %)'
    else
      ArrayData := 'Баланс по дому с учётом собственного потребления квартирных счётчиков(+/- %)';

    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
    for i := 79 to 83 do
    begin
      if CheckBox1.Checked = false then
      begin
        BalansPoDomu[i - 78] := '=100*(' + PotrSumm[i - 78] + '-' + chr(i) + IntToStr(tmp - 1) + ')/(' + PotrSumm[i -
          78] + ')'; //chr(i)+IntToStr(tmp-1);
        stroka := BalansPoDomu[i - 78];
        Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 15];
        Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 19];
        if promSummAll[i - 78] < 0.0001 then
          WorkBook.WorkSheets[1].Cells[tmp, i - 64].Value := '----------' //i-64 - 15,16,17,18,19 столбцы
        else
          WorkBook.WorkSheets[1].Cells[tmp, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы

      end
      else
      begin
        BalansPoDomu[i - 78] := '=100*(' + PotrSumm[i - 78] + '-K' + IntToStr(tmp + 1) + '-' + chr(i) + IntToStr(tmp -
          1) + ')/(' + PotrSumm[i - 78] + ')'; //chr(i)+IntToStr(tmp-1);
        stroka := BalansPoDomu[i - 78];
        Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 15];
        Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 19];
        if promSummAll[i - 78] < 0.0001 then
          WorkBook.WorkSheets[1].Cells[tmp, i - 64].Value := '----------' //i-64 - 15,16,17,18,19 столбцы
        else
          WorkBook.WorkSheets[1].Cells[tmp, i - 64].FormulaArray := stroka; //i-64 - 15,16,17,18,19 столбцы
      
      end;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
      WorkBook.WorkSheets[1].Range[Cell2, Cell3].Interior.ColorIndex := ColorCell; //цвет ячеек
    end;
    // собственное потребление квартирных счётчиков по дому
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp + 1, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp + 1, 10];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    ArrayData := 'Собственное потребление квартирных счётчиков по дому(кВт/ч)';
    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
    WorkBook.WorkSheets[1].Cells[tmp + 1, 11].FormulaArray := ItogoPoDomu[6];

    //     WorkBook.WorkSheets[1].Range[Cell2,Cell3].Interior.ColorIndex:=ColorCell;//цвет ячеек

    //-------------Количество счётчиков по дому
    tmp := BeginRow + RowCount + 6;
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 5];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    ArrayData := 'Суммирующих счётчиков: ' + IntToStr(kolSumScet);
    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;

    tmp := BeginRow + RowCount + 7;
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 5];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    ArrayData := 'Квартирных счётчиков: ' + IntToStr(kol1x);
    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;

    tmp := BeginRow + RowCount + 8;
    Cell2 := WorkBook.WorkSheets[1].Cells[tmp, 1];
    Cell3 := WorkBook.WorkSheets[1].Cells[tmp, 5];
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Merge;
    WorkBook.WorkSheets[1].Range[Cell2, Cell3].Borders.LineStyle := 1;
    ArrayData := 'Всего счётчиков: ' + IntToStr(kol1x + kolSumScet);
    WorkBook.WorkSheets[1].Range[Cell2, Cell2] := ArrayData;
    ProgressBar1.Position := ProgressBar1.Max;

    Application.ProcessMessages;
    LogMemo.SelAttributes.Color := clBlack;
    LogMemo.Lines.Add('Баланс построен');
    ExcelApp.DisplayAlerts := true;
    ExcelApp.Run('NotReadedCounters', tmp); // Выполнение макроса(выделение несчитанных счётчиков)
    ExcelApp.Visible := true;
    if graph.Checked = true then
      ExcelGraph(ExcelApp, WorkBook, columnbal1, columnbal2, 0, 3);

         if promSummAll[i - 78] >= 0.0001 then
      begin
        tmp := BeginRow + RowCount + 4;
        pFIBQuery1.SQL.Clear;
        DecimalSeparator := '.';
        pFIBQuery1.SQL.Text:= 'UPDATE ADDRESMAIN SET BALANS =' + FloatToStrF(WorkBook.WorkSheets[1].Cells[tmp, 15].value, ffFixed, 7, 3) + ' WHERE INC =' + editId.Text;
        pFIBQuery1.ExecQuery;
      end;

    metka1:
    if (exit_bal = true) and (VarIsNull(ExcelApp) = false) then
    begin
      ExcelApp.DisplayAlerts := False;
      ExcelApp.Quit;
    end;
 // ExcelApp.Visible := false;
  IBDatabase2.Connected := false;

  end;
  BalButton1.Enabled := true;
  BalButton3.Enabled := true;

end;

procedure TFormDLL1.RadioButton3Click(Sender: TObject);
var
  tmpstr, arh, k, s: string;
  i, j: integer;
begin
  //  CheckBox1.Checked:=false;
  //  CheckBox1.Enabled:=false;

  QueryForm.Show;
  Application.ProcessMessages;
  Button1.Enabled := true;
  label2.Visible := false;
  nacSrok.Visible := false;
  konSrok.Visible := false;
  Label1.Visible := false;
  Label2.Visible := false;
  Label7.Visible := true;
  Label4.Visible := true;
  label3.Visible := false;
  nacSrokposl.Visible := true;
  konSrokPosl.Visible := true;
  //----------------------------------------------------------------------------------
  // заполнение combobox-ов
{
  k := 'SELECT ADDRESMAIN.ADDR, tmp_3xf.sdf as ADDR_1, tmp_3xf.cod, tmp_3xf.addr as kv, tmp_3xf.ns as kvart_ns, kv_konfig.mes_pot , kv_konfig.tar_nak, kv_konfig.mes_pot_time as time_kvart_ns,tmp.inc as svaz'
    + '  FROM addresmain, tmp_3xf, kv_konfig,tmp where addresmain.inc = ' + EditId.Text +
    ' and tmp_3xf.ns in (select ns from tmp where tmp.cod in (select inc from addres where addres.cod = ' + EditID.Text
    +
    ')) and kv_konfig.cod in (select inc from tmp where tmp.ns = tmp_3xf.ns) and tmp_3xf.cod = tmp.inc and tmp_3xf.cod = :inc ORDER BY tmp_3xf.addr ASC';
}
  k := 'SELECT ADDRESMAIN.ADDR, tmp_3xf.sdf as ADDR_1, tmp_3xf.cod, tmp_3xf.addr as kv, tmp_3xf.ns as kvart_ns, tmp_3xf.id_tmp, kv_konfig.mes_pot, '
    +
    ' kv_konfig.tar_nak, kv_konfig.mes_pot_time as time_kvart_ns,tmp.inc as svaz ' +
    ' from addresmain ' +
    ' inner join addres on addresmain.inc = addres.cod ' +
    ' inner join tmp on addres.inc = tmp.cod ' +
    ' inner join tmp_3xf on tmp.inc = tmp_3xf.cod and tmp_3xf.cod = :inc ' +
    ' inner join kv_konfig on kv_konfig.cod = tmp_3xf.id_tmp ' +
    ' where addresmain.inc = :inc_addresmain ' +
    ' order by tmp_3xf.addr';
 {
  s := 'SELECT tmp.inc, tmp.addr, tmp.ns as summ_ns, tmp.spol as kt,kv_konfig.mes_pot , kv_konfig.tar_nak, kv_konfig.mes_pot_time as time_summ_ns  FROM addresmain,tmp, kv_konfig where addresmain.inc = '
    + EditId.Text + ' and tmp.sdf = 3 and tmp.cod in (select inc from addres where addres.cod = ' + EditId.Text +
    ') and kv_konfig.cod = tmp.inc';
}
  s := 'select tmp.inc, tmp.addr, tmp.ns as summ_ns, tmp.spol as kt,kv_konfig.mes_pot , kv_konfig.tar_nak, kv_konfig.mes_pot_time as time_summ_ns ' +
        ' from addres ' +
        ' inner join tmp on (addres.inc = tmp.cod) and tmp.sdf = 3 ' +
        ' inner join kv_konfig on (tmp.inc = kv_konfig.cod) ' +
        ' where  addres.cod = :inc_addresmain';
  FormDLL1.bal_summ.Close;
  FormDLL1.bal_kvart.Close;
  Qkv_konfig_arh.Close;
  FormDLL1.bal_summ.SQLs.SelectSql.Clear;
  FormDLL1.bal_kvart.SQLs.SelectSql.Clear;
  FormDLL1.bal_summ.SQLs.SelectSql.Add(s);
  FormDLL1.bal_kvart.SQLs.SelectSql.Add(k);
  FormDLL1.bal_kvart.ParamByName('inc_addresmain').AsInteger := StrToInt(EditID.Text);
  FormDLL1.bal_summ.ParamByName('inc_addresmain').AsInteger := StrToInt(EditID.Text);
  FormDll1.Qkv_konfig_arh.SQLs.SelectSql.Clear;

  IBDatabase2.Connected := true;
  FormDLL1.bal_summ.Active := true;
  FormDLL1.bal_kvart.Active := true;
  FormDll1.Qkv_konfig_arh_zapros_summ;
  Qkv_konfig_arh.First;
  KonSrokPosl.Items.Clear;
  nacSrokPosl.Items.Clear;
  for i := 9 downto 0 do
  begin
    tmpstr := Qkv_konfig_arh.fieldByName('DATE_TIME').AsString;
    if tmpstr <> '' then
    begin
      konSrokposl.Items.Add(tmpstr);
      if konSrokPosl.Items.Count > 1 then
        nacSrokposl.Items.Add(tmpstr);
    end;
    Qkv_konfig_arh.Next;
  end;
  QueryForm.Visible := false;
  konSrokposl.Text := konSrokposl.Items[0];
  nacSrokposl.Text := nacSrokposl.Items[0];
  if (konSrokposl.Text = '') or (nacSrokposl.Text = '') then
  begin
    Button1.Enabled := false;
  end;

  //----------------------------------------------------------------------------------

  // Balance_period;
end;

procedure TFormDll1.Qkv_konfig_arh_zapros_summ;
var
  arh: string;
begin
  FormDll1.Qkv_konfig_arh.Close;
  FormDll1.Qkv_konfig_arh.SQLs.SelectSql.Clear;
  arh := 'select COD, TAR_NAK, NS_TIME, DATE_TIME, NCOUNT FROM KV_KONFIG_ARH WHERE COD = :inc ORDER BY DATE_TIME DESC';
  FormDll1.Qkv_konfig_arh.SQLs.SelectSql.Add(arh);
  FormDLL1.Qkv_konfig_arh.ParamByName('inc').AsInteger := FormDll1.bal_summ.FieldByName('INC').AsInteger;
  FormDll1.Qkv_konfig_arh.Open;
end;

procedure TFormDll1.Qkv_konfig_arh_zapros_kvart;
var
  arh, tmpstr1: string;
begin

//  tmpstr1 := 'select inc from tmp where ns= ''' + FormDll1.bal_kvart.FieldByName('kvart_ns').AsString + '''';
//  Select_kvart.Close;
//  select_kvart.SQLs.SelectSql.Clear;
//  select_kvart.SQLs.SelectSql.Add(tmpstr1);
//  select_kvart.Open;

  FormDll1.Qkv_konfig_arh.Close;
  FormDll1.Qkv_konfig_arh.SQLs.SelectSql.Clear;
  //arh := 'Select COD,TAR_NAK,NS_TIME,DATE_TIME, DATE_TIME, NCOUNT FROM KV_KONFIG_ARH WHERE COD=(select inc from tmp where ns = '''
  //  + FormDll1.bal_kvart.FieldByName('kvart_ns').AsString + ''') ORDER BY NCOUNT DESC';
  arh := 'Select COD,TAR_NAK,NS_TIME,DATE_TIME, DATE_TIME, NCOUNT FROM KV_KONFIG_ARH WHERE COD = :id_tmp ORDER BY NCOUNT DESC';
  FormDll1.Qkv_konfig_arh.SQLs.SelectSql.Add(arh);
  FormDLL1.Qkv_konfig_arh.ParamByName('id_tmp').AsInteger := FormDll1.bal_kvart.FN('id_tmp').AsInteger;
  FormDll1.Qkv_konfig_arh.Open;
end;

procedure TFormDLL1.Button2Click(Sender: TObject);
begin
  Notebook1.PageIndex := (Notebook1.PageIndex + 1) mod 2;
end;

end.

