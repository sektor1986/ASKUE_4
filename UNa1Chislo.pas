unit UNa1Chislo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrameNa1Chislo, ComCtrls, sPageControl, StdCtrls, sCheckBox, sMemo;

type
  TFormNa1Chislo = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    frameNa1Chislo1: TframeNa1Chislo;
    frameNa1Chislo2: TframeNa1Chislo;
    sCheckBox1: TsCheckBox;
    procedure frameNa1Chislo1sBitBtn1Click(Sender: TObject);
    procedure frameNa1Chislo2sBitBtn1Click(Sender: TObject);
    procedure sPageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNa1Chislo: TFormNa1Chislo;

implementation

uses Udm1;

{$R *.dfm}

procedure TFormNa1Chislo.frameNa1Chislo1sBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFormNa1Chislo.frameNa1Chislo2sBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFormNa1Chislo.sPageControl1Change(Sender: TObject);
begin
  if dm1.tmp_1.Active then
    dm1.Na1ChisloMes(dm1.tmp_1)
  else
    dm1.Na1ChisloMes(dm1.tmp_2);
end;

end.
