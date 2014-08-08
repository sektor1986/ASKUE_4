unit UEditTarPerehod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, UFrameTarPerehodi, sMaskEdit;

type
  TForm_EditTarPerehod = class(TForm)
    FrameTarPerehodi1: TFrameTarPerehodi;
    sButton1: TsButton;
    sButton2: TsButton;
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_EditTarPerehod: TForm_EditTarPerehod;

implementation

uses UEditVArTar, Udm2;

{$R *.dfm}

procedure TForm_EditTarPerehod.sButton1Click(Sender: TObject);
var
  i: integer;
  tar_pereh: TStrings;
begin
  tar_pereh := TStringList.Create;
  if not dm2.sys_bd.Active then
    dm2.sys_bd.Open;
  tar_pereh.Text := dm2.sys_bd.FBN('VarTar_' + IntToStr(Form_EditVarTar.num_varTar)).AsString;
  if tar_pereh.Text = '' then
    exit;

  with FrameTarPerehodi1 do
    begin
      tar_pereh.Strings[24 + (sComboBox4.ItemIndex*3)] := IntToStr(sComboBox1.ItemIndex);
      tar_pereh.Strings[25 + (sComboBox4.ItemIndex*3)] := IntToStr(sComboBox2.ItemIndex);
      tar_pereh.Strings[26 + (sComboBox4.ItemIndex*3)] := IntToStr(sComboBox3.ItemIndex);
      for i := 0 to ComponentCount-1 do
        if Components[i].ClassName = 'TsMaskEdit' then
          tar_pereh.Strings[(Components[i] as TsMaskEdit).Tag-1 + sComboBox4.ItemIndex*25] := (Components[i] as TsMaskEdit).Text;
      dm2.sys_bd.Edit;
      dm2.sys_bd.FBN('VarTar_' + IntToStr(Form_EditVarTar.num_varTar)).AsString := tar_pereh.Text;
      dm2.sys_bd.Post;
      dm2.sys_bd.UpdateTransaction.CommitRetaining;
      dm2.sys_bd.Close;
    end;
end;

procedure TForm_EditTarPerehod.sButton2Click(Sender: TObject);
begin
  Close;
end;

end.
