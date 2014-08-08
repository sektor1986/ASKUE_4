library excelDLL;

uses
  SysUtils,
  Classes,
  Forms,
  Windows,
  Dialogs,
  Excel in 'Excel.pas' {FormDLL1},
  query in 'query.pas' {QueryForm};

procedure CreateFormBalance(pathBase: Pchar; pass: Pchar; user: Pchar; protocol:Pchar; Handle_:HWND; ID:integer);
 begin

   Application.Handle:=Handle_;

   begin
   FormDLL1 := TFormDLL1.Create(Application.MAinForm);
//  Application.CreateForm();
   Application.CreateForm(TQueryForm, QueryForm);
   FormDLL1.IBDatabase2.Connected:=false;
   FormDLL1.IBDatabase2.DBname:=pathBase;
   FormDLL1.IBDatabase2.DBParams.Clear;
   FormDLL1.IBDatabase2.DBParams.Add('user_name='+user);
   FormDLL1.IBDatabase2.DBParams.Add('password='+pass);
   FormDll1.SaveDialog1.InitialDir:=pathBase;
   FormDll1.editId.Text :=IntToStr(id);
   FormDLL1.IBDatabase2.Open;
   FormDll1.Show;
   end;
 end;


procedure BalanceDll(Reason:integer);
begin
  case Reason of
   DLL_PROCESS_ATTACH:MessageBeep(0);
   DLL_PROCESS_DETACH:MessageBeep(0);
   Dll_THREAD_ATTACH:MessageBeep(0) ;
   Dll_THREAD_DETACH:MessageBeep(0);
  end;
end;
exports
 CreateFormBalance;
// tak;

//{$R *.RES}

begin
// DLLProc:=@BalanceDll;
 BalanceDll(DLL_PROCESS_ATTACH);
// SomeBuffer:=AllocMem(1024);
end.
