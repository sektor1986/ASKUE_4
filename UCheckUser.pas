unit UCheckUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sRadioButton, sGroupBox, ExtCtrls, sPanel,
  sSpeedButton, IniFiles, sEdit;

type
  TFormCheckUser = class(TForm)
    sPanel1: TsPanel;
    sRadioGroup1: TsRadioGroup;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sGroupBox1: TsGroupBox;
    sSpeedButton1: TsSpeedButton;
    sEdit1: TsEdit;
    procedure sBitBtn1Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sSpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCheckUser: TFormCheckUser;
  my: integer;

implementation

uses Udm1, Unit1, UFunction, UProcedure;

{$R *.dfm}

procedure TFormCheckUser.FormClose(Sender: TObject; var Action: TCloseAction);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0))+'options.ini');
  IniFile.WriteString('Options', 'base', sSpeedButton1.Caption);
  IniFile.Free;
end;

procedure TFormCheckUser.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0))+'options.ini');
  sSpeedButton1.Caption := IniFile.ReadString('Options', 'base', sSpeedButton1.Caption);
  IniFile.Free;
end;

procedure TFormCheckUser.sBitBtn1Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TFormCheckUser.sBitBtn2Click(Sender: TObject);
var
  IniFile: TIniFile;
  password: string;
begin
  case sRadioGroup1.ItemIndex of
  0:  begin
        IniFile := TIniFile.Create(NahCataloga(ParamStr(0))+'options.ini');
        password := IniFile.ReadString('Password', 'PassAdmin', '');
        password := Decrypt(password);
        if not (sEdit1.Text = password) then
          begin
            Application.MessageBox('Пароль не верен!', 'Ошибка', MB_ICONERROR + MB_OK);
            IniFile.Free;
            Exit;
          end
        else
          Form1.N7.Visible := true;
      end;
  1:  begin
        IniFile := TIniFile.Create(NahCataloga(ParamStr(0))+'options.ini');
        password := IniFile.ReadString('Password', 'PassOpPols', '');
        password := Decrypt(password);
        if not (sEdit1.Text = password) then
          begin
            Application.MessageBox('Пароль не верен!', 'Ошибка', MB_ICONERROR + MB_OK);
            IniFile.Free;
            Exit;
          end
        else
          with Form1 do
            begin
              ActionAddAdres.Enabled := false;
              ActionKorrectAdres.Enabled := false;
              ActionDelAdres.Enabled := false;
            end;
      end;
  2:  with Form1 do
        begin
          ActionAddAdres.Enabled := false;
          ActionKorrectAdres.Enabled := false;
          ActionDelAdres.Enabled := false;
          ActionKoncentrator.Enabled := false;
          ActionSchitivatel.Enabled := false;
        end
  else
  end;

  if dm1.database.Connected then
    try
      dm1.database.Close;
    except

    end;
  dm1.database.DBName := sSpeedButton1.Caption;

  try
    dm1.database.Open;
//    dm1.town.Open;
//    dm1.addresmain.Open;
   if my =1 then
   begin
     Form1.N41Click(self);
   end;
    Close;
  except
    Application.MessageBox('Ошибка при подключении к базе!', 'Предупреждение', MB_ICONERROR + MB_OK);
  end;
end;

procedure TFormCheckUser.sSpeedButton1Click(Sender: TObject);
begin
   my := 1;
   if Form1.sOpenDialog1.Execute then
    sSpeedButton1.Caption := Form1.sOpenDialog1.FileName;
end;

procedure TFormCheckUser.sSpeedButton1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  sSpeedButton1.Hint := sSpeedButton1.Caption;
end;

end.
