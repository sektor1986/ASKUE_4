unit UPeremSchetchikaVDrRas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sComboBox, sLabel, Buttons, sBitBtn, ExtCtrls, sPanel;

type
  TFormPeremSchetchikaVDrRas = class(TForm)
    sPanel1: TsPanel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sComboBox1: TsComboBox;
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      incAddres: array [1..20] of ShortString;
  end;

var
  FormPeremSchetchikaVDrRas: TFormPeremSchetchikaVDrRas;
implementation

uses Udm1;

{$R *.dfm}

procedure TFormPeremSchetchikaVDrRas.sBitBtn1Click(Sender: TObject);
begin
  dm1.tmp_korrekt.Edit;
  dm1.tmp_korrektCOD.AsString := incAddres[StrToInt(sComboBox1.Text)];
  dm1.tmp_korrekt.Post;
  dm1.addres_korrekt.ReopenLocate('inc');
  dm1.tmp_korrekt.CloseOpen(true);
  close;
end;

procedure TFormPeremSchetchikaVDrRas.sBitBtn2Click(Sender: TObject);
begin
  close;
end;

end.
