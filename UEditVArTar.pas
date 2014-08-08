unit UEditVArTar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrameVarTar, sSpeedButton, sMaskEdit, StdCtrls, sMemo, sCheckBox, sComboBox,
  Buttons, sBitBtn;

type
  TForm_EditVarTar = class(TForm)
    frameVartar1: TframeVartar;
    sBitBtn1: TsBitBtn;
    procedure frameVartar1sez1Click(Sender: TObject);
    procedure frameVartar1sBitBtn1Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    num_varTar: Integer;
    { Public declarations }
  end;

var
  Form_EditVarTar: TForm_EditVarTar;


implementation

uses UEditTarPerehod, Udm2;

{$R *.dfm}

procedure TForm_EditVarTar.frameVartar1sBitBtn1Click(Sender: TObject);
var
  i: integer;
  varTar: TStrings;
begin
    if not dm2.sys_bd.Active then
      dm2.sys_bd.Open;
    varTar := TStringList.Create;
    varTar.Text := dm2.sys_bd.FBN('VarTar_' + IntToStr(num_varTar)).AsString;
    if varTar.Text = '' then
      exit;

    for i := 0 to frameVartar1.ComponentCount - 1 do
      begin
        if frameVartar1.Components[i].ClassName = 'TsMaskEdit' then
          varTar.Strings[(frameVartar1.Components[i] as TsMaskEdit).Tag] := (frameVartar1.Components[i] as TsMaskEdit).Text;
        if frameVartar1.Components[i].ClassName  = 'TsComboBox' then
          varTar.Strings[(frameVartar1.Components[i] as TsComboBox).Tag] := (frameVartar1.Components[i] as TsComboBox).Text;
        if (frameVartar1.Components[i].ClassName = 'TsCheckBox') and (varTar.Strings[(frameVartar1.Components[i] as TsCheckBox).Tag] <> '') then
          if (frameVartar1.Components[i] as TsCheckBox).Checked then
            varTar.Strings[(frameVartar1.Components[i] as TsCheckBox).Tag] := '1'
          else
            varTar.Strings[(frameVartar1.Components[i] as TsCheckBox).Tag] := '0';
      end;
    varTar.Strings[1] := frameVartar1.sSpinEdit1.Text;
    dm2.sys_bd.Edit;
    dm2.sys_bd.FBN('VarTar_' + IntToStr(Form_EditVarTar.num_varTar)).AsString := varTar.Text;
    dm2.sys_bd.Post;
    dm2.sys_bd.UpdateTransaction.CommitRetaining;
    dm2.sys_bd.Close;
end;

procedure TForm_EditVarTar.frameVartar1sez1Click(Sender: TObject);
var
  i: integer;
  tar_pereh: TStrings;
begin
  tar_pereh := TStringList.Create;
  Form_EditTarPerehod.FrameTarPerehodi1.sComboBox4.ItemIndex := (Sender as TsSpeedButton).Tag - 1;
  with Form_EditTarPerehod do
    try
    //Заполнение вкладки
      if not dm2.sys_bd.Active then
        dm2.sys_bd.Open;
      tar_pereh.Text := dm2.sys_bd.FBN('VarTar_' + IntToStr(num_varTar)).AsString;
      if tar_pereh.Text = '' then
        exit;
    Caption := 'Редактирование сезона № ' + IntToStr((sender as TsSpeedButton).Tag);
    for i := tar_pereh.Count to 384 do
      tar_pereh.Add('');

    with FrameTarPerehodi1 do
      begin
        try
          sComboBox1.ItemIndex := StrToInt(tar_pereh.Strings[24 + ((Sender as TsSpeedButton).Tag - 1)*3]);
        except
          sComboBox1.ItemIndex := 0;
        end;

        try
          sComboBox2.ItemIndex := StrToInt(tar_pereh.Strings[25 + ((Sender as TsSpeedButton).Tag - 1)*3]);
        except
          sComboBox2.ItemIndex := 0;
        end;

        try
          sComboBox3.ItemIndex := StrToInt(tar_pereh.Strings[26 + ((Sender as TsSpeedButton).Tag - 1)*3]);
        except
          sComboBox3.ItemIndex := 0;
        end;
        for i := 0 to ComponentCount-1 do
          if Components[i].ClassName = 'TsMaskEdit' then
            (Components[i] as TsMaskEdit).Text := tar_pereh.Strings[(Components[i] as TsMaskEdit).Tag-1 + sComboBox4.ItemIndex*25];
        sComboBox1Change(sComboBox1);
        sComboBox1Change(sComboBox2);
        sComboBox1Change(sComboBox3);
      end;
    finally
      ShowModal;
    end;
end;

procedure TForm_EditVarTar.sBitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
