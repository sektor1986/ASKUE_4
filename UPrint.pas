unit UPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, Buttons, sBitBtn, frxClass,
  sGroupBox, ComObj, pFIBQuery, sGauge;

type
  TFormPrint = class(TForm)
    sPanel1: TsPanel;
    sBitBtn1: TsBitBtn;
    sRadioGroup1: TsRadioGroup;
    sRadioGroup2: TsRadioGroup;
    sGauge1: TsGauge;
    procedure sBitBtn1Click(Sender: TObject);
    procedure PrintSim(vid: integer);
    procedure PrintOtchet(vid: integer);
    procedure sRadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PrintStrunktur(vid: integer);
    procedure PrintSummir;
    { Public declarations }
  end;

var
  FormPrint: TFormPrint;

implementation

uses UdmPrint, Udm1, Unit1;

{$R *.dfm}

procedure TFormPrint.PrintOtchet(vid: integer);
var
  i: integer;
  j: integer;
  incAddres: string;
  progr: integer;
  incDate: Integer;
  adr: string;
  bal: string;
  home_cod: string;
  prim: string;
  dop: string;
  countSch: string;
  counNeopr: string;
  neoprSch: string;
  dateOpr: TDateTime;
  excel: Variant;
  sqlAddresmain: TpFIBQuery;
  sqlTmp: TpFIBQuery;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\' + 'Отчёт.xls') then
  begin
    excel := CreateOleObject('Excel.Application');
    excel.Workbooks.Open(ExtractFilePath(Application.ExeName) + 'Reports\' + 'Отчёт.xls', 0, true);
    sqlAddresmain := TpFIBQuery.Create(nil);
    with sqlAddresmain do
      try
        Database := dm1.database;
        Transaction := dm1.transact1;
        SQL.Add('select count(inc)');
        SQL.Add(' from addresmain');
        SQL.Add(' where chec = 1');
        ExecQuery;
        sGauge1.MaxValue := FN('count').AsInteger;
        progr := 1;
        Close;
        SQL.Clear;
        SQL.Add('select inc, addr, rez1, rez2, home_cod, balans ');
        SQL.Add(' from addresmain');
        SQL.Add(' where chec = 1');
        SQL.Add(' order by addr');
        ExecQuery;
        i := 3;
        sqlTmp := TpFIBQuery.Create(nil);
        sqlTmp.Database := dm1.database;
        sqlTmp.Transaction := dm1.transact1;
        while not eof do
        begin
          adr := sqlAddresmain.FN('addr').AsString;
          home_cod := sqlAddresmain.FN('home_cod').AsString;
          prim := sqlAddresmain.FN('rez1').AsString;
          dop := sqlAddresmain.FN('rez2').AsString;
          bal := sqlAddresmain.FN('balans').AsString;
          sqlTmp.Close;
          sqlTmp.SQL.Clear;
          sqlTmp.SQL.Add('select  count(inc)');
          sqlTmp.SQL.Add(' from tmp');
          sqlTmp.SQL.Add(' where cod in (select inc from addres');
          sqlTmp.SQL.Add('     where cod = :inc)');
          sqlTmp.ParamByName('inc').AsString := sqlAddresmain.FN('inc').AsString;
          sqlTmp.ExecQuery;
          countSch := sqlTmp.FN('count').AsString;
          sqlTmp.Close;
          sqlTmp.SQL.Clear;

          sqlTmp.SQL.Add('select inc');
          sqlTmp.SQL.Add(' from tmp');
          sqlTmp.SQL.Add(' where cod in (select inc from addres');
          sqlTmp.SQL.Add('     where cod = :inc)');
          sqlTmp.SQL.Add(' and hashr = 1');
          sqlTmp.ParamByName('inc').AsString := sqlAddresmain.FN('inc').AsString;
          sqlTmp.ExecQuery;
          incDate := sqlTmp.FN('inc').AsInteger;
          sqlTmp.Close;
          sqlTmp.SQL.Clear;

          sqlTmp.SQL.Add('select times');
          sqlTmp.SQL.Add(' from kv_konfig ');
          sqlTmp.SQL.Add(' where cod = ' + IntToStr(incDate));
          sqlTmp.ExecQuery;
          dateOpr := StrToDateDef(Copy(sqlTmp.FieldByName('times').AsString, Pos('Дата - ',
            sqlTmp.FieldByName('times').AsString) + 7, 8), 0);
          sqlTmp.Close;
          sqlTmp.SQL.Clear;

          sqlTmp.SQL.Add('select  kv, ns');
          sqlTmp.SQL.Add(' from tmp');
          sqlTmp.SQL.Add(' where cod in (select inc from addres');
          sqlTmp.SQL.Add('     where cod = :inc)');
          sqlTmp.SQL.Add(' and hashr = 0');
          if vid = 1 then
            sqlTmp.SQL.Add(' and sdf = 3');
          sqlTmp.SQL.Add(' order by kv');
          sqlTmp.ParamByName('inc').AsString := sqlAddresmain.FN('inc').AsString;
          sqlTmp.ExecQuery;
          neoprSch := '';
          j := 0;
          while not sqlTmp.Eof do
          begin
            neoprSch := neoprSch + 'кв.' + sqlTmp.FN('kv').AsString + ' №-' + sqlTmp.FN('ns').AsString + ' ';
            Inc(j);
            sqlTmp.Next;
          end;
          counNeopr := IntToStr(j);
          if i <> 3 then
          begin
            excel.Rows[i - 1].Copy(excel.Rows[i]);
          end;
          excel.Cells[i, 1] := home_cod;
          excel.Cells[i, 2] := adr;
          excel.Cells[i, 3] := prim;
          excel.Cells[i, 4] := dop;
          excel.Cells[i, 5] := countSch;
          excel.Cells[i, 6] := counNeopr;
          excel.Cells[i, 7] := neoprSch;
          excel.Cells[i, 8] := DateToStr(dateOpr);

          excel.Cells[i, 9] := bal;
     
          Inc(i);
          sGauge1.Progress := progr;
          Application.ProcessMessages;
          Inc(progr);
          Next;
        end;
      finally
        sqlTmp.Free;
        Free
      end;
    excel.Visible := true;
  end
  else
    Application.MessageBox('Не найден файл отчёта Отчёт.xls', 'Ошибка!', MB_OK + MB_ICONERROR);
end;

procedure TFormPrint.PrintSim(vid: integer);
begin
  if dmPrint.SIM.Active then
    dmPrint.SIM.Close;
  dmPrint.SIM.SQLs.SelectSQL.Clear;
  with dmPrint do
    case vid of
      0:
        begin
          SIM.SQLs.SelectSQL.Add('select town, addresmain.addr, koncen.phone');
          SIM.SQLs.SelectSQL.Add('  from addresmain, koncen, town');
          SIM.SQLs.SelectSQL.Add('  where (koncen.cod = addresmain.inc)');
          SIM.SQLs.SelectSQL.Add('  and  (town.inc = addresmain.rez)');
          SIM.SQLs.SelectSQL.Add('  order by town, addresmain.addr');
        end;
      1:
        begin
          SIM.SQLs.SelectSQL.Add('select town, addresmain.addr, koncen.phone');
          SIM.SQLs.SelectSQL.Add('  from addresmain, koncen, town');
          SIM.SQLs.SelectSQL.Add('  where (koncen.cod = addresmain.inc)');
          SIM.SQLs.SelectSQL.Add('  and  (town.inc = addresmain.rez)');
          SIM.SQLs.SelectSQL.Add('  and  (town.inc = :inc)');
          SIM.SQLs.SelectSQL.Add('  order by addresmain.addr');
        end;
    end;

  dmPrint.SIM.Open;
  if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\' + 'SIM.fr3') then
    try
      dmPrint.frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\' + 'SIM.fr3');
      dmPrint.frxReport1.ShowReport();
    except
      ShowMessage('Ошибка при формировании детализации отчета');
    end
  else
    Application.MessageBox('Не найден файл конфигурации отчёта SIM.fr3', 'Ошибка!', MB_OK + MB_ICONERROR);
  dmPrint.SIM.Close;
end;

procedure TFormPrint.PrintStrunktur(vid: integer);
var
  Memo1: TfrxMemoView;
  openAddres: Boolean;
begin
  if dmPrint.tmp.Active then
    dmPrint.tmp.Close;
  dmPrint.tmp.SQLs.SelectSQL.Clear;
  with dmPrint do
    case vid of
      0:
        begin
          tmp.DataSource := dm1.DSaddresmain;
          tmp.SQLs.SelectSQL.Add('SELECT tmp.KV, tmp.NS, tmp.PPLAT, tmp.LSCHET, kv_konfig.date_poverka');
          tmp.SQLs.SelectSQL.Add('  FROM TMP, kv_konfig');
          tmp.SQLs.SelectSQL.Add('    where tmp.cod in (select inc from addres where addres.cod = :inc)');
          tmp.SQLs.SelectSQL.Add('    and (kv_konfig.COD = tmp.inc)');
          tmp.SQLs.SelectSQL.Add('    order by tmp.kv');
          tmp.Open;
          if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\' + 'STRUKT.fr3') then
            try
              frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\' + 'STRUKT.fr3');
              Memo1 := dmPrint.frxReport1.FindObject('Memo1') as TfrxMemoView;
              Memo1.Text := 'г. ' + dm1.townTOWN.AsString + ', ' + dm1.addresmainADDR.AsString;
              frxReport1.ShowReport();
            except
              ShowMessage('Ошибка при формировании детализации отчета');
            end
          else
            Application.MessageBox('Не наёден файл конфигурации отчёта STRUKT.fr3', 'Ошибка!', MB_OK + MB_ICONERROR);
        end;

      1:
        begin
          tmp.DataSource := dm1.dsaddres;
          tmp.SQLs.SelectSQL.Add('SELECT tmp.KV, tmp.NS, tmp.PPLAT, tmp.LSCHET, kv_konfig.date_poverka');
          tmp.SQLs.SelectSQL.Add('  FROM TMP, kv_konfig');
          tmp.SQLs.SelectSQL.Add('    where tmp.cod = :inc');
          tmp.SQLs.SelectSQL.Add('    and (kv_konfig.COD = tmp.inc)');
          tmp.SQLs.SelectSQL.Add('    order by tmp.kv');
          tmp.Open;
          if not dm1.addres.Active then
          begin
            dm1.addres.Open;
            openAddres := true;
          end
          else
            openAddres := false;
          dm1.addres.First;
          if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\' + 'STRUKT.fr3') then
            try
              frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\' + 'STRUKT.fr3');
              while not dm1.addres.Eof do
              begin
                Memo1 := dmPrint.frxReport1.FindObject('Memo1') as TfrxMemoView;
                Memo1.Text := 'г. ' + dm1.townTOWN.AsString + ', ' + dm1.addresSTREET.AsString;
                frxReport1.PrepareReport(false);
                dm1.addres.Next;
              end;
              dmPrint.frxReport1.ShowPreparedReport;
            except
              ShowMessage('Ошибка при формировании детализации отчета');
            end
          else
            Application.MessageBox('Не наёден файл конфигурации отчёта STRUKT.fr3', 'Ошибка!', MB_OK + MB_ICONERROR);
          if openAddres then
            dm1.addres.Close;
        end;

      2:
        begin
          tmp.DataSource := dm1.dsaddres;
          tmp.SQLs.SelectSQL.Add('SELECT tmp.KV, tmp.NS, tmp.PPLAT, tmp.LSCHET, kv_konfig.date_poverka');
          tmp.SQLs.SelectSQL.Add('  FROM TMP, kv_konfig');
          tmp.SQLs.SelectSQL.Add('    where tmp.cod = :inc');
          tmp.SQLs.SelectSQL.Add('    and (kv_konfig.COD = tmp.inc)');
          tmp.SQLs.SelectSQL.Add('    order by tmp.kv');
          tmp.Open;
          if not dm1.addres.Active then
          begin
            dm1.addres.Open;
            openAddres := true;
          end
          else
            openAddres := false;
          if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\' + 'STRUKT.fr3') then
            try
              frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\' + 'STRUKT.fr3');
              Memo1 := dmPrint.frxReport1.FindObject('Memo1') as TfrxMemoView;
              Memo1.Text := 'г. ' + dm1.townTOWN.AsString + ', ' + dm1.addresSTREET.AsString;
              frxReport1.ShowReport();
            except
              ShowMessage('Ошибка при формировании детализации отчета');
              if openAddres then
                dm1.addres.Close;
            end
          else
            Application.MessageBox('Не наёден файл конфигурации отчёта STRUKT.fr3', 'Ошибка!', MB_OK + MB_ICONERROR);
        end;

    end;
  dmPrint.tmp.Close;
end;

procedure TFormPrint.PrintSummir;
var
  sql_tmp: TpFIBQuery;
  sql_kv_konfig: TpFIBQuery;
  sql_tmp3xf: TpFIBQuery;
  list_data: TStrings;
  tar_nak: TStrings;
  mas: array[0..5, 0..11] of Double;
  mas_temp: array[0..4, 0..11] of Double;
  koef: Integer;
  i: Integer;
  j: Integer;
  excel: Variant;
begin
  list_data := TStringList.Create;
  tar_nak := TStringList.Create;

  sql_tmp := TpFIBQuery.Create(nil);
  sql_tmp.Database := dm1.database;
  sql_tmp.Transaction := dm1.transact1;

  sql_tmp3xf := TpFIBQuery.Create(nil);
  sql_tmp3xf.Database := dm1.database;
  sql_tmp3xf.Transaction := dm1.transact1;

  sql_kv_konfig := TpFIBQuery.Create(nil);
  sql_kv_konfig.Database := dm1.database;
  sql_kv_konfig.Transaction := dm1.transact1;

  for i := 0 to 5 do
    for j := 0 to 11 do
      mas[i, j] := 0;
  for i := 0 to 3 do
    for j := 0 to 11 do
      mas_temp[i, j] := 0;

  with sql_tmp do
    try
      SQL.Text := 'select count(*) from tmp where sdf = 3';
      sql_kv_konfig.SQL.Text := 'select mes_pot, mes_pot_time from kv_konfig where cod = :cod';
      sql_tmp3xf.SQL.Text := 'select count(*) from tmp_3xf where cod = :cod';
      ExecQuery;
      sGauge1.MaxValue := FN('count').AsInteger;
      sGauge1.Progress := 0;
      Close;
      SQL.Text := 'select inc, cod, addr, spol from tmp where sdf = 3';
      ExecQuery;
      while not Eof do
      begin
        sql_kv_konfig.Close;
        sql_kv_konfig.ParamByName('cod').AsInteger := FN('inc').AsInteger;
        sql_kv_konfig.ExecQuery;

        if (sql_kv_konfig.FN('mes_pot_time').AsString <> 'Нет') then
        begin
          koef := StrToIntDef(FN('spol').AsString, 1);
          if koef = 0 then
            koef := 1;
          list_data.Clear;
          list_data.Text := sql_kv_konfig.FieldByName('mes_pot').AsString;
          if (FN('Addr').AsString = '2') or (FN('Addr').AsString = '3') then
            dm1.ConvertMesPotr(list_data);

          // Тариф 1
          for i := 0 to 11 do
            mas_temp[0, i] := StrToFloatDef(list_data.Strings[i], 0) * koef;
          // Тариф 2
          for i := 13 to 24 do
            mas_temp[1, i - 13] := StrToFloatDef(list_data.Strings[i], 0) * koef;
          // Тариф 3
          for i := 26 to 37 do
            mas_temp[2, i - 26] := StrToFloatDef(list_data.Strings[i], 0) * koef;

          sql_tmp3xf.Close;
          sql_tmp3xf.ParamByName('cod').AsInteger := FN('inc').AsInteger;
          sql_tmp3xf.ExecQuery;

          for i := 0 to 11 do
            mas_temp[3, i] := mas_temp[2, i] + mas_temp[1, i] + mas_temp[0, i];

          for i := 0 to 11 do
          begin
            if mas_temp[3, i] <> 0 then
            begin
              mas[0, i] := mas[0, i] + 1;
              mas[1, i] := mas[1, i] + sql_tmp3xf.FN('count').AsInteger;
              mas[2, i] := mas[2, i] + mas_temp[0, i];
              mas[3, i] := mas[3, i] + mas_temp[1, i];
              mas[4, i] := mas[4, i] + mas_temp[2, i];
              mas[5, i] := mas[5, i] + mas_temp[3, i];
            end;
          end;

        end;
        Next;
        sGauge1.Progress := sGauge1.Progress + 1;
        Application.ProcessMessages;
      end;
    finally
      Free;
      sql_kv_konfig.Free;
      sql_tmp3xf.FreeHandle;
    end;

  if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\' + 'Отчет по суммирующим.xls') then
  begin
    excel := CreateOleObject('Excel.Application');
    excel.Workbooks.Open(ExtractFilePath(Application.ExeName) + 'Reports\' + 'Отчет по суммирующим.xls', 0, true);
    for i := 0 to 5 do
      for j := 0 to 11 do
        excel.Cells[j+7, i+3] := mas[i, j];
    excel.Visible := True;
  end
  else
    Application.MessageBox('Файл отчета не найден!', 'Предупреждение!',
      MB_OK + MB_ICONWARNING);

end;

procedure TFormPrint.sBitBtn1Click(Sender: TObject);
begin
  dmPrint.frxReport1.PreviewPages.Clear;
  case sRadioGroup2.ItemIndex of
    0: PrintStrunktur(sRadioGroup1.ItemIndex);
    //    1:  begin end;
    1: PrintSim(sRadioGroup1.ItemIndex);
    2: PrintOtchet(sRadioGroup1.ItemIndex);
    3: PrintSummir;
  else
  end;

  //dmPrint.frxReport1.ShowPreparedReport();

end;

procedure TFormPrint.sRadioGroup2Click(Sender: TObject);
begin
  sRadioGroup1.Items.Clear;
  with sRadioGroup1 do
    case sRadioGroup2.ItemIndex of
      0:
        begin
          Items.Add('Весь адрес');
          Items.Add('Поразъёмно');
          Items.Add('Один разъём');
        end;
      {    1:
            begin
              Items.Add('Весь адрес');
              Items.Add('Поразъёмно');
              Items.Add('Один разъём');
              Items.Add('Одни счётчик');
            end;
       }
      1:
        begin
          Items.Add('Все города');
          Items.Add('Текущий город');
        end;
      2:
        begin
          Items.Add('По всем счётчикам');
          Items.Add('По суммирующим');
        end;
    end;
  sRadioGroup1.ItemIndex := 0;
end;

end.

