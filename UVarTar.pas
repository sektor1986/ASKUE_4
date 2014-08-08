unit UVarTar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sPageControl, UFrameVarTar, StdCtrls, sMemo, sSpeedButton;

type
  TFormVarTar = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    frameVartar1: TframeVartar;
    frameVartar2: TframeVartar;
    sMemo1: TsMemo;
    sMemo2: TsMemo;
    procedure frameVartar1sez1Click(Sender: TObject);
    procedure frameVartar1sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVarTar: TFormVarTar;

implementation

uses UTarPerehodi, Udm1;

{$R *.dfm}

procedure TFormVarTar.frameVartar1sBitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFormVarTar.frameVartar1sez1Click(Sender: TObject);
begin
  FormTarPerehodi.FrameTarPerehodi1.sComboBox4.ItemIndex := (Sender as TsSpeedButton).Tag;
  FormTarPerehodi.FrameTarPerehodi2.sComboBox4.ItemIndex := (Sender as TsSpeedButton).Tag;
  dm1.TarPerehodi;
  FormTarPerehodi.Show;
end;

end.
