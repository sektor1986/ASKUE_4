unit UAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, sLabel, Buttons, sBitBtn, sBevel,
  sSkinProvider;

type
  TFormAbout = class(TForm)
    sLabelFX2: TsLabelFX;
    sLabelFX1: TsLabelFX;
    sLabelFX4: TsLabelFX;
    sBevel1: TsBevel;
    sBitBtn1: TsBitBtn;
    Image1: TImage;
    sSkinProvider1: TsSkinProvider;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

uses UProcedure;

{$R *.dfm}

procedure TFormAbout.FormShow(Sender: TObject);
begin
  sLabelFX2.Caption := 'ASKUE VZEP 2002 V ' + GetMyVersion;
end;

end.
