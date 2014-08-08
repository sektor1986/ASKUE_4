program ASKUE_VZEP;

uses
  Windows,
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Udm1 in 'Udm1.pas' {dm1: TDataModule},
  UVarTar in 'UVarTar.pas' {FormVarTar},
  UFrameVarTar in 'UFrameVarTar.pas' {frameVartar: TFrame},
  UDataVrem in 'UDataVrem.pas' {FormDataVrem},
  UFrameTarNak in 'UFrameTarNak.pas' {frameTarNak: TFrame},
  UTarNak in 'UTarNak.pas' {FormTarNak},
  UFramePower in 'UFramePower.pas' {FramePower: TFrame},
  UPower in 'UPower.pas' {FormPower},
  UFramePomesPotr in 'UFramePomesPotr.pas' {framePomesPotr: TFrame},
  UPomesPotr in 'UPomesPotr.pas' {FormPomesPotr},
  UFrameNa1Chislo in 'UFrameNa1Chislo.pas' {frameNa1Chislo: TFrame},
  UNa1Chislo in 'UNa1Chislo.pas' {FormNa1Chislo},
  UFrameOtklPodkl in 'UFrameOtklPodkl.pas' {farmeOtklPodkl: TFrame},
  UOtklPodkl in 'UOtklPodkl.pas' {FormOtklPodkl},
  UView in 'UView.pas' {FormView},
  USpisokNeschit in 'USpisokNeschit.pas' {FormSpisokNeschit},
  UProcedure in 'UProcedure.pas',
  UOptions in 'UOptions.pas' {FormOptions},
  UFunction in 'UFunction.pas',
  UAddNewSchetchik in 'UAddNewSchetchik.pas' {FormAddNewSchetchik},
  UProgress in 'UProgress.pas' {FormProgress},
  UPeremSchetchikaVDrRas in 'UPeremSchetchikaVDrRas.pas' {FormPeremSchetchikaVDrRas},
  UPassword in 'UPassword.pas' {FormPassword},
  UDeviceThread in 'UDeviceThread.pas',
  UFrameTarPerehodi in 'UFrameTarPerehodi.pas' {FrameTarPerehodi: TFrame},
  UTarPerehodi in 'UTarPerehodi.pas' {FormTarPerehodi},
  UFormOpr in 'UFormOpr.pas' {FormOpr},
  Udm2 in 'Udm2.pas' {dm2: TDataModule},
  UPassKoncSchit in 'UPassKoncSchit.pas' {FormPassKonsSchit},
  UFormirOprChtenie in 'UFormirOprChtenie.pas' {FormFormirOprChtenie},
  UCheckUser in 'UCheckUser.pas' {FormCheckUser},
  UPassSchit in 'UPassSchit.pas' {FormPassSchit},
  USamSchetchika in 'USamSchetchika.pas' {FormSamSchetchika},
  UExport in 'UExport.pas' {FormExport},
  UPereimAdr in 'UPereimAdr.pas' {FormPereimAdr},
  UAbout in 'UAbout.pas' {FormAbout},
  UPereimRas in 'UPereimRas.pas' {FormPereimRas},
  UNaznVarTar in 'UNaznVarTar.pas' {FormNaznVarTar},
  UBackUp in 'UBackUp.pas' {FormBackUp},
  URestore in 'URestore.pas' {FormRestore},
  UBackUpThread in 'UBackUpThread.pas',
  UTEM_104 in 'UTEM_104.pas' {FormTEM_104},
  UTEM_104_Stat in 'UTEM_104_Stat.pas' {FormTEM_104_Stat},
  UProfil in 'UProfil.pas' {FormProfil},
  UdmPrint in 'UdmPrint.pas' {dmPrint: TDataModule},
  UPrint in 'UPrint.pas' {FormPrint},
  URegistrNomer in 'URegistrNomer.pas' {FormRegistrNomer},
  USaveData in 'USaveData.pas',
  UdmExport_Import in 'UdmExport_Import.pas' {dmExport_Import: TDataModule},
  UDelCounter in 'UDelCounter.pas' {FormDelCounter},
  UTypes in 'UTypes.pas',
  UModem in 'UModem.pas',
  UHistory in 'UHistory.pas' {FormHistory},
  UExport_TEM_104 in 'UExport_TEM_104.pas' {Form_Export_TEM_104},
  UEditPassCounter in 'UEditPassCounter.pas' {Form_EditPassCounter},
  UEditVArTar in 'UEditVArTar.pas' {Form_EditVarTar},
  UEditTarPerehod in 'UEditTarPerehod.pas' {Form_EditTarPerehod},
  UAutoRead in 'UAutoRead.pas' {Form_AutoRead},
  UMySQL in 'UMySQL.pas' {Form_MySQL},
  UAutoUpload in 'UAutoUpload.pas' {Form_AutoUpload},
  UAutoUploadTeplo in 'UAutoUploadTeplo.pas' {Form_AutoUploadTeplo},
  UGPRS in 'UGPRS.pas' {dmGPRS: TDataModule},
  UBook in 'UBook.pas' {FormBook};

