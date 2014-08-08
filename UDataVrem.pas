unit UDataVrem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sEdit, ExtCtrls, sPanel;

type
  TFormDataVrem = class(TForm)
    sPanel1: TsPanel;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sBitBtn1: TsBitBtn;
    procedure sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDataVrem: TFormDataVrem;

implementation

{$R *.dfm}

procedure TFormDataVrem.sBitBtn1Click(Sender: TObject);
begin
  close;
end;

end.
