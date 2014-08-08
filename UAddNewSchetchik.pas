unit UAddNewSchetchik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sSpinEdit, Buttons, sBitBtn, ExtCtrls, sPanel,
  ActnList, DB;

type
  TFormAddNewSchetchik = class(TForm)
    sPanel1: TsPanel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sSpinEdit1: TsSpinEdit;
    ActionList1: TActionList;
    ActionFormClose: TAction;
    ActionAddSchetchik: TAction;
    procedure ActionFormCloseExecute(Sender: TObject);
    procedure ActionAddSchetchikExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAddNewSchetchik: TFormAddNewSchetchik;

implementation

uses Unit1, Udm1, UProcedure;

{$R *.dfm}


//Поцедара добавления новых счётчиков в разъём
procedure TFormAddNewSchetchik.ActionAddSchetchikExecute(Sender: TObject);
var kolvo, i, n: Integer;
error: Boolean;
begin
  dm1.flagDobavlNewSchetch := true;       //Отключение вывода сообщения о повторе номера счетчика
  error := false;
  kolvo := dm1.addres_korrektTOWN.AsInteger;
  n := kolvo;
  i :=1;
  dm1.tmp_korrekt.AllowedUpdateKinds := [ukModify,ukInsert,ukDelete];
  if not dm1.tmp_korrekt.Active then
    dm1.tmp_korrekt.Open;
  while  i <= FormAddNewSchetchik.sSpinEdit1.Value do
    begin
      if not error then
        tmpAppend;
      dm1.tmp_korrektCHEC.AsInteger := 1;
      dm1.tmp_korrektSPOL.AsString := '0';
      dm1.tmp_korrektPPLAT.AsString := 'однофазный';
      dm1.tmp_korrektSDF.AsInteger := 1;
      dm1.tmp_korrektPHONE.AsString :=  '1';
      dm1.tmp_korrektKV.AsString := '0';
      dm1.tmp_korrektID_COUNTER_TYPE.AsInteger := 3;
      error := false;
      try
        dm1.tmp_korrektNS.AsString := '####' + IntToStr(n);
        dm1.tmp_korrekt.Post
      except
        inc(n);
        error := true
      end;
      if not error then
        begin
          dm1.updateTransact.StartTransaction;
          dm1.sp_INSERT_COUNTER.Params[0].AsInteger := dm1.tmp_korrektINC.AsInteger;
          dm1.sp_INSERT_COUNTER.ExecProc;
          Inc(kolvo);
          Inc(i);
        end;
    end;
  dm1.addres_korrekt.Edit;
  dm1.addres_korrektTOWN.AsInteger := kolvo;
  dm1.addres_korrekt.Post;
  dm1.tmp_korrekt.AllowedUpdateKinds := [ukModify,ukDelete];
  FormAddNewSchetchik.Close;
  dm1.flagDobavlNewSchetch := false;          //Включение вывода сообжения при повторе номера
end;

procedure TFormAddNewSchetchik.ActionFormCloseExecute(Sender: TObject);
begin
  FormAddNewSchetchik.Close;
end;

end.
