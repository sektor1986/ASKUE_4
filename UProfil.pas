unit UProfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, TeeProcs, TeEngine,
  Chart, ExtCtrls, sPanel, Series, StdCtrls, Buttons, sBitBtn, sRadioButton,
  sGroupBox, DBGridEhGrouping;

type
  TFormProfil = class(TForm)
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sPanel4: TsPanel;
    Chart1: TChart;
    DBGridEh1: TDBGridEh;
    profmain: TpFIBDataSet;
    DSProfmain: TDataSource;
    profmainINC: TFIBIntegerField;
    profmainCOD: TFIBIntegerField;
    profmainDATA: TFIBStringField;
    profmainPROFIL: TFIBMemoField;
    profmainREZ: TFIBStringField;
    profmainCHEC: TFIBIntegerField;
    sGroupBox1: TsGroupBox;
    sBitBtn1: TsBitBtn;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    Series1: TFastLineSeries;
    sRadioGroup1: TsRadioGroup;
    Series2: TBarSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure profmainAfterScroll(DataSet: TDataSet);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sRadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProfil: TFormProfil;
  ns: string;

implementation

uses Udm1, Unit1;

{$R *.dfm}

procedure TFormProfil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  profmain.Close;
end;

procedure TFormProfil.profmainAfterScroll(DataSet: TDataSet);
var
  blod: TStrings;
  i: integer;
  vrem: string;
  vid: Word;
begin
  blod := TStringList.Create;
  blod.Text := profmainPROFIL.AsString;
  if Chart1.Series[0].Active then
    vid := 0
  else
    vid := 1;
  with Chart1.Series[vid] do
    begin
      Clear;
      vrem := '00:00';
      for i := blod.Count - 1 downto 2 do
        begin
          Add(StrToFloatDef(blod[i], 00.00), vrem);
          vrem := FormatDateTime('hh:nn', StrToTime(vrem)+StrToTime('00:30'));
        end;
    end;
  Chart1.Title.Text[0] := 'Профиль нарузки за ' + profmainData.AsString + ', счётчик № ' + ns;
end;

procedure TFormProfil.sBitBtn1Click(Sender: TObject);
begin
  if sRadioButton1.Checked then
    Chart1.PrintPortrait
  else
    Chart1.PrintLandscape;
end;

procedure TFormProfil.sRadioGroup1Click(Sender: TObject);
begin
  if sRadioGroup1.ItemIndex = 1 then
    begin
      Series2.Assign(Series1);
      Series2.Active := true;
      Series1.Active := false;
    end
  else
    begin
      Series1.Assign(Series2);
      Series1.Active := true;
      Series2.Active := false;
    end;
end;

end.
