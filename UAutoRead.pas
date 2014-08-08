unit UAutoRead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sSpinEdit, ExtCtrls, sBevel, sEdit,
  sCheckBox, sRadioButton, sGroupBox, IniFiles, sComboBox;

type
  TForm_AutoRead = class(TForm)
    Timer1: TTimer;
    sGroupBox1: TsGroupBox;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sRadioButton3: TsRadioButton;
    sCheckBox1: TsCheckBox;
    sTimePicker1: TsTimePicker;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sSpinEdit1: TsSpinEdit;
    sTimePicker2: TsTimePicker;
    sTimePicker3: TsTimePicker;
    sBevel3: TsBevel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sRadioButton4: TsRadioButton;
    sTimePicker4: TsTimePicker;
    sBevel4: TsBevel;
    sComboBox1: TsComboBox;
    sGroupBox2: TsGroupBox;
    sRadioButton5: TsRadioButton;
    sRadioButton6: TsRadioButton;
    procedure sBitBtn2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    task: Boolean;
    procedure Startread();
    procedure StartProgramRead();
    procedure LoadOptions();
    procedure SaveOptions();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_AutoRead: TForm_AutoRead;

implementation

uses Unit1, Udm2, UFormirOprChtenie, UDeviceThread, UFunction, UFormOpr;

{$R *.dfm}

procedure TForm_AutoRead.FormCreate(Sender: TObject);
begin
  LoadOptions;
end;

procedure TForm_AutoRead.FormShow(Sender: TObject);
begin
  LoadOptions;
end;

procedure TForm_AutoRead.LoadOptions;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0))+'options.ini');
  sRadioButton1.Checked := IniFile.ReadBool('AutoRead', 'EveryDay', False);
  sRadioButton2.Checked := IniFile.ReadBool('AutoRead', 'monthly', False);
  sRadioButton3.Checked := IniFile.ReadBool('AutoRead', 'once', False);
  sRadioButton4.Checked := IniFile.ReadBool('AutoRead', 'Week', False);
  sCheckBox1.Checked := IniFile.ReadBool('AutoRead', 'Enable', False);
  sTimePicker1.Text := IniFile.ReadString('AutoRead', 'EveryDay_Time', '00:00:00');
  sTimePicker2.Text := IniFile.ReadString('AutoRead', 'monthly_Time', '00:00:00');
  sTimePicker3.Text := IniFile.ReadString('AutoRead', 'once_Time', '00:00:00');
  sTimePicker4.Text := IniFile.ReadString('AutoRead', 'Week_Time', '00:00:00');
  sSpinEdit1.Value := IniFile.ReadInteger('AutoRead', 'once_Day', 1);
  sComboBox1.ItemIndex := IniFile.ReadInteger('AutoRead', 'once_Week', 0);
  if (IniFile.ReadInteger('AutoRead', 'mode_read', 0) = 0) then
    sRadioButton5.Checked := True
  else
    sRadioButton6.Checked := True;
  Timer1.Enabled := IniFile.ReadBool('AutoRead', 'Enable', False);
  IniFile.Free;
end;

procedure TForm_AutoRead.SaveOptions;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0))+'options.ini');
  IniFile.WriteBool('AutoRead', 'EveryDay', sRadioButton1.Checked);
  IniFile.WriteBool('AutoRead', 'monthly', sRadioButton2.Checked);
  IniFile.WriteBool('AutoRead', 'once', sRadioButton3.Checked);
  IniFile.WriteBool('AutoRead', 'Week', sRadioButton4.Checked);
  IniFile.WriteBool('AutoRead', 'Enable', sCheckBox1.Checked);
  IniFile.WriteString('AutoRead', 'EveryDay_Time', sTimePicker1.Text);
  IniFile.WriteString('AutoRead', 'monthly_Time', sTimePicker2.Text);
  IniFile.WriteString('AutoRead', 'once_Time', sTimePicker3.Text);
  IniFile.WriteString('AutoRead', 'Week_Time', sTimePicker4.Text);
  IniFile.WriteInteger('AutoRead', 'once_Day', sSpinEdit1.Value);
  IniFile.WriteInteger('AutoRead', 'once_Week', sComboBox1.ItemIndex);
  if sRadioButton5.Checked then
    IniFile.WriteInteger('AutoRead', 'mode_read', 0)
  else
    IniFile.WriteInteger('AutoRead', 'mode_read', 1);
  IniFile.Free;
end;

procedure TForm_AutoRead.sBitBtn1Click(Sender: TObject);
begin
  task := False;
  SaveOptions;
  Timer1.Enabled := sCheckBox1.Checked;
  sBitBtn1.Enabled := False;
end;

