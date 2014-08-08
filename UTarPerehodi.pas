unit UTarPerehodi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sPageControl, StdCtrls, Buttons, sBitBtn, UFrameTarPerehodi,
  sMemo;

type
  TFormTarPerehodi = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    FrameTarPerehodi2: TFrameTarPerehodi;
    FrameTarPerehodi1: TFrameTarPerehodi;
    sBitBtn1: TsBitBtn;
    procedure sBitBtn1Click(Sender: TObject);
    procedure FrameTarPerehodi2sComboBox4Change(Sender: TObject);
    procedure sPageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTarPerehodi: TFormTarPerehodi;

implementation

uses Udm1;


{$R *.dfm}

procedure TFormTarPerehodi.FrameTarPerehodi2sComboBox4Change(Sender: TObject);
begin
  dm1.TarPerehodi;
end;

procedure TFormTarPerehodi.sBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormTarPerehodi.sPageControl1Change(Sender: TObject);
var
  nomPage: integer;
begin
  nomPage := sPageControl1.ActivePageIndex;
  LockWindowUpdate(Handle);
  dm1.TarPerehodi;
  LockWindowUpdate(0);
  sPageControl1.ActivePageIndex := nomPage;
end;

end.
