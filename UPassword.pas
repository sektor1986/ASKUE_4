unit UPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sEdit, ExtCtrls, sPanel, IniFiles,
  sGroupBox;

type
  TFormPassword = class(TForm)
    sPanel1: TsPanel;
    sEdit2: TsEdit;
    sBitBtn1: TsBitBtn;
    sRadioGroup1: TsRadioGroup;
    sEdit1: TsEdit;
    sEdit3: TsEdit;
    procedure sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPassword: TFormPassword;

implementation

uses UProcedure, UFunction;

{$R *.dfm}

procedure TFormPassword.sBitBtn1Click(Sender: TObject);
var
  IniFile: TIniFile;
  password: string;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0))+'options.ini');
  case sRadioGroup1.ItemIndex of
    0:
      begin
        password := IniFile.ReadString('Password', 'PassAdmin', '');
        password := Decrypt(password);
        if sEdit2.Text <> password then
          begin
            Application.MessageBox('Неправильно введен старый пароль!', 'Ошибка', MB_OK + MB_ICONWARNING);
            sEdit2.SetFocus;
            IniFile.Free;
            Exit
          end;
        if sEdit1.Text <> sEdit3.Text then
          begin
            Application.MessageBox('Повторите ввод паролей', 'Ошибка', MB_OK + MB_ICONWARNING);
            sEdit1.Text := '';
            sEdit3.Text := '';
            sEdit1.SetFocus;
            IniFile.Free;
            Exit
          end
        else
          begin
            IniFile.WriteString('Password', 'PassAdmin', Crypt(sEdit1.Text));
            Application.MessageBox('Пароль администратора успешно изменен', '', MB_OK + MB_ICONINFORMATION);
          end;
      end;

    1:
      begin
        password := IniFile.ReadString('Password', 'PassOpPols', '');
        password := Decrypt(password);
        if sEdit2.Text <> password then
          begin
            Application.MessageBox('Неправильно введен старый пароль!', 'Ошибка', MB_OK + MB_ICONWARNING);
            sEdit2.SetFocus;
            IniFile.Free;
            Exit
          end;
        if sEdit1.Text <> sEdit3.Text then
          begin
            Application.MessageBox('Повторите ввод паролей', 'Ошибка', MB_OK + MB_ICONWARNING);
            sEdit1.Text := '';
            sEdit3.Text := '';
            sEdit1.SetFocus;
            IniFile.Free;
            Exit
          end
        else
          begin
            IniFile.WriteString('Password', 'PassOpPols', Crypt(sEdit1.Text));
            Application.MessageBox('Пароль пользователя успешно изменен', '', MB_OK + MB_ICONINFORMATION);
          end;
      end;
    else
  end;
  IniFile.Free;
  sEdit1.Clear;
  sEdit2.Clear;
  sEdit3.Clear;
end;

end.