procedure TForm_AutoRead.sBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_AutoRead.sCheckBox1Click(Sender: TObject);
begin
  sBitBtn1.Enabled := True;
end;

procedure TForm_AutoRead.StartProgramRead;
  var
    i: Integer;
begin
  Form1.EditPassCounter := False;
  dm2.addresmain_konc.Close;
  dm2.addres_konc.Close;
  dm2.tmp_konc.Close;
  dm2.transact.Active := false;
  dm2.addresmain_konc.Open;
  dm2.addres_konc.Open;
  dm2.tmp_konc.Open;
  try
    Form1.Port := TDeviceThread.Create(true);
    Form1.Port.FreeOnTerminate := true;
    Form1.Port.flagTolkoChtenie := false;
    Form1.flagTolkoChtenie := false;
    Form1.Port.flagModem := Form1.sCheckBox2.Checked;
    Form1.Port.flagSchitivatel := (Form1.sBitBtn51.Tag = 4);
    Form1.Port.flagWrite := (Form1.sBitBtn51.Tag = 1);
    FormOpr.FormirParamOpr;
    FormOpr.FormirMassiva;
    Form1.nb.PageIndex := 6;        //Переход на страницу протокола обмена
    Form1.Port.stop := false;
    //----------Заполнение паролей----------------
    for i := 0 to Length(Form1.Port.massivOprosa) - 1 do
      begin
        Form1.Port.massivOprosa[i, 0, 0, 3] := '000001';
        Form1.Port.massivOprosa[i, 0, 0, 4] := '000001';
        Form1.Port.massivOprosa[i, 0, 0, 8] :=  '000001';
        Form1.massivOprosa[i, 0, 0, 3] := Form1.Port.massivOprosa[i, 0, 0, 3];
        Form1.massivOprosa[i, 0, 0, 4] := Form1.Port.massivOprosa[i, 0, 0, 4];
        Form1.massivOprosa[i, 0, 0, 8] := Form1.Port.massivOprosa[i, 0, 0, 8];
      end;
    //********************************
    Form1.Port.Priority := tpHigher;
    Form1.Port.Resume;
  except
    ShowMessage('Ошибка запуска атоматического чтения');
  end;
end;

procedure TForm_AutoRead.Startread;
begin
  dm2.addresmain_konc.CloseOpen(true);
  FormFormirOprChtenie.sEdit1.Text := '000001';
  try
    Form1.Port := TDeviceThread.Create(true);
    Form1.Port.FreeOnTerminate := true;       //Автозавершение потока
    Form1.Port.flagTolkoChtenie := true;      //Установка флага только чтение
    Form1.Port.flagModem := Form1.sCheckBox2.Checked;
    Form1.flagTolkoChtenie := true;
    Form1.Port.flagSchitivatel := false;
    FormFormirOprChtenie.FormirMassiv;                             //Формирование массива для чтения
    Form1.Port.Priority := tpHigher;           //Приоритет потока чтения
    Form1.nb.PageIndex := 6;                  //Переход на страницу протокола обмена
    Form1.Port.Resume;                        //Старт потока                                   //Закрытие окна
    except
      Form1.Port.Terminate;   //Завершение потока
    end;
end;

procedure TForm_AutoRead.Timer1Timer(Sender: TObject);
var
  time_str: string;
  day, month, year: Word;
begin
  LongTimeFormat := 'hh:mm:ss';
  if sCheckBox1.Checked then
    begin
      if sRadioButton1.Checked then
        begin
          time_str := TimeToStr(now);
          if time_str = sTimePicker1.Text then
            begin
              if sRadioButton5.Checked then
                StartProgramRead
              else
                Startread;
            end;
        end;
      if sRadioButton2.Checked then
        begin
          DecodeDate(Date, year, month, day);
          if sSpinEdit1.Value = day then
            begin
              time_str := TimeToStr(now);
              if time_str = sTimePicker2.Text then
                begin
                  if sRadioButton5.Checked then
                    StartProgramRead
                  else
                    Startread;
                end;
            end;
          
        end;
      if (sRadioButton3.Checked) and (task = False) then
        begin
          time_str := TimeToStr(now);
          if time_str = sTimePicker3.Text then
            begin
              if sRadioButton5.Checked then
                StartProgramRead
              else
                Startread;
              task := True;
            end;
        end;
      if sRadioButton4.Checked then
        begin
          DecodeDate(Date, year, month, day);
          if DayOfWeek(Date) = sComboBox1.ItemIndex then
            begin
              time_str := TimeToStr(now);
              if time_str = sTimePicker4.Text then
                begin
                  if sRadioButton5.Checked then
                    StartProgramRead
                  else
                    Startread;
                end;
            end;
        end;

    end;
  
end;

end.
