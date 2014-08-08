unit UFormirOprChtenie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, GridsEh, DBGridEh, ExtCtrls, sPanel,
  sBevel, sCheckBox, sEdit, sLabel, pFIBQuery, DBGridEhGrouping, Menus;

type
  TFormFormirOprChtenie = class(TForm)
    sPanel1: TsPanel;
    DBGridEh1: TDBGridEh;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sLabel2: TsLabel;
    sEdit1: TsEdit;
    sCheckBox1: TsCheckBox;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure sEdit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private

  public
    procedure FormirMassiv;
    { Public declarations }
  end;

var
  FormFormirOprChtenie: TFormFormirOprChtenie;

implementation

uses Udm1, Udm2, Unit1, UDeviceThread;

{$R *.dfm}

procedure TFormFormirOprChtenie.FormirMassiv;
var
  i: integer;
  sql: TpFIBQuery;
begin
  i := 0;
  Form1.Port.massivOprosa := nil;
  Form1.massivOprosa := nil;
  dm2.addresmain_konc.First;
  with  dm2 do
  begin
    while not addresmain_konc.Eof do
      begin
        SetLength(Form1.Port.massivOprosa, i+1);
        SetLength(Form1.Port.massivOprosa[i], 1);
        SetLength(Form1.Port.massivOprosa[i, 0], 1);
        SetLength(Form1.Port.massivOprosa[i, 0, 0], 13);
        Form1.Port.massivOprosa[i, 0, 0, 0] := addresmain_koncTOWN.AsString;
        Form1.Port.massivOprosa[i, 0, 0, 1] := addresmain_koncADDR.AsString;
        Form1.Port.massivOprosa[i, 0, 0, 2] := addresmain_koncPHONE.AsString;
        Form1.Port.massivOprosa[i, 0, 0, 3] := sEdit1.Text;   //Пароль коцентратора
        Form1.Port.massivOprosa[i, 0, 0, 4] := '000001';
        Form1.Port.massivOprosa[i, 0, 0, 5] := '000001';
        Form1.Port.massivOprosa[i, 0, 0, 9] := addresmain_koncINC.AsString;
        Form1.Port.massivOprosa[i, 0, 0, 10] := addresmain_koncIP_ADDRES.AsString;
//        Form1.Port.massivOprosa[i, 0, 0, 10] := '10.24.215.19';

        if (dm2.addresmain_koncREZHIM.AsInteger = 0) or (Form1.Port.flagModem = False) then
        begin
           Form1.Port.massivOprosa[i, 0, 0, 12] := 'CSD';
        end
        else
        begin
           Form1.Port.massivOprosa[i, 0, 0, 12] := 'GPRS';
        end;

        SetLength(Form1.massivOprosa, i+1);
        SetLength(Form1.massivOprosa[i], 1);
        SetLength(Form1.massivOprosa[i, 0], 1);
        SetLength(Form1.massivOprosa[i, 0, 0], 13);
        Form1.massivOprosa[i, 0, 0, 0] := addresmain_koncTOWN.AsString;
        Form1.massivOprosa[i, 0, 0, 1] := addresmain_koncADDR.AsString;
        Form1.massivOprosa[i, 0, 0, 2] := addresmain_koncPHONE.AsString;
        Form1.massivOprosa[i, 0, 0, 9] := addresmain_koncINC.AsString;
        Form1.massivOprosa[i, 0, 0, 3] := sEdit1.Text;   //Пароль коцентратора
        Form1.massivOprosa[i, 0, 0, 4] := '000001';
        Form1.massivOprosa[i, 0, 0, 5] := '000001';
        Form1.massivOprosa[i, 0, 0, 10] := Form1.Port.massivOprosa[i, 0, 0, 10];
        Form1.massivOprosa[i, 0, 0, 12] := Form1.Port.massivOprosa[i, 0, 0, 12];

        //Определение количества счетчиков в адресе
        sql := TpFIBQuery.Create(nil);
        with sql do
        try
          Database := dm1.database;
          Transaction := dm1.database.DefaultTransaction;
          SQL.Text := 'select count (*) from tmp where cod in (select inc from addres where cod = ' + addresmain_koncINC.AsString + ')';
          ExecQuery;
          Form1.Port.massivOprosa[i, 0, 0, 6] := FN('count').AsString;
          Form1.massivOprosa[i, 0, 0, 6] := FN('count').AsString;
        finally
          Free
        end;
        //****************************************
        Inc(i);
        addresmain_konc.Next;
      end;
  end;
end;

procedure TFormFormirOprChtenie.FormShow(Sender: TObject);
begin
  if not sCheckBox1.Checked then
    sEdit1.Clear;
  if Form1.passwordDefault then
    sEdit1.Text := '000001';
end;

procedure TFormFormirOprChtenie.N1Click(Sender: TObject);
begin
  try
    dm2.addresmain_konc.Delete;
  except
    ShowMessage('Ошибка при удалении адреса!');
  end;
end;

procedure TFormFormirOprChtenie.sBitBtn1Click(Sender: TObject);
begin
  if Length(sEdit1.Text) <> 6 then
    begin
      Application.MessageBox('Пароль для счётчиков должен иметь 6 знаков!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
      sEdit1.SetFocus;
      exit;
    end;
  try
    Form1.Port := TDeviceThread.Create(true);
    Form1.Port.FreeOnTerminate := true;       //Автозавершение потока
    Form1.Port.flagTolkoChtenie := true;      //Установка флага только чтение
    Form1.Port.flagModem := Form1.sCheckBox2.Checked;
    Form1.flagTolkoChtenie := true;
    Form1.Port.flagSchitivatel := Form1.nb.PageIndex = 4;
    FormirMassiv;                             //Формирование массива для чтения
    Form1.Port.Priority := tpHigher;           //Приоритет потока чтения
    Form1.nb.PageIndex := 6;                  //Переход на страницу протокола обмена
    Form1.Port.Resume;                        //Старт потока
    Close;                                    //Закрытие окна
  except
    if Application.MessageBox('Ошибка при формировании буфера опроса!', 'Ошибка!', MB_RETRYCANCEL + MB_ICONWARNING) = 4 then
      sBitBtn1Click(self);
    Form1.Port.Terminate;   //Завершение потока
  end;
end;

procedure TFormFormirOprChtenie.sBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormFormirOprChtenie.sEdit1Change(Sender: TObject);
begin
  if Length((Sender as TsEdit).Text) = 6 then
    (Sender as TsEdit).Color := clWindow
  else
    (Sender as TsEdit).Color := $00D5D5FF;
end;

procedure TFormFormirOprChtenie.sEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if  not (key in['0'..'9', #8]) then
    key := #0;
end;

end.
