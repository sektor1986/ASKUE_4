unit UEditPassCounter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, ExtCtrls, sBevel, sEdit, sLabel;

type
  TForm_EditPassCounter = class(TForm)
    sLabel1: TsLabel;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sLabel2: TsLabel;
    sEdit3: TsEdit;
    sLabel3: TsLabel;
    sBevel1: TsBevel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    procedure sEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_EditPassCounter: TForm_EditPassCounter;

implementation

{$R *.dfm}

procedure TForm_EditPassCounter.sBitBtn1Click(Sender: TObject);
begin
  if (Length(sEdit1.Text) <> 6) or (Length(sEdit2.Text) <> 6) then
    begin
      Application.MessageBox('Пароль для счётчиков должен иметь 6 знаков!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
      sEdit1.SetFocus;
      exit;
    end;

  if sEdit3.Text = sEdit2.Text then
    begin
      if sEdit1.Text = sEdit2.Text then
        begin
          Application.MessageBox('Старый и новый пароли совпадают!!', 'Предупреждение!', MB_OK+MB_ICONINFORMATION);
          Exit;
        end;
      ModalResult := mrOk;
//      Close;
    end
  else
    Application.MessageBox('Пароли не совпадают!', 'Предупреждение!', MB_OK+MB_ICONINFORMATION);
  sEdit3.SetFocus;

  
end;

procedure TForm_EditPassCounter.sBitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TForm_EditPassCounter.sEdit1Change(Sender: TObject);
begin
  if Length((Sender as TsEdit).Text) = 6 then
    (Sender as TsEdit).Color := clWindow
  else
    (Sender as TsEdit).Color := $00D5D5FF;
end;

procedure TForm_EditPassCounter.sEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if  not (key in['0'..'9', #8]) then
    key := #0;
end;
                        
end.
