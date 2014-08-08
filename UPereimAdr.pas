unit UPereimAdr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, ExtCtrls, sBevel, sEdit, sComboBox,
  sPanel, pFIBQuery, DBGridEh, Mask, DBCtrlsEh, DBLookupEh, sLabel;

type
  TFormPereimAdr = class(TForm)
    sPanel1: TsPanel;
    sComboBox1: TsComboBox;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sEdit3: TsEdit;
    sBevel1: TsBevel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    sLabel1: TsLabel;
    DBEditEh1: TDBEditEh;
    sLabel2: TsLabel;
    procedure sBitBtn1Click(Sender: TObject);
    procedure sEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPereimAdr: TFormPereimAdr;

implementation

uses Udm1;
{$R *.dfm}

procedure TFormPereimAdr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.townAdd.Close;
end;

procedure TFormPereimAdr.FormShow(Sender: TObject);
begin
  dm1.townAdd.Open;
end;

procedure TFormPereimAdr.sBitBtn1Click(Sender: TObject);
const streets: array[0..20] of string = ('ул.',
'пр.',
'пер.',
'пр-д',
'тр.',
'б-р',
'туп.',
'пл',
'к/о',
'наб.',
'пос.',
'шоссе',
'тер.',
'парк',
'ст.',
'мкр-н',
'вал',
'кв-л',
'уроч.',
'вг',
'вч');
var
  nazvanie: string;
  raz: string;
begin
  if (sEdit1.Text = '') or (sEdit2.Text = '') or (sEdit3.Text = '') then
    begin
      Application.MessageBox('Введите все данные', 'Предупреждение', MB_OK+MB_ICONWARNING);
      Exit
    end;

  if not dm1.addres.Active then
    dm1.addres.Open;
  dm1.addres.First;
  while not dm1.addres.Eof do
    begin
      nazvanie := dm1.addresSTREET.AsString;
      raz := Trim(Copy(nazvanie, Length(nazvanie)-1, 2));
      dm1.addres.Edit;
      dm1.addresSTREET.AsString := streets[FormPereimAdr.sComboBox1.ItemIndex] + ' ' + FormPereimAdr.sEdit1.Text + ', дом ' + FormPereimAdr.sEdit2.Text + ', корпус ' + FormPereimAdr.sEdit3.Text + ', разъём ' + raz;
      dm1.addres.Post;
      dm1.addres.Next;
    end;

  dm1.addresmain.Edit;
  dm1.addresmainADDR.AsString := streets[FormPereimAdr.sComboBox1.ItemIndex] + ' ' + FormPereimAdr.sEdit1.Text + ', дом ' + FormPereimAdr.sEdit2.Text + ', корпус ' + FormPereimAdr.sEdit3.Text;
  dm1.addresmainREZ.AsInteger := dm1.townAddINC.AsInteger;
  dm1.addresmain.Post;
  dm1.addresmain.ReopenLocate('inc');
  dm1.addres.ReopenLocate('inc');
  Close;
end;

procedure TFormPereimAdr.sEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  //if  not (key in['0'..'9', #8]) then
  //  key := #0;
end;

end.
