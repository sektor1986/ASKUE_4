library DllImport;

uses
  SysUtils,
  Dialogs,
  sDialogs,
  dbclient,
  DllExpD in 'DllExpD.pas' {exportD: TDataModule};

{$R *.RES}

var
//DllF : TDLLF;
  ImpExp : TClientDataSet;
  SaveDialog :TsSaveDialog;

function CreateImpExp(Path: string; data: integer):Integer;
begin
  try
    exportD := TexportD.Create(nil);
    ImpExp := TClientDataSet.Create(ImpExp);
    exportD.index := 0;
    exportD.indexm := 0;
    if data <> 0 then
      exportD.ImpExp.LoadFromFile(Path+'DLL\export\Impexp_2.cds')
    else
      begin
        ImpExp.LoadFromFile(Path+'DLL\export\Impexp.cds');
        ImpExp.Open;
      end;

    ImpExp.Tag := data;

    Result := 1;
  except
    Result := 0;
  end;
end;

function Exp (Street:String ; kv: String; ns: String; sdf: String; vartar:String; desk:String):Integer;
begin
  try
    if ImpExp.Tag = 0 then
      begin
        Impexp.Append;
        Impexp.FieldByName('STREET').AsString := Street;
        Impexp.FieldByName('KV').AsString := kv;
        Impexp.FieldByName('NS').AsString := ns;
        Impexp.FieldByName('SDF').AsString := sdf;
        Impexp.FieldByName('VARTAR').AsString := vartar;
        Impexp.FieldByName('DESK').AsString := desk;
        Impexp.Post;
      end
    else
      begin
        Inc(exportD.index);
        exportD.Impexp.Append;
        exportD.Impexp.FieldByName('INC').AsInteger := exportD.index;
        exportD.Impexp.FieldByName('CHEC').AsInteger := 0;
        exportD.Impexp.FieldByName('STREET').AsString := Street;
        exportD.Impexp.FieldByName('KV').AsString := kv;
        exportD.Impexp.FieldByName('NS').AsString := ns;
        exportD.Impexp.FieldByName('SDF').AsString := sdf;
        exportD.Impexp.FieldByName('VARTAR').AsString := vartar;
        exportD.Impexp.FieldByName('DESCRIPTION').AsString := desk;
        exportD.Impexp.Post;
      end;

    Result := 1;
  except
    Result := 0;
  end;
end;


function ExpDMAIN (KV:Integer; NS:String; SDF:Integer; PHONE: String; DESCRIPTION: String; LSCHET,UBANK:String;
  VAR_TAR:String; VAR_TAR1:String; TAR_NAK:String; TAR_NAK1:String; MES_POT:String; MES_POT1:String;
  POWER:String; POWER1:String; POT_OTK:String; POT_OTK1:String; TIME0:String; TIME1:String;
  TIMES:String; TIMEC:String; VAR_TAR_TIME,VAR_TAR_TIME1,TAR_NAK_TIME,TAR_NAK_TIME1,
  POWER_TIME,POWER_TIME1,MES_POT_TIME,MES_POT_TIME1,POT_OTK_TIME,POT_OTK_TIME1,
  TIME_SCH,FDT,FDP:String; MES:Integer; PROF_NAGR,PROF_NAGR1,PROF_NAGR_TIME,PROF_NAGR_TIME1:String):Integer;
