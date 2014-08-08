unit USpisokNeschit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, ExtCtrls, sPanel, StdCtrls, Buttons, sBitBtn, DB,
  FIBDataSet, pFIBDataSet, DBGridEhImpExp, sDialogs, DBGridEhGrouping;

type
  TFormSpisokNeschit = class(TForm)
    sPanel1: TsPanel;
    DBGridEh1: TDBGridEh;
    neschit: TpFIBDataSet;
    DSneschit: TDataSource;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sSaveDialog1: TsSaveDialog;
    procedure sBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSpisokNeschit: TFormSpisokNeschit;

implementation

uses Udm1, Unit1;

{$R *.dfm}

procedure TFormSpisokNeschit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
try
  neschit.Close;
except

end;
end;

procedure TFormSpisokNeschit.sBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFormSpisokNeschit.sBitBtn2Click(Sender: TObject);
var ExportClass: TDBGridEhExportClass;
begin
  if sSaveDialog1.Execute then
  begin
  case sSaveDialog1.FilterIndex of
    1:
  begin
      ExportClass := TDBGridEhExportAsHTML;
      sSaveDialog1.DefaultExt := 'htm'
  end;
  2:
  begin
    ExportClass := TDBGridEhExportAsRTF;
    sSaveDialog1.DefaultExt := 'doc'
  end;
  3:
  begin
    ExportClass := TDBGridEhExportAsText;
    sSaveDialog1.DefaultExt := 'txt'
  end
  else
  begin
    ExportClass := TDBGridEhExportAsHTML;
    sSaveDialog1.DefaultExt := 'htm'
  end;
  end;
    dm1.SaveDbGridToFile(handle ,DBGridEh1, ExportClass, sSaveDialog1.FileName);
  end;
end;

end.
