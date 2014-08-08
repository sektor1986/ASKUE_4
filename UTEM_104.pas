unit UTEM_104;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, sMemo, sButton, Grids, sLabel, sGroupBox,
  Buttons, sBitBtn, DB, DBClient, QExport4, QExport4DBF, sDialogs;
type
  TFormTEM_104 = class(TForm)
    sPanel1: TsPanel;
    Tabl: TStringGrid;
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sBitBtn1: TsBitBtn;
    QExp_TEM_104: TQExport4DBF;
    CDS_TEM_104: TClientDataSet;
    sBitBtn2: TsBitBtn;
    sSaveDialog1: TsSaveDialog;
    CDS_TEM_104zavn: TStringField;
    CDS_TEM_104kju: TStringField;
    CDS_TEM_104adr: TStringField;
    CDS_TEM_104Kod_Ch: TIntegerField;
    CDS_TEM_104tipsh: TStringField;
    CDS_TEM_104Uch: TIntegerField;
    CDS_TEM_104dat: TCurrencyField;
    CDS_TEM_104vrem: TCurrencyField;
    CDS_TEM_104Q1: TFloatField;
    CDS_TEM_104V1: TFloatField;
    CDS_TEM_104G1: TFloatField;
    CDS_TEM_104tpod: TFloatField;
    CDS_TEM_104Q2: TFloatField;
    CDS_TEM_104V2: TFloatField;
    CDS_TEM_104G2: TFloatField;
    CDS_TEM_104tobr: TFloatField;
    CDS_TEM_104txv: TFloatField;
    CDS_TEM_104Trab: TFloatField;
    CDS_TEM_104Trab_o: TFloatField;
    CDS_TEM_104N_GrUch: TIntegerField;
    procedure sBitBtn2Click(Sender: TObject);
  private
    procedure FixColsStringGrid;
  public
    procedure Load_TEM_104;
  end;

const
  enabledPar: array[0..12, 0..2] of byte = ((1,0,0), (1,1,1), (1,1,1), (1,2,2), (1,2,2), (1,2,2), (1,2,2), (1,2,2), (1,2,2), (2,2,2), (2,3,3), (2,3,3), (3,3,3));
var
  FormTEM_104: TFormTEM_104;
  count_rec: Integer;

implementation

uses Udm1, UFunction, Unit1;


{$R *.dfm}

procedure TFormTEM_104.FixColsStringGrid;
var
  mass: TStrings;
begin
  mass := TStringList.Create;
  mass.Add('�������');                 // 0
  mass.Add('���');                     // 1
  mass.Add('����');                    // 2
  mass.Add('�����');                   // 3
  mass.Add('Q, ����');                 // 4
  mass.Add('�1, ����');                // 5
  mass.Add('�2, ����');                // 6
  mass.Add('�3, ����');                // 7
  mass.Add('�1, ����');                // 8
  mass.Add('�2, ����');                // 9
  mass.Add('�3, ����');                // 10
  mass.Add('�1, ���');                 // 11
  mass.Add('�2, ���');                 // 12
  mass.Add('�3, ���');                 // 13
  mass.Add('����, �');                 // 14
  mass.Add('Tmax, �');                 // 15
  mass.Add('Tmin, �');                 // 16
  mass.Add('Tdt, �');                  // 17
  mass.Add('����.�., �');              // 18
  mass.Add('�������� ������ G1, �/�'); // 19
  mass.Add('�������� ������ G2, �/�'); // 20
  mass.Add('�������� ������ G3, �/�'); // 21
  mass.Add('����� V1, �3');            // 22
  mass.Add('����� V2, �3');            // 23
  mass.Add('����� V3, �3');            // 24
  mass.Add('�������� ������ G1, �3/�');// 25
  mass.Add('�������� ������ G2, �3/�');// 26
  mass.Add('�������� ������ G3, �3/�');// 27
  Tabl.RowCount := 28;
  Tabl.Cols[0] := mass;
  Tabl.Cols[1].Clear;
  Tabl.Cols[2].Clear;
  Tabl.Cols[3].Clear;
  Tabl.Cols[4].Clear;
  mass.Clear;
end;

