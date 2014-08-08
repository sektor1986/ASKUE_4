unit USamSchetchika;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sBevel, StdCtrls, Buttons, sBitBtn, Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, sEdit, sPanel, pFIBQuery;

type
  TFormSamSchetchika = class(TForm)
    sPanel1: TsPanel;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sDateEdit1: TsDateEdit;
    sDateEdit2: TsDateEdit;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sBevel1: TsBevel;
    sBitBtn3: TsBitBtn;
    sBitBtn4: TsBitBtn;
    procedure sBitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSamSchetchika: TFormSamSchetchika;

implementation

uses Udm1;

{$R *.dfm}

procedure TFormSamSchetchika.FormShow(Sender: TObject);
begin
  sDateEdit1.Date := Date;
  sDateEdit2.Date := sDateEdit1.Date;
end;

procedure TFormSamSchetchika.sBitBtn3Click(Sender: TObject);
var
  sql: TpFIBQuery;
begin

  sql := TpFIBQuery.Create(nil);
  sql.Database := dm1.database;
  sql.Transaction := dm1.transact1;
  with sql do
    try
      SQL.Text := 'select ns from tmp where ns = :ns and cod in (select inc from addres where cod = :inc_addresmain)';
      ParamByName('inc_addresmain').AsInteger := dm1.addresmainINC.AsInteger;
      ParamByName('ns').AsString := sEdit2.Text;
      ExecQuery;
      if not Eof then
      begin
        Application.MessageBox('Счетчик с таким номером уже' + #13#10 +
          '     установлен на этом доме', 'Повтор счетчика!', MB_OK +
          MB_ICONWARNING);
        Exit;
      end;

      Close;
      SQL.Text := 'select ns from tmp where ns = :ns and id_counter_type = :id_counter_type';
      ParamByName('id_counter_type').AsInteger := dm1.tmp_korrektID_COUNTER_TYPE.AsInteger;
      ParamByName('ns').AsString := sEdit2.Text;
      ExecQuery;
      if not Eof then
      begin
        Application.MessageBox('  Счетчик с таким номером и ' + #13#10 +
          'такого типа уже  есть в базе!', 'Повтор счетчика!', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    finally
      Free;
    end;

  dm1.tmp_korrekt.Edit;
  dm1.tmp_korrektNUM_OLD.AsString := sEdit1.Text;
  dm1.tmp_korrektNUM_NEW.AsString := sEdit2.Text;
  dm1.tmp_korrektDATE_ZAM.AsDateTime := sDateEdit1.Date;
  dm1.tmp_korrektDATE_INST.AsDateTime := sDateEdit2.Date;
  dm1.tmp_korrektNS.AsString := sEdit2.Text;
  try
    dm1.tmp_korrekt.Post;
  except

  end;
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      dm1.updateTransact.StartTransaction;
      SQL.Text := 'update tmp_3xf set ns = :ns_new where ns = :ns_old and id_tmp = :inc';
      ParamByName('ns_new').AsString := sEdit2.Text;
      ParamByName('ns_old').AsString := sEdit1.Text;
      ParamByName('inc').AsInteger := dm1.tmp_korrektINC.AsInteger;
      ExecQuery;
      dm1.updateTransact.Commit
    finally
      Free;
    end;
  Close;
end;

procedure TFormSamSchetchika.sBitBtn4Click(Sender: TObject);
begin
  dm1.tmp_korrektNS.NewValue := dm1.tmp_korrektNS.OldValue;
  close;
end;

end.

