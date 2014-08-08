unit UdmPrint;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, frxCross, DB, FIBDataSet, pFIBDataSet,
  frxExportPDF, frxExportXLS, frxExportHTML, frxExportMail, frxDesgn;

type
  TdmPrint = class(TDataModule)
    SIM: TpFIBDataSet;
    SIMTOWN: TFIBStringField;
    SIMADDR: TFIBStringField;
    SIMPHONE: TFIBStringField;
    frxReport1: TfrxReport;
    frDSetSim: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    tmp: TpFIBDataSet;
    frDsetTMP: TfrxDBDataset;
    frxMailExport1: TfrxMailExport;
    tmpKV: TFIBIntegerField;
    tmpNS: TFIBStringField;
    tmpPPLAT: TFIBStringField;
    tmpDATE_POVERKA: TFIBDateField;
    tmpLSCHET: TFIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrint: TdmPrint;

implementation

uses Udm1;

{$R *.dfm}



end.
