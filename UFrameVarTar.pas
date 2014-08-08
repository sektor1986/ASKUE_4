unit UFrameVarTar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, sCheckBox, sComboBox, Buttons, sSpeedButton, ExtCtrls,
  sPanel, sLabel, Mask, sMaskEdit, sBitBtn, sEdit, sSpinEdit;

type
  TframeVartar = class(TFrame)
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sPanel4: TsPanel;
    sPanel5: TsPanel;
    sPanel6: TsPanel;
    sPanel7: TsPanel;
    sPanel8: TsPanel;
    sPanel9: TsPanel;
    sPanel10: TsPanel;
    sPanel11: TsPanel;
    sComboBox1: TsComboBox;
    sComboBox2: TsComboBox;
    sComboBox3: TsComboBox;
    sCheckBox1: TsCheckBox;
    sMaskEdit1: TsMaskEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sComboBox4: TsComboBox;
    sLabel4: TsLabel;
    sMaskEdit2: TsMaskEdit;
    sLabel5: TsLabel;
    sMaskEdit3: TsMaskEdit;
    sMaskEdit4: TsMaskEdit;
    sLabel6: TsLabel;
    sez1: TsSpeedButton;
    sez2: TsSpeedButton;
    sez3: TsSpeedButton;
    sez4: TsSpeedButton;
    sez5: TsSpeedButton;
    sez6: TsSpeedButton;
    sez7: TsSpeedButton;
    sez8: TsSpeedButton;
    sez9: TsSpeedButton;
    sez10: TsSpeedButton;
    sez11: TsSpeedButton;
    sez12: TsSpeedButton;
    fd1: TsMaskEdit;
    fd7: TsMaskEdit;
    fd13: TsMaskEdit;
    fd19: TsMaskEdit;
    fd2: TsMaskEdit;
    fd8: TsMaskEdit;
    fd14: TsMaskEdit;
    fd20: TsMaskEdit;
    fd3: TsMaskEdit;
    fd9: TsMaskEdit;
    fd15: TsMaskEdit;
    fd21: TsMaskEdit;
    fd4: TsMaskEdit;
    fd10: TsMaskEdit;
    fd16: TsMaskEdit;
    fd22: TsMaskEdit;
    fd5: TsMaskEdit;
    fd11: TsMaskEdit;
    fd17: TsMaskEdit;
    fd23: TsMaskEdit;
    fd6: TsMaskEdit;
    fd12: TsMaskEdit;
    fd18: TsMaskEdit;
    fd24: TsMaskEdit;
    fd25: TsMaskEdit;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    sCheckBox2: TsCheckBox;
    sLabel10: TsLabel;
    sCheckBox3: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sCheckBox7: TsCheckBox;
    sCheckBox8: TsCheckBox;
    sCheckBox9: TsCheckBox;
    sCheckBox10: TsCheckBox;
    sSpinEdit1: TsSpinEdit;
    sBitBtn1: TsBitBtn;
    procedure sComboBox1Change(Sender: TObject);
    procedure sComboBox3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UTarPerehodi;

{$R *.dfm}

procedure TframeVartar.sComboBox1Change(Sender: TObject);
var
  i: Integer;
begin
  if sComboBox1.Text <> '' then
  begin
    for i := 1 to StrToInt(sComboBox1.Text) do
      TsSpeedButton(FindComponent('sez' + IntToStr(i))).Enabled := true;
    for i := StrToInt(sComboBox1.Text)+1 to 12 do
      TsSpeedButton(FindComponent('sez' + IntToStr(i))).Enabled := false;
  end;
end;

procedure TframeVartar.sComboBox3Change(Sender: TObject);
var
  i: Integer;
begin
  if sComboBox3.Text <> '' then
  begin
    for i := 1 to StrToInt(sComboBox3.Text) do
      TsMaskEdit(FindComponent('fd' + IntToStr(i))).Visible := true;
    for i := StrToInt(sComboBox3.Text)+1 to 25 do
      TsMaskEdit(FindComponent('fd' + IntToStr(i))).Visible := false;
  end;
end;

end.
