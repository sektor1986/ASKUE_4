unit UPereimRas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, ExtCtrls, sBevel, sComboBox, sLabel,
  sPanel, pFIBQuery, StrUtils;

type
  TFormPereimRas = class(TForm)
    sPanel1: TsPanel;
    sLabel1: TsLabel;
    sComboBox1: TsComboBox;
    sBevel1: TsBevel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPereimRas: TFormPereimRas;

implementation

uses Udm1;

{$R *.dfm}

procedure TFormPereimRas.sBitBtn1Click(Sender: TObject);
begin
  dm1.addres_korrekt.Edit;
  dm1.addres_korrektSTREET.AsString := Trim(Copy(dm1.addres_korrektSTREET.AsString, 0, Length(dm1.addres_korrektSTREET.AsString)-2)) + ' ' + sComboBox1.Text;
  dm1.addres_korrekt.Post;
  dm1.addres_korrekt.ReopenLocate('inc');
  Close;
end;

procedure TFormPereimRas.sBitBtn2Click(Sender: TObject);
begin
  close;
end;

end.
