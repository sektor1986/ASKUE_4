unit URestore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sRadioButton, Buttons, sBitBtn, sSpeedButton, sEdit,
  sGroupBox, ExtCtrls, sPanel, sDialogs, IB_Services, sBevel, sMemo, sComboBox;

type
  TFormRestore = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sBitBtn1: TsBitBtn;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sMemo1: TsMemo;
    sBevel1: TsBevel;
    sBitBtn2: TsBitBtn;
    FIBRestore: TpFIBRestoreService;
    sOpenDialog: TsOpenDialog;
    sSaveDialog: TsSaveDialog;
    sComboBox1: TsComboBox;
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRestore: TFormRestore;

implementation

uses Unit1;

{$R *.dfm}

procedure TFormRestore.sBitBtn1Click(Sender: TObject);
begin
  if sRadioButton1.Checked then
    FIBRestore.Options := [CreateNewDB]
  else
    FIBRestore.Options := [Replace];
  FIBRestore.BackupFile.Add(sEdit1.Text);
  FIBRestore.DatabaseName.Add(sEdit2.Text);
  FIBRestore.PageSize := StrtoInt(sComboBox1.Text);
  FIBRestore.ServerName := 'localhost';
  try
    Screen.Cursor := crSQLWait;
    FIBRestore.Active := true;
    FIBRestore.ServiceStart;
    sMemo1.Lines.Add('*******Начат процесс востановления*************');
    sMemo1.Lines.Add('');
    while not FIBRestore.Eof do
      sMemo1.Lines.Add(FIBRestore.GetNextLine);
    sMemo1.Lines.Add('Процесс восстановления закончен');
    FIBRestore.Active := false;
  except
    ShowMessage('Ошибка при востановлении базы');
  end;
  Screen.Cursor := crDefault;
end;

procedure TFormRestore.sBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRestore.sSpeedButton1Click(Sender: TObject);
begin
  if sOpenDialog.Execute then
    sEdit1.Text := sOpenDialog.FileName;
end;

procedure TFormRestore.sSpeedButton2Click(Sender: TObject);
begin
  if sSaveDialog.Execute then
    sEdit2.Text := sSaveDialog.FileName;
end;

end.