begin
  try
    Inc(exportD.indexm);
    exportD.EXPDMAIN.Append;
    exportD.EXPDMAIN.FieldByName('INC').AsInteger := exportD.indexm;
    exportD.EXPDMAIN.FieldByName('KV').AsInteger := KV;
    exportD.EXPDMAIN.FieldByName('NS').AsString := NS;
    exportD.EXPDMAIN.FieldByName('SDF').AsInteger := SDF;
    exportD.EXPDMAIN.FieldByName('PHONE').AsString := PHONE;
    exportD.EXPDMAIN.FieldByName('DESCRIPTION').AsString := DESCRIPTION;
    exportD.EXPDMAIN.FieldByName('LSCHET').AsString := LSCHET;
    exportD.EXPDMAIN.FieldByName('UBANK').AsString := UBANK;
    exportD.EXPDMAIN.FieldByName('VAR_TAR').AsString := VAR_TAR;
    exportD.EXPDMAIN.FieldByName('VAR_TAR1').AsString := VAR_TAR1;
    exportD.EXPDMAIN.FieldByName('TAR_NAK').AsString := TAR_NAK;
    exportD.EXPDMAIN.FieldByName('TAR_NAK1').AsString := TAR_NAK1;
    exportD.EXPDMAIN.FieldByName('MES_POT').AsString := MES_POT;
    exportD.EXPDMAIN.FieldByName('MES_POT1').AsString := MES_POT1;
    exportD.EXPDMAIN.FieldByName('POWER').AsString := POWER;
    exportD.EXPDMAIN.FieldByName('POWER1').AsString := POWER1;
    exportD.EXPDMAIN.FieldByName('POT_OTK').AsString := POT_OTK;
    exportD.EXPDMAIN.FieldByName('POT_OTK1').AsString := POT_OTK1;
    exportD.EXPDMAIN.FieldByName('TIME0').AsString := TIME0;
    exportD.EXPDMAIN.FieldByName('TIME1').AsString := TIME1;
    exportD.EXPDMAIN.FieldByName('TIMES').AsString := TIMES;
    exportD.EXPDMAIN.FieldByName('TIMEC').AsString := TIMEC;
    exportD.EXPDMAIN.FieldByName('VAR_TAR_TIME').AsString := VAR_TAR_TIME;
    exportD.EXPDMAIN.FieldByName('VAR_TAR_TIME1').AsString := VAR_TAR_TIME1;
    exportD.EXPDMAIN.FieldByName('TAR_NAK_TIME').AsString := VAR_TAR_TIME;
    exportD.EXPDMAIN.FieldByName('TAR_NAK_TIME1').AsString := VAR_TAR_TIME1;
    exportD.EXPDMAIN.FieldByName('POWER_TIME').AsString := POWER_TIME;
    exportD.EXPDMAIN.FieldByName('POWER_TIME1').AsString := POWER_TIME1;
    exportD.EXPDMAIN.FieldByName('MES_POT_TIME').AsString := MES_POT_TIME;
    exportD.EXPDMAIN.FieldByName('MES_POT_TIME1').AsString := MES_POT_TIME1;
    exportD.EXPDMAIN.FieldByName('POT_OTK_TIME').AsString := POT_OTK_TIME;
    exportD.EXPDMAIN.FieldByName('POT_OTK_TIME1').AsString := POT_OTK_TIME1;
    exportD.EXPDMAIN.FieldByName('TIME_SCH').AsString := TIME_SCH;
    exportD.EXPDMAIN.FieldByName('FDT').AsString := FDT;
    exportD.EXPDMAIN.FieldByName('FDP').AsString := FDP;
    exportD.EXPDMAIN.FieldByName('MES').AsInteger := MES;
    exportD.EXPDMAIN.FieldByName('PROF_NAGR').AsString := PROF_NAGR;
    exportD.EXPDMAIN.FieldByName('PROF_NAGR1').AsString := PROF_NAGR1;
    exportD.EXPDMAIN.FieldByName('PROF_NAGR_TIME').AsString := PROF_NAGR_TIME;
    exportD.EXPDMAIN.FieldByName('PROF_NAGR_TIME1').AsString := PROF_NAGR_TIME1;
    exportD.EXPDMAIN.Post;
    Result := 1;
  except
    Result := 0;
  end;
end;


function ExpDARHIV(M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,GOD:String; REZ:Integer):Integer;
begin
  try
    exportD.EXPDARHIV.Append;
    exportD.EXPDARHIV.FieldByName('M1').AsString := M1;
    exportD.EXPDARHIV.FieldByName('M2').AsString := M2;
    exportD.EXPDARHIV.FieldByName('M3').AsString := M3;
    exportD.EXPDARHIV.FieldByName('M4').AsString := M4;
    exportD.EXPDARHIV.FieldByName('M5').AsString := M5;
    exportD.EXPDARHIV.FieldByName('M6').AsString := M6;
    exportD.EXPDARHIV.FieldByName('M7').AsString := M7;
    exportD.EXPDARHIV.FieldByName('M8').AsString := M8;
    exportD.EXPDARHIV.FieldByName('M9').AsString := M9;
    exportD.EXPDARHIV.FieldByName('M10').AsString := M10;
    exportD.EXPDARHIV.FieldByName('M11').AsString := M11;
    exportD.EXPDARHIV.FieldByName('M12').AsString := M12;
    exportD.EXPDARHIV.FieldByName('GOD').AsString := GOD;
    exportD.EXPDARHIV.FieldByName('REZ').AsInteger := REZ;
    exportD.EXPDARHIV.Post;
    Result := 1;
  except
    Result := 0;
  end;
end;

function ExpDPROF(DATA,PROFIL,REZ:String):Integer;
begin
  try
    exportD.EXPDPROF.Append;
    exportD.EXPDPROF.FieldByName('DATA').AsString := DATA;
    exportD.EXPDPROF.FieldByName('PROFIL').AsString := PROFIL;
    exportD.EXPDPROF.FieldByName('REZ').AsString := REZ;
    exportD.EXPDPROF.Post;
    Result := 1;
  except
    Result := 0;
  end;
end;

