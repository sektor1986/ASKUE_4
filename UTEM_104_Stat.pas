unit UTEM_104_Stat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sGroupBox, sListBox, ExtCtrls, sPanel, Grids,
  Buttons, sBitBtn;

type
  DataTEM_104 = array of TStrings;
  arrayDataTEM_104 = array of DataTEM_104;
  TFormTEM_104_Stat = class(TForm)
    sPanel1: TsPanel;
    sListBox1: TsListBox;
    sGroupBox1: TsGroupBox;
    sGroupBox2: TsGroupBox;
    StringGrid1: TStringGrid;
    sBitBtn1: TsBitBtn;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    procedure sBitBtn1Click(Sender: TObject);
    procedure sListBox1Click(Sender: TObject);
  private
    function CreateBuf(blod: TStrings): DataTEM_104;
    function CreateSpisok(var mass: TStrings; nomSys: integer; SysType: integer): TStrings;
  public
    procedure ArhivTEM_104;
  end;
  
const
  enabledPar: array[0..12, 0..2] of byte = ((1,0,0), (1,1,1), (1,1,1), (1,2,2), (1,2,2), (1,2,2), (1,2,2), (1,2,2), (1,2,2), (2,2,2), (2,3,3), (2,3,3), (3,3,3));
var
  FormTEM_104_Stat: TFormTEM_104_Stat;
  mass: DataTEM_104;
  tabl: arrayDataTEM_104;
  countSystem: integer;

implementation

uses Udm1, UFunction;

{$R *.dfm}

//��������� ��� �������� ������ �������� SysInt
procedure TFormTEM_104_Stat.ArhivTEM_104;
var
  blod: TStrings;
  i: Integer;
  type_q: integer;
  j: Integer;
  sysType: integer;
begin
  Blod := TStringList.Create;
  Blod.Text := dm1.kv_konfig.FN('M7').AsString;

  sLabel2.Caption := EncodeDataTem_104(blod, $0000, $007C, 'L_notInv');
  sLabel4.Caption := EncodeDataTem_104(blod, $0000, $0078, 'L');

  if EncodeDataTem_104(blod, $0000, $0001, 'C') = '0' then
    sLabel6.Caption := '���������'
  else
    sLabel6.Caption := '����������';

  type_q := StrToInt(EncodeDataTem_104(blod, $0000, $0007, 'C'));
  case type_q of
    0: sLabel8.Caption := '��*�';
    1: sLabel8.Caption := '���';
    2: sLabel8.Caption := '������';
  else
    sLabel8.Caption := '�� ���������';
  end;

  countSystem := StrToInt(EncodeDataTem_104(blod, $0000, $0000, 'C'));
  SysType := StrToInt(EncodeDataTem_104(blod, $00600, $0000, 'C'));

  blod.Text := dm1.kv_konfig.FN('M10').AsString;
  mass := CreateBuf(blod);
  SetLength(tabl, Length(mass));
  for i := 0 to Length(mass) - 1 do
    begin
      SetLength(tabl[i], countSystem);
      for j := 0 to countSystem - 1 do
        begin
          tabl[i, j] := TStringList.Create;
          tabl[i, j] := CreateSpisok(mass[i], j+1, sysType)
        end;
    end;

  sListBox1.Clear;
  for i := 0 to Length(tabl) - 1 do
    sListBox1.Items.Add(tabl[i, 0].Strings[1]);

    blod.Clear;
    with blod do
      begin
        Add('����� �������');    //0
        Add('���� �����');
        Add('����� V1, �3');
        Add('����� V2, �3');
        Add('����� V3, �3');
        Add('����� �1, �');
        Add('����� �2, �');
        Add('����� �3, �');
        Add('������� Q1, ���');
        Add('������� Q2, ���');
        Add('������� Q3, ���');
        Add('����');
        Add('�max');
        Add('�min');
        Add('�dt');
        Add('�����.������.');
        Add('����. �1, ����');
        Add('����. �2, ����');
        Add('����. �3, ����');
        Add('�������� �1, ���');
        Add('�������� �2, ���');
        Add('�������� �3, ���');
        Add('������ V1, �3/�');
        Add('������ V2, �3/�');
        Add('������ V3, �3/�');
      end;

  StringGrid1.Cols[0] := blod;
  for i := 0 to countSystem - 1 do
    StringGrid1.Cols[i+1] := tabl[0, i];