procedure TFormTEM_104.Load_TEM_104;
const adrSysInt = $0200;
var
  Blod: TStrings;
  mass: TStrings;
  type_q: integer;
  countSystem: integer;
  i: Integer;
  adrSysCon: integer;
  adrSysPar: integer;
  tempInteger: integer;
  SysType: Byte;
  j: Integer;
  hour: Word;
  min: Word;
  sec: Word;
  type_counter: Byte;  // 0 - ������, 1 - �����
  num_chM: Integer;
  num_chV: Integer;
begin
  Blod := TStringList.Create;
  // ������ ������� 512 ����
  Blod.Text := dm1.kv_konfig.FN('M7').AsString;
  type_counter := StrToInt(Blod.Strings[511]);

  count_rec := 0;
  num_chM := 1;
  num_chV := 1;
  if type_counter = 0 then
    begin
      //��������� ����� �������
      sLabel2.Caption := EncodeDataTem_104(blod, $0000, $007C, 'L_notInv');
      // ����� ������� � ����
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
    end
  else
    begin
      sLabel2.Caption := Chr(StrToInt(Blod.Strings[0])) +
                      Chr(StrToInt(Blod.Strings[1])) +
                      Chr(StrToInt(Blod.Strings[2])) +
                      Chr(StrToInt(Blod.Strings[3])) +
                      Chr(StrToInt(Blod.Strings[4])) +
                      Chr(StrToInt(Blod.Strings[5])) +
                      Chr(StrToInt(Blod.Strings[6]));
      countSystem := 1;
    end;

  FixColsStringGrid;

  for i := 0 to countSystem - 1 do
    begin
      count_rec := count_rec + 1;
      Blod.Text := dm1.kv_konfig.FN('M7').AsString;
      type_counter := StrToInt(Blod.Strings[511]);
      mass := TStringList.Create;
      for j := 0 to 27 do
        mass.Add('---');
      mass.Strings[0] := IntToStr(i + 1);

      if type_counter = 0 then
        adrSysCon := $00600 + $40 * i
      else
        adrSysCon := $0041;

      adrSysPar := $0000 + $92 * i;
      try
        SysType := StrToInt(EncodeDataTem_104(blod, adrSysCon, $0000, 'C'));
      except

      end;
      case SysType of
        $00:  mass.Strings[1] := '���������� V';
        $01:  mass.Strings[1] := '���������� M';
        $02:  mass.Strings[1] := '����������';
        $03:  mass.Strings[1] := '������';
        $04:  mass.Strings[1] := '�������';
        $05:  mass.Strings[1] := '��������� ���';
        $06:  mass.Strings[1] := '�������� ���';
        $07:  mass.Strings[1] := '�������� ���������';
        $08:  mass.Strings[1] := '������ + �';
        $0A:  mass.Strings[1] := '��������';
        $0B:  mass.Strings[1] := '��� � ����������';
        $0C:  mass.Strings[1] := '��������';
      else
        mass.Strings[1] := '�� ����������'
      end;

      //������� �� �������
      if type_counter = 0 then
        try
          if i = 0 then
            mass.Strings[4] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(blod, $0200, $0058, 'L[1]_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0028, 'F[1]')));
          if i = 1 then
            mass.Strings[4] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(blod, $0200, $0058, 'L[2]_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0028, 'F[2]')));
        except

        end
      else
        try
          mass.Strings[4] := FormatFloat('00000.000', StrToInt(EncodeDataTem_104(blod, $0154, $0000, 'L[1]_not')) + StrToFloat(EncodeDataTem_104(Blod, $0158, $0000, 'F[1]')));
        except

        end;

      //����� �� �������
      if type_counter = 0 then
        try
          if enabledPar[SysType, 0] > 0 then
          begin
            mass.Strings[5] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(Blod, $0200, $0048, 'L[' + IntToStr(num_chM) +  ']_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0018, 'F[' + IntToStr(num_chM) +  ']')));
            num_chM := num_chM + 1;
          end;
          if enabledPar[SysType, 0] > 1 then
          begin
            mass.Strings[6] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(Blod, $0200, $0048, 'L[' + IntToStr(num_chM) +  ']_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0018, 'F[' + IntToStr(num_chM) +  ']')));
            num_chM := num_chM + 1;
          end;
          if enabledPar[SysType, 0] > 2 then
          begin
            mass.Strings[7] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(Blod, $0200, $0048, 'L[' + IntToStr(num_chM) +  ']_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0018, 'F[' + IntToStr(num_chM) +  ']')));
            num_chM := num_chM + 1;
          end;
        except

        end
      else
        try
          mass.Strings[5] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(Blod, $014C, $0000, 'L[1]_not')) + StrToFloat(EncodeDataTem_104(Blod, $0150, $0000, 'F[1]')));
        except

        end;

      //�����
      if type_counter = 0 then
        try
          if enabledPar[SysType, 0] > 0 then
          begin
            mass.Strings[22] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(Blod, $0200, $0038, 'L[' + IntToStr(num_chV) +  ']_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0008, 'F[' + IntToStr(num_chV) +  ']')));
            num_chV := num_chV + 1;
          end;
          if enabledPar[SysType, 0] > 1 then
          begin
            mass.Strings[23] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(Blod, $0200, $0038, 'L[' + IntToStr(num_chV) +  ']_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0008, 'F[' + IntToStr(num_chV) +  ']')));
            num_chV := num_chV + 1;
          end;
          if enabledPar[SysType, 0] > 2 then
          begin
            mass.Strings[24] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(Blod, $0200, $0038, 'L[' + IntToStr(num_chV) +  ']_not')) + StrToFloat(EncodeDataTem_104(Blod, $0200, $0008, 'F[' + IntToStr(num_chV) +  ']')));
            num_chV := num_chV + 1;
          end;
        except

        end
      else
        try
          mass.Strings[22] := FormatFloat('0.000', StrToInt(EncodeDataTem_104(Blod, $0144, $0000, 'L[1]_not')) + StrToFloat(EncodeDataTem_104(Blod, $0148, $0000, 'F[1]')));
        except

        end;

      //�����������
      if type_counter = 0 then
        try
          if enabledPar[SysType, 2] > 0 then
            mass.Strings[8] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, $0200, $00C8 + i*6, 'I[1]_not'))/100);
          if enabledPar[SysType, 2] > 1 then
            mass.Strings[9] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, $0200, $00C8 + i*6, 'I[2]_not'))/100);
          if enabledPar[SysType, 2] > 2 then
            mass.Strings[10] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, $0200, $00C8 + i*6, 'I[3]_not'))/100);
        except

        end;

      if type_counter = 0 then
      try
        if enabledPar[SysType, 1] > 0 then
          mass.Strings[11] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, $0200, $00E0 + i*3, 'C[1]'))/100);
        if enabledPar[SysType, 1] > 1 then
          mass.Strings[12] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, $0200, $00E0 + i*3, 'C[2]'))/100);
        if enabledPar[SysType, 1] > 2 then
          mass.Strings[13] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, $0200, $00E0 + i*3, 'C[3]'))/100);
      except

      end;

      //����� ����
      if type_counter = 0 then
        tempInteger := StrToInt(EncodeDataTem_104(blod, $0200, $006C + i*4, 'L[1]_not')) + StrToInt(EncodeDataTem_104(blod, $0200, $00AC + i*4, 'L[1]_not'))
      else
        tempInteger := StrToInt(EncodeDataTem_104(blod, $015C, $0000, 'L[1]_not')) + StrToInt(EncodeDataTem_104(blod, $0164, $0000, 'L[1]_not'));
      hour := tempInteger div 3600;
      min :=  (tempInteger - hour * 3600) div 60;
      sec := tempInteger - hour * 3600 - min * 60;

      mass.Strings[14] := FloatToStrF(tempInteger/3600, ffFixed, 10, 2);

      //����� Tmax
      if type_counter = 0 then
        tempInteger := StrToInt(EncodeDataTem_104(blod, $0200, $008C + i*4, 'L[1]_not'))
      else
        tempInteger := StrToInt(EncodeDataTem_104(blod, $0000, $016C, 'L[1]_not'));
      hour := tempInteger div 3600;
      min :=  (tempInteger - hour * 3600) div 60;
      sec := tempInteger - hour * 3600 - min * 60;
      //mass.Strings[15] := IntToStr(hour) + ':' + FormatFloat('00', min) + ':' + FormatFloat('00', sec);
       mass.Strings[15] := FloatToStrF(tempInteger/3600, ffFixed, 10, 2);

      //����� Tmin
      if type_counter = 0 then
        tempInteger := StrToInt(EncodeDataTem_104(blod, $0200, $007C + i*4, 'L[1]_not'))
      else
        tempInteger := StrToInt(EncodeDataTem_104(blod, $0000, $0170, 'L[1]_not'));
      hour := tempInteger div 3600;
      min :=  (tempInteger - hour * 3600) div 60;
      sec := tempInteger - hour * 3600 - min * 60;
      //mass.Strings[16] := IntToStr(hour) + ':' + FormatFloat('00', min) + ':' + FormatFloat('00', sec);
       mass.Strings[16] := FloatToStrF(tempInteger/3600, ffFixed, 10, 2);

      //����� Tdt
      if type_counter = 0 then
        tempInteger := StrToInt(EncodeDataTem_104(blod, $0200, $009C + i*4, 'L[1]_not'))
      else
        tempInteger := StrToInt(EncodeDataTem_104(blod, $0000, $0168, 'L[1]_not'));
      hour := tempInteger div 3600;
      min :=  (tempInteger - hour * 3600) div 60;
      sec := tempInteger - hour * 3600 - min * 60;
      //mass.Strings[17] := IntToStr(hour) + ':' + FormatFloat('00', min) + ':' + FormatFloat('00', sec);
       mass.Strings[17] := FloatToStrF(tempInteger/3600, ffFixed, 10, 2);

      //����� T���
      if type_counter = 0 then
        tempInteger := StrToInt(EncodeDataTem_104(blod, $0200, $00AC + i*4, 'L[1]_not'))
      else
        tempInteger := StrToInt(EncodeDataTem_104(blod, $0164, $0000, 'L[1]_not'));
      hour := tempInteger div 3600;
      min :=  (tempInteger - hour * 3600) div 60;
      sec := tempInteger - hour * 3600 - min * 60;
      //mass.Strings[18] := IntToStr(hour) + ':' + FormatFloat('00', min) + ':' + FormatFloat('00', sec);
       mass.Strings[18] := FloatToStrF(tempInteger/3600, ffFixed, 10, 2);

      //mimemory
      Blod.Clear;
      Blod.Text := dm1.kv_konfig.FN('M9').AsString;



      if type_counter = 1 then
        try
          //�������� ������
          mass.Strings[25] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, $00B8, $0000, 'F[1]')));
          //�������� ������
          mass.Strings[19] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, $00BC, $0000, 'F[1]')));
        except

        end;

      //�������� ������
      if type_counter = 0 then
        try
          if enabledPar[SysType, 0] > 0 then
            mass.Strings[19] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, adrSysPar, $0050, 'F[1]')));
          if enabledPar[SysType, 0] > 1 then
            mass.Strings[20] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, adrSysPar, $0050, 'F[2]')));
          if enabledPar[SysType, 0] > 2 then
            mass.Strings[21] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, adrSysPar, $0050, 'F[3]')));
        except

        end;

      if type_counter = 0 then
        try
          if enabledPar[SysType, 0] > 0 then
            mass.Strings[25] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, adrSysPar, $0040, 'F[1]')));
          if enabledPar[SysType, 0] > 1 then
            mass.Strings[26] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, adrSysPar, $0040, 'F[2]')));
          if enabledPar[SysType, 0] > 2 then
            mass.Strings[27] := FormatFloat('0.000', StrToFloat(EncodeDataTem_104(Blod, adrSysPar, $0040, 'F[3]')));
        except

        end;

     if type_counter = 1 then
        begin
          //��������
          mass.Strings[11] := FormatFloat('0.000', (StrToFloat(EncodeDataTem_104(Blod, $00C8, $0000, 'F[1]'))));
          mass.Strings[12] := FormatFloat('0.000', (StrToFloat(EncodeDataTem_104(Blod, $00C8, $0000, 'F[2]'))));
          //�����������
          mass.Strings[8] := FormatFloat('0.000', (StrToFloat(EncodeDataTem_104(Blod, $00C0, $0000, 'F[1]'))));
          mass.Strings[9] := FormatFloat('0.000', (StrToFloat(EncodeDataTem_104(Blod, $00C0, $0000, 'F[2]'))));
        end;


      //timer128
      Blod.Clear;
      Blod.Text := dm1.kv_konfig.FN('M8').AsString;
      if type_counter = 0 then
        begin
          mass.Strings[2] := EncodeDataTem_104(blod, $0017, $0000, 'BCD') + '.' + EncodeDataTem_104(blod, $0018, $0000, 'BCD') + '.' + EncodeDataTem_104(blod, $0019, $0000, 'BCD');
          mass.Strings[3] := EncodeDataTem_104(blod, $0014, $0000, 'BCD') + ':' + EncodeDataTem_104(blod, $0012, $0000, 'BCD') + ':' + EncodeDataTem_104(blod, $0010, $0000, 'BCD');
        end
      else if type_counter = 1 then
        begin
          mass.Strings[2] := EncodeDataTem_104(blod, $0004, $0000, 'BCD') + '.' + EncodeDataTem_104(blod, $0005, $0000, 'BCD') + '.' + EncodeDataTem_104(blod, $0006, $0000, 'BCD');
          mass.Strings[3] := EncodeDataTem_104(blod, $0002, $0000, 'BCD') + ':' + EncodeDataTem_104(blod, $0001, $0000, 'BCD') + ':' + EncodeDataTem_104(blod, $0000, $0000, 'BCD');
        end;

      Tabl.Cols[i + 1] := mass;
    end;
  Blod.Free;
