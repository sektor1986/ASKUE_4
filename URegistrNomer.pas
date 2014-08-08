unit URegistrNomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sComboBox, ExtCtrls, sPanel, Buttons, sBitBtn, sBevel;

type
  TFormRegistrNomer = class(TForm)
    sPanel1: TsPanel;
    sComboBox1: TsComboBox;
    sComboBox2: TsComboBox;
    sComboBox3: TsComboBox;
    sBevel1: TsBevel;
    sBitBtn1: TsBitBtn;
    procedure sComboBox1Change(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRegistrNomer: TFormRegistrNomer;

implementation

uses Udm1;

{$R *.dfm}

procedure TFormRegistrNomer.sBitBtn1Click(Sender: TObject);
var
  CRC: integer;
  i: integer;
begin
  with dm1 do
    begin
      tmp_korrekt_FIO_licSch.First;
      while not tmp_korrekt_FIO_licSch.Eof do
        begin
          if tmp_korrekt_FIO_licSchKV.AsString <> '0' then
              begin
                tmp_korrekt_FIO_licSch.Edit;
                tmp_korrekt_FIO_licSchUBANK.AsString := sComboBox1.Text[1] + Copy(sComboBox2.Text, 0, 2) + tmp_korrekt_FIO_licSchNDOG.AsString + IntToStr(sComboBox3.ItemIndex) + '0';
                CRC := 0;
                try
                  for i := 1 to Length(tmp_korrekt_FIO_licSchUBANK.AsString) - 1 do
                    CRC := StrToInt(tmp_korrekt_FIO_licSchUBANK.AsString[i]) + CRC;
                  CRC := CRC mod 9;
                except

                end;
                tmp_korrekt_FIO_licSchUBANK.AsString := tmp_korrekt_FIO_licSchUBANK.AsString + IntToStr(CRC);
                tmp_korrekt_FIO_licSch.Post;
              end;
          tmp_korrekt_FIO_licSch.Next;
        end;
    end;
end;

procedure TFormRegistrNomer.sComboBox1Change(Sender: TObject);
begin
  sComboBox2.Clear;
  case sComboBox1.ItemIndex of
    5:
      with sComboBox2.Items do
        begin
          Add('20 � �. �������');
          Add('24 � ����������� �����');
          Add('31 � ����������� �����');
          Add('32 � ��������� �����');
          Add('33 � �������� �����');
          Add('34 � ����������� �����');
          Add('35 � �������� �����');
          Add('36 � ��������� �����');
          Add('37 � ���������� �����');
          Add('40 � �. ��������');
          Add('43 � ���������� �����');
          Add('51 � �������� �����');
          Add('52 � ��������� �����');
          Add('53 � ���������� �����');
          Add('54 � ������������ �����');
          Add('60 � ������������ �����');
          Add('62 � �������������� �����');
          Add('63 � ��������� �����');
          Add('80 � ���������� �����');
          Add('84 � �������������� �����');
          Add('85 � ������������ �����');
          Add('86 � ������������� �����');
          Add('87 � ����������� �����');
        end;  
  end;
  sComboBox2.ItemIndex := 0;
end;

end.
