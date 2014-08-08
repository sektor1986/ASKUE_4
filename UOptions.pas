unit UOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, Buttons, sBitBtn, sDialogs, ExtCtrls, sPanel,
  sScrollBox, sFrameBar, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  ButtonGroup, CategoryButtons, ComCtrls, sTreeView, sCheckBox, sComboBox,
  sGroupBox, sSpinEdit, sLabel, IniFiles, CPort, sSpeedButton, sButton,
  sTrackBar, acNoteBook;

type
  TFormOptions = class(TForm)
    sPanel1: TsPanel;
    sOpenDialog1: TsOpenDialog;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sPanel4: TsPanel;
    sPanel5: TsPanel;
    sBitBtn2: TsBitBtn;
    sBitBtn3: TsBitBtn;
    sBitBtn4: TsBitBtn;
    sBitBtn6: TsBitBtn;
    nb: TsNotebook;
    sPanel6: TsPanel;
    sPanel7: TsPanel;
    sPanel8: TsPanel;
    sGroupBox1: TsGroupBox;
    sComboBox2: TsComboBox;
    sComboBox3: TsComboBox;
    sGroupBox2: TsGroupBox;
    sComboBox4: TsComboBox;
    sComboBox5: TsComboBox;
    sLabel1: TsLabel;
    sSpinEdit1: TsSpinEdit;
    sBitBtn1: TsBitBtn;
    sBitBtn7: TsBitBtn;
    sGroupBox3: TsGroupBox;
    sComboBox1: TsComboBox;
    sCheckBox1: TsCheckBox;
    sGroupBox4: TsGroupBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    sRadioGroup1: TsRadioGroup;
    sGroupBox5: TsGroupBox;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sEdit3: TsEdit;
    sButton1: TsButton;
    sPanel9: TsPanel;
    sGroupBox6: TsGroupBox;
    sDecimalSpinEdit1: TsDecimalSpinEdit;
    sBitBtn9: TsBitBtn;
    sBitBtn10: TsBitBtn;
    sBitBtn8: TsBitBtn;
    sGroupBox7: TsGroupBox;
    sEditFileBase: TsEdit;
    SBFileBase: TsSpeedButton;
    sLabel2: TsLabel;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sSpinEdit2: TsSpinEdit;
    sLabel3: TsLabel;
    sBitBtn11: TsBitBtn;
    sGroupBox8: TsGroupBox;
    sCheckBox6: TsCheckBox;
    sRadioGroup2: TsRadioGroup;
    sSpinEdit3: TsSpinEdit;
    sCheckBox7: TsCheckBox;
    sComboBox6: TsComboBox;
    sGroupBox9: TsGroupBox;
    sCheckBox8: TsCheckBox;
    sCheckBox9: TsCheckBox;
    sCheckBox10: TsCheckBox;
    sGroupBox10: TsGroupBox;
    sComboBox7: TsComboBox;
    sLabel4: TsLabel;
    sSpinEdit4: TsSpinEdit;
    sComboBox8: TsComboBox;
    sBitBtn5: TsBitBtn;
    sPanel10: TsPanel;
    sEdit4: TsEdit;
    sRadioGroup3: TsRadioGroup;
    sCheckBox11: TsCheckBox;
    procedure sCheckBox1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure sBitBtn6Click(Sender: TObject);
    procedure sComboBox2Change(Sender: TObject);
    procedure sComboBox4Change(Sender: TObject);
    procedure sBitBtn7Click(Sender: TObject);
    procedure sSpinEdit1Change(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure LoadOptions;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sComboBox3Change(Sender: TObject);
    procedure sComboBox5Change(Sender: TObject);
    procedure SBFileBaseClick(Sender: TObject);
    procedure sEditFileBaseChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sRadioGroup1Click(Sender: TObject);
    procedure sBitBtn8Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sDecimalSpinEdit1Change(Sender: TObject);
    procedure sBitBtn9Click(Sender: TObject);
    procedure sBitBtn10Click(Sender: TObject);
    procedure sCheckBox4Click(Sender: TObject);
    procedure sCheckBox5Click(Sender: TObject);
    procedure sBitBtn11Click(Sender: TObject);
    procedure sSpinEdit2Change(Sender: TObject);
    procedure sCheckBox6Click(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure sRadioGroup2Click(Sender: TObject);
    procedure sSpinEdit3Change(Sender: TObject);
    procedure sCheckBox9Click(Sender: TObject);
    procedure sCheckBox10Click(Sender: TObject);
    procedure sComboBox7Change(Sender: TObject);
    procedure sComboBox8Change(Sender: TObject);
    procedure sSpinEdit4Change(Sender: TObject);
    procedure sBitBtn5Click(Sender: TObject);
    procedure sEdit4Change(Sender: TObject);
    procedure sRadioGroup3Changing(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure sCheckBox11Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PrimenitNastr;
  end;

var
  FormOptions: TFormOptions;
  my: integer;

implementation

uses Unit1, UFunction, Udm1, UBackUp, URestore;

{$R *.dfm}

procedure TFormOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LoadOptions;
end;

procedure TFormOptions.FormCreate(Sender: TObject);
begin
  Form1.sSkinManager1.GetSkinNames(sComboBox1.Items);
  //****Нахождение доступных COM портов
  try
    EnumComPorts(sComboBox2.Items);
  except

  end;
  FormOptions.sComboBox4.Items := FormOptions.sComboBox2.Items;
  FormOptions.sComboBox7.Items := FormOptions.sComboBox2.Items;
  LoadOptions;
  sComboBox1Change(self);
  PrimenitNastr;
end;

procedure TFormOptions.FormShow(Sender: TObject);
begin
  LoadOptions;
  sBitBtn7.Enabled := False;
end;

procedure TFormOptions.LoadOptions;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
  sComboBox2.Text := IniFile.ReadString('Options', 'PortKonc1', 'COM1');
  sComboBox3.Text := IniFile.ReadString('Options', 'BaudRateConcentr1', '9600');
  sComboBox7.Text := IniFile.ReadString('Options', 'PortKonc2', 'COM1');
  sComboBox8.Text := IniFile.ReadString('Options', 'BaudRateConcentr2', '9600');
  sComboBox4.Text := IniFile.ReadString('Options', 'PortSchit', 'COM1');
  sComboBox5.Text := IniFile.ReadString('Options', 'BaudRateSchit', '19200');
  sCheckBox1.Checked := IniFile.ReadBool('Options', 'EnableSkin', false);
  sCheckBox2.Checked := IniFile.ReadBool('Options', 'PolePrim', false);
  sCheckBox3.Checked := IniFile.ReadBool('Options', 'PoleDop', false);
  sCheckBox7.Checked := IniFile.ReadBool('Options', 'PoleHomeCod', false);
  sCheckBox8.Checked := IniFile.ReadBool('Options', 'LS_Tarrif', false);
  sCheckBox9.Checked := IniFile.ReadBool('Options', 'PoleLatitude', false);
  sCheckBox9.Checked := IniFile.ReadBool('Options', 'PoleLongitude', false);
  sCheckBox10.Checked := IniFile.ReadBool('Options', 'PoleBalans', false);
  sComboBox1.ItemIndex := IniFile.ReadInteger('Options', 'IndexSkin', 0);
  sSpinEdit1.Value := IniFile.ReadInteger('Options', 'CountDozvon1', 3);
  sSpinEdit4.Value := IniFile.ReadInteger('Options', 'CountDozvon2', 3);
  sRadioGroup1.ItemIndex := IniFile.ReadInteger('Options', 'server', 0);
  sEditFileBase.Text := IniFile.ReadString('Options', 'base', '');
  sEdit4.Text := IniFile.ReadString('Options', 'Port_TCP/IP', '');
  sRadioGroup3.ItemIndex := IniFile.ReadInteger('Options', 'rezhim', 0);

  if sRadioGroup1.ItemIndex = 1 then
    if sEditFileBase.Text <> '' then
      try
        sEdit1.Text := Copy(sEditFileBase.Text, 1, Pos('/', sEditFileBase.Text) - 1);
        sEdit2.Text := Copy(sEditFileBase.Text, Pos('/', sEditFileBase.Text) + 1, Pos(':', sEditFileBase.Text) - Pos('/', sEditFileBase.Text) - 1);
        sEdit3.Text := Copy(sEditFileBase.Text, Pos(':', sEditFileBase.Text) + 1, Length(sEditFileBase.Text));
      except

      end;
  sEditFileBase.Text := IniFile.ReadString('Options', 'base', '');
  sCheckBox6.Checked := IniFile.ReadBool('Options', 'passDefault', false);

  sDecimalSpinEdit1.Value := IniFile.ReadFloat('Param', 'TimeOdinSch', 1.5);
  sSpinEdit2.Value := IniFile.ReadInteger('Param', 'TimeIntervalPack', 600);
  sCheckBox4.Checked := IniFile.ReadBool('Param', 'log', true);
  sCheckBox5.Checked := IniFile.ReadBool('Param', 'autoBackup', false);
  sRadioGroup2.ItemIndex := IniFile.ReadInteger('TEM_104', 'mode', 2);
  sSpinEdit3.Value := IniFile.ReadInteger('TEM_104', 'CountRead', 10);
  IniFile.Free;
end;

procedure TFormOptions.PrimenitNastr;
begin
  Form1.sSkinManager1.Active := sCheckBox1.Checked;
  Form1.DBGridEh1.Columns[1].Visible := sCheckBox7.Checked;
  Form1.DBGridEh1.Columns[5].Visible := sCheckBox2.Checked;
  Form1.DBGridEh1.Columns[6].Visible := sCheckBox3.Checked;
  Form1.DBGridEh1.Columns[7].Visible := sCheckBox9.Checked;
  Form1.DBGridEh1.Columns[8].Visible := sCheckBox9.Checked;
  Form1.DBGridEh1.Columns[3].Visible := sCheckBox10.Checked;

  Form1.DBGridEh7.Columns[4].Visible := sCheckBox8.Checked;
  Form1.DBGridEh7.Columns[5].Visible := sCheckBox8.Checked;
  Form1.DBGridEh7.Columns[6].Visible := sCheckBox8.Checked;
  {
  if sCheckBox11.Checked = True then
  begin
   // Form1.DBGridEh3.Columns[9].Visible := True;
   // Form1.DBGridEh3.Columns[10].Visible := False;
    Form1.passwordDefaultNote := True;
  end
  else
  begin
   // Form1.DBGridEh3.Columns[9].Visible := False;
   // Form1.DBGridEh3.Columns[10].Visible := True;
    Form1.passwordDefaultNote := False;
  end;        }

  if sCheckBox8.Checked then
    Form1.DBGridEh7.Columns[3].Title.Caption := 'Номер лицевого счёта|Тариф 1'
  else
    Form1.DBGridEh7.Columns[3].Title.Caption := 'Номер лицевого счёта';

  Form1.ComPort.Port := sComboBox2.Text;
  Form1.ComPort1.Port := sComboBox4.Text;
  Form1.ComPort2.Port := sComboBox7.Text;

  if sComboBox3.Text = '9600' then
    Form1.ComPort.BaudRate := StrToBaudRate('9600')
  else
    if sComboBox3.Text = '19200' then
      Form1.ComPort.BaudRate := StrToBaudRate('19200')
    else
      if sComboBox3.Text = '38400' then
        Form1.ComPort.BaudRate := StrToBaudRate('38400')
      else
        if sComboBox3.Text = '57600' then
          Form1.ComPort.BaudRate := StrToBaudRate('57600')
        else
          if sComboBox3.Text = '115200' then
            Form1.ComPort.BaudRate := StrToBaudRate('115200')
          else
            Form1.ComPort.BaudRate := StrToBaudRate('9600');

  if sComboBox5.Text = '9600' then
    Form1.ComPort1.BaudRate := StrToBaudRate('9600')
  else
    if sComboBox5.Text = '19200' then
      Form1.ComPort1.BaudRate := StrToBaudRate('19200')
    else
      if sComboBox5.Text = '38400' then
        Form1.ComPort1.BaudRate := StrToBaudRate('38400')
      else
        if sComboBox5.Text = '57600' then
          Form1.ComPort1.BaudRate := StrToBaudRate('57600')
        else
          if sComboBox5.Text = '115200' then
            Form1.ComPort1.BaudRate := StrToBaudRate('115200')
          else
            Form1.ComPort1.BaudRate := StrToBaudRate('19200');

  if sComboBox8.Text = '9600' then
    Form1.ComPort2.BaudRate := StrToBaudRate('9600')
  else
    if sComboBox8.Text = '19200' then
      Form1.ComPort2.BaudRate := StrToBaudRate('19200')
    else
      if sComboBox8.Text = '38400' then
        Form1.ComPort2.BaudRate := StrToBaudRate('38400')
      else
        if sComboBox8.Text = '57600' then
          Form1.ComPort2.BaudRate := StrToBaudRate('57600')
        else
          if sComboBox8.Text = '115200' then
            Form1.ComPort2.BaudRate := StrToBaudRate('115200')
          else
            Form1.ComPort2.BaudRate := StrToBaudRate('9600');

  Form1.sStatusBar1.Panels[0].Text := 'Порт модема: ' + sComboBox2.Text;
  Form1.sStatusBar1.Panels[1].Text := 'Скорость: ' + sComboBox3.Text;
  Form1.sStatusBar1.Panels[2].Text := 'Порт считывателя: ' + sComboBox4.Text;
  Form1.sStatusBar1.Panels[3].Text := 'Скорость: ' + sComboBox5.Text;

  Form1.passwordDefault := sCheckBox6.Checked;
//  Form1.passwordDefaultNote := sCheckBox11.Checked;

  sBitBtn7.Enabled := False;
end;

procedure TFormOptions.SBFileBaseClick(Sender: TObject);
begin
  my := 1;
  sOpenDialog1.Filter := 'Файлы базы данных|*.fdb';
  if sOpenDialog1.Execute then
    sEditFileBase.Text := sOpenDialog1.FileName;
end;

procedure TFormOptions.sBitBtn10Click(Sender: TObject);
begin
  FormRestore.sEdit1.Text := '';
  FormRestore.sEdit2.Text := '';
  FormRestore.sMemo1.Clear;
  FormRestore.ShowModal;
end;

procedure TFormOptions.sBitBtn11Click(Sender: TObject);
begin
  sDecimalSpinEdit1.Value := 1.3;
  sSpinEdit2.Value := 2500;
end;

procedure TFormOptions.sBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormOptions.sBitBtn2Click(Sender: TObject);
begin
  nb.PageIndex := 0;
end;

procedure TFormOptions.sBitBtn3Click(Sender: TObject);
begin
  nb.PageIndex := 1;
end;

procedure TFormOptions.sBitBtn4Click(Sender: TObject);
begin
  nb.PageIndex := 4;
end;

procedure TFormOptions.sBitBtn5Click(Sender: TObject);
begin
 nb.PageIndex := 5;
end;

procedure TFormOptions.sBitBtn6Click(Sender: TObject);
begin
  nb.PageIndex := 2;
end;

procedure TFormOptions.sBitBtn7Click(Sender: TObject);
var
  base: string;
begin
  PrimenitNastr;

  if sEditFileBase.Modified and (sOpenDialog1.FileName <> '') and sEditFileBase.Enabled then
  begin
    base := dm1.database.DBName;
    Form1.CloseDataBase; //Отключение от базы данных
    dm1.database.DBName := sEditFileBase.Text;
    dm1.databaseSaveThread.DBName := dm1.database.DBName;
    try
      dm1.database.Open;
      dm1.databaseSaveThread.Open;
      FormOptions.sEditFileBase.Text := sOpenDialog1.FileName;
    except
      Application.MessageBox('Ошибка при подключении к базе!', 'Предупреждение', MB_ICONERROR + MB_OK);
      dm1.database.DBName := base;
      dm1.databaseSaveThread.DBName := dm1.database.DBName;
      dm1.database.Open;
      dm1.databaseSaveThread.Open;
    end;
    if my =1 then
    begin
      Form1.N41Click(self);
      //Application.MessageBox('Структура таблицы успешно изменена','', MB_OK+MB_ICONINFORMATION);
    end;
    dm1.town.Open;
    dm1.addresmain.Open;

  end;
  sEditFileBase.Modified := false;
  sOpenDialog1.FileName := '';
  Form1.SaveOptions;

  sBitBtn7.Enabled := false;
end;

procedure TFormOptions.sBitBtn8Click(Sender: TObject);
var
  base: string;
begin
  base := dm1.database.DBName;
  Form1.CloseDataBase; //Отключение от базы данных
  dm1.database.DBName := sEdit1.Text + '/' + sEdit2.Text + ':' + sEdit3.Text;
  try
    dm1.database.Open;
    FormOptions.sEditFileBase.Text := dm1.database.DBName;
  except
    Application.MessageBox('Ошибка при подключении к базе!', 'Предупреждение', MB_ICONERROR + MB_OK);
    dm1.database.DBName := base;
    dm1.database.Open;
  end;
  dm1.town.Open;
  dm1.addresmain.Open;
end;

procedure TFormOptions.sBitBtn9Click(Sender: TObject);
begin
  FormBackUp.sEdit1.Text := dm1.database.DatabaseName;
  FormBackUp.sMemo1.Clear;
  FormBackUp.ShowModal;
end;

procedure TFormOptions.sButton1Click(Sender: TObject);
begin
  nb.PageIndex := 3;
end;

procedure TFormOptions.sCheckBox10Click(Sender: TObject);
begin
 sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sCheckBox11Click(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sCheckBox1Click(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sCheckBox2Click(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sCheckBox3Click(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sCheckBox4Click(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sCheckBox5Click(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sCheckBox6Click(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sCheckBox9Click(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sComboBox1Change(Sender: TObject);
var
  IniFile: TIniFile;
begin
  Form1.sSkinManager1.SkinName := sComboBox1.Text;
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
  IniFile.WriteInteger('Options', 'IndexSkin', sComboBox1.ItemIndex);
  IniFile.Free;
end;

procedure TFormOptions.sComboBox2Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sComboBox3Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sComboBox4Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sComboBox5Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sComboBox7Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sComboBox8Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sDecimalSpinEdit1Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sEdit4Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sEditFileBaseChange(Sender: TObject);
begin
  sBitBtn7.Enabled := True;
  sEditFileBase.Modified := True;
end;

procedure TFormOptions.sRadioGroup1Click(Sender: TObject);
begin
  sGroupBox5.Visible := (sRadioGroup1.ItemIndex = 1);
  sGroupBox7.Visible := (sRadioGroup1.ItemIndex = 0);
end;

procedure TFormOptions.sRadioGroup2Click(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sRadioGroup3Changing(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
 { if sRadioGroup3.ItemIndex = 0 then
  begin
    sEdit4.Visible := False;
  end
  else
  begin
    sEdit4.Visible := False;
  end;    }
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sSpinEdit1Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sSpinEdit2Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sSpinEdit3Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

procedure TFormOptions.sSpinEdit4Change(Sender: TObject);
begin
  sBitBtn7.Enabled := true;
end;

end.