function ExpDVARTAR(VARTAR1,VARTAR2,VARTAR3,VARTAR4,VARTAR5,VARTAR6,VARTAR7,VARTAR8,VARTAR9,VARTAR10:String):Integer;
begin
  try
    exportD.EXPDVARTAR.Append;
    exportD.EXPDVARTAR.FieldByName('VARTAR_1').AsString := VARTAR1;
    exportD.EXPDVARTAR.FieldByName('VARTAR_2').AsString := VARTAR2;
    exportD.EXPDVARTAR.FieldByName('VARTAR_3').AsString := VARTAR3;
    exportD.EXPDVARTAR.FieldByName('VARTAR_4').AsString := VARTAR4;
    exportD.EXPDVARTAR.FieldByName('VARTAR_5').AsString := VARTAR5;
    exportD.EXPDVARTAR.FieldByName('VARTAR_6').AsString := VARTAR6;
    exportD.EXPDVARTAR.FieldByName('VARTAR_7').AsString := VARTAR7;
    exportD.EXPDVARTAR.FieldByName('VARTAR_8').AsString := VARTAR8;
    exportD.EXPDVARTAR.FieldByName('VARTAR_9').AsString := VARTAR9;
    exportD.EXPDVARTAR.FieldByName('VARTAR_10').AsString := VARTAR10;
    exportD.EXPDVARTAR.Post;
    Result := 1;
  except
    Result := 0;
  end;
end;

function SaveExp(data: integer):Integer;
begin
  try
    SaveDialog := TsSaveDialog.Create(SaveDialog);
    SaveDialog.Options  := [ofOverwritePrompt];
    if ImpExp.Tag = 0 then
      begin
        SaveDialog.DefaultExt := 'exp';
        SaveDialog.Filter := 'Файлы экспорта|*.exp|Все файлы|*.*';
      end
    else
      begin
        SaveDialog.Filter := 'Файлы экспорта данных|*.exp2|Все файлы|*.*';
        SaveDialog.DefaultExt := 'exp2';
      end;

    if SaveDialog.Execute then
      begin
        try
          if FileExists(SaveDialog.FileName) then
            DeleteFile(SaveDialog.FileName);
          if ImpExp.Tag = 0 then
            ImpExp.SaveToFile(SaveDialog.FileName)
          else
            exportD.ImpExp.SaveToFile(SaveDialog.FileName);

          if data <> 0 then
            begin
            exportD.EXPDMAIN.SaveToFile(ExtractFilePath(SaveDialog.FileName)+'expdmain.exp');
            exportD.EXPDARHIV.SaveToFile(ExtractFilePath(SaveDialog.FileName)+'expdarhiv.exp');
            exportD.EXPDPROF.SaveToFile(ExtractFilePath(SaveDialog.FileName)+'expdprof.exp');
            exportD.EXPDVARTAR.SaveToFile(ExtractFilePath(SaveDialog.FileName)+'expdvartar.exp');

            exportD.ImpExp.Free;
            exportD.EXPDMAIN.Free;
            exportD.EXPDARHIV.Free;
            exportD.EXPDPROF.Free;
            exportD.EXPDVARTAR.Free;

            exportD.Zip1.ArchiveFile := ExtractFilePath(SaveDialog.FileName)+'arh__.zip';
            exportD.ZIP1.FileSpec.Clear;
            exportD.Zip1.FileSpec.Add(SaveDialog.FileName);
            exportD.Zip1.FileSpec.Add(ExtractFilePath(SaveDialog.FileName)+'expdmain.exp');
            exportD.Zip1.FileSpec.Add(ExtractFilePath(SaveDialog.FileName)+'expdarhiv.exp');
            exportD.Zip1.FileSpec.Add(ExtractFilePath(SaveDialog.FileName)+'expdprof.exp');
            exportD.Zip1.FileSpec.Add(ExtractFilePath(SaveDialog.FileName)+'expdvartar.exp');
            if exportD.ZIP1.Compress = 0 then
              sShowMessage('Ошибка при сжатии файлов экспорта');
            DeleteFile(ExtractFilePath(SaveDialog.FileName)+'expdmain.exp');
            DeleteFile(SaveDialog.FileName);
            DeleteFile(ExtractFilePath(SaveDialog.FileName)+'expdarhiv.exp');
            DeleteFile(ExtractFilePath(SaveDialog.FileName)+'expdprof.exp');
            DeleteFile(ExtractFilePath(SaveDialog.FileName)+'expdvartar.exp');
            RenameFile(ExtractFilePath(SaveDialog.FileName)+'arh__.zip', SaveDialog.FileName);
            DeleteFile(ExtractFilePath(SaveDialog.FileName)+'arh__.zip');
          end;
          //ShowMessage('Данные экспортированы');
          sMessageDlg('Данные экспортированы', mtInformation, [MBOk], 0);
          exportD.Free;
          Result := 1;
        except
          Result := 0;
        end;
      end;
  except
    Result := 0;
  end;
end;

function InfImp :Integer;
begin
  try
    Result := ImpExp.RecordCount;
  except
    Result := -1;
  end
end;

function CloseImp :Integer;
begin
  try
    exportD.Free;
    ImpExp.Free;
  except
    Result := -1;
  end
end;

function Imports :Integer;
begin
  try
    Result := ImpExp.RecordCount;
  except
    Result := -1;
  end
end;

exports
CreateImpExp,
SaveExp,
InfImp,
Imports,
Exp,
CloseImp,
EXPDMAIN,
EXPDARHIV,
EXPDPROF,
EXPDVARTAR;

begin
end.

