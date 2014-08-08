unit UTarNak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrameTarNak, ComCtrls, sPageControl, StdCtrls, sMemo, sCheckBox;

type
  TFormTarNak = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    sTabSheet3: TsTabSheet;
    frameTarNak1: TframeTarNak;
    frameTarNak2: TframeTarNak;
    frameTarNak3: TframeTarNak;
    sCheckBox1: TsCheckBox;
    procedure frameTarNak2sBitBtn1Click(Sender: TObject);
    procedure frameTarNak1sBitBtn1Click(Sender: TObject);
    procedure frameTarNak3sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTarNak: TFormTarNak;

implementation

{$R *.dfm}

procedure TFormTarNak.frameTarNak1sBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFormTarNak.frameTarNak2sBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFormTarNak.frameTarNak3sBitBtn1Click(Sender: TObject);
begin
close;
end;

end.
