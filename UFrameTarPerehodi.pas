unit UFrameTarPerehodi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, sSpeedButton, StdCtrls, sComboBox, ExtCtrls, sBevel,
  sBitBtn, sLabel, Mask, sMaskEdit, sPanel;

type
  TFrameTarPerehodi = class(TFrame)
    sPanel1: TsPanel;
    sMaskEdit1: TsMaskEdit;
    sMaskEdit2: TsMaskEdit;
    sMaskEdit3: TsMaskEdit;
    sMaskEdit4: TsMaskEdit;
    sMaskEdit5: TsMaskEdit;
    sMaskEdit6: TsMaskEdit;
    sMaskEdit7: TsMaskEdit;
    sMaskEdit8: TsMaskEdit;
    sMaskEdit9: TsMaskEdit;
    sMaskEdit10: TsMaskEdit;
    sMaskEdit11: TsMaskEdit;
    sMaskEdit12: TsMaskEdit;
    sMaskEdit13: TsMaskEdit;
    sMaskEdit14: TsMaskEdit;
    sMaskEdit15: TsMaskEdit;
    sMaskEdit16: TsMaskEdit;
    sMaskEdit17: TsMaskEdit;
    sMaskEdit18: TsMaskEdit;
    sMaskEdit19: TsMaskEdit;
    sMaskEdit20: TsMaskEdit;
    sMaskEdit21: TsMaskEdit;
    sMaskEdit22: TsMaskEdit;
    sMaskEdit23: TsMaskEdit;
    sMaskEdit24: TsMaskEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sBevel3: TsBevel;
    sBevel4: TsBevel;
    sBevel5: TsBevel;
    sBevel6: TsBevel;
    sBevel7: TsBevel;
    sBevel8: TsBevel;
    sBevel9: TsBevel;
    sBevel10: TsBevel;
    sBevel11: TsBevel;
    sComboBox1: TsComboBox;
    sComboBox2: TsComboBox;
    sComboBox3: TsComboBox;
    sLabel4: TsLabel;
    sMaskEdit25: TsMaskEdit;
    sComboBox4: TsComboBox;
    procedure sComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameTarPerehodi.sComboBox1Change(Sender: TObject); 
var
  i: Integer;
begin
  for i := 1 to StrToInt((sender as TsComboBox).Text) do
    TsMaskEdit(FindComponent('sMaskEdit' + IntToStr(i + 8*(sender as TsComboBox).Tag))).Visible := true;
  for i := StrToInt((sender as TsComboBox).Text)+1 to 8 do
    TsMaskEdit(FindComponent('sMaskEdit' + IntToStr(i + 8*(sender as TsComboBox).Tag))).Visible := false;
end;

end.