{$R *.res}

var UniqueMapping: THandle;
    FirstWindow: THandle;
begin
  //*******Возможность загрузки только одной копии программы
    UniqueMapping :=CreateFileMapping($ffffffff, nil,PAGE_READONLY, 0, 32, 'MyMap');
    if UniqueMapping = 0 then
      begin
        Application.MessageBox('Одна копия уже запущена', 'Предупреждение!!!', MB_OK);
        Halt;
      end
    else if GetLastError = ERROR_ALREADY_EXISTS then
      begin
        FirstWindow := FindWindowEx(0, 0, PChar(TForm1.ClassName + #0), nil);
        if FirstWindow <> 0 then
          SetForegroundWindow(FirstWindow);
        Halt;
      end;
  //****

  Application.Initialize;
  Application.ShowMainForm := false;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ASKUE VZEP 4';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormRegistrNomer, FormRegistrNomer);
  Application.CreateForm(TdmExport_Import, dmExport_Import);
  Application.CreateForm(TFormDelCounter, FormDelCounter);
  Application.CreateForm(TFormHistory, FormHistory);
  Application.CreateForm(TForm_Export_TEM_104, Form_Export_TEM_104);
  Application.CreateForm(TForm_EditPassCounter, Form_EditPassCounter);
  Application.CreateForm(TForm_EditVarTar, Form_EditVarTar);
  Application.CreateForm(TForm_EditTarPerehod, Form_EditTarPerehod);
  Application.CreateForm(TForm_AutoRead, Form_AutoRead);
  Application.CreateForm(TForm_MySQL, Form_MySQL);
  Application.CreateForm(TForm_AutoUpload, Form_AutoUpload);
  Application.CreateForm(TForm_AutoUploadTeplo, Form_AutoUploadTeplo);
  Application.CreateForm(TdmGPRS, dmGPRS);
  Application.CreateForm(TFormBook, FormBook);
  //FormPreview.Show;
  Application.ProcessMessages;
  Application.CreateForm(TFormCheckUser, FormCheckUser);
  Application.CreateForm(TFormVarTar, FormVarTar);
  Application.CreateForm(TFormDataVrem, FormDataVrem);
  Application.CreateForm(TFormTarNak, FormTarNak);
  Application.CreateForm(TFormPower, FormPower);
  Application.CreateForm(TFormPomesPotr, FormPomesPotr);
  Application.CreateForm(TFormNa1Chislo, FormNa1Chislo);
  Application.CreateForm(TFormOtklPodkl, FormOtklPodkl);
  Application.CreateForm(TFormView, FormView);
  Application.CreateForm(TFormSpisokNeschit, FormSpisokNeschit);
  Application.CreateForm(TFormAddNewSchetchik, FormAddNewSchetchik);
  Application.CreateForm(TFormProgress, FormProgress);
  Application.CreateForm(TFormPeremSchetchikaVDrRas, FormPeremSchetchikaVDrRas);
  Application.CreateForm(TFormPassword, FormPassword);
  Application.CreateForm(TFormTarPerehodi, FormTarPerehodi);
  Application.CreateForm(TFormOpr, FormOpr);
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(Tdm2, dm2);
  Application.CreateForm(TFormPassKonsSchit, FormPassKonsSchit);
  Application.CreateForm(TFormFormirOprChtenie, FormFormirOprChtenie);
  Application.CreateForm(TFormOptions, FormOptions);
  Application.CreateForm(TFormPassSchit, FormPassSchit);
  Application.CreateForm(TFormSamSchetchika, FormSamSchetchika);
  Application.CreateForm(TFormExport, FormExport);
  Application.CreateForm(TFormPereimAdr, FormPereimAdr);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormPereimRas, FormPereimRas);
  Application.CreateForm(TFormNaznVarTar, FormNaznVarTar);
  Application.CreateForm(TFormBackUp, FormBackUp);
  Application.CreateForm(TFormRestore, FormRestore);
  Application.CreateForm(TFormTEM_104, FormTEM_104);
  Application.CreateForm(TFormTEM_104_Stat, FormTEM_104_Stat);
  Application.CreateForm(TFormProfil, FormProfil);
  Application.CreateForm(TdmPrint, dmPrint);
  Application.CreateForm(TFormPrint, FormPrint);
  //FormPreview.Close;
  Form1.Show;
  Application.Run;
end.