end;

procedure TFormTEM_104.sBitBtn2Click(Sender: TObject);
var
    Blod: TStrings;
    zavn: string;
    adr: string;
  i: Integer;
begin
  Blod := TStringList.Create;
  Blod.Text := dm1.kv_konfig.FN('M7').AsString;
  if Form1.sPageControl1.ActivePageIndex = 0  then
    begin
      zavn := Copy(dm1.tmp_1.FN('NS').AsString, 1, 7);
    end
  else
    begin
      zavn := Copy(dm1.tmp_2.FN('NS').AsString, 1, 7);
    end;
  adr := dm1.addresmain.FN('ADDR').AsString;
  CDS_TEM_104.Open;
  for i := 1 to count_rec do

    CDS_TEM_104.AppendRecord([zavn,                         // ��������� ����� �������
                            '',                             // ��� ���
                            adr,                            // ����� �������������� ��������
                            0,                              // ��� �������� � ��������� �����������
                            '���-104',                      // ��� �������������, ��������
                            i,                              // ��� �����
                            StrToDate(Tabl.Cells[i, 2]),    // ���� ������ ���������
                            StrToTime(Tabl.Cells[i, 3]),    // ����� ������ ���������
                            StrToFloat(Tabl.Cells[i, 4]),   // ��������� ������� ����� ������� ����� � �������� ������������
                            StrToFloat(Tabl.Cells[i, 5]),   // ������ ������� ���� � �������� ������������
                            StrToFloat(Tabl.Cells[i, 19]),  // �������������� ������ ������� ���� � �������� ������������
                            StrToFloat(Tabl.Cells[i, 8]),   // �������������� ����������� ������� ���� � �������� ������������
                            0.0,                            // ��������� ������� ����� ������� ����� � �������� ������������
                            StrToFloatdef(Tabl.Cells[i, 6], 0),   // ������ ������� ���� � �������� ������������
                            StrToFloatdef(Tabl.Cells[i, 20], 0),  // �������������� ������ ������� ���� � �������� ������������
                            StrToFloat(Tabl.Cells[i, 9]),   // �������������� ����������� ������� ���� � �������� ������������
                            StrToFloatdef(Tabl.Cells[i, 10], 0),  // �������������� ����������� �������� ����
                            StrToFloat(Tabl.Cells[i, 14]),  // ����� ����� ������ �������
                            StrToFloat(Tabl.Cells[i, 18]),  // ����� ������ ������� � �������
                            0]);                            // ��� �������� ���������� ����� � ��������� �����������
  Blod.Free;
  if sSaveDialog1.Execute then
    begin
      QExp_TEM_104.FileName := sSaveDialog1.FileName;
      QExp_TEM_104.Execute;
    end;
  CDS_TEM_104.Close;
end;

end.
