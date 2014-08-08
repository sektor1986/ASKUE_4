unit DllExpD;

interface

uses
  SysUtils, Classes, ztvBase, ztvUnZIP, ztvZip, DB, DBClient, ztvRegister;

type
  TexportD = class(TDataModule)
    ImpExp: TClientDataSet;
    ImpExpINC: TIntegerField;
    ImpExpCHEC: TIntegerField;
    ImpExpSTREET: TStringField;
    ImpExpKV: TMemoField;
    ImpExpNS: TMemoField;
    ImpExpSDF: TMemoField;
    ImpExpVARTAR: TMemoField;
    ImpExpDESCRIPTION: TMemoField;
    ImpExpADDINFORM: TMemoField;
    EXPDMAIN: TClientDataSet;
    EXPDMAININC: TIntegerField;
    EXPDMAINCOD: TIntegerField;
    EXPDMAINKV: TIntegerField;
    EXPDMAINNS: TStringField;
    EXPDMAINSDF: TIntegerField;
    EXPDMAINPHONE: TStringField;
    EXPDMAINDESCRIPTION: TStringField;
    EXPDMAINLSCHET: TStringField;
    EXPDMAINUBANK: TStringField;
    EXPDMAINVAR_TAR: TMemoField;
    EXPDMAINVAR_TAR1: TMemoField;
    EXPDMAINMES_POT: TMemoField;
    EXPDMAINMES_POT1: TMemoField;
    EXPDMAINPOWER: TMemoField;
    EXPDMAINPOWER1: TMemoField;
    EXPDMAINPOT_OTK: TMemoField;
    EXPDMAINPOT_OTK1: TMemoField;
    EXPDMAINTAR_NAK: TMemoField;
    EXPDMAINTAR_NAK1: TMemoField;
    EXPDMAINTIME0: TStringField;
    EXPDMAINTIME1: TStringField;
    EXPDMAINTIMES: TStringField;
    EXPDMAINTIMEC: TStringField;
    EXPDMAINVAR_TAR_TIME: TStringField;
    EXPDMAINVAR_TAR_TIME1: TStringField;
    EXPDMAINTAR_NAK_TIME: TStringField;
    EXPDMAINTAR_NAK_TIME1: TStringField;
    EXPDMAINPOWER_TIME: TStringField;
    EXPDMAINPOWER_TIME1: TStringField;
    EXPDMAINMES_POT_TIME: TStringField;
    EXPDMAINMES_POT_TIME1: TStringField;
    EXPDMAINPOT_OTK_TIME: TStringField;
    EXPDMAINPOT_OTK_TIME1: TStringField;
    EXPDMAINTIME_SCH: TStringField;
    EXPDMAINFDT: TMemoField;
    EXPDMAINFDP: TMemoField;
    EXPDMAINMES: TIntegerField;
    EXPDMAINPROF_NAGR: TMemoField;
    EXPDMAINPROF_NAGR1: TMemoField;
    EXPDMAINPROF_NAGR_TIME: TStringField;
    EXPDMAINPROF_NAGR_TIME1: TStringField;
    EXPDARHIV: TClientDataSet;
    EXPDARHIVCOD: TIntegerField;
    EXPDARHIVM1: TMemoField;
    EXPDARHIVM2: TMemoField;
    EXPDARHIVM3: TMemoField;
    EXPDARHIVM4: TMemoField;
    EXPDARHIVM5: TMemoField;
    EXPDARHIVM6: TMemoField;
    EXPDARHIVM7: TMemoField;
    EXPDARHIVM8: TMemoField;
    EXPDARHIVM9: TMemoField;
    EXPDARHIVM10: TMemoField;
    EXPDARHIVM11: TMemoField;
    EXPDARHIVM12: TMemoField;
    EXPDARHIVREZ: TIntegerField;
    EXPDARHIVGOD: TStringField;
    EXPDVARTAR: TClientDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Zip1: TZip;
    EXPDPROF: TClientDataSet;
    EXPDPROFCOD: TIntegerField;
    EXPDPROFDATA: TStringField;
    EXPDPROFPROFIL: TMemoField;
    EXPDPROFREZ: TStringField;
    UnZIP1: TUnZip;
  private
    { Private declarations }
  public
    { Public declarations }
    index : integer;
    indexm : integer;
  end;

var
  exportD: TexportD;

implementation

{$R *.dfm}

end.
