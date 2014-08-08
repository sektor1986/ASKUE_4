unit UBackUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sMemo, Buttons, sBitBtn, sEdit, IB_Services, ExtCtrls,
  sPanel, sDialogs, sSpeedButton, sBevel;

type
  TFormBackUp = class(TForm)
    sPanel1: TsPanel;
    FIBBackup: TpFIBBackupService;
    sEdit1: TsEdit;
    sBitBtn1: TsBitBtn;
    sMemo1: TsMemo;
    sSpeedButton1: TsSpeedButton;
    sOpenDialog: TsOpenDialog;
    sBevel1: TsBevel;
    sBitBtn2: TsBitBtn;
    procedure sBitBtn1Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBackUp: TFormBackUp;

implementation

uses Udm1, Unit1;

{$R *.dfm}

procedure TFormBackUp.sBitBtn1Click(Sender: TObject);
begin
  FIBBackup.DatabaseName := sEdit1.Text;
  FIBBackup.ServerName := 'localhost';
  FIBBackup.BackupFile.Add(ExtractFilePath(sEdit1.Text) + ExtractFileName(sEdit1.Text) + '.gbk');
  FIBBackup.Active := True;
  FIBBackup.Verbose := true;
  try
    Screen.Cursor := crSQLWait;
    FIBBackup.ServiceStart;
    sMemo1.Lines.Add('************ Резервное копирование базы ' + sEdit1.Text + ' начато************');
    sMemo1.Lines.Add('');
    while not FIBBackup.Eof do
      begin
        sMemo1.Lines.Add(FIBBackup.GetNextLine);
      end;
    sMemo1.Lines.Add('************ Резервное копирование закончено***********');
    FIBBackup.Active := false;
  except
    ShowMessage('Ошибка при резервном копировании');
  end;
  Screen.Cursor := crDefault;
end;

procedure TFormBackUp.sBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFormBackUp.sSpeedButton1Click(Sender: TObject);
begin
  if sOpenDialog.Execute then
    sEdit1.Text := sOpenDialog.FileName;
end;

end.
