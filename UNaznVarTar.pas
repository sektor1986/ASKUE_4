unit UNaznVarTar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, ExtCtrls, sComboBox, sPanel, pFIBQuery;

type
  TFormNaznVarTar = class(TForm)
    sPanel1: TsPanel;
    sComboBox1: TsComboBox;
    Bevel1: TBevel;
    sButton1: TsButton;
    sButton2: TsButton;
    procedure sButton2Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    vid: integer;
    { Public declarations }
  end;

var
  FormNaznVarTar: TFormNaznVarTar;

implementation

uses Udm1;

{$R *.dfm}

procedure TFormNaznVarTar.sButton1Click(Sender: TObject);
var
  sql: TpFIBQuery;
begin
  sql := TpFIBQuery.Create(nil);
  case vid of
  1:  with sql do
        try
          Database := dm1.database;
          Transaction := dm1.updateTransact;
          SQL.Text := 'update tmp set phone = ' + sComboBox1.Text + ' where cod in (select inc from addres where cod = ' + dm1.addresmainINC.AsString + ') and sdf = 1';
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        finally
          Free;
        end;
  2:  with sql do
        try
          Database := dm1.database;
          Transaction := dm1.updateTransact;
          SQL.Text := 'update tmp set phone = ' + sComboBox1.Text + ' where cod in (select inc from addres where cod = ' + dm1.addresmainINC.AsString + ') and sdf = 4';
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        finally
          Free;
        end;
  3:  with sql do
        try
          Database := dm1.database;
          Transaction := dm1.updateTransact;
          SQL.Text := 'update tmp set phone = ' + sComboBox1.Text + ' where cod in (select inc from addres where cod = ' + dm1.addresmainINC.AsString + ') and sdf = 3';
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        finally
          Free;
        end;
  end;
  dm1.tmp.ReopenLocate('INC');
  Application.MessageBox('Вариант тарификации успешно назначен', '', MB_OK + MB_ICONINFORMATION);
  Close;
  
end;

procedure TFormNaznVarTar.sButton2Click(Sender: TObject);
begin
  Close;
end;

end.
