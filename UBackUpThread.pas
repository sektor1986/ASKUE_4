unit UBackUpThread;

interface

uses
  Classes, SysUtils;

type
  TBackUpThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
    Dbname: string;
    BackUpName: string;
  end;

implementation

uses UBackUp;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TBackUpThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TBackUpThread }

procedure TBackUpThread.Execute;
begin
  Sleep(5000);
  with FormBackUp do
    begin
      FIBBackup.DatabaseName := Dbname;
      FIBBackup.ServerName := 'localhost';
      FIBBackup.BackupFile.Add(Dbname + '.gbk');
      FIBBackup.Active := True;
      FIBBackup.Verbose := true;
      try
        FIBBackup.ServiceStart;
        while not FIBBackup.eof do
          begin

          end;
        FIBBackup.Active := false;
  except

  end;
    end;
end;

end.
