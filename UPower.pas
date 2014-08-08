unit UPower;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFramePower, ComCtrls, sPageControl, StdCtrls, sMemo, Buttons,
  sBitBtn;

type
  TFormPower = class(TForm)
    sMemo1: TsMemo;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    FramePower1: TFramePower;
    FramePower2: TFramePower;
    sBitBtn1: TsBitBtn;
    procedure FramePower1sBitBtn1Click(Sender: TObject);
    procedure FramePower2sBitBtn1Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPower: TFormPower;

implementation

{$R *.dfm}

procedure TFormPower.FramePower1sBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFormPower.FramePower2sBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFormPower.sBitBtn1Click(Sender: TObject);
begin
close;
end;

end.
