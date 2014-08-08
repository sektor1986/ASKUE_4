unit UPassSchit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, ExtCtrls, sBevel, sEdit, sPanel;

type
  TFormPassSchit = class(TForm)
    sPanel1: TsPanel;
    sEdit1: TsEdit;
    sBevel1: TsBevel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    procedure sEdit1Change(Sender: TObject);
    procedure sEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPassSchit: TFormPassSchit;

implementation

uses Unit1, UDeviceThread;

{$R *.dfm}

procedure TFormPassSchit.sBitBtn1Click(Sender: TObject);
begin
  if Length(sEdit1.Text) <> 6 then
    begin
      Application.MessageBox('Пароль для концентратора должен состоять из 6 цифр!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
      sEdit1.SetFocus;
      exit;
    end;
  try
    Form1.Port := TDeviceThread.Create(true);
    Form1.Port.FreeOnTerminate := true;       //Автозавершение потока
    Form1.Port.flagTolkoChtenie := true;      //Установка флага только чтение
    Form1.Port.flagSchitivatel := true;
    Form1.Port.Priority := tpHigher;           //Приоритет потока чтения
    SetLength(Form1.Port.massivOprosa, 1);
    SetLength(Form1.Port.massivOprosa[0], 1);
    SetLength(Form1.Port.massivOprosa[0, 0], 1);
    SetLength(Form1.Port.massivOprosa[0, 0, 0], 7);
    SetLength(Form1.massivOprosa, 1);
    SetLength(Form1.massivOprosa[0], 1);
    SetLength(Form1.massivOprosa[0, 0], 1);
    SetLength(Form1.massivOprosa[0, 0, 0], 7);
    Form1.Port.massivOprosa[0, 0, 0, 0] := 'Город';
    Form1.Port.massivOprosa[0, 0, 0, 1] := 'Адрес';
    Form1.Port.massivOprosa[0, 0, 0, 2] := 'Телефон';
    Form1.Port.massivOprosa[0, 0, 0, 3] := sEdit1.Text;
    Form1.Port.massivOprosa[0, 0, 0, 4] := '000001';
    Form1.Port.massivOprosa[0, 0, 0, 5] := '000001';
    Form1.Port.massivOprosa[0, 0, 0, 6] := '0';
    Form1.massivOprosa[0, 0, 0, 0] := 'Город';
    Form1.massivOprosa[0, 0, 0, 1] := 'Адрес';
    Form1.massivOprosa[0, 0, 0, 2] := 'Телефон';
    Form1.massivOprosa[0, 0, 0, 3] := sEdit1.Text;
    Form1.massivOprosa[0, 0, 0, 4] := '000001';
    Form1.massivOprosa[0, 0, 0, 5] := '000001';
    Form1.massivOprosa[0, 0, 0, 6] := '0';
    Form1.nb.PageIndex := 6;                  //Переход на страницу протокола обмена
    Form1.Port.Resume;
  except
    Form1.Port.Terminate;
  end;
end;

procedure TFormPassSchit.sEdit1Change(Sender: TObject);
begin
  if Length((Sender as TsEdit).Text) = 6 then
    (Sender as TsEdit).Color := clWindow
  else
    (Sender as TsEdit).Color := $00D5D5FF;
end;

procedure TFormPassSchit.sEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if  not (key in['0'..'9', #8]) then
    key := #0;
end;

end.
