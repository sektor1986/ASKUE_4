unit UDelCounter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sEdit, sGroupBox, sLabel, pFIBQuery,
  ExtCtrls, sBevel;

type
  TFormDelCounter = class(TForm)
    sLabel1: TsLabel;
    sRadioGroup1: TsRadioGroup;
    sEdit1: TsEdit;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sBevel1: TsBevel;
    sBitBtn3: TsBitBtn;
    sLabel2: TsLabel;
    sBevel2: TsBevel;
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDelCounter: TFormDelCounter;

implementation

uses Udm1;

{$R *.dfm}

procedure TFormDelCounter.sBitBtn1Click(Sender: TObject);
var sql: TpFIBQuery;
begin
  if not (Application.MessageBox('Вы действительно хотите удалить счётчики?', 'Предупреждение', MB_OKCANCEL+MB_ICONWARNING) = ID_OK) then
    Exit;
  sql := TpFIBQuery.Create(nil);
    with sql do
    try
      Screen.Cursor := crSQLWait;
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      dm1.updateTransact.StartTransaction;
      if sRadioGroup1.ItemIndex = 0 then
        SQL.Text := 'DELETE FROM TMP WHERE KV = ' + sEdit1.Text
      else
        SQL.Text := 'DELETE FROM TMP WHERE KV <> ' + sEdit1.Text;
      ExecQuery;
      dm1.updateTransact.Commit
    finally
      Screen.Cursor := crDefault;
      Free;
    end;

end;

procedure TFormDelCounter.sBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormDelCounter.sBitBtn3Click(Sender: TObject);
var
  sql: TpFIBQuery;
begin
  if not (Application.MessageBox('Вы действительно хотите удалить пустые разъёмы?', 'Предупреждение', MB_OKCANCEL+MB_ICONWARNING) = ID_OK) then
    Exit;
  sql := TpFIBQuery.Create(nil);
    with sql do
    try
      Screen.Cursor := crSQLWait;
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      dm1.updateTransact.StartTransaction;

      SQL.Text := 'DELETE FROM ADDRES WHERE INC not in  (select cod from tmp)';

      ExecQuery;
      dm1.updateTransact.Commit
    finally
      Screen.Cursor := crDefault;
      Free;
    end;
end;

end.
