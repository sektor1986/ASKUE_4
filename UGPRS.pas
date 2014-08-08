unit UGPRS;

interface

uses
  Windows, SysUtils, Classes, IdTCPClient, IdThread, IdSync, IdTCPConnection, SyncObjs, IdBaseComponent,
  IdComponent, Graphics, RichEdit, Messages, IdStack, IdAntiFreezeBase, IdAntiFreeze;

type
  TReadingThread = class(TIdThread)
  protected
    FConn: TIdTCPConnection;
    procedure Execute; override;
    procedure DoTerminate; override;
  public
    constructor Create(AConn: TIdTCPConnection); reintroduce;
  end;

  TLog = class(TIdSync)
  protected
    FMsg: string;
    procedure DoSynchronize; override;
  public
    constructor Create(const AMsg: string);
    class procedure AddMsg(const AMsg: string);
  end;

  TdmGPRS = class(TDataModule)
    idtcpclnt1: TIdTCPClient;
    procedure idtcpclnt1Connected(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure UpdateLog(str: string; color: TColor);
    { Private declarations }
  public
    function InitGPRS(Host: string; Port: Integer): Boolean; //Процедура инициализации модема
    function DisconnectGPRS(): Boolean;
    function SendGPRS(buf: TBytes): Boolean;
    function GetDataGPRS(var buf: TBytes; cnt: integer): Boolean;
    function GetByteGPRS(var byf: Byte):Boolean;
    function InBufEmtyGPRS():Boolean;
    { Public declarations }
  end;

var
  dmGPRS: TdmGPRS;
  rt: TReadingThread = nil;
  Section: TCriticalSection;
  Processed: Integer;
implementation
uses Unit1;
const
  colorError = clred;
  colorOk = clBlue;
  colorRab = clGreen;
{$R *.dfm}

{ TDataModule3 }

procedure TdmGPRS.DataModuleCreate(Sender: TObject);
begin
  Section := TCriticalSection.Create;
end;

function TdmGPRS.GetByteGPRS(var byf: Byte): Boolean;
begin
  try
    byf := Byte(idtcpclnt1.IOHandler.ReadChar);
    Result := True;
  except
    Result := False;
  end;
end;

function TdmGPRS.GetDataGPRS(var buf: TBytes; cnt: integer): Boolean;
begin
  try
    idtcpclnt1.IOHandler.ReadBytes(buf, cnt, false);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TdmGPRS.idtcpclnt1Connected(Sender: TObject);
begin
  UpdateLog('Соединение установлено', colorOk);
//  rt := TReadingThread.Create(idtcpclnt1);
end;

function TdmGPRS.InBufEmtyGPRS: Boolean;
begin
  Result := idtcpclnt1.IOHandler.InputBufferIsEmpty;
end;

function TdmGPRS.InitGPRS(Host: string; Port: Integer): Boolean;
begin
  idtcpclnt1.Host := Host;
  idtcpclnt1.Port := Port;
  Result := False;
  try
    idtcpclnt1.Connect;
    Result := True;
  except
    on E: Exception  do
      UpdateLog('Соединение не установлено (' + E.Message + ')', colorError);
//      TLog.AddMsg('Error: ' + E.Message);
  end;
end;

function TdmGPRS.DisconnectGPRS(): Boolean;
begin
  try
    idtcpclnt1.Disconnect;
    Result := True;;
  except
    Result := False;
  end;
end;

function TdmGPRS.SendGPRS(buf: TBytes): Boolean;
begin
  idtcpclnt1.Socket.Write(buf);
  Result := True;
end;

{ TReadingThread }

constructor TReadingThread.Create(AConn: TIdTCPConnection);
begin
//  TLog.AddMsg('DEBUG: TReadingThread.Create');
  FConn := AConn;
  inherited Create(False);
end;

procedure TReadingThread.DoTerminate;
begin
  TLog.AddMsg('DEBUG: TReadingThread.DoTerminate');
  inherited;
end;

procedure TReadingThread.Execute;
var
  cmd: string;
begin
  TLog.AddMsg('DEBUG: TReadingThread.Execute');

  while not Terminated do
  begin
    cmd := FConn.IOHandler.ReadLn();
    TLog.AddMsg('DEBUG: TReadingThread.Execute. Cmd: ' + cmd);
    if cmd = 'PING' then begin
      FConn.IOHandler.WriteLn('PONG');
    end
  end;
end;

{ TLog }

class procedure TLog.AddMsg(const AMsg: string);
begin
  with Create(AMsg) do
    try
      Synchronize;
    finally
      Free;
    end;
end;

constructor TLog.Create(const AMsg: string);
begin
  inherited Create;
  FMsg := AMsg;
end;

procedure TLog.DoSynchronize;
begin
  Form1.Log.Lines.Add(FMsg);
end;

procedure TdmGPRS.UpdateLog(str: string; color: TColor);
//Процедура добавления строки в протокол обмена
var
  Format: TCharFormat; //Переменная для хранения параметров шрифта TRichEdit
begin
  FillChar(Format, SizeOf(TCharFormat), 0);
  Format.cbSize := SizeOf(TCharFormat);
  SendMessage(Form1.Log.Handle, EM_SETSEL, MaxInt, MaxInt);
  SendMessage(Form1.Log.Handle, EM_GETCHARFORMAT, 0, LPARAM(@Format));
  //Получение текущих параметров шрифта
  Format.dwMask := CFM_COLOR;
  Format.crTextColor := ColorToRGB(color);
  SendMessage(Form1.Log.Handle, EM_SETCHARFORMAT, SCF_SELECTION,
    LPARAM(@Format)); //Применение параметров
  SendMessage(Form1.Log.Handle, EM_REPLACESEL, 0, LongInt(PChar(str + #13#10)));
  //Запись новой строки в TRichEdit
end;

end.

