unit UExport_TEM_104;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, DB, FIBDataSet, pFIBDataSet,
  ExtCtrls, sBevel, StdCtrls, Buttons, sBitBtn, DBClient, QExport4, QExport4DBF,
  sDialogs;

type
  TForm_Export_TEM_104 = class(TForm)
    DataSource1: TDataSource;
    tmp: TpFIBDataSet;
    DBGridEh1: TDBGridEh;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sBevel1: TsBevel;
    sSaveDialog1: TsSaveDialog;
    CDS_TEM_104: TClientDataSet;
    CDS_TEM_104zavn: TStringField;
    CDS_TEM_104kju: TStringField;
    CDS_TEM_104adr: TStringField;
    CDS_TEM_104Kod_Ch: TIntegerField;
    CDS_TEM_104tipsh: TStringField;
    CDS_TEM_104Uch: TIntegerField;
    CDS_TEM_104dat: TCurrencyField;
    CDS_TEM_104vrem: TCurrencyField;
    CDS_TEM_104Q1: TFloatField;
    CDS_TEM_104V1: TFloatField;
    CDS_TEM_104G1: TFloatField;
    CDS_TEM_104tpod: TFloatField;
    CDS_TEM_104Q2: TFloatField;
    CDS_TEM_104V2: TFloatField;
    CDS_TEM_104G2: TFloatField;
    CDS_TEM_104tobr: TFloatField;
    CDS_TEM_104txv: TFloatField;
    CDS_TEM_104Trab: TFloatField;
    CDS_TEM_104Trab_o: TFloatField;
    CDS_TEM_104N_GrUch: TIntegerField;
    QExp_TEM_104: TQExport4DBF;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ExportTem(fileName: string);
    { Public declarations }
  end;
const
  enabledPar: array[0..12, 0..2] of byte = ((1,0,0), (1,1,1), (1,1,1), (1,2,2), (1,2,2), (1,2,2), (1,2,2), (1,2,2), (1,2,2), (2,2,2), (2,3,3), (2,3,3), (3,3,3));
var
  Form_Export_TEM_104: TForm_Export_TEM_104;

implementation

uses Udm1, UFunction;

{$R *.dfm}

procedure TForm_Export_TEM_104.ExportTem(fileName: string);
var
    Blod: TStrings;
    Tteh: Real;
    Tnar: Real;
    zavn: string;
    adr: string;
    dat: TDate;
    vrem: TTime;
    Q1: Real;
    V1: Real;
    G1: Real;
    tpod: Real;
    Q2: Real;
    V2: Real;
    G2: Real;
    tobr: Real;
    txv: Real;
    Trab: Real;
    Trab_o: Real;
    type_counter: Byte;
    counter_name: string;
    countSystem: Integer;
    i: Integer;
    vidUch: Integer;
    adrSysCon, adrSysPar: Integer;
    SysType: Byte;
    num_chM: Integer;
    num_chV: Integer;
    cod_sch: string;
    jeu: string;
    temp_str: string;
label
  labelKonec;
procedure AddRecord();
begin
  CDS_TEM_104.AppendRecord([zavn,                       // Заводской номер прибора
                            jeu,                         // Код ЖЭУ
                            adr,                        // Адрес местоположения счетчика
                            cod_sch,                    // Код счетчика в нумерации ЭНЕРГОСБЫТА
                            counter_name,               // Тип теплосчетчика, название
                            vidUch,                     // Вид учета
                            dat,                        // Дата снятия показаний
                            vrem,                       // Время снятия показаний
                            Q1,                         // Показания прибора учета расхода тепла в подающем трубопроводе
                            V1,                         // Расход сетевой воды в подающем трубопроводе
                            G1,                         // Среднесуточный расход сетевой воды в подающем трубопроводе
                            tpod,                       // Среднесуточная температура сетевой воды в плдающем трубопроводе
                            Q2,                         // Показания прибора учета расхода тепла в обратном трубопроводе
                            V2,                         // Расход сетевой воды в обратном трубопроводе
                            G2,                         // Среднесуточный расход сетевой воды в обратном трубопроводе
                            tobr,                       // Среднесуточная температура сетевой воды в обратном трубопроводе
                            txv,                        // Среднесуточная температура холодной воды
                            Trab,                       // Общее время работы системы
                            Trab_o,                     // Время работы прибора с ошибкой
                            0]);                        // Код счетчика групповога учета в кодировке ЭНЕРГОСБЫТА
end;


