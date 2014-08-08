unit UAutoUploadTeplo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, Mask, sMaskEdit, sCustomComboEdit, sTooledit, sLabel, sComboBox, sSpinEdit,
  sEdit, sRadioButton, ExtCtrls, sBevel, sGroupBox, sCheckBox, IniFiles;

type
  TForm_AutoUploadTeplo = class(TForm)
    sCheckBox1: TsCheckBox;
    sGroupBox1: TsGroupBox;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sBevel4: TsBevel;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sRadioButton3: TsRadioButton;
    sTimePicker1: TsTimePicker;
    sSpinEdit1: TsSpinEdit;
    sTimePicker2: TsTimePicker;
    sTimePicker3: TsTimePicker;
    sRadioButton4: TsRadioButton;
    sTimePicker4: TsTimePicker;
    sComboBox1: TsComboBox;
    sGroupBox4: TsGroupBox;
    sLabel1: TsLabel;
    sDirectoryEdit1: TsDirectoryEdit;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sEdit3: TsEdit;
    sBitBtn3: TsBitBtn;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    task: Boolean;
    procedure UploadTem();
    procedure LoadOptions();
    procedure SaveOptions();
  public
    { Public declarations }
  end;

var
  Form_AutoUploadTeplo: TForm_AutoUploadTeplo;

implementation

uses UExport_TEM_104, UFunction;

{$R *.dfm}

procedure TForm_AutoUploadTeplo.FormCreate(Sender: TObject);
begin
  LoadOptions();
end;

procedure TForm_AutoUploadTeplo.FormShow(Sender: TObject);
begin
  LoadOptions();
end;

procedure TForm_AutoUploadTeplo.LoadOptions;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
  sRadioButton1.Checked := IniFile.ReadBool('AutoUploadTem', 'EveryDay', False);
  sRadioButton2.Checked := IniFile.ReadBool('AutoUploadTem', 'monthly', False);
  sRadioButton3.Checked := IniFile.ReadBool('AutoUploadTem', 'once', False);
  sRadioButton4.Checked := IniFile.ReadBool('AutoUploadTem', 'Week', False);
  sCheckBox1.Checked := IniFile.ReadBool('AutoUploadTem', 'Enable', False);
  sTimePicker1.Text := IniFile.ReadString('AutoUploadTem', 'EveryDay_Time', '00:00:00');
  sTimePicker2.Text := IniFile.ReadString('AutoUploadTem', 'monthly_Time', '00:00:00');
  sTimePicker3.Text := IniFile.ReadString('AutoUploadTem', 'once_Time', '00:00:00');
  sTimePicker4.Text := IniFile.ReadString('AutoUploadTem', 'Week_Time', '00:00:00');
  sSpinEdit1.Value := IniFile.ReadInteger('AutoUploadTem', 'once_Day', 1);
  sComboBox1.ItemIndex := IniFile.ReadInteger('AutoUploadTem', 'once_Week', 0);
  sDirectoryEdit1.Text := IniFile.ReadString('AutoUploadTem', 'Patch', '');
  sEdit1.Text := IniFile.ReadString('AutoUploadTem', 'mask', 'dd/mm/yy');
  sEdit2.Text := IniFile.ReadString('AutoUploadTem', 'prefix', '');
  sEdit3.Text := IniFile.ReadString('AutoUploadTem', 'postfix', '');

  Timer1.Enabled := IniFile.ReadBool('AutoUploadTem', 'Enable', False);
  IniFile.Free;
end;

procedure TForm_AutoUploadTeplo.SaveOptions;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
  IniFile.WriteBool('AutoUploadTem', 'EveryDay', sRadioButton1.Checked);
  IniFile.WriteBool('AutoUploadTem', 'monthly', sRadioButton2.Checked);
  IniFile.WriteBool('AutoUploadTem', 'once', sRadioButton3.Checked);
  IniFile.WriteBool('AutoUploadTem', 'Week', sRadioButton4.Checked);
  IniFile.WriteBool('AutoUploadTem', 'Enable', sCheckBox1.Checked);
  IniFile.WriteString('AutoUploadTem', 'EveryDay_Time', sTimePicker1.Text);
  IniFile.WriteString('AutoUploadTem', 'monthly_Time', sTimePicker2.Text);
  IniFile.WriteString('AutoUploadTem', 'once_Time', sTimePicker3.Text);
  IniFile.WriteString('AutoUploadTem', 'Week_Time', sTimePicker4.Text);
  IniFile.WriteInteger('AutoUploadTem', 'once_Day', sSpinEdit1.Value);
  IniFile.WriteInteger('AutoUploadTem', 'once_Week', sComboBox1.ItemIndex);
  IniFile.WriteString('AutoUploadTem', 'Patch', sDirectoryEdit1.Text);
  IniFile.WriteString('AutoUploadTem', 'mask', sEdit1.Text);
  IniFile.WriteString('AutoUploadTem', 'prefix', sEdit2.Text);
  IniFile.WriteString('AutoUploadTem', 'postfix', sEdit3.Text);
  IniFile.Free;
end;

procedure TForm_AutoUploadTeplo.sBitBtn1Click(Sender: TObject);
begin
  task := False;
  SaveOptions;
  Timer1.Enabled := sCheckBox1.Checked;
  sBitBtn1.Enabled := False;
end;

procedure TForm_AutoUploadTeplo.sBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_AutoUploadTeplo.sBitBtn3Click(Sender: TObject);
begin
  UploadTem;
end;

procedure TForm_AutoUploadTeplo.sCheckBox1Click(Sender: TObject);
begin
  sBitBtn1.Enabled := True;
end;

procedure TForm_AutoUploadTeplo.Timer1Timer(Sender: TObject);
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
        UploadTem;
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
          UploadTem;
        end;
      end;

    end;
    if (sRadioButton3.Checked) and (task = False) then
    begin
      time_str := TimeToStr(now);
      if time_str = sTimePicker3.Text then
      begin
        UploadTem;
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
          UploadTem;
        end;
      end;
    end;

  end;

end;

procedure TForm_AutoUploadTeplo.UploadTem;
var
  fileName: string;
begin
  Form_Export_TEM_104.tmp.Open;
  DateSeparator := '-';
  TimeSeparator := '_';
  fileName := sDirectoryEdit1.Text + '\' + sEdit2.Text + FormatDateTime(sEdit1.Text, Date + Time) + sEdit3.Text + '.dbf';
  DateSeparator := '.';
  TimeSeparator := ':';
  Form_Export_TEM_104.ExportTem(fileName);
  Form_Export_TEM_104.tmp.Close;

end;

end.