end;

function TFormTEM_104_Stat.CreateBuf(blod: TStrings): DataTEM_104;
var
  count: integer;
  i: Integer;
  j: Integer;
begin
  count := blod.Count div 256;
  for i := 0 to count - 1 do
    begin
      SetLength(Result, i + 1);
      Result[i] := TStringList.Create;
      for j := 1 to 255 do
        Result[i].Add(blod.Strings[j + i*256]);
    end;
end;

function TFormTEM_104_Stat.CreateSpisok(var mass: TStrings; nomSys: integer; SysType: integer): TStrings;
var
  hour: Word;
  min: Word;
  sec: Word;
  j: Integer;
  tempInteger: integer;
begin
  Result := TStringList.Create;
  for j := 0 to 24 do
    Result.Add('---');

  Result.Strings[0] := IntToStr(nomSys);
  Result.Strings[1] := EncodeDataTem_104(mass, $0000, $0000, 'BCD') + '.' + EncodeDataTem_104(mass, $0001, $0000, 'BCD') + '.' +
                              EncodeDataTem_104(mass, $0002, $0000, 'BCD') + ' ' + EncodeDataTem_104(mass, $0003, $0000, 'BCD') + ':00';

  //�����
  if enabledPar[SysType, 0] > 0 then
    Result.Strings[2] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(mass, $0000, $0038, 'L[1]_notInv')) + StrToFloat(EncodeDataTem_104(mass, $0000, $0008, 'F[1]')));
  if enabledPar[SysType, 0] > 1 then
    Result.Strings[3] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(mass, $0000, $0038, 'L[2]_notInv')) + StrToFloat(EncodeDataTem_104(mass, $0000, $0008, 'F[2]')));
  if enabledPar[SysType, 0] > 2 then
    Result.Strings[4] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(mass, $0000, $0038, 'L[3]_notInv')) + StrToFloat(EncodeDataTem_104(mass, $0000, $0008, 'F[3]')));

  //����� �� �������
  if enabledPar[SysType, 0] > 0 then
    Result.Strings[5] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(mass, $0000, $0048, 'L[1]_notInv')) + StrToFloat(EncodeDataTem_104(mass, $0000, $0018, 'F[1]')));
  if enabledPar[SysType, 0] > 1 then
    Result.Strings[6] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(mass, $0000, $0048, 'L[2]_notInv')) + StrToFloat(EncodeDataTem_104(mass, $0000, $0018, 'F[2]')));
  if enabledPar[SysType, 0] > 2 then
    Result.Strings[7] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(mass, $0000, $0048, 'L[3]_notInv')) + StrToFloat(EncodeDataTem_104(mass, $0000, $0018, 'F[3]')));


  //������� �� �������
  if enabledPar[SysType, 0] > 0 then
    Result.Strings[8] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(mass, $0000, $0058, 'L[1]_notInv')) + StrToFloat(EncodeDataTem_104(mass, $0000, $0028, 'F[1]')));
  if enabledPar[SysType, 0] > 1 then
    Result.Strings[9] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(mass, $0000, $0058, 'L[2]_notInv')) + StrToFloat(EncodeDataTem_104(mass, $0000, $0028, 'F[2]')));
  if enabledPar[SysType, 0] > 2 then
    Result.Strings[10] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(mass, $0000, $0058, 'L[3]_notInv')) + StrToFloat(EncodeDataTem_104(mass, $0000, $0028, 'F[3]')));

  //����� ����
  tempInteger := StrToInt(EncodeDataTem_104(mass, $0000, $006C, 'L[1]'));
  hour := tempInteger div 3600;
  min :=  (tempInteger - hour * 3600) div 60;
  sec := tempInteger - hour * 3600 - min * 60;
  Result.Strings[11] := IntToStr(hour) + ':' + FormatFloat('00', min) + ':' + FormatFloat('00', sec);

  //����� Tmax
  tempInteger := StrToInt(EncodeDataTem_104(mass, $0000, $008C, 'L[1]'));
  hour := tempInteger div 3600;
  min :=  (tempInteger - hour * 3600) div 60;
  sec := tempInteger - hour * 3600 - min * 60;
  Result.Strings[12] := IntToStr(hour) + ':' + FormatFloat('00', min) + ':' + FormatFloat('00', sec);

  //����� Tmin
  tempInteger := StrToInt(EncodeDataTem_104(mass, $0000, $007C, 'L[1]'));
  hour := tempInteger div 3600;
  min :=  (tempInteger - hour * 3600) div 60;
  sec := tempInteger - hour * 3600 - min * 60;
  Result.Strings[13] := IntToStr(hour) + ':' + FormatFloat('00', min) + ':' + FormatFloat('00', sec);

  //����� Tdt
  tempInteger := StrToInt(EncodeDataTem_104(mass, $0000, $009C, 'L[1]'));
  hour := tempInteger div 3600;
  min :=  (tempInteger - hour * 3600) div 60;
  sec := tempInteger - hour * 3600 - min * 60;
  Result.Strings[14] := IntToStr(hour) + ':' + FormatFloat('00', min) + ':' + FormatFloat('00', sec);

  //����� T���
  tempInteger := StrToInt(EncodeDataTem_104(mass, $0000, $00AB, 'L[1]'));
  hour := tempInteger div 3600;
  min :=  (tempInteger - hour * 3600) div 60;
  sec := tempInteger - hour * 3600 - min * 60;
  Result.Strings[15] := IntToStr(hour) + ':' + FormatFloat('00', min) + ':' + FormatFloat('00', sec);

  //����������� �� ��������
  if enabledPar[SysType, 2] > 0 then
    Result.Strings[16] := FloatToStr(StrToInt(EncodeDataTem_104(mass, $0000, $00C8 + (nomSys - 1)*4, 'I[1]')) / 100);
  if enabledPar[SysType, 2] > 1 then
    Result.Strings[17] := FloatToStr(StrToInt(EncodeDataTem_104(mass, $0000, $00C8 + (nomSys - 1)*4, 'I[2]')) / 100);
  if enabledPar[SysType, 2] > 2 then
    Result.Strings[18] := FloatToStr(StrToInt(EncodeDataTem_104(mass, $0000, $00C8 + (nomSys - 1)*4, 'I[3]')) / 100);

  //�������� �� ��������
  if enabledPar[SysType, 1] > 0 then
    Result.Strings[19] := FloatToStr(StrToInt(EncodeDataTem_104(mass, $0000, $00E0 + (nomSys - 1)*4, 'C[1]')) / 100);
  if enabledPar[SysType, 1] > 1 then
    Result.Strings[20] := FloatToStr(StrToInt(EncodeDataTem_104(mass, $0000, $00E0 + (nomSys - 1)*4, 'C[2]')) / 100);
  if enabledPar[SysType, 1] > 2 then
    Result.Strings[21] := FloatToStr(StrToInt(EncodeDataTem_104(mass, $0000, $00E0 + (nomSys - 1)*4, 'C[3]')) / 100);

  //�������� ������
  if enabledPar[SysType, 0] > 0 then
    Result.Strings[22] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(mass, $0000, $00EC, 'F[1]')));
  if enabledPar[SysType, 0] > 1 then
    Result.Strings[23] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(mass, $0000, $00EC, 'F[2]')));
  if enabledPar[SysType, 0] > 2 then
    Result.Strings[24] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(mass, $0000, $00EC, 'F[3]')));
end;

procedure TFormTEM_104_Stat.sBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormTEM_104_Stat.sListBox1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to countSystem - 1 do
    StringGrid1.Cols[i+1] := tabl[sListBox1.ItemIndex, i];
end;

end.
