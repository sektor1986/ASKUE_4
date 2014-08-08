unit UPomesPotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFramePomesPotr, ComCtrls, sPageControl, StdCtrls, sMemo, sCheckBox;

type
  TFormPomesPotr = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    framePomesPotr1: TframePomesPotr;
    framePomesPotr2: TframePomesPotr;
    sCheckBox1: TsCheckBox;
    procedure framePomesPotr1sBitBtn1Click(Sender: TObject);
    procedure framePomesPotr2sBitBtn1Click(Sender: TObject);
    procedure sPageControl1Change(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPomesPotr: TFormPomesPotr;

implementation

uses Udm1;

{$R *.dfm}

procedure TFormPomesPotr.framePomesPotr1sBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFormPomesPotr.framePomesPotr2sBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFormPomesPotr.sCheckBox1Click(Sender: TObject);
begin
  if dm1.tmp_1.Active then
    dm1.MesPotr(dm1.tmp_1)
  else
    dm1.MesPotr(dm1.tmp_2);
end;

procedure TFormPomesPotr.sPageControl1Change(Sender: TObject);
begin
  if dm1.tmp_1.Active then
    dm1.MesPotr(dm1.tmp_1)
  else
    dm1.MesPotr(dm1.tmp_2);
end;

end.
