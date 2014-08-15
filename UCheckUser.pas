unit UCheckUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sRadioButton, sGroupBox, ExtCtrls, sPanel,
  sSpeedButton, IniFiles, sEdit, sDialogs;

type
  TFormCheckUser = class(TForm)
    sPanel1: TsPanel;
    sRadioGroup1: TsRadioGroup;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sEdit1: TsEdit;
    rgb1: TsRadioGroup;
    grp1: TsGroupBox;
    edt1: TsEdit;
    edt2: TsEdit;
    edt3: TsEdit;
    grp2: TsGroupBox;
    btnSBFileBase: TsSpeedButton;
    edtFileBase: TsEdit;
    dlg1: TsOpenDialog;
    procedure sBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBitBtn2Click(Sender: TObject);
    procedure rgb1Click(Sender: TObject);
    procedure btnSBFileBaseClick(Sender: TObject);
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

procedure TFormCheckUser.btnSBFileBaseClick(Sender: TObject);
begin
  my := 1;
  dlg1.Filter := 'Файлы базы данных|*.fdb';
  if dlg1.Execute then
    edtFileBase.Text := dlg1.FileName;
end;

procedure TFormCheckUser.FormClose(Sender: TObject; var Action: TCloseAction);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
  if rgb1.ItemIndex = 0 then
    IniFile.WriteString('Options', 'base', edtFileBase.Text)
  else
    IniFile.WriteString('Options', 'base', edt1.Text + '/' + edt2.Text + ':' + edt3.Text);

  IniFile.WriteInteger('Options', 'server', rgb1.ItemIndex);
  IniFile.Free;
end;

procedure TFormCheckUser.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
  rgb1.ItemIndex := IniFile.ReadInteger('Options', 'server', 0);
  edtFileBase.Text := IniFile.ReadString('Options', 'base', edtFileBase.Text);
  if rgb1.ItemIndex = 1 then
    if edtFileBase.Text <> '' then
      try
        edt1.Text := Copy(edtFileBase.Text, 1, Pos('/', edtFileBase.Text) - 1);
        edt2.Text := Copy(edtFileBase.Text, Pos('/', edtFileBase.Text) + 1, Pos(':', edtFileBase.Text) - Pos('/', edtFileBase.Text) - 1);
        edt3.Text := Copy(edtFileBase.Text, Pos(':', edtFileBase.Text) + 1, Length(edtFileBase.Text));
      except

      end;
  IniFile.Free;
end;

procedure TFormCheckUser.rgb1Click(Sender: TObject);
begin
  grp1.Visible := (rgb1.ItemIndex = 1);
  grp2.Visible := (rgb1.ItemIndex = 0);
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
    0:
      begin
        IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
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
    1:
      begin
        IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
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
    2: with Form1 do
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

  if rgb1.ItemIndex = 0 then
    dm1.database.DBName := edtFileBase.Text
  else
  begin
    dm1.database.DBName := edt1.Text + '/' + edt2.Text + ':' + edt3.Text;
    my := 1;
  end;

  try
    dm1.database.Open;
    if my = 1 then
    begin
      Form1.N41Click(self);
    end;
    Close;
  except
    Application.MessageBox('Ошибка при подключении к базе!', 'Предупреждение', MB_ICONERROR + MB_OK);
  end;
end;

end.