begin
  tmp.First;
  if tmp.Eof then
    Exit;

  Blod := TStringList.Create;
  if not CDS_TEM_104.Active then
    CDS_TEM_104.CreateDataSet;
  CDS_TEM_104.Open;

  while not tmp.Eof do
    begin
      Blod := TStringList.Create;
      // Память таймера 512 байт
      Blod.Text := tmp.FN('M7').AsString;
      try
        type_counter := StrToInt(Blod.Strings[511]);
      except
        tmp.Next;
        Continue;
      end;

      if type_counter = 0 then
        begin
          //Заводской номер прибора
          zavn := EncodeDataTem_104(blod, $0000, $007C, 'L_notInv');
          countSystem := StrToInt(EncodeDataTem_104(blod, $0000, $0000, 'C'));
        end
      else
        begin
          zavn := Chr(StrToInt(Blod.Strings[0])) +
                      Chr(StrToInt(Blod.Strings[1])) +
                      Chr(StrToInt(Blod.Strings[2])) +
                      Chr(StrToInt(Blod.Strings[3])) +
                      Chr(StrToInt(Blod.Strings[4])) +
                      Chr(StrToInt(Blod.Strings[5])) +
                      Chr(StrToInt(Blod.Strings[6]));
      end;


      adr := tmp.FN('ADDR').AsString;
      jeu := tmp.FN('JEU').AsString;
      cod_sch := tmp.FN('COD_SCH').AsString;

      num_chM := 1;
      num_chV := 1;
      try
        Blod.Clear;
        Blod.Text := tmp.FN('M7').AsString;
        type_counter := StrToInt(Blod.Strings[511]);
        if type_counter = 0 then
          counter_name := 'ТЭМ-104'
        else if type_counter = 1 then
          counter_name := 'ТЭМ-104/1';

        if type_counter = 0 then
          begin
            for i := 0 to countSystem - 1 do
            begin
              Trab_o := 0;
              Trab := 0;
              Q1 := 0;
              V1 := 0;
              Q2 := 0;
              V1 := 0;
              G2 := 0;
              Q2 := 0;
              tpod := 0;
              tobr := 0;
              txv := 0;
              dat := 0;
              vrem := 0;

              Blod.Text := tmp.FN('M7').AsString;
              adrSysCon := $00600 + $40 * i;
              adrSysPar := $0000 + $92 * i;
              try
                SysType := StrToInt(EncodeDataTem_104(blod, adrSysCon, $0000, 'C'));
              except

              end;

              if i = 0 then
                Q1 := StrToInt(EncodeDataTem_104(blod, $0200, $0058, 'L[1]_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0028, 'F[1]'));
              if i = 1 then
                Q1 := StrToInt(EncodeDataTem_104(blod, $0200, $0058, 'L[2]_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0028, 'F[2]'));

              if enabledPar[SysType, 0] > 0 then
              begin
                V1 := StrToInt(EncodeDataTem_104(Blod, $0200, $0048, 'L[' + IntToStr(num_chM) +  ']_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0018, 'F[' + IntToStr(num_chM) +  ']'));
                num_chM := num_chM + 1;
              end;
              if enabledPar[SysType, 0] > 1 then
              begin
                V2 := StrToInt(EncodeDataTem_104(Blod, $0200, $0048, 'L[' + IntToStr(num_chM) +  ']_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0018, 'F[' + IntToStr(num_chM) +  ']'));
                num_chM := num_chM + 1;
              end;

              try
              if enabledPar[SysType, 2] > 0 then
                tpod := StrToFloat(EncodeDataTem_104(Blod, $0200, $00C8 + i*6, 'I[1]_not'))/100;
              if enabledPar[SysType, 2] > 1 then
                tobr := StrToFloat(EncodeDataTem_104(Blod, $0200, $00C8 + i*6, 'I[2]_not'))/100;
              if enabledPar[SysType, 2] > 2 then
                txv := StrToFloat(EncodeDataTem_104(Blod, $0200, $00C8 + i*6, 'I[3]_not'))/100;
              except

              end;

              //Время Тнар
              Trab := (StrToInt(EncodeDataTem_104(blod, $0200, $006C, 'L[1]_not')) + StrToInt(EncodeDataTem_104(blod, $0200, $00AC, 'L[1]_not')))/3600;
              //Время Tтех
              Trab_o := StrToInt(EncodeDataTem_104(blod, $0200, $00AC, 'L[1]_not'))/3600;
              
              //mimemory
              Blod.Clear;
              Blod.Text := tmp.FN('M9').AsString;
              if enabledPar[SysType, 0] > 0 then
                G1 := StrToFloat(EncodeDataTem_104(Blod, adrSysPar, $0050, 'F[1]'));
              if enabledPar[SysType, 0] > 1 then
                G2 := StrToFloat(EncodeDataTem_104(Blod, adrSysPar, $0050, 'F[2]'));

              //timer128
              Blod.Clear;
              Blod.Text := tmp.FN('M8').AsString;

              dat := StrToDate(EncodeDataTem_104(blod, $0017, $0000, 'BCD') + '.' + EncodeDataTem_104(blod, $0018, $0000, 'BCD') + '.' + EncodeDataTem_104(blod, $0019, $0000, 'BCD'));
              vrem := StrToTime(EncodeDataTem_104(blod, $0014, $0000, 'BCD') + ':' + EncodeDataTem_104(blod, $0012, $0000, 'BCD') + ':' + EncodeDataTem_104(blod, $0010, $0000, 'BCD'));
              vidUch := i+1;
              AddRecord;  //Добавление записи в таблицу экспорта
            end;
          end
        else if type_counter = 1 then
          begin
            Trab_o := 0;
            Trab := 0;
            Q1 := 0;
            V1 := 0;
            Q2 := 0;
            V1 := 0;
            G2 := 0;
            Q2 := 0;
            tpod := 0;
            tobr := 0;
            txv := 0;
            dat := 0;
            vrem := 0;
            try
              Q1 := StrToInt(EncodeDataTem_104(blod, $0154, $0000, 'L[1]_not')) + StrToFloat(EncodeDataTem_104(Blod, $0158, $0000, 'F[1]'));
            except

            end;
            try
              V1 := StrToInt(EncodeDataTem_104(Blod, $014C, $0000, 'L[1]_not')) + StrToFloat(EncodeDataTem_104(Blod, $0150, $0000, 'F[1]'));
            except

            end;

            Trab := StrToInt(EncodeDataTem_104(blod, $015C, $0000, 'L[1]_not')) + StrToInt(EncodeDataTem_104(blod, $0164, $0000, 'L[1]_not'))/3600;
            Trab_o := StrToInt(EncodeDataTem_104(blod, $0164, $0000, 'L[1]_not'))/3600;

            Blod.Clear;
            Blod.Text := tmp.FN('M9').AsString;
            try
              //Массовый расход
              G1 := StrToFloat(EncodeDataTem_104(Blod, $00BC, $0000, 'F[1]'));
            except

            end;

            //Температура
            tpod := (StrToFloat(EncodeDataTem_104(Blod, $00C0, $0000, 'F[1]')));
            tobr := (StrToFloat(EncodeDataTem_104(Blod, $00C0, $0000, 'F[2]')));

            Blod.Clear;
            Blod.Text := tmp.FN('M8').AsString;

            dat := StrToDate(EncodeDataTem_104(blod, $0004, $0000, 'BCD') + '.' + EncodeDataTem_104(blod, $0005, $0000, 'BCD') + '.' + EncodeDataTem_104(blod, $0006, $0000, 'BCD'));
            try
              temp_str := EncodeDataTem_104(blod, $0002, $0000, 'BCD') + ':' + EncodeDataTem_104(blod, $0001, $0000, 'BCD') + ':' + EncodeDataTem_104(blod, $0000, $0000, 'BCD');
              vrem := StrToTime(temp_str);
            finally
               vidUch := 1;
               AddRecord;  //Добавление записи в таблицу экспорта
            end;

//            Trab_o := StrToInt(EncodeDataTem_104(blod, $0164, $0000, 'L[1]_not')) / 3600;
//            Trab := StrToInt(EncodeDataTem_104(blod, $015C, $0000, 'L[1]_not')) / 3600;
//            Q1 := StrToInt(EncodeDataTem_104(blod, $0154, $0000, 'L[1]')) + StrToFloat(EncodeDataTem_104(Blod, $0158, $0000, 'F[1]'));
//            V1 := StrToInt(EncodeDataTem_104(Blod, $014C, $0000, 'L[1]')) + StrToFloat(EncodeDataTem_104(Blod, $0150, $0000, 'F[1]'));
//            tpod := StrToFloat(EncodeDataTem_104(Blod, $0176, $0000, 'I'))/10;
//
//            Q2 := 0.0;
//            V2 := 0.0;
//            G2 := 0.0;
//            tobr := StrToFloat(EncodeDataTem_104(Blod, $0178, $0000, 'I'))/10;
//
//            //mimemory
//            Blod.Clear;
//            Blod.Text := tmp.FN('M9').AsString;
//            G1 := StrToFloat(EncodeDataTem_104(Blod, $00BC, $0000, 'F[1]'));
          end;
      except
    
      end;

      tmp.Next;
    end;

  Blod.Free;
  QExp_TEM_104.FileName := fileName;
  try
    QExp_TEM_104.Execute;
  except

  end;
  CDS_TEM_104.Close;
  CDS_TEM_104.Active := False;
end;

procedure TForm_Export_TEM_104.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tmp.Close;
end;

procedure TForm_Export_TEM_104.FormShow(Sender: TObject);
begin
  tmp.Open;
end;

procedure TForm_Export_TEM_104.sBitBtn1Click(Sender: TObject);
begin
  if Application.MessageBox('Выполнить экспорт?', 'Экспорт данных ТЭМ-104', MB_YESNO+MB_ICONINFORMATION) <> ID_YES then
    Exit;
  if sSaveDialog1.Execute then
    begin
      try
        ExportTem(sSaveDialog1.FileName);
        Application.MessageBox('Данные экспортированы!', 'Экспорт данных ТЭМ-104', MB_OK+MB_ICONINFORMATION);
      Except
        Application.MessageBox('Не удалось экспортировать данные!', 'Ошибка экспорта', MB_OK+MB_ICONERROR);
      end;
    end;
end;

procedure TForm_Export_TEM_104.sBitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
