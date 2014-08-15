unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, StdCtrls, sEdit, sButton, ExtCtrls,
  sPanel, sSkinManager, Menus, sLabel, ComCtrls, sStatusBar, ImgList, Buttons,
  sBitBtn, sMemo, sPageControl, sCheckBox, DBCtrls, sSpeedButton, sGauge,
  sRichEdit, Mask, DBCtrlsEh, acShellCtrls, sComboBoxes, Spin, sSpinEdit,
  sGroupBox, DBLookupEh, ActnList, sComboBox, DB, sDialogs, pFIBQuery, StrUtils,
  sSkinProvider, ToolWin, acCoolBar, sToolBar, PropFilerEh, PropStorageEh,
  UDeviceThread, UBackUpThread, acProgressBar, Gauges, IniFiles, EhLibFIB, sSplitter, FIBSQLMonitor, sHintManager,
  frxDBSet, frxCross,
  frxPreview, DBClient, acNotebook, ZipMstr19, pFIBDataSet, UTypes,
  DBGridEhGrouping, CPort, sMaskEdit, MidasLib, sCustomComboEdit, sTooledit,
  sDBRadioGroup, sDBDateEdit, sMonthCalendar, sDBEdit, JvExControls, JvComCtrls;

type
  TForm1 = class(TForm)
    sStatusBar1: TsStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    sSkinManager1: TsSkinManager;
    ImageList1: TImageList;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    ActionList1: TActionList;
    ActionFormsClose: TAction;
    ActionSpisokNeschit: TAction;
    ActionAddSchBal: TAction;
    ActionAddSpisGorodovAddGorod: TAction;
    ActionAddAdres: TAction;
    ActionAddAdresGotovo: TAction;
    ActionKorrectAdres: TAction;
    N13: TMenuItem;
    sOpenDialog1: TsOpenDialog;
    ActionAllpost: TAction;
    ActionKoncentrator: TAction;
    ActionSchitivatel: TAction;
    ActionCloseAll: TAction;
    PMenuRas: TPopupMenu;
    PMenuAdres: TPopupMenu;
    ActionVidelitVseShetchikiVRas: TAction;
    ActionSniatVidelenieSoVsehSchetchVRas: TAction;
    ActionVidelitVseSchetchikiVAdrese: TAction;
    ActionSniatVidelenieSoVsehSchetchikovAdresa: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    PMenuSchetchiki: TPopupMenu;
    N20: TMenuItem;
    N21: TMenuItem;
    ActionAddRas: TAction;
    PMenuKorrektTmp: TPopupMenu;
    PMenuKorrektAddres: TPopupMenu;
    ActionFormAddNewSchethikShow: TAction;
    N22: TMenuItem;
    N23: TMenuItem;
    ActionDelAdres: TAction;
    ActionDelSchetchik: TAction;
    N24: TMenuItem;
    ActionAddRasBal: TAction;
    PMenu_tmp_bal: TPopupMenu;
    N25: TMenuItem;
    N26: TMenuItem;
    ActionDelSchBal: TAction;
    ActionDelVseBal: TAction;
    PMenu_tmp_3xf: TPopupMenu;
    N27: TMenuItem;
    ActionDannieSoSchetchikov: TAction;
    PMenu_Richedit: TPopupMenu;
    Find: TMenuItem;
    sCoolBar1: TsCoolBar;
    sToolBar1: TsToolBar;
    PeremSchetchik: TMenuItem;
    //    BComPort: TBComPort;
    ActionProgrNaChtenie: TAction;
    sSkinProvider1: TsSkinProvider;
    sProgressBar2: TsProgressBar;
    //    BComPort1: TBComPort;
    ActionDelRas: TAction;
    ActionSamSchetchika: TAction;
    N29: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ImageList2: TImageList;
    ActionShowHelpForLog: TAction;
    sSaveDialog1: TsSaveDialog;
    N7: TMenuItem;
    ActionPereimAdr: TAction;
    N11: TMenuItem;
    ActionBalance: TAction;
    CtrlA1: TMenuItem;
    N12: TMenuItem;
    N28: TMenuItem;
    ActionVidelitVseSummir: TAction;
    N30: TMenuItem;
    ActionVidelitVseSchetchiki: TAction;
    N31: TMenuItem;
    ActionPereimenRas: TAction;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    ActionNaznVarTarOdf: TAction;
    ActionNaznVarTar3xf: TAction;
    ActionNaznVarTar3xfSum: TAction;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    sHintManager1: TsHintManager;
    Timer1: TTimer;
    ActionProtokolObmena: TAction;
    ActionProgrNaSapis: TAction;
    ActionNB: TAction;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    ActionPrint: TAction;
    ToolButton5: TToolButton;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    ActionImportAddres: TAction;
    MSWord2: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    nb: TsNotebook;
    sLabel1: TsLabel;
    sPanel1: TsPanel;
    sBitBtn59: TsBitBtn;
    sBitBtn15: TsBitBtn;
    sGrBoxDevice: TsGroupBox;
    sButton5: TsButton;
    sButton6: TsButton;
    sGrBoxAdres: TsGroupBox;
    sButton1: TsButton;
    sButton2: TsButton;
    sButton3: TsButton;
    sButton8: TsButton;
    sPanel32: TsPanel;
    sLabel36: TsLabel;
    sPanel33: TsPanel;
    sSpeedButton3: TsSpeedButton;
    sLabel35: TsLabel;
    DBGridEh14: TDBGridEh;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sLabel39: TsLabel;
    sEdit1: TsEdit;
    sComboBox1: TsComboBox;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    sBitBtn54: TsBitBtn;
    sPanel4: TsPanel;
    sPanel30: TsPanel;
    sPanel31: TsPanel;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton10: TsSpeedButton;
    sSpeedButton11: TsSpeedButton;
    sSpeedButton12: TsSpeedButton;
    sSpeedButton13: TsSpeedButton;
    DBGridEh13: TDBGridEh;
    DBGridEh1: TDBGridEh;
    sPanel5: TsPanel;
    sLabel2: TsLabel;
    sPanel6: TsPanel;
    sPanel7: TsPanel;
    sLabel3: TsLabel;
    TownBox: TsComboBox;
    sComboBox4: TsComboBox;
    sEdit2: TsEdit;
    sEdit3: TsEdit;
    sEdit4: TsEdit;
    sEdit5: TsEdit;
    sEdit6: TsEdit;
    sMemo1: TsMemo;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sLabel4: TsLabel;
    sPanel8: TsPanel;
    sBitBtn8: TsBitBtn;
    sBitBtn9: TsBitBtn;
    sBitBtn10: TsBitBtn;
    sGroupBox3: TsGroupBox;
    sBitBtn3: TsBitBtn;
    sBitBtn32: TsBitBtn;
    sBitBtn56: TsBitBtn;
    sGroupBox4: TsGroupBox;
    sBitBtn4: TsBitBtn;
    sBitBtn5: TsBitBtn;
    sBitBtn55: TsBitBtn;
    sBitBtn6: TsBitBtn;
    sPanel9: TsPanel;
    sPanel10: TsPanel;
    DBGridEh2: TDBGridEh;
    sPanel11: TsPanel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    KorrectPhone: TDBEditEh;
    DBEditEh2: TDBEditEh;
    sPanel12: TsPanel;
    DBGridEh3: TDBGridEh;
    sLabel7: TsLabel;
    sPanel13: TsPanel;
    sBitBtn21: TsBitBtn;
    sBitBtn22: TsBitBtn;
    sGroupBox6: TsGroupBox;
    sBitBtn11: TsBitBtn;
    sBitBtn12: TsBitBtn;
    sBitBtn14: TsBitBtn;
    sBitBtn16: TsBitBtn;
    sBitBtn17: TsBitBtn;
    sBitBtn18: TsBitBtn;
    sBitBtn19: TsBitBtn;
    sBitBtn20: TsBitBtn;
    sGroupBox7: TsGroupBox;
    sBitBtn13: TsBitBtn;
    sBitBtn60: TsBitBtn;
    sPanel14: TsPanel;
    sPanel15: TsPanel;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sLabel8: TsLabel;
    DBGridEh4: TDBGridEh;
    DBGridEh5: TDBGridEh;
    sTabSheet2: TsTabSheet;
    sLabel9: TsLabel;
    DBGridEh6: TDBGridEh;
    sPanel16: TsPanel;
    sBitBtn23: TsBitBtn;
    sBitBtn24: TsBitBtn;
    sBitBtn25: TsBitBtn;
    sLabel10: TsLabel;
    sPanel17: TsPanel;
    sPanel18: TsPanel;
    sPanel19: TsPanel;
    sBitBtn26: TsBitBtn;
    sBitBtn27: TsBitBtn;
    sBitBtn28: TsBitBtn;
    sPanel20: TsPanel;
    sBitBtn29: TsBitBtn;
    sPanel21: TsPanel;
    sBitBtn30: TsBitBtn;
    sLabel13: TsLabel;
    sPanel22: TsPanel;
    sPanel23: TsPanel;
    sPanel24: TsPanel;
    sBitBtn31: TsBitBtn;
    sBitBtn33: TsBitBtn;
    sBitBtn34: TsBitBtn;
    sPanel25: TsPanel;
    sPanel26: TsPanel;
    sBitBtn36: TsBitBtn;
    sLabel17: TsLabel;
    Log: TsRichEdit;
    sPanel27: TsPanel;
    sGauge2: TsGauge;
    sLabel19: TsLabel;
    sLabel21: TsLabel;
    sLabel23: TsLabel;
    sLabel25: TsLabel;
    sLabel14: TsLabel;
    sLabel15: TsLabel;
    sGauge1: TsGauge;
    sLabel16: TsLabel;
    sLabel18: TsLabel;
    sBitBtn37: TsBitBtn;
    sBitBtn38: TsBitBtn;
    sBitBtn39: TsBitBtn;
    sBitBtn41: TsBitBtn;
    sBitBtn42: TsBitBtn;
    sProgressBar1: TsProgressBar;
    sEdit9: TsEdit;
    sEdit10: TsEdit;
    sEdit11: TsEdit;
    sEdit12: TsEdit;
    sEdit13: TsEdit;
    sCheckBox1: TsCheckBox;
    sBitBtn40: TsBitBtn;
    sPanelLogSaveData: TsPanel;
    sLabel11: TsLabel;
    sPageControl2: TsPageControl;
    sTabSheet3: TsTabSheet;
    sRichEdit2: TsRichEdit;
    sTabSheet4: TsTabSheet;
    sRichEdit1: TsRichEdit;
    sLabel28: TsLabel;
    sPanel28: TsPanel;
    sLabel29: TsLabel;
    sLabel30: TsLabel;
    sLabel31: TsLabel;
    DBGridEh9: TDBGridEh;
    DBGridEh10: TDBGridEh;
    DBEditEh1: TDBEditEh;
    sPanel29: TsPanel;
    sLabel32: TsLabel;
    sLabel33: TsLabel;
    DBGridEh11: TDBGridEh;
    DBGridEh12: TDBGridEh;
    sBitBtn43: TsBitBtn;
    sBitBtn44: TsBitBtn;
    sBitBtn45: TsBitBtn;
    sBitBtn46: TsBitBtn;
    sBitBtn47: TsBitBtn;
    sBitBtn48: TsBitBtn;
    sBitBtn53: TsBitBtn;
    sLabel37: TsLabel;
    sPanel34: TsPanel;
    sPanel35: TsPanel;
    sGroupBox1: TsGroupBox;
    sCheckBox3: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sCheckBox7: TsCheckBox;
    sCheckBox8: TsCheckBox;
    sCheckBox9: TsCheckBox;
    sCheckBox10: TsCheckBox;
    sPanel36: TsPanel;
    sLabel38: TsLabel;
    sCheckBox11: TsCheckBox;
    sSpinEdit1: TsSpinEdit;
    sBitBtn52: TsBitBtn;
    ChBoxAutomCht: TsCheckBox;
    sBitBtn49: TsBitBtn;
    sBitBtn50: TsBitBtn;
    sBitBtn51: TsBitBtn;
    sLabel12: TsLabel;
    sPanel37: TsPanel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBGridEh7: TDBGridEh;
    sBitBtn57: TsBitBtn;
    sGroupBox5: TsGroupBox;
    sBitBtn7: TsBitBtn;
    sLabel20: TsLabel;
    GridPanel1: TGridPanel;
    sPanel38: TsPanel;
    sLabel22: TsLabel;
    DBGridEh8: TDBGridEh;
    DBMemoKV: TDBMemo;
    DBMemoNS: TDBMemo;
    DBMemoDESK: TDBMemo;
    DBMemoSDF: TDBMemo;
    DBMemoVARTAR: TDBMemo;
    sProgressBar3: TsProgressBar;
    sPanel39: TsPanel;
    sLabel24: TsLabel;
    sBitBtn61: TsBitBtn;
    sBitBtn62: TsBitBtn;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    sPanel40: TsPanel;
    sMemo2: TsMemo;
    N51: TMenuItem;
    sBitBtn63: TsBitBtn;
    sEdit8: TsEdit;
    ComPort: TComPort;
    ComPort1: TComPort;
    N52: TMenuItem;
    N1041: TMenuItem;
    sBitBtn35: TsBitBtn;
    sBitBtn64: TsBitBtn;
    N53: TMenuItem;
    N110: TMenuItem;
    N210: TMenuItem;
    N310: TMenuItem;
    N410: TMenuItem;
    N54: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N101: TMenuItem;
    sCheckBox2: TsCheckBox;
    sEdit16: TsEdit;
    sEdit17: TsEdit;
    sBitBtn65: TsBitBtn;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    sEdit18: TsEdit;
    sEdit19: TsEdit;
    sEdit20: TsEdit;
    sEdit21: TsEdit;
    sEdit7: TsEdit;
    sBitBtn58: TsBitBtn;
    N48: TMenuItem;
    sGroupBox2: TsGroupBox;
    sBitBtn66: TsBitBtn;
    N58: TMenuItem;
    sEdit14: TsEdit;
    edt1: TsEdit;
    edt2: TsEdit;
    edt3: TsEdit;
    btn1: TsSpeedButton;
    btn2: TsSpeedButton;
    btn3: TsSpeedButton;
    dlg1: TsOpenDialog;
    grp1: TsGroupBox;
    edt4: TsDecimalSpinEdit;
    edt5: TsDecimalSpinEdit;
    lbl1: TsLabel;
    lbl2: TsLabel;
    ComPort2: TComPort;
    Button1: TButton;
    sLabel34: TsLabel;
    sGroupBox8: TsGroupBox;
    sLabel43: TsLabel;
    sLabel44: TsLabel;
    sRadioGroup1: TsRadioGroup;
    sCheckBox12: TsCheckBox;
    sDBRadioGroup1: TsDBRadioGroup;
    sDBDateEdit1: TsDBDateEdit;
    sDBEdit1: TsDBEdit;
    sDBEdit2: TsDBEdit;
    sCheckBox14: TsCheckBox;
    sGroupBox9: TsGroupBox;
    sEdit15: TsEdit;
    sEdit23: TsEdit;
    sEdit24: TsEdit;
    sLabel26: TsLabel;
    sBitBtn67: TsBitBtn;
    jvpdrs1: TJvIPAddress;
    jvpdrs2: TJvIPAddress;
    lbl3: TsLabel;
    btn4: TsSpeedButton;
    btn5: TsSpeedButton;
    btn6: TsSpeedButton;
    btn7: TsSpeedButton;
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn10Click(Sender: TObject);
    procedure sBitBtn30Click(Sender: TObject);
    procedure sButton5Click(Sender: TObject);
    procedure sButton6Click(Sender: TObject);
    procedure sBitBtn36Click(Sender: TObject);
    procedure sBitBtn23Click(Sender: TObject);
    procedure sBitBtn39Click(Sender: TObject);
    procedure sButton7Click(Sender: TObject);
    procedure sBitBtn48Click(Sender: TObject);
    procedure sBitBtn24Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sBitBtn33Click(Sender: TObject);
    procedure sBitBtn49Click(Sender: TObject);
    procedure sBitBtn52Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh13DblClick(Sender: TObject);
    procedure sPageControl1Change(Sender: TObject);
    procedure DBGridEh6GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh5GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh14GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure sBitBtn53Click(Sender: TObject);
    procedure sBitBtn11Click(Sender: TObject);
    procedure sBitBtn12Click(Sender: TObject);
    procedure sBitBtn14Click(Sender: TObject);
    procedure sBitBtn16Click(Sender: TObject);
    procedure sBitBtn17Click(Sender: TObject);
    procedure sBitBtn18Click(Sender: TObject);
    procedure sBitBtn19Click(Sender: TObject);
    procedure ActionFormsCloseExecute(Sender: TObject);
    procedure sBitBtn22Click(Sender: TObject);
    procedure ActionSpisokNeschitExecute(Sender: TObject);
    procedure DBGridEh9GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh12GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh11GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ActionAddSchBalExecute(Sender: TObject);
    procedure ActionAddSpisGorodovAddGorodExecute(Sender: TObject);
    procedure ActionAddAdresExecute(Sender: TObject);
    procedure ActionAddAdresGotovoExecute(Sender: TObject);
    procedure TownBoxExit(Sender: TObject);
    procedure ActionKorrectAdresExecute(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure ActionAllpostExecute(Sender: TObject);
    procedure ActionKoncentratorExecute(Sender: TObject);
    procedure ActionSchitivatelExecute(Sender: TObject);
    procedure ActionCloseAllExecute(Sender: TObject);
    procedure ActionVidelitVseSchetchikiVAdreseExecute(Sender: TObject);
    procedure ActionSniatVidelenieSoVsehSchetchikovAdresaExecute(
      Sender: TObject);
    procedure ActionVidelitVseShetchikiVRasExecute(Sender: TObject);
    procedure ActionSniatVidelenieSoVsehSchetchVRasExecute(Sender: TObject);
    procedure ActionAddRasExecute(Sender: TObject);
    procedure ActionFormAddNewSchethikShowExecute(Sender: TObject);
    procedure ActionDelAdresExecute(Sender: TObject);
    procedure ActionDelSchetchikExecute(Sender: TObject);
    procedure ActionAddRasBalExecute(Sender: TObject);
    procedure DBGridEh3Exit(Sender: TObject);
    procedure DBGridEh14Exit(Sender: TObject);
    procedure DBGridEh13Exit(Sender: TObject);
    procedure DBEditEh1Exit(Sender: TObject);
    procedure ActionDelSchBalExecute(Sender: TObject);
    procedure ActionDelVseBalExecute(Sender: TObject);
    procedure ActionDannieSoSchetchikovExecute(Sender: TObject);
    procedure FindClick(Sender: TObject);
    procedure sEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn54Click(Sender: TObject);
    procedure sBitBtn9Click(Sender: TObject);
    procedure nbPageChanged(Sender: TObject);
    procedure PeremSchetchikClick(Sender: TObject);
    procedure DBGridEh3KeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn55Click(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure sSpeedButton14Click(Sender: TObject);
    procedure sBitBtn40Click(Sender: TObject);
    procedure sStatusBar1DblClick(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure sBitBtn50Click(Sender: TObject);
    procedure ActionProgrNaChtenieExecute(Sender: TObject);
    procedure sBitBtn51Click(Sender: TObject);
    procedure sBitBtn31Click(Sender: TObject);
    procedure sBitBtn34Click(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure sBitBtn41Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBitBtn32Click(Sender: TObject);
    procedure sBitBtn38Click(Sender: TObject);
    procedure sBitBtn42Click(Sender: TObject);
    procedure sBitBtn26Click(Sender: TObject);
    procedure sBitBtn27Click(Sender: TObject);
    procedure sBitBtn28Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KorrectPhoneExit(Sender: TObject);
    procedure ActionDelRasExecute(Sender: TObject);
    procedure ActionSamSchetchikaExecute(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure ActionShowHelpForLogExecute(Sender: TObject);
    procedure sRichEdit1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LogMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure sBitBtn37Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure ActionPereimAdrExecute(Sender: TObject);
    procedure sBitBtn57Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure sBitBtn47Click(Sender: TObject);
    procedure ActionBalanceExecute(Sender: TObject);
    procedure ActionVidelitVseSummirExecute(Sender: TObject);
    procedure ActionVidelitVseSchetchikiExecute(Sender: TObject);
    procedure ActionPereimenRasExecute(Sender: TObject);
    procedure ActionNaznVarTarOdfExecute(Sender: TObject);
    procedure ActionNaznVarTar3xfExecute(Sender: TObject);
    procedure ActionNaznVarTar3xfSumExecute(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sBitBtn13Click(Sender: TObject);
    procedure sBitBtn59Click(Sender: TObject);
    procedure ActionProtokolObmenaExecute(Sender: TObject);
    procedure sBitBtn60Click(Sender: TObject);
    procedure sSpinEdit1Change(Sender: TObject);
    procedure sBitBtn20Click(Sender: TObject);
    procedure ActionNBExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn8Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure DBEditEh2KeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn7Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure sBitBtn61Click(Sender: TObject);
    procedure MSWord1Click(Sender: TObject);
    procedure MSWord2Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure sBitBtn62Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure sBitBtn63Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N1041Click(Sender: TObject);
    procedure sBitBtn21Click(Sender: TObject);
    procedure sBitBtn35Click(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure ActionProgrNaSapisExecute(Sender: TObject);
    procedure sBitBtn64Click(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sBitBtn65Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure sBitBtn58Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure IPExit(Sender: TObject);
    procedure sCheckBox12Exit(Sender: TObject);
    procedure sDBDateEdit1Exit(Sender: TObject);
    procedure sCheckBox14Click(Sender: TObject);
    procedure sDBRadioGroup1Exit(Sender: TObject);
    procedure sBitBtn67Click(Sender: TObject);
    procedure jvpdrs2Exit(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    //    procedure DBGridEh1CellClick(Column: TColumnEh);
  private
    procedure LoadOptions;
    procedure ImportStructure;
    procedure ImportAllStructure;
    procedure UpdateDB(versPO: Integer);
  public
    passwordDefault: Boolean;
    passwordDefaultNote: Boolean;
    Port: TDeviceThread; //***Объект потока TDeviceThread
    BackupThread: TbackupThread;
    timeOpr: integer;
    massivOprosa: TmassivOpr;
    KonfigWrite: array[1..10] of RKonfigZap;
    EnableVarTar: array of REnableVarTar;
    EditPassCounter: Boolean;
    //massivOprosa: array of array of array of array of string;
    ParOprosa: array of array of string;
    flagTolkoChtenie: Boolean;
    vid_Export: Word;
    procedure SaveOptions;
    procedure CloseDataBase;
    procedure ReopenAdrTmp;
    procedure SaveLog(log: TsRichEdit);
    procedure ProverkaVersDb;
    function UpdateStructureDb(vers: string): Boolean;
  end;

var
  Form1: TForm1;
  ArrayPage: array of integer;
  pageKonc: Boolean;

implementation

uses Udm1, UVarTar, UDataVrem, UTarNak, UPower, UPomesPotr, UNa1Chislo,
  UOtklPodkl, UView, USpisokNeschit, UProcedure, UOptions, UFunction,
  UAddNewSchetchik, UProgress, UPeremSchetchikaVDrRas, UPassword, UTarPerehodi,
  UFormOpr, Udm2, UPassKoncSchit, UFormirOprChtenie,
  UCheckUser, UPassSchit, USamSchetchika, UExport, UPereimAdr, UAbout,
  UPereimRas, UNaznVarTar, UTEM_104, UTEM_104_Stat, UProfil, UdmPrint,
  UPrint, URegistrNomer, UdmExport_Import, UDelCounter, UHistory, UBook,
  UExport_TEM_104, UEditPassCounter, UEditVArTar, UAutoRead, UAutoUpload, UAutoUploadTeplo;

{$R *.dfm}

procedure TForm1.ActionDannieSoSchetchikovExecute(Sender: TObject);
begin
  if dm1.addresmain.IsEmpty then
  begin
    ShowMessage('Нет адреса для отображения');
    exit;
  end;
  if sPageControl1.ActivePageIndex = 0 then
  begin
    dm1.kv_konfig.DataSource := dm1.Dstmp_1;
    dm1.addres_1.Open;
    dm1.tmp_1.Open;
  end
  else
  begin
    dm1.tmp_2.Open;
    dm1.kv_konfig.DataSource := dm1.DStmp_2;
  end;
  sLabel7.Caption := 'Данные по адресу: г.' + dm1.townTOWN.AsString + ', ' + dm1.addresmainADDR.AsString;
  nb.PageIndex := 3;
  dm1.kv_konfig.Open;
end;

procedure TForm1.ActionDelAdresExecute(Sender: TObject); //Процедура удаления адреса
var
  sql: TpFIBQuery;
  IncAdr: string;
begin
  if Application.MessageBox(PChar('Вы действительно хотите удалить адрес ' + dm1.addresmain.FBN('ADDR').AsString),
    'Предупреждение !!!', MB_OKCANCEL + MB_ICONQUESTION) = 1 then
  begin
    IncAdr := dm1.addresmain.FBN('INC').AsString;
    sql := TpFIBQuery.Create(nil);
    with sql do
      try
        Database := dm1.database;
        Transaction := dm1.database.DefaultUpdateTransaction;
        dm1.updateTransact.StartTransaction;
        FormProgress.Show;
        FormProgress.sLabel1.Caption := 'Удаление данныx со счётчиков';
        FormProgress.sGauge1.Progress := 0;
        SQL.Text :=
          'DELETE FROM kv_konfig where cod in (select inc from tmp where cod in (select inc from addres where cod = ' + IncAdr
          + '))';
        ExecQuery;

        FormProgress.sLabel1.Caption := 'Удаление данных с трёхфазных счётчиков';
        FormProgress.sGauge1.Progress := 20;
        Application.ProcessMessages;
        Sleep(10);
        SQL.Text :=
          'DELETE FROM profmain where cod in (select inc from tmp where cod in (select inc from addres where cod = ' + IncAdr
          + '))';
        ExecQuery;

        FormProgress.sLabel1.Caption := 'Удаление данных параметризации';
        FormProgress.sGauge1.Progress := 30;
        FormProgress.Show;
        Sleep(10);
        SQL.Text :=
          'DELETE FROM SYS_BD where cod in (select inc from tmp where cod in (select inc from addres where cod = ' + IncAdr
          + '))';
        ExecQuery;

        FormProgress.sLabel1.Caption := 'Удаление архива потребления';
        FormProgress.sGauge1.Progress := 40;
        FormProgress.Show;
        Sleep(10);
        SQL.Text :=
          'DELETE FROM arhiv where cod in (select inc from tmp where cod in (select inc from addres where cod = ' + IncAdr
          + '))';
        ExecQuery;

        FormProgress.sLabel1.Caption := 'Удаление данных настройки баланса';
        FormProgress.sGauge1.Progress := 50;
        FormProgress.Show;
        Sleep(10);
        SQL.Text :=
          'DELETE FROM TMP_3XF where cod in (select inc from tmp where cod in (select inc from addres where cod = ' + IncAdr
          + '))';
        ExecQuery;

        FormProgress.sLabel1.Caption := 'Удаление счётчиков из разъёмов';
        FormProgress.sGauge1.Progress := 60;
        Application.ProcessMessages;
        Sleep(10);
        SQL.Text := 'DELETE FROM tmp where cod in (select inc from addres where cod = ' + IncAdr + ')';
        ExecQuery;

        FormProgress.sLabel1.Caption := 'Удаление разъёмов из адреса';
        FormProgress.sGauge1.Progress := 70;
        Application.ProcessMessages;
        Sleep(10);
        SQL.Text := 'DELETE FROM addres where cod = ' + IncAdr;
        ExecQuery;

        FormProgress.sLabel1.Caption := 'Удаление концентратора';
        FormProgress.sGauge1.Progress := 80;
        Application.ProcessMessages;
        Sleep(10);
        SQL.Text := 'DELETE FROM koncen where cod = ' + IncAdr;
        ExecQuery;

        FormProgress.sLabel1.Caption := 'Удаление удаление адреса';
        FormProgress.sGauge1.Progress := 90;
        Application.ProcessMessages;
        Sleep(10);
        SQL.Text := 'DELETE FROM addresmain where inc = ' + IncAdr;
        ExecQuery;

        FormProgress.sLabel1.Caption := 'Адрес удален';
        FormProgress.sGauge1.Progress := 100;
        Application.ProcessMessages;
        Sleep(100);
        FormProgress.Close;
        dm1.updateTransact.Commit
      finally
        Free;
        dm1.addresmain.CloseOpen(false);
      end;
  end;
end;

procedure TForm1.ActionDelRasExecute(Sender: TObject);
var
  sql: TpFIBQuery;
  IncRas: string;
begin
  if Application.MessageBox('Вы действительно хотите удалить разъём?', 'Подтверждение удаления разъёма!', MB_YESNOCANCEL
    + MB_ICONQUESTION) <> IDYES then
    exit;
  Screen.Cursor := crSQLWait;
  sql := TpFIBQuery.Create(nil);
  IncRas := dm1.addres_korrektINC.AsString;
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      dm1.updateTransact.StartTransaction;
      SQL.Text := 'DELETE from kv_konfig where cod in (select inc from tmp where cod =' + IncRas + ')';
      ExecQuery;
      SQL.Text := 'DELETE from PROFMAIN where cod in (select inc from tmp where cod =' + IncRas + ')';
      ExecQuery;
      SQL.Text := 'DELETE from arhiv where cod in (select inc from tmp where cod =' + IncRas + ')';
      ExecQuery;
      SQL.Text := 'DELETE from sys_bd where cod in (select inc from tmp where cod =' + IncRas + ')';
      ExecQuery;
      SQL.Text := 'DELETE from tmp_3xf where cod in (select inc from tmp where cod =' + IncRas + ')';
      ExecQuery;
      SQL.Text := 'DELETE from tmp where cod =' + IncRas;
      ExecQuery;
      SQL.Text := 'DELETE from addres where inc=' + IncRas;
      ExecQuery;
      dm1.updateTransact.Commit
    finally
      Free;
    end;
  dm1.addres_korrekt.CloseOpen(false);
  dm1.tmp_korrekt.CloseOpen(false);
  Screen.Cursor := crDefault;
end;

procedure TForm1.ActionDelSchBalExecute(Sender: TObject); //Процедура удаления счётчика из
begin //таблицы построения баланса
  if dm1.tmp_3xf.IsEmpty then
    exit;
  dm1.tmp_3xf.Delete;
  dm1.tmp_3xf.Refresh;
end;

procedure TForm1.ActionDelSchetchikExecute(Sender: TObject); //Процедура удаления счетчика
var
  sql: TpFIBQuery;
  IncTmp: string;
begin
  sql := TpFIBQuery.Create(nil);
  IncTmp := dm1.tmp_korrektINC.AsString;
  with sql do
  begin
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      dm1.updateTransact.StartTransaction;
      SQL.Text := 'DELETE from kv_konfig where cod =' + IncTmp;
      ExecQuery;
      SQL.Text := 'DELETE from PROFMAIN where cod =' + IncTmp;
      ExecQuery;
      SQL.Text := 'DELETE from arhiv where cod =' + IncTmp;
      ExecQuery;
      SQL.Text := 'DELETE from sys_bd where cod =' + IncTmp;
      ExecQuery;
      SQL.Text := 'DELETE from tmp_3xf where cod =' + IncTmp;
      ExecQuery;
      SQL.Text := 'DELETE from tmp where inc = ' + IncTmp;
      ExecQuery;
      dm1.updateTransact.Commit
    finally
      Free;
    end;
  end;
  dm1.tmp_korrekt.CloseOpen(false);
end;

procedure TForm1.ActionDelVseBalExecute(Sender: TObject); //Процедура удалениея всеч счетчиков
begin //из таблицы построения баланса
  if dm1.tmp_3xf.IsEmpty then
    exit;
  dm1.tmp_3xf.First;
  while not dm1.tmp_3xf.Eof do
    dm1.tmp_3xf.Delete;
end;

procedure TForm1.ActionAddAdresExecute(Sender: TObject); //Открытие окошка добавление нового адреса
begin
  if not dm1.townAdd.Active then
    dm1.townAdd.Open;
  dm1.addresmain.AllowedUpdateKinds := [ukModify, ukInsert, ukDelete];
  ActionAddSpisGorodovAddGorod.Execute;
  TownBox.ItemIndex := 0;
  sEdit2.Clear;
  sEdit3.Clear;
  sEdit4.Clear;
  sEdit5.Clear;
  sEdit6.Clear;
  sEdit14.Clear;
  jvpdrs1.ClearAddress;
  edt4.Text := '0,000000';
  edt5.Text := '0,000000';
  sRadioGroup1.ItemIndex := 0;
  sMemo1.Clear;
  nb.PageIndex := 1;
end;

procedure TForm1.ActionAddAdresGotovoExecute(Sender: TObject); //Добавление новго адреса
const
  streets: array[0..20] of string = ('ул.',
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
  i: Integer;

begin
  if (TownBox.Text = '') or (sEdit2.Text = '') or (sEdit3.Text = '') or (sEdit4.Text = '') or (sEdit5.Text = '') then
  begin
    Application.MessageBox('Введены не все данные', 'Предупреждение', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  addresmainAppend; //Добавление новой строки в таблицу с заполнением поля inc
  with dm1 do
  begin
    try
      townAdd.Locate('town', TownBox.Text, [loCaseInsensitive]);
      addresmainADDR.AsString := streets[sComboBox4.ItemIndex] + ' ' + sEdit2.Text + ', дом ' + sEdit3.Text +
        ', корпус ' + sEdit4.Text;
      addresmainREZ.AsInteger := townAddINC.AsInteger;
      addresmainJEU.AsString := sEdit14.Text;
      addresmainCHEC.AsInteger := 0;
      addresmainCHECKED.AsInteger := 0;
      addresmainDESCRIPTION.AsString := sMemo1.Text;
      addresmainLATITUDE.AsFloat := edt4.Value;
      addresmainLONGITUDE.AsFloat := edt5.Value;
      addresmainREPAIR.AsInteger := 0;

      case sRadioGroup1.ItemIndex of
        1: addresmainREZHIM.AsInteger := 1;
        0: addresmainREZHIM.AsInteger := 0;
      else
      end;

      // addresmainBALANS.AsInteger := 0;
       //Добавление файлов информации о системе
      if (Trim(edt1.Text) <> '') and (FileExists(edt1.Text)) then
      begin
        TBlobField(addresmain.FieldByName('SCHEMA')).LoadFromFile(edt1.Text);
      end;
      if (Trim(edt2.Text) <> '') and (FileExists(edt2.Text)) then
      begin
        TBlobField(addresmain.FieldByName('DOC')).LoadFromFile(edt2.Text);
      end;
      if (Trim(edt3.Text) <> '') and (FileExists(edt3.Text)) then
      begin
        TBlobField(addresmain.FieldByName('INFO')).LoadFromFile(edt3.Text);
      end;

      addresmain.Post;
    except
      //Обработка ошибоки при создании нового адреса
    end;
    if addres_korrekt.Active then
      addres_korrekt.Close;
    addres_korrekt.SQLs.SelectSQL.Text := 'SELECT INC, COD, CHEC, STREET, PHONE, TOWN FROM ADDRES ' +
      'where cod = :inc';
    addres_korrekt.Open;
    for i := 1 to StrToIntDef(sEdit6.Text, 0) do
    begin
      addresAppend; //Добавление новой записи в таблицу разъёмов
      addres_korrektCHEC.AsInteger := 0;
      addres_korrektCOD.AsInteger := addresmainINC.AsInteger;
      addres_korrektTOWN.AsInteger := 0;
      addres_korrektSTREET.AsString := streets[sComboBox4.ItemIndex] + ' ' + sEdit2.Text + ', дом ' + sEdit3.Text +
        ', корпус ' + sEdit4.Text + ', разъём ' + IntToStr(i);
      addres_korrektPHONE.AsString := sEdit5.Text;
      addres_korrekt.Post;
    end;
    try
      koncen.Open;
      koncenAppend; //Добавление новой записи  втаблицу концентраторов
      koncenNUMSCHIT.AsString := 'Концентратор №000001';
      koncenADDR.AsString := sEdit2.Text + ', дом ' + sEdit3.Text + ', корпус ' + sEdit4.Text;
      koncenPHONE.AsString := sEdit5.Text;
      koncenTIME_1.AsString := '000001';
      koncenCOD.AsInteger := addresmainINC.AsInteger;
      koncenIP_ADDRES.AsString := jvpdrs1.Text;
      koncen.Post;
    except
      //Обработка ошибок при создании нового адреса
    end;
    addres_korrekt.First;
    sLabel4.Caption := 'Добавление адреса: г.' + dm1.townTOWN.AsString + ', ' + dm1.addresmainADDR.AsString;
    jvpdrs2.Text := dm1.koncenIP_ADDRES.AsString;
    nb.PageIndex := 2;

  end;
end;

procedure TForm1.ActionAddSchBalExecute(Sender: TObject);
//Процедура добавления нового счётчика для суммирования при построении баланса
var
  addrTek: string;
  sql: TpFIBQuery;
begin
  if dm1.tmp_bal.IsEmpty then //Если в разъёме нет ни одного счетчика
    exit; //Выход из процедуры

  sql := TpFIBQuery.Create(nil);
  sql.Database := dm1.database;
  sql.Transaction := dm1.transact1;
  with sql do
    try
      SQL.Text := 'select inc from tmp_3xf where cod = :cod and ns = :ns';
      ParamByName('cod').AsInteger := dm1.tmp_summir.FieldByName('INC').AsInteger;
      ParamByName('ns').AsString := dm1.tmp_bal.FieldByName('NS').AsString;
      ExecQuery;
      if not Eof then
      begin
        Application.MessageBox(PChar('Счётчик ' + dm1.tmp_balNS.AsString + ' уже суммируется!'), 'Предупреждение', MB_OK
          + MB_ICONWARNING);
        Exit;
      end;
    finally
      Free;
    end;

  addrTek := dm1.addres_bal.FieldByName('street').AsString;
  addrTek := Copy(addrTek, Pos('разъём', addrTek), 8);
  tmp_3fxAppend;

  dm1.tmp_3xfNS.AsString := dm1.tmp_bal.FieldByName('NS').AsString;
  dm1.tmp_3xfSDF.AsString := dm1.tmp_bal.FieldByName('ADDR').AsString;
  dm1.tmp_3xfADDR.AsString := dm1.tmp_bal.FieldByName('KV').AsString;
  dm1.tmp_3xfCOD.AsInteger := dm1.tmp_summir.FieldByName('INC').AsInteger;
  dm1.tmp_3xfID_TMP.AsInteger := dm1.tmp_bal.FN('INC').AsInteger;
  try
    dm1.tmp_3xfKV.AsInteger := dm1.tmp_bal.FieldByName('KV').AsInteger;
  except
    dm1.tmp_3xfKV.AsInteger := -1;
  end;
  dm1.tmp_3xfFIO.AsString := addrTek;

  try
    dm1.tmp_3xf.Post;
  except

  end;
  dm1.tmp_3xf.Refresh;
end;

procedure TForm1.ActionAddRasBalExecute(Sender: TObject);
//Процедура добавления всех счетчиков разъёма при построении баланса
begin
  if not dm1.tmp_bal.IsEmpty then //Если в разъёме есть счётчики
  begin
    dm1.tmp_bal.First; //Перемещение на первую запись
    while not dm1.tmp_bal.Eof do //Пока есть счетчики
    begin
      ActionAddSchBal.Execute; //Добавление счетчика в таблицу построения баланса
      dm1.tmp_bal.Next; //перемещение к следующей записи
    end;
  end
  else
    Application.MessageBox('В разъёме нет ни одного счетчика', 'Предупреждение', MB_OK + MB_ICONEXCLAMATION);
end;

procedure TForm1.ActionAddRasExecute(Sender: TObject); //Добавление нового разъёма
var
  nomer: string;
begin
  if dm1.addres_korrekt.IsEmpty then
  begin
    addresAppend;
    dm1.addres_korrektCHEC.AsInteger := 2;
    dm1.addres_korrektCOD.AsInteger := dm1.addresmainINC.AsInteger;
    dm1.addres_korrektSTREET.AsString := dm1.addresmainADDR.AsString + ', разъём 1';
    dm1.addres_korrekt.Post
  end
  else
  begin
    dm1.addres_korrekt.Last;
    nomer := ReverseString(Trim(Copy(ReverseString(dm1.addres_korrektSTREET.AsString), 1, 2)));
    addresAppend;
    dm1.addres_korrektCHEC.AsInteger := 2;
    dm1.addres_korrektCOD.AsInteger := dm1.addresmainINC.AsInteger;
    dm1.addres_korrektSTREET.AsString := dm1.addresmainADDR.AsString + ', разъём ' + IntToStr(StrToInt(nomer) + 1);
    dm1.addres_korrekt.Post
  end;
end;

procedure TForm1.ActionAddSpisGorodovAddGorodExecute(Sender: TObject); //Заполнение комбобокса списком городов
begin
  TownBox.Items.Clear;
  dm1.townAdd.First;
  while not dm1.townAdd.Eof do
  begin
    TownBox.Items.Add(dm1.townAddTOWN.asString);
    dm1.townAdd.Next;
  end;
end;

procedure TForm1.ActionAllpostExecute(Sender: TObject); //Применение изменении в таблицах перого окошка
begin
  try
    if dm1.addresmain.Modified then
      dm1.addresmain.Post;
    if dm1.addres.Modified then
      dm1.addres.Post;
    if dm1.tmp.Modified then
      dm1.tmp.Post;
  except

  end;
end;

procedure TForm1.ActionBalanceExecute(Sender: TObject);
type
  ProcDll = procedure(pathBase: Pchar;
    pass: Pchar;
    user: Pchar;
    protocol: Pchar;
    Handle: HWND;
    ID: integer);

var
  DllHandle: THandle;
  CreateFormBalance: ProcDll;
  nameBase: PChar;
  user: Pchar;
  pass: Pchar;
  protocol: Pchar;
  hand: HWND;
  id: integer;
begin
  try
    DLLHandle := LoadLibrary(PChar(ExtractFilePath(Application.ExeName) + '\DLL\balance\exceldll.dll'));
  finally

  end;
  if DLLHandle = 0 then
  begin
    Application.MessageBox('Не найдена библиотека построения баланса', 'Ошибка', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  @CreateFormBalance := GetProcAddress(DLLHandle, 'CreateFormBalance');
  if @CreateFormBalance = nil then
  begin
    Application.MessageBox('Не удается загрузить окно построения баланса', 'Ошибка', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  nameBase := Pchar(dm1.database.DBName);
  pass := PChar('masterkey');
  user := PChar('sysdba');
  protocol := Pchar('firebird');
  hand := Handle;
  id := dm1.addresmainINC.AsInteger;
  CreateFormBalance(nameBase, pass, user, protocol, hand, id);
end;

procedure TForm1.ActionCloseAllExecute(Sender: TObject);
begin
  dm1.database.Close;
  Form1.Close;
end;

procedure TForm1.ActionFormAddNewSchethikShowExecute(Sender: TObject);
begin
  FormAddNewSchetchik.sSpinEdit1.Value := 1;
  FormAddNewSchetchik.ShowModal;
end;

procedure TForm1.ActionFormsCloseExecute(Sender: TObject);
begin
  //Закрытие октивных окон
  if FormPomesPotr.Visible then
    FormPomesPotr.Close;
  if FormNa1Chislo.Visible then
    FormNa1Chislo.Close;
  if FormVarTar.Visible then
    FormVarTar.Close;
  if FormDataVrem.Visible then
    FormDataVrem.Close;
  if FormTarNak.Visible then
    FormTarNak.Close;
  if FormPower.Visible then
    FormPower.Close;
end;

procedure TForm1.ImportAllStructure;
  procedure CloseAllCDS();
  var
    j: Integer;
  begin
    for j := 0 to dmExport_Import.ComponentCount - 1 do
    begin
      if dmExport_Import.Components[j] is TClientDataSet then
        (dmExport_Import.Components[j] as TClientDataSet).Close;
    end;
  end;
var
  i: integer;
  nomCounter: integer;
  error_duplicate: Boolean;
  sql: TpFIBQuery;
begin
  with dmExport_Import do
  begin
    CDS_addres.MasterSource := DSaddresmain;
    CDS_koncen.MasterSource := DSaddresmain;
    CDS_tmp.MasterSource := DSaddres;
    CDS_kv_konfig.MasterSource := DStmp;
    CDS_kv_konfig_arh.MasterSource := DStmp;
    CDS_arhiv.MasterSource := DStmp;
    CDS_profmain.MasterSource := DStmp;
    CDS_tmp_3xf.MasterSource := DStmp;

    CDS_addres.IndexFieldNames := 'COD';
    CDS_koncen.IndexFieldNames := 'COD';
    CDS_tmp.IndexFieldNames := 'COD';
    CDS_kv_konfig.IndexFieldNames := 'COD';
    CDS_kv_konfig_arh.IndexFieldNames := 'COD';
    CDS_arhiv.IndexFieldNames := 'COD';
    CDS_profmain.IndexFieldNames := 'COD';
    CDS_tmp_3xf.IndexFieldNames := 'COD';

    CDS_addresmain.MasterFields := 'INC';
    CDS_koncen.MasterFields := 'INC';
    CDS_addres.MasterFields := 'INC';
    CDS_tmp.MasterFields := 'INC';
    CDS_kv_konfig.MasterFields := 'INC';
    CDS_kv_konfig_arh.MasterFields := 'INC';
    CDS_arhiv.MasterFields := 'INC';
    CDS_profmain.MasterFields := 'INC';
    CDS_tmp_3xf.MasterFields := 'INC';
  end;
  sProgressBar3.Position := 0;
  sProgressBar3.Max := dmExport_Import.CDS_addresmain.RecordCount;

  //Проверка на существоВание адресов
  dmExport_Import.CDS_addresmain.First;
  while not dmExport_Import.CDS_addresmain.Eof do
  begin
    if dmExport_Import.CDS_addresmain.FieldByName('chec').AsInteger = 1 then
    begin
      if dm1.addresmain.Locate('ADDR', dmExport_Import.CDS_addresmain.FieldByName('ADDR').AsString, [loCaseInsensitive]) then
        case Application.MessageBox('ИмпортируемыЙ адрес уже существует.' + Chr(13) + 'Заменить - Да' +
          Chr(13) + 'Пропустить - Нет' +
          Chr(13) + 'Прервать - Отмена ', 'Предупреждение!!!', MB_YESNOCANCEL + MB_ICONINFORMATION) of
          7:
            begin
              dmExport_Import.CDS_addresmain.Edit;
              dmExport_Import.CDS_addresmain.FieldByName('chec').AsInteger := 0;
              dmExport_Import.CDS_addresmain.Post;
            end;
          2:
            begin
              CloseAllCDS;
              Exit;
            end;
          6: ActionDelAdresExecute(Self);
        end;
      Application.ProcessMessages;
    end;
    dmExport_Import.CDS_addresmain.Next;
  end;

  dm1.flagDobavlNewSchetch := true;
  dm1.addresmain.AllowedUpdateKinds := [ukModify, ukInsert, ukDelete];
  if dm1.addres_korrekt.Active then
    dm1.addres_korrekt.Close;
  dm1.addres_korrekt.SQLs.SelectSQL.Text := 'select * from addres where cod = :inc';
  dm1.addres_korrekt.DataSource := dm1.DSaddresmain;

  dmExport_Import.CDS_addresmain.First;
  Application.ProcessMessages;
  Screen.Cursor := crSQLWait;
  while not dmExport_Import.CDS_addresmain.Eof do
  begin
    if dmExport_Import.CDS_addresmain.FieldByName('chec').AsInteger = 1 then
    begin

      //---------Добавление нового адреса ------------
      addresmainAppend;
      for i := 1 to dmExport_Import.CDS_addresmain.Fields.Count - 1 do
        dm1.addresmain.FindField(dmExport_Import.CDS_addresmain.Fields[i].FieldName).AsVariant :=
          dmExport_Import.CDS_addresmain.Fields[i].AsVariant;
      dm1.addresmain.FN('rez').AsVariant := dm1.townINC.AsVariant;
      dm1.addresmain.Post;
      //*********************************

      //------------Добавление нового разъёма со счётчиками-----------
      dmExport_Import.CDS_addres.First;
      while not dmExport_Import.CDS_addres.Eof do
      begin
        addresAppend;
        for i := 1 to dmExport_Import.CDS_addres.Fields.Count - 1 do
          dm1.addres_korrekt.FindField(dmExport_Import.CDS_addres.Fields[i].FieldName).AsVariant :=
            dmExport_Import.CDS_addres.Fields[i].AsVariant;
        dm1.addres_korrektCOD.AsInteger := dm1.addresmainINC.AsInteger;
        dm1.addres_korrekt.Post;

        //Добавление счётчиков и данных о счётчиках
        dmExport_Import.CDS_tmp.First;
        sql := TpFIBQuery.Create(nil);
        sql.Database := dm1.database;
        sql.Transaction := dm1.transact1;

        while not dmExport_Import.CDS_tmp.Eof do
        begin
          tmpAppend;
          for i := 1 to dmExport_Import.CDS_tmp.Fields.Count - 1 do
            dm1.tmp_korrekt.FindField(dmExport_Import.CDS_tmp.Fields[i].FieldName).AsVariant :=
              dmExport_Import.CDS_tmp.Fields[i].AsVariant;
          dm1.tmp_korrektCOD.AsInteger := dm1.addres_korrektINC.AsInteger;
          sql.Close;
          sql.SQL.Text :=
            'select ns from tmp where ns = :ns and cod in (select inc from addres where cod = :inc_addresmain)';
          sql.ParamByName('inc_addresmain').AsInteger := dm1.addresmainINC.AsInteger;
          sql.ParamByName('ns').AsString := dm1.tmp_korrektNS.AsString;
          sql.ExecQuery;
          if not sql.Eof then
          begin
            sMemo2.Lines.Add('Повторяющийся номер счетчика: ' + dm1.tmp_korrektNS.AsString);
            dm1.tmp_korrektNS.AsString := '#' + dm1.tmp_korrektNS.AsString;
            sMemo2.Lines.Add('Заменен на: ' + '#' + dm1.tmp_korrektNS.AsString);
            sMemo2.Lines.Add('Рсположен:  ' + dm1.addres_korrektSTREET.AsString);
            sMemo2.Lines.Add('----------------------------');
          end;
          repeat
            error_duplicate := false;
            try
              dm1.tmp_korrekt.Post
            except
              error_duplicate := true;
              sMemo2.Lines.Add('Повторяющийся номер счетчика: ' + dm1.tmp_korrektNS.AsString);
              dm1.tmp_korrektNS.AsString := '###' + IntToStr(nomCounter);
              sMemo2.Lines.Add('Заменен на: ' + '###' + IntToStr(nomCounter));
              sMemo2.Lines.Add('Рсположен: ' + dm1.addres_korrektSTREET.AsString);
              sMemo2.Lines.Add('----------------------------');
              Inc(nomCounter);
            end;
          until (not error_duplicate);

          //Добавление данных в талицу kv_konfig
          dmExport_Import.CDS_kv_konfig.First;
          while not dmExport_Import.CDS_kv_konfig.Eof do
          begin
            if not dm1.kv_konfig_korrekt.Active then
              dm1.kv_konfig_korrekt.Open;
            dm1.kv_konfig_korrekt.Append;
            for i := 1 to dmExport_Import.CDS_kv_konfig.Fields.Count - 1 do
              try
                dm1.kv_konfig_korrekt.FindField(dmExport_Import.CDS_kv_konfig.Fields[i].FieldName).AsVariant :=
                  dmExport_Import.CDS_kv_konfig.Fields[i].AsVariant;
              except

              end;
            dm1.kv_konfig_korrekt.FN('cod').AsInteger := dm1.tmp_korrektINC.AsInteger;
            dm1.kv_konfig_korrekt.Post;
            dmExport_Import.CDS_kv_konfig.Next;
          end;

          //Добавление данных в талицу kv_konfig_arh
          dmExport_Import.CDS_kv_konfig_arh.First;
          while not dmExport_Import.CDS_kv_konfig_arh.Eof do
          begin
            if not dm1.kv_konfig_arh_korrekt.Active then
              dm1.kv_konfig_arh_korrekt.Open;
            dm1.kv_konfig_arh_korrekt.Append;
            dm1.kv_konfig_arh_korrekt.FN('cod').AsInteger := dm1.tmp_korrektINC.AsInteger;
            try
              for i := 2 to dmExport_Import.CDS_kv_konfig_arh.Fields.Count - 1 do
                dm1.kv_konfig_arh_korrekt.FindField(dmExport_Import.CDS_kv_konfig_arh.Fields[i].FieldName).AsVariant :=
                  dmExport_Import.CDS_kv_konfig_arh.Fields[i].AsVariant;
            except

            end;
            dm1.kv_konfig_arh_korrekt.Post;
            dmExport_Import.CDS_kv_konfig_arh.Next;
          end;

          //Добавление данных в талицу arhiv
          dmExport_Import.CDS_arhiv.First;
          while not dmExport_Import.CDS_arhiv.Eof do
          begin
            if not dm1.arhiv_korrekt.Active then
              dm1.arhiv_korrekt.Open;
            dm1.arhiv_korrekt.Append;
            dm1.arhiv_korrekt.FN('cod').AsInteger := dm1.tmp_korrektINC.AsInteger;
            try
              for i := 2 to dmExport_Import.CDS_arhiv.Fields.Count - 1 do
                dm1.arhiv_korrekt.FindField(dmExport_Import.CDS_arhiv.Fields[i].FieldName).AsVariant :=
                  dmExport_Import.CDS_arhiv.Fields[i].AsVariant;
            except

            end;
            dm1.arhiv_korrekt.Post;
            dmExport_Import.CDS_arhiv.Next;
          end;

          //Добавление данных в талицу profmain
          dmExport_Import.CDS_profmain.First;
          while not dmExport_Import.CDS_profmain.Eof do
          begin
            if not dm1.profmain_korrekt.Active then
              dm1.profmain_korrekt.Open;
            dm1.profmain_korrekt.Append;
            dm1.profmain_korrekt.FN('cod').AsInteger := dm1.tmp_korrektINC.AsInteger;
            try
              for i := 2 to dmExport_Import.CDS_profmain.Fields.Count - 1 do
                dm1.profmain_korrekt.FindField(dmExport_Import.CDS_profmain.Fields[i].FieldName).AsVariant :=
                  dmExport_Import.CDS_profmain.Fields[i].AsVariant;
            except

            end;
            dm1.profmain_korrekt.Post;
            dmExport_Import.CDS_profmain.Next;
          end;

          //Добавление данных в талицу tmp_3xf
          dmExport_Import.CDS_tmp_3xf.First;
          while not dmExport_Import.CDS_tmp_3xf.Eof do
          begin
            tmp_3fxAppend;
            dm1.tmp_3xf.FN('cod').AsInteger := dm1.tmp_korrektINC.AsInteger;
            try
              for i := 2 to dmExport_Import.CDS_tmp_3xf.Fields.Count - 1 do
                dm1.tmp_3xf.FindField(dmExport_Import.CDS_tmp_3xf.Fields[i].FieldName).AsVariant :=
                  dmExport_Import.CDS_tmp_3xf.Fields[i].AsVariant;
            except

            end;
            dm1.tmp_3xf.Post;
            dmExport_Import.CDS_tmp_3xf.Next;
          end;

          dmExport_Import.CDS_tmp.Next;
        end;

        dmExport_Import.CDS_addres.Next;
      end;
      //*********************************
      koncenAppend;
      try
        for i := 1 to dmExport_Import.CDS_koncen.Fields.Count - 1 do
          dm1.koncen.FindField(dmExport_Import.CDS_koncen.Fields[i].FieldName).AsVariant :=
            dmExport_Import.CDS_koncen.Fields[i].AsVariant;
      except

      end;
      dm1.koncenCOD.AsInteger := dm1.addresmainINC.AsInteger;
      dm1.koncen.Post;

    end;
    dmExport_Import.CDS_addresmain.Edit;
    dmExport_Import.CDS_addresmain.FieldByName('chec').AsInteger := 0;
    dmExport_Import.CDS_addresmain.Post;
    dmExport_Import.CDS_addresmain.Next;
    sProgressBar3.Position := sProgressBar3.Position + 1;
    Application.ProcessMessages;
  end;
  with dm1 do
  begin
    addres_korrekt.Close;
    koncen.Close;
    tmp_korrekt.Close;
    kv_konfig_korrekt.Close;
    kv_konfig_arh_korrekt.Close;
    tmp_3xf.Close;
    arhiv_korrekt.Close;
    profmain_korrekt.Close;
    addresmain.AllowedUpdateKinds := [ukModify, ukDelete];
    flagDobavlNewSchetch := false;
  end;
  CloseAllCDS;
  sql.Close;
  sql.Transaction := dm1.updateTransact;
  sql.SQL.Text := 'update tmp_3xf ' +
    'set id_tmp  = (select inc from tmp where tmp.ns = tmp_3xf.ns and tmp.cod in ' +
    '(select addres.inc from addres where addres.cod = ' +
    '(select addresmain.inc from addresmain where addresmain.inc = ' +
    '(select addres.cod from addres where addres.inc = (select tmp.cod from tmp where tmp.inc = tmp_3xf.cod)))))';
  sql.Transaction.StartTransaction;
  try
    sql.ExecQuery;
  except

  end;
  sql.Transaction.Commit;
  sql.Free;
  Screen.Cursor := crDefault;
  MessageBox(0, 'Импорт окончен!', 'Импорт', MB_ICONINFORMATION or MB_OK);
end;

procedure TForm1.ImportStructure;
//функция нахождения названия объекта
  function GetNameAddres(nameRaz: string): string;
  var
    street: string;
    house: string;
    korp: string;
  begin
    street := Copy(nameRaz, 1, Pos(',', nameRaz) - 1);
    house := Copy(nameRaz, Pos('дом ', nameRaz) + 4, Pos(', корпус', nameRaz) - Pos('дом ', nameRaz) - 4);
    if Trim(house) = '' then
      house := '0';
    korp := Copy(nameRaz, Pos('корпус ', nameRaz) + 7, Pos(', разъём', nameRaz) - Pos('корпус ', nameRaz) - 7);
    if Trim(korp) = '' then
      korp := '0';
    Result := street + ', дом ' + house + ', корпус ' + korp;
  end;
var
  i: integer;
  nomCounter: integer;
  error_duplicate: Boolean;
  sql: TpFIBQuery;
begin
  nomCounter := 0;
  dm1.addresmain.AllowedUpdateKinds := [ukModify, ukInsert, ukDelete];
  dm1.flagDobavlNewSchetch := true;
  sProgressBar3.Max := 0;
  if dm1.import.State = dsEdit then
    dm1.import.Post;
  dm1.import.First;
  if dm1.addres_korrekt.Active then
    dm1.addres_korrekt.close;
  dm1.addres_korrekt.SQLs.SelectSQL.Text :=
    'select * from addres where cod in (select inc from addresmain where rez = :inc) order by street';
  dm1.addres_korrekt.DataSource := dm1.DStown;
  dm1.addres_korrekt.Open;

  while not dm1.import.Eof do
  begin
    if dm1.importCHEC.AsInteger = 1 then
      if dm1.addres_korrekt.Locate('STREET', dm1.importSTREET.AsString, []) then
        case Application.MessageBox('ИмпортируемыЙ разъём уже существует.' + Chr(13) + 'Заменить - Да' +
          Chr(13) + 'Пропустить - Нет' +
          Chr(13) + 'Прервать - Отмена ', 'Предупреждение!!!', MB_YESNOCANCEL + MB_ICONINFORMATION) of
          7:
            begin
              dm1.import.Edit;
              dm1.importCHEC.AsInteger := 0;
              dm1.import.Post;
            end;
          2:
            begin
              dm1.addres_korrekt.Close;
              Exit;
            end;
        end;
    sProgressBar3.Max := sProgressBar3.Max + 1;
    dm1.import.Next;
  end;

  sql := TpFIBQuery.Create(nil);
  sql.Database := dm1.database;
  sql.Transaction := dm1.transact1;
  dm1.import.First;
  while not dm1.import.Eof do
  begin
    if dm1.importCHEC.AsInteger = 1 then
    begin
      //Если разъём существует
      if dm1.addres_korrekt.Locate('STREET', dm1.importSTREET.AsString, []) then
      begin
        //Заменяем его на такой же
        dm1.addres_korrekt.Delete;
        dm1.addresmain.Locate('ADDR', GetNameAddres(dm1.importSTREET.AsString), []);
        addresAppend;
        dm1.addres_korrektSTREET.AsString := dm1.importSTREET.AsString;
        dm1.addres_korrektCOD.AsInteger := dm1.addresmainINC.AsInteger;
        dm1.addres_korrektPHONE.AsString := '999999';
        dm1.addres_korrektTOWN.AsInteger := DBMemoNS.Lines.Count;
        dm1.addres_korrektCHEC.AsString := '0';
        dm1.addres_korrekt.Post;
      end
        //Если не существует
      else
      begin
        //Проверяем есть ли такой адрес
        //если адрес есть то просто добавляем разъём
        if dm1.addresmain.Locate('ADDR', GetNameAddres(dm1.importSTREET.AsString), []) then
        begin
          addresAppend;
          dm1.addres_korrektSTREET.AsString := dm1.importSTREET.AsString;
          dm1.addres_korrektCOD.AsInteger := dm1.addresmainINC.AsInteger;
          dm1.addres_korrektPHONE.AsString := '999999';
          dm1.addres_korrektTOWN.AsInteger := DBMemoNS.Lines.Count;
          dm1.addres_korrektCHEC.AsString := '0';
          dm1.addres_korrekt.Post;
        end
          //Если адреса нет то добавляем сначало его
          //а потом разъём
        else
        begin
          addresmainAppend;
          dm1.addresmainADDR.AsString := GetNameAddres(dm1.importSTREET.AsString);
          dm1.addresmainREZ.AsInteger := dm1.townINC.AsInteger;
          dm1.addresmainCHEC.AsInteger := 0;
          dm1.addresmainCHECKED.AsInteger := 0;
          dm1.addresmain.Post;
          koncenAppend;
          dm1.koncen.FieldByName('numschit').AsString := 'Концентратор № 000001';
          dm1.koncen.FieldByName('addr').AsString := GetNameAddres(dm1.importSTREET.AsString);
          dm1.koncen.FieldByName('phone').AsString := '999999';
          dm1.koncen.FieldByName('TIME_').AsString := '000001';
          dm1.koncen.FieldByName('TIME_1').AsString := '000001';
          dm1.koncen.FieldByName('cod').AsInteger := dm1.addresmainINC.AsInteger;
          dm1.koncen.Post;
          addresAppend;
          dm1.addres_korrektSTREET.AsString := dm1.importSTREET.AsString;
          dm1.addres_korrektCOD.AsInteger := dm1.addresmainINC.AsInteger;
          dm1.addres_korrektPHONE.AsString := '999999';
          dm1.addres_korrektTOWN.AsInteger := DBMemoNS.Lines.Count;
          dm1.addres_korrektCHEC.AsString := '0';
          dm1.addres_korrekt.Post;
        end;
      end;
      for i := 0 to DBMemoKV.Lines.Count - 1 do
      begin
        if DBMemoNS.Lines.Strings[i] = '' then
          Break;
        tmpAppend;
        try
          dm1.tmp_korrektKV.AsInteger := StrToInt(DBMemoKV.Lines.Strings[i]);
        except
          sMemo2.Lines.Add('Ошибка в номере квартиры для счётчика № ' + DBMemoNS.Lines.Strings[i]);
          sMemo2.Lines.Add('Установленный номер квартиры: 1');
          sMemo2.Lines.Add('Рсположен: ' + dm1.importSTREET.AsString);
          sMemo2.Lines.Add('----------------------------');
        end;
        try
          dm1.tmp_korrektSDF.AsInteger := StrToInt(DBMemoSDF.Lines.Strings[i]);
        except
          sMemo2.Lines.Add('Ошибка в поле вида счётчика для счётчика № ' + DBMemoNS.Lines.Strings[i]);
          sMemo2.Lines.Add('Установленный вид: однофазный');
          sMemo2.Lines.Add('Рсположен: ' + dm1.importSTREET.AsString);
          sMemo2.Lines.Add('----------------------------');
          dm1.tmp_korrektSDF.AsInteger := 1;
        end;
        case dm1.tmp_korrektSDF.AsInteger of
          1: dm1.tmp_korrektPPLAT.AsString := 'однофазный';
          2: dm1.tmp_korrektPPLAT.AsString := 'трёхфазный квартирный';
          3: dm1.tmp_korrektPPLAT.AsString := 'трёхфазный суммирующий';
          4: dm1.tmp_korrektPPLAT.AsString := 'трёхфазный общего потребления';
        end;
        dm1.tmp_korrektNS.AsString := DBMemoNS.Lines.Strings[i];
        if DBMemoVARTAR.Lines.Strings[i] <> '' then
          dm1.tmp_korrektPHONE.AsString := DBMemoVARTAR.Lines.Strings[i]
        else
          dm1.tmp_korrektPHONE.AsString := '9';
        dm1.tmp_korrektDESCRIPTION.AsString := DBMemoDESK.Lines.Strings[i];
        dm1.tmp_korrektLSCHET.AsInteger := 0;
        dm1.tmp_korrektCHEC.AsInteger := 0;

        sql.Close;
        sql.SQL.Text :=
          'select ns from tmp where ns = :ns and cod in (select inc from addres where cod = :inc_addresmain)';
        sql.ParamByName('inc_addresmain').AsInteger := dm1.addresmainINC.AsInteger;
        sql.ParamByName('ns').AsString := dm1.tmp_korrektNS.AsString;
        sql.ExecQuery;
        if not sql.Eof then
        begin
          sMemo2.Lines.Add('Повторяющийся номер счетчика: ' + dm1.tmp_korrektNS.AsString);
          dm1.tmp_korrektNS.AsString := '#' + dm1.tmp_korrektNS.AsString;
          sMemo2.Lines.Add('Заменен на: ' + '#' + dm1.tmp_korrektNS.AsString);
          sMemo2.Lines.Add('Рсположен: ' + dm1.addres_korrektSTREET.AsString);
          sMemo2.Lines.Add('----------------------------');
        end;

        repeat
          error_duplicate := false;
          try
            dm1.tmp_korrekt.Post
          except
            error_duplicate := true;
            sMemo2.Lines.Add('Повторяющийся номер счетчика: ' + dm1.tmp_korrektNS.AsString);
            dm1.tmp_korrektNS.AsString := '###' + IntToStr(nomCounter);
            sMemo2.Lines.Add('Заменен на: ' + '###' + IntToStr(nomCounter));
            sMemo2.Lines.Add('Рсположен: ' + dm1.importSTREET.AsString);
            sMemo2.Lines.Add('----------------------------');
            Inc(nomCounter);
          end;
        until (not error_duplicate);
        dm1.updateTransact.StartTransaction;
        dm1.sp_INSERT_COUNTER.Params[0].AsInteger := dm1.tmp_korrektINC.AsInteger;
        dm1.sp_INSERT_COUNTER.ExecProc;
      end;
    end;
    dm1.import.Edit;
    dm1.importCHEC.AsInteger := 0;
    dm1.import.Post;
    dm1.import.Next;
    sProgressBar3.StepIt;
  end;
  dm1.tmp_korrekt.Close;
  dm1.addres_korrekt.Close;
  dm1.addresmain.AllowedUpdateKinds := [ukModify, ukDelete];
  dm1.addresmain.ReopenLocate('inc');
  dm1.addres.ReopenLocate('inc');
  dm1.tmp.ReopenLocate('inc');
  dm1.flagDobavlNewSchetch := false;
  MessageBox(0, 'Импорт окончен!', 'Импорт', MB_ICONINFORMATION or MB_OK);
end;

procedure TForm1.ActionKoncentratorExecute(Sender: TObject);
begin
  ActionAllpost.Execute;
  nb.PageIndex := 5;
end;

procedure TForm1.ActionKorrectAdresExecute(Sender: TObject);
begin
  with dm1 do
  begin
    if addres_korrekt.Active then
      addres_korrekt.Close;
    addres_korrekt.SQLs.SelectSQL.Text := 'SELECT INC, COD, CHEC, STREET, PHONE, TOWN FROM ADDRES ' +
      'where cod = :inc';
    addres_korrekt.DataSource := DSaddresmain;
    addres_korrekt.Open;
    tmp_korrekt.Open;
    tmp_korrekt.AllowedUpdateKinds := [ukModify, ukDelete];
    koncen.Open;
  end;
  sLabel4.Caption := 'Корректировка адреса: г.' + dm1.townTOWN.AsString + ', ' + dm1.addresmainADDR.AsString;

  jvpdrs2.Text := dm1.koncenIP_ADDRES.AsString;

  if dm1.addresmainREPAIR.AsInteger = 1 then
  begin
    sCheckBox12.Checked := True;
  end
  else
  begin
    sCheckBox12.Checked := False;
  end;

  nb.PageIndex := 2;
end;

procedure TForm1.ActionNaznVarTar3xfExecute(Sender: TObject);
begin
  FormNaznVarTar.vid := 2;
  FormNaznVarTar.ShowModal;
end;

procedure TForm1.ActionNaznVarTar3xfSumExecute(Sender: TObject);
begin
  FormNaznVarTar.vid := 3;
  FormNaznVarTar.ShowModal;
end;

procedure TForm1.ActionNaznVarTarOdfExecute(Sender: TObject);
begin
  FormNaznVarTar.vid := 1;
  FormNaznVarTar.ShowModal;
end;

procedure TForm1.ActionNBExecute(Sender: TObject);
begin
  case nb.PageIndex of
    1: sBitBtn1Click(self);
    2: sBitBtn10Click(self);
    3: sBitBtn23Click(self);
    4: sBitBtn30Click(self);
    5: sBitBtn36Click(self);
    6: sBitBtn39Click(self);
    7: sBitBtn53Click(self);
    8: sBitBtn50Click(self);
    9: sBitBtn57Click(self);
    10: sBitBtn61Click(self);
  else
    exit
  end;
end;

procedure TForm1.ActionPereimAdrExecute(Sender: TObject);
const
  streets: array[0..20] of string = ('ул.',
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
  nazvUl: string;
  dom: string;
  korpus: string;
begin
  nazvanie := dm1.addresmainADDR.AsString;
  nazvUl := Trim(Copy(nazvanie, Pos(' ', nazvanie), Pos(',', nazvanie) - Pos(' ', nazvanie)));
  dom := Trim(Copy(nazvanie, Pos('дом', nazvanie) + 4, Pos(', корпус', nazvanie) - Pos('дом', nazvanie) - 4));
  korpus := Trim(Copy(nazvanie, Pos('корпус', nazvanie) + 6, 3));
  FormPereimAdr.sEdit1.Text := nazvUl;
  FormPereimAdr.sEdit2.Text := dom;
  FormPereimAdr.sEdit3.Text := korpus;
  FormPereimAdr.ShowModal;
end;

procedure TForm1.ActionPereimenRasExecute(Sender: TObject);
begin
  FormPereimRas.ShowModal;
end;

procedure TForm1.ActionPrintExecute(Sender: TObject);
begin
  FormPrint.ShowModal;
end;

procedure TForm1.ActionProgrNaChtenieExecute(Sender: TObject);
begin
  if not EditPassCounter then
  begin
    if not (sCheckBox3.Checked or sCheckBox4.Checked or
      sCheckBox5.Checked or sCheckBox6.Checked or
      sCheckBox7.Checked or sCheckBox8.Checked or
      sCheckBox9.Checked or sCheckBox10.Checked or
      sCheckBox11.Checked) then
    begin
      Application.MessageBox('Для опроса не выбрано ни одного параметра!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
      sCheckBox3.SetFocus;
      Exit
    end;
  end;

  dm2.addresmain_konc.Close;
  dm2.addres_konc.Close;
  dm2.tmp_konc.Close;
  dm2.transact.Active := false;
  dm2.addresmain_konc.Open;
  dm2.addres_konc.Open;
  dm2.tmp_konc.Open;

  if dm2.addresmain_konc.IsEmpty then
  begin
    if EditPassCounter then
      Application.MessageBox('Для смены пароля не выбрано ни одного обьекта!', 'Предупреждение!', MB_OK +
        MB_ICONWARNING)
    else
      Application.MessageBox('Для опроса не выбрано ни одного обьекта!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
    nb.PageIndex := 0;
    Exit;
  end;

  if dm2.addresmain_konc.RecordCount = 1 then
  begin
    if not dm2.addres_konc.IsEmpty then
    begin
      if not dm2.tmp_konc.IsEmpty then
      begin
        FormOpr.Show;
        Sleep(100);
        FormOpr.sBitBtn2Click(self);
      end
      else
      begin
        if EditPassCounter then
          Application.MessageBox('Для смены пароля не выбрано ни одного счётчика!', 'Предупреждение!', MB_OK +
            MB_ICONWARNING)
        else
          Application.MessageBox('Для опроса не выбрано ни одного счётчика!', 'Предупреждение!', MB_OK +
            MB_ICONWARNING);
        nb.PageIndex := 0;
        Exit;
      end;
    end
    else
    begin
      if EditPassCounter then
        Application.MessageBox('Для смены пароля не выбрано ни одного разъёма!', 'Предупреждение!', MB_OK +
          MB_ICONWARNING)
      else
        Application.MessageBox('Для опроса не выбрано ни одного разъёма!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
      nb.PageIndex := 0;
      Exit;
    end;
  end
  else
  begin
    FormOpr.ShowModal;
  end;
end;

procedure TForm1.ActionProgrNaSapisExecute(Sender: TObject);
var
  IniFile: TIniFile;
begin
  begin
    IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');

    sEdit15.Text := IniFile.ReadString('GPRS', 'APN', '');
    sEdit23.Text := IniFile.ReadString('GPRS', 'Login', '');
    sEdit24.Text := IniFile.ReadString('GPRS', 'Password', '');

    IniFile.Free;
  end;

  sCheckBox3.Checked := True;

  dm2.addresmain_konc.Close;
  dm2.addres_konc.Close;
  dm2.tmp_konc.Close;
  dm2.transact.Active := false;
  dm2.addresmain_konc.Open;
  dm2.addres_konc.Open;
  dm2.tmp_konc.Open;

  if dm2.addresmain_konc.IsEmpty then
  begin
    Application.MessageBox('Для записи не выбрано ни одного обьекта!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
    nb.PageIndex := 0;
    Exit;
  end;

  if dm2.addresmain_konc.RecordCount = 1 then
  begin
    if not dm2.addres_konc.IsEmpty then
    begin
      if not dm2.tmp_konc.IsEmpty then
      begin
        FormOpr.Show;
        Sleep(100);
        FormOpr.sBitBtn2Click(self);
      end
      else
      begin
        Application.MessageBox('Для записи не выбрано ни одного счётчика!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
        nb.PageIndex := 0;
        Exit;
      end;
    end
    else
    begin
      Application.MessageBox('Для записи не выбрано ни одного разъёма!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
      nb.PageIndex := 0;
      Exit;
    end;
  end
  else
  begin
    FormOpr.ShowModal;
  end;

end;

procedure TForm1.ActionProtokolObmenaExecute(Sender: TObject);
begin
  nb.PageIndex := 6;
end;

procedure TForm1.ActionSamSchetchikaExecute(Sender: TObject);
begin
  FormSamSchetchika.sEdit1.Text := dm1.tmp_korrektNS.OldValue;
  FormSamSchetchika.sEdit2.Text := dm1.tmp_korrektNS.NewValue;
  FormSamSchetchika.ShowModal;
end;

procedure TForm1.ActionSchitivatelExecute(Sender: TObject);
begin
  ActionAllpost.Execute;
  nb.PageIndex := 4;
end;

procedure TForm1.ActionShowHelpForLogExecute(Sender: TObject);
  function FindDataSch(nom: string): string;
  var
    sql: TpFIBQuery;
  begin
    sql := TpFIBQuery.Create(nil);
    with sql do
      try
        Database := dm1.database;
        Transaction := Database.DefaultTransaction;
        SQL.Text := 'select kv from tmp where ns = ''' + nom + '''';
        ExecQuery;
        Result := 'Квартира ' + FN('kv').AsString + #13#10;
        Close;
        SQL.Text := 'select STREET from addres where inc = (select cod from tmp where ns = ''' + nom + ''')';
        ExecQuery;
        Result := Result + FN('STREET').AsString;
      finally
        Free
      end;
  end;

begin
  if sRichEdit1.Focused then
    if (sRichEdit1.SelText <> '') and (Length(Trim(sRichEdit1.SelText)) = 6) and (StrToIntDef(sRichEdit1.SelText, 0) <>
      0) then
      sRichEdit1.Hint := FindDataSch(sRichEdit1.SelText)
    else
      sRichEdit1.Hint := '';

  if Log.Focused then
    if (Log.SelText <> '') and (Length(Trim(Log.SelText)) = 6) and (StrToIntDef(Log.SelText, 0) <> 0) then
      Log.Hint := FindDataSch(Trim(Log.SelText))
    else
      Log.Hint := '';
end;

procedure TForm1.ActionSniatVidelenieSoVsehSchetchikovAdresaExecute(
  Sender: TObject); //Процедура снятия выделения со всех счётчиков адреса
var
  sql: TpFIbQuery;
begin
  if not dm1.addres.Active then
    dm1.addres.Open;
  if not dm1.tmp.Active then
    dm1.tmp.Open;
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      dm1.updateTransact.StartTransaction;
      SQL.Text := 'UPDATE ADDRES SET chec = 0 where cod = ' + dm1.addresmain.FieldByName('INC').AsString;
      ExecQuery;
      SQL.Text := 'UPDATE TMP SET chec = 0 WHERE COD IN  (select inc from addres where cod = ' +
        dm1.addresmain.FieldByName('INC').AsString + ')';
      ExecQuery;
      dm1.updateTransact.Commit
    finally
      Free;
    end;
  ReopenAdrTmp;
end;

procedure TForm1.ActionSniatVidelenieSoVsehSchetchVRasExecute(Sender: TObject);
var
  sql: TpFIBQuery; //Процедура снятия выделения со всех счётчиков разъёма
begin
  if not dm1.tmp.Active then
    dm1.tmp.Open;
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      dm1.updateTransact.StartTransaction;
      SQL.Text := 'UPDATE ADDRESMAIN SET chec = 1 WHERE INC = ' + dm1.addresmainINC.AsString;
      ExecQuery;
      SQL.Text := 'UPDATE ADDRES SET chec = 0 WHERE INC = ' + dm1.addresINC.AsString;
      ExecQuery;
      SQL.Text := 'UPDATE TMP SET chec = 0 WHERE COD = ' + dm1.addresINC.AsString;
      ExecQuery;
      dm1.updateTransact.Commit
    finally
      Free;
    end;
  ReopenAdrTmp;
end;

procedure TForm1.ActionSpisokNeschitExecute(Sender: TObject);
begin
  try
    FormSpisokNeschit.neschit.Open;
    FormSpisokNeschit.ShowModal;
  except

  end;
end;

procedure TForm1.ActionVidelitVseSchetchikiExecute(Sender: TObject);
var
  sql: TpFIBQuery;
begin
  if dm1.addresmain.State = dsEdit then
    dm1.addresmain.Post;
  DBGridEh1.Cursor := crSQLWait;
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.updateTransact;
      dm1.updateTransact.StartTransaction;
      SQL.Text :=
        'Update tmp set chec = 1 where cod in (select inc from addres where cod in (select inc from addresmain where rez = ' +
        dm1.townINC.AsString + '))';
      ExecQuery;
      SQL.Text := 'update addres set chec = 1 where cod in (select inc from addresmain where rez = ' +
        dm1.townINC.AsString + ' and chec = 1)';
      ExecQuery;
      dm1.updateTransact.Commit;
    finally
      Free;
    end;
  ReopenAdrTmp;
  DBGridEh1.Cursor := crDefault;
end;

procedure TForm1.ActionVidelitVseSchetchikiVAdreseExecute(Sender: TObject);
var
  sql: TpFIbQuery; //Процедура выделения всех счётчиков в адресе
begin
  if not dm1.addres.Active then
    dm1.addres.Open;
  if not dm1.tmp.Active then
    dm1.tmp.Open;
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      dm1.updateTransact.StartTransaction;
      SQL.Text := 'UPDATE ADDRESMAIN SET chec = 1 where inc =' + dm1.addresmain.FieldByName('INC').AsString;
      ExecQuery;
      SQL.Text := 'UPDATE ADDRES SET chec = 1 where cod = ' + dm1.addresmain.FieldByName('INC').AsString;
      ExecQuery;
      SQL.Text := 'UPDATE TMP SET chec = 1 WHERE COD IN  (select inc from addres where cod = ' +
        dm1.addresmain.FieldByName('INC').AsString + ')';
      ExecQuery;
      dm1.updateTransact.Commit
    finally
      Free;
    end;
  ReopenAdrTmp;
end;

procedure TForm1.ActionVidelitVseShetchikiVRasExecute(Sender: TObject);
var
  sql: TpFIBQuery; //Процедура выделения всех счётчиков в разёме
begin
  if not dm1.tmp.Active then
    dm1.tmp.Open;
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      dm1.updateTransact.StartTransaction;
      SQL.Text := 'UPDATE ADDRESMAIN SET chec = 1 WHERE INC = ' + dm1.addresmainINC.AsString;
      ExecQuery;
      SQL.Text := 'UPDATE ADDRES SET chec = 1 WHERE INC = ' + dm1.addresINC.AsString;
      ExecQuery;
      SQL.Text := 'UPDATE TMP SET chec = 1 WHERE COD = ' + dm1.addresINC.AsString;
      ExecQuery;
      dm1.updateTransact.Commit
    finally
      Free;
    end;
  ReopenAdrTmp;
end;

procedure TForm1.ActionVidelitVseSummirExecute(Sender: TObject);
var
  sql: TpFIBQuery;
begin
  if dm1.addresmain.State = dsEdit then
    dm1.addresmain.Post;
  DBGridEh1.Cursor := crSQLWait;
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.updateTransact;
      dm1.updateTransact.StartTransaction;
      SQL.Text :=
        'Update tmp set chec = 1 where cod in (select inc from addres where cod in (select inc from addresmain where rez = ' +
        dm1.townINC.AsString + ')) and sdf = 3';
      ExecQuery;
      SQL.Text :=
        'Update tmp set chec = 0 where cod in (select inc from addres where cod in (select inc from addresmain where rez = ' +
        dm1.townINC.AsString + ' and chec = 1)) and sdf <> 3';
      ExecQuery;
      SQL.Text := 'update addres set chec = 0 where cod in (select inc from addresmain where rez = ' +
        dm1.townINC.AsString + ' and chec = 1)';
      ExecQuery;
      SQL.Text := 'update addres set chec = 1 where cod in (select inc from addresmain where rez = ' +
        dm1.townINC.AsString + ' and chec = 1) and inc in (select cod from tmp where chec = 1)';
      ExecQuery;
      dm1.updateTransact.Commit;
    finally
      Free;
    end;
  ReopenAdrTmp;
  DBGridEh1.Cursor := crDefault;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  if dlg1.Execute then
    edt1.Text := dlg1.FileName;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  if dlg1.Execute then
    edt2.Text := dlg1.FileName;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  if dlg1.Execute then
    edt3.Text := dlg1.FileName;
end;

procedure TForm1.btn4Click(Sender: TObject);
var
  sql: TpFIBQuery;
begin
  if not dm1.addresmain.IsEmpty then
  begin
    sql := TpFIBQuery.Create(nil);

    with sql do
      try
        Database := dm1.database;
        Transaction := dm1.database.DefaultUpdateTransaction;
        dm1.updateTransact.StartTransaction;
        SQL.Text := 'UPDATE addresmain set chec = 1 where REZHIM = 1 and rez =' + dm1.townINC.AsString;
        ExecQuery;
      finally
        Free;
      end;

    dm1.updateTransact.Commit;
    dm1.addresmain.ReopenLocate('inc');
  end;

end;

procedure TForm1.btn5Click(Sender: TObject);
var
  sql: TpFIBQuery;
begin
  if not dm1.addresmain.IsEmpty then
  begin
    sql := TpFIBQuery.Create(nil);

    with sql do
      try
        Database := dm1.database;
        Transaction := dm1.database.DefaultUpdateTransaction;
        dm1.updateTransact.StartTransaction;
        SQL.Text := 'UPDATE addresmain set chec = 1 where REZHIM = 0 and rez =' + dm1.townINC.AsString;
        ExecQuery;
      finally
        Free;
      end;

    dm1.updateTransact.Commit;
    dm1.addresmain.ReopenLocate('inc');
  end;
end;

procedure TForm1.btn6Click(Sender: TObject);
var
  sql: TpFIBQuery;
begin
  if not dm1.addresmain.IsEmpty then
  begin
    sql := TpFIBQuery.Create(nil);

    with sql do
      try
        Database := dm1.database;
        Transaction := dm1.database.DefaultUpdateTransaction;
        dm1.updateTransact.StartTransaction;
        SQL.Text := 'UPDATE addresmain set chec = 1 where rez =' + dm1.townINC.AsString;
        ExecQuery;
      finally
        Free;
      end;
    dm1.updateTransact.Commit;
    dm1.addresmain.ReopenLocate('inc');
  end;
end;

procedure TForm1.btn7Click(Sender: TObject);
var
  sql: TpFIBQuery;
begin
  if not dm1.addresmain.IsEmpty then
  begin
    sql := TpFIBQuery.Create(nil);

    with sql do
      try
        Database := dm1.database;
        Transaction := dm1.database.DefaultUpdateTransaction;
        dm1.updateTransact.StartTransaction;
        SQL.Text := 'UPDATE addresmain set chec = 0 where rez =' + dm1.townINC.AsString;
        ExecQuery;
      finally
        Free;
      end;
    dm1.updateTransact.Commit;
    dm1.addresmain.ReopenLocate('inc');
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  dm1.addresmain.ReopenLocate('inc');
end;

procedure TForm1.CloseDataBase;
begin
  try
    if dm1.TransactSaveTHread.Active then
      dm1.TransactSaveTHread.Commit;
    if dm1.updateTransact.Active then
      dm1.updateTransact.Commit;
    if dm1.transact1.Active then
      dm1.transact1.Rollback;
    if dm2.transact.Active then
      dm2.transact.Rollback;
  finally
    dm1.database.Close;
    dm1.databaseSaveThread.Close;
  end;
end;

procedure TForm1.DBEditEh1Exit(Sender: TObject); //Процедура применения коэффициента
begin //трансформациии для суммирующего счётчика
  if dm1.tmp_summir.State = dsEdit then
    dm1.tmp_summir.Post;
end;

procedure TForm1.DBEditEh2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
  begin
    Application.MessageBox('Пароль должен содержать только цифры!', 'Ошибка', MB_OK + MB_ICONERROR);
    key := #0
  end;
end;

procedure TForm1.IPExit(Sender: TObject);
begin
  if dm1.addresmain.State = dsEdit then
    dm1.addresmain.Post;
end;

procedure TForm1.jvpdrs2Exit(Sender: TObject);
begin
  dm1.koncen.Edit;
  dm1.koncenIP_ADDRES.AsString := jvpdrs2.Text;
  dm1.koncen.Post;
end;

procedure TForm1.DBGridEh11GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dm1.tmp_3xf.FieldByName('sdf').AsString = '4' then
    BackGround := $00FEF4A0
  else if dm1.tmp_3xf.FieldByName('sdf').AsString = '5' then
    BackGround := $00C4E4FD
  else
    BackGround := clWhite;
end;

procedure TForm1.DBGridEh12GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dm1.tmp_bal.FieldByName('sdf').AsString = '4' then
    BackGround := $00FEF4A0
  else if dm1.tmp_bal.FieldByName('sdf').AsString = '5' then
    BackGround := $00C4E4FD
  else
    BackGround := clWhite;
end;

procedure TForm1.DBGridEh13DblClick(Sender: TObject); //Закрытие окошка выбора разъёмов на первой странице
begin
  if sPanel32.Visible = false then
  begin
    dm1.tmp.Open;
    sPanel32.Visible := true
  end
  else
    sSpeedButton3Click(self);
end;

procedure TForm1.DBGridEh13Exit(Sender: TObject); //применение изменений в окошке разъёмов (addres)
begin
  if dm1.addres.State = dsEdit then
    dm1.addres.Post;
end;

procedure TForm1.DBGridEh14Exit(Sender: TObject); //Применение изменений в окошке счетчиков (tmp)
begin
  if dm1.tmp.State = dsEdit then
    dm1.tmp.Post;
end;

procedure TForm1.DBGridEh14GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dm1.tmp.FieldByName('sdf').AsString = '3' then
    BackGround := $00BBFDC1
  else if dm1.tmp.FieldByName('sdf').AsString = '4' then
    BackGround := $00FEF4A0
  else if dm1.tmp.FieldByName('sdf').AsString = '5' then
    BackGround := $00C4E4FD
  else
    BackGround := clWhite;
end;
{
procedure TForm1.DBGridEh1CellClick(Column: TColumnEh);
begin
 dm1.addresmain.ReopenLocate('inc');
  if dm1.addresmain.FieldByName('REPAIR').AsInteger = 1 then
    begin
    sBitBtn5.Enabled := false;
    sBitBtn6.Enabled := false;
    end
  else
    begin
    sBitBtn5.Enabled := true;
    sBitBtn6.Enabled := true;
    end;
end;      }

procedure TForm1.DBGridEh1DblClick(Sender: TObject);
begin
  if sPanel30.Visible = false then
  begin
    dm1.addres.Open;
    sPanel30.Visible := true;
  end
  else
    sSpeedButton2Click(self);
end;

procedure TForm1.DBGridEh1Exit(Sender: TObject);
begin
  if dm1.addresmain.State = dsEdit then
    dm1.addresmain.Post;
end;

procedure TForm1.DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dm1.addresmain.FieldByName('REPAIR').AsInteger = 1 then
  begin
    BackGround := clRed;
    AFont.Color := clWhite;
  end
  else
  begin
    BackGround := clWhite;
    AFont.Color := clBlack;
  end;

  if dm1.addresmain.FieldByName('REZHIM').AsInteger = 0 then
  begin
    AFont.Color := clBlue;
  end
  else if dm1.addresmain.FieldByName('REZHIM').AsInteger = 1 then
  begin
    AFont.Color := clGreen;
  end
  else
  begin
    AFont.Color := clBlack;
  end;
end;

procedure TForm1.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (dm1.addresmain.State = dsEdit) then //при нажаиии Enter
    dm1.addresmain.Post;
end;

procedure TForm1.DBGridEh3Exit(Sender: TObject); //Процедура потери фокуса таблицы
begin //коорректировки счетчиков
  if dm1.tmp_korrekt.Modified then
    dm1.tmp_korrekt.Post;
end;

procedure TForm1.DBGridEh3KeyPress(Sender: TObject; var Key: Char);
begin //Применение изменений в корекции счетчиков
  if (Key = #13) and (dm1.tmp_korrekt.State = dsEdit) then //при нажаиии Enter
    dm1.tmp_korrekt.Post;
end;

procedure TForm1.DBGridEh5GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dm1.tmp_1.FieldByName('sdf').AsString = '3' then
    BackGround := $00BBFDC1
  else if dm1.tmp_1.FieldByName('sdf').AsString = '4' then
    BackGround := $00FEF4A0
  else if dm1.tmp_1.FieldByName('sdf').AsString = '5' then
    BackGround := $00C4E4FD
  else
    BackGround := clWhite;

  if dm1.tmp_1.FieldByName('hashr').AsString = '0' then
  begin
    Background := clRed;
    AFont.Color := clWhite;
  end;
end;

procedure TForm1.DBGridEh6GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dm1.tmp_2.FieldByName('sdf').AsString = '3' then
    BackGround := $00BBFDC1
  else if dm1.tmp_2.FieldByName('sdf').AsString = '4' then
    BackGround := $00FEF4A0
  else if dm1.tmp_2.FieldByName('sdf').AsString = '5' then
    BackGround := $00C4E4FD
  else
    BackGround := clWhite;

  if dm1.tmp_2.FieldByName('hashr').AsString = '0' then
  begin
    Background := clRed;
    AFont.Color := clWhite;
  end;
end;

procedure TForm1.DBGridEh9GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  Background := $00BBFDC1;
end;

procedure TForm1.FindClick(Sender: TObject); //Процедура нахождения счётчика в окне протокола обиена
begin
  if Log.Focused then
    FindSchetchik(Trim(Log.SelText), 'NS');
  if sRichEdit1.Focused then
    FindSchetchik(Trim(sRichEdit1.SelText), 'NS');
  if sRichEdit2.Focused then
    FindSchetchik(Trim(sRichEdit2.SelText), 'NS');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveOptions; //Сохранение настроев при выходе из программы
  closeDataBase;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //****Установка свойств для SkinManager************
  DecimalSeparator := ',';
  sSkinManager1.SkinDirectory := NahCataloga(ParamStr(0)) + 'Skins';
  sSkinManager1.Active := True;
  nb.PageIndex := 0;
  sPanel32.Align := alClient;
  LoadOptions; //Загрузка настроек программы
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #27 then
    exit;
  case nb.PageIndex of
    1: sBitBtn1Click(self);
    2: sBitBtn10Click(self);
    3: sBitBtn23Click(self);
    4: sBitBtn30Click(self);
    5: sBitBtn36Click(self);
    6: sBitBtn39Click(self);
    7: sBitBtn53Click(self);
    8: sBitBtn50Click(self);
    9: sBitBtn57Click(self);
    10: sBitBtn61Click(self);
  else
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  FormCheckUser.ShowModal;
  FormOptions.LoadOptions;
  if not dm1.database.Connected then
  begin
    Application.Terminate;
    Exit;
  end
  else
  begin
    dm1.databaseSaveThread.DBName := dm1.database.DBName;
    dm1.databaseSaveThread.Open;
  end;
  Caption := Caption + GetMyVersion;
  ProverkaVersDb;
  dm1.town.Open;
  dm1.addresmain.Open;
  //Резервное корирование базы
  {if FormOptions.sCheckBox5.Checked then
    begin
      BackupThread := TBackUpThread.Create(true);
      BackupThread.FreeOnTerminate := true;
      BackupThread.Dbname := dm1.database.DBName;
      BackupThread.Priority := tpLowest;
      BackupThread.Resume;
    end;}
end;

procedure TForm1.KorrectPhoneExit(Sender: TObject);
begin
  if dm1.koncen.State = dsEdit then
    dm1.koncen.Post;
end;

procedure TForm1.LoadOptions;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
  sCheckBox3.Checked := IniFile.ReadBool('DannieObmena', 'VarTar', true);
  sCheckBox4.Checked := IniFile.ReadBool('DannieObmena', 'TarNac', false);
  sCheckBox5.Checked := IniFile.ReadBool('DannieObmena', 'Power', false);
  sCheckBox6.Checked := IniFile.ReadBool('DannieObmena', 'Tarif_1', false);
  sCheckBox7.Checked := IniFile.ReadBool('DannieObmena', 'Tarif_2', false);
  sCheckBox8.Checked := IniFile.ReadBool('DannieObmena', 'Tarif_3', false);
  sCheckBox9.Checked := IniFile.ReadBool('DannieObmena', 'Tarif_4', false);
  sCheckBox10.Checked := IniFile.ReadBool('DannieObmena', 'JurnalSob', false);
  sCheckBox11.Checked := IniFile.ReadBool('DannieObmena', 'ProfilNagr', false);
  sSpinEdit1.Value := IniFile.ReadInteger('DannieObmena', 'ProfilNagrCount', 10);
  ChBoxAutomCht.Checked := IniFile.ReadBool('DannieObmena', 'AutomatCht', true);
  DBLookupComboboxEh1.KeyValue := IniFile.ReadInteger('Options', 'Key_town', 0);
  sEdit15.Text := IniFile.ReadString('GPRS', 'APN', '');
  sEdit23.Text := IniFile.ReadString('GPRS', 'Login', '');
  sEdit24.Text := IniFile.ReadString('GPRS', 'Password', '');
  IniFile.Free;
end;

procedure TForm1.LogMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ActionShowHelpForLogExecute(self);
end;

procedure TForm1.MSWord1Click(Sender: TObject);
begin
  SaveLog(sRichEdit2);
end;

procedure TForm1.MSWord2Click(Sender: TObject);
begin
  if Log.Focused then
    SaveLog(Log);
  if sRichEdit1.Focused then
    SaveLog(sRichEdit1);
  if sRichEdit2.Focused then
    SaveLog(sRichEdit2);
end;

//Процедура изменения подключённой базы данных

procedure TForm1.N1041Click(Sender: TObject);
begin
  Form_Export_TEM_104.ShowModal;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  if dm1.addresmain.State = dsEdit then
    dm1.addresmain.Post;

  FormExport.ShowModal;
end;

procedure TForm1.N110Click(Sender: TObject);
var
  varTar: TStrings;
  i: Integer;
begin
  varTar := TStringList.Create;
  with Form_EditVarTar do
    try
      //Заполнение вкладки
      if not dm2.sys_bd.Active then
        dm2.sys_bd.Open;
      varTar.Text := dm2.sys_bd.FBN('VarTar_' + IntToStr((sender as TMenuItem).Tag)).AsString;
      num_varTar := (sender as TMenuItem).Tag;
      if varTar.Text = '' then
        exit;
      Caption := 'Редактирование варианта тарификации № ' + IntToStr((sender as TMenuItem).Tag);
      for i := varTar.Count to 384 do
        varTar.Add('');
      for i := 0 to frameVartar1.ComponentCount - 1 do
      begin
        if frameVartar1.Components[i].ClassName = 'TsMaskEdit' then
          (frameVartar1.Components[i] as TsMaskEdit).Text := varTar.Strings[(frameVartar1.Components[i] as
            TsMaskEdit).Tag];
        if frameVartar1.Components[i].ClassName = 'TsComboBox' then
          (frameVartar1.Components[i] as TsComboBox).Text := varTar.Strings[(frameVartar1.Components[i] as
            TsComboBox).Tag];
        if (frameVartar1.Components[i].ClassName = 'TsCheckBox') and (varTar.Strings[(frameVartar1.Components[i] as
            TsCheckBox).Tag] <> '') then
          (frameVartar1.Components[i] as TsCheckBox).Checked := StrToBoolDef(varTar.Strings[(frameVartar1.Components[i]
              as TsCheckBox).Tag], false);
      end;
      frameVartar1.sSpinEdit1.Text := varTar.Strings[1];
      frameVartar1.sComboBox1Change(self);
      frameVartar1.sComboBox3Change(self);
    finally
      ShowModal;
    end;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
  if not dm1.tmp_korrekt_FIO_licSch.Active then
    dm1.tmp_korrekt_FIO_licSch.Open;
  DBLookupComboboxEh2.KeyValue := dm1.addresmain.FN('inc').AsInteger;
  nb.PageIndex := 9;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  FormOptions.nb.PageIndex := 0;
  FormOptions.Show;
end;

procedure TForm1.N37Click(Sender: TObject);
begin
  FormOptions.sBitBtn9Click(self);
end;

procedure TForm1.N38Click(Sender: TObject);
begin
  FormOptions.sBitBtn10Click(self);
end;

procedure TForm1.N40Click(Sender: TObject);
begin
  FormAbout.ShowModal;
end;

procedure TForm1.N41Click(Sender: TObject);
var
  sql: TpFIBQuery;
  list_update: TStrings;
  i: Integer;
begin

  list_update := TStringList.Create;
  with list_update do
  begin
    Add('ALTER TABLE KV_KONFIG ADD DATE_POVERKA DATE');
    Add('ALTER TABLE TMP_3XF ADD KV INTEGER');
    Add('ALTER TABLE IMPORT ADD INC INTEGER NOT NULL  PRIMARY KEY');
    Add('CREATE GENERATOR GEN_IMPORT_ID');
    Add('CREATE trigger import_bi for import active before insert position 0 ' +
      'BEGIN IF (NEW.INC IS NULL) THEN NEW.INC = GEN_ID(GEN_IMPORT_ID,1); END');
    Add('update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENGTH = 100 where RDB$FIELD_NAME = ''RDB$137''');
    Add('update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENGTH = 100 where RDB$FIELD_NAME = ''RDB$129''');
    Add('update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENGTH = 100 where RDB$FIELD_NAME = ''RDB$240''');
    Add('ALTER TABLE ADDRESMAIN ADD HOME_COD VARCHAR(20)');
    Add('ALTER TABLE TMP ADD NDOG_2 VARCHAR(20)');
    Add('ALTER TABLE TMP ADD NDOG_3 VARCHAR(20)');
    Add('ALTER TABLE TMP ADD NDOG_4 VARCHAR(20)');
    Add('ALTER TABLE TMP ADD "PASSWORD" VARCHAR(6) DEFAULT 500001');
    Add('update RDB$FIELDS set RDB$FIELD_LENGTH = 20, RDB$CHARACTER_LENGTH = 20 where RDB$FIELD_NAME = ''RDB$470''');
    Add('ALTER INDEX NS INACTIVE');
    Add('DROP INDEX NS');
    Add('CREATE INDEX NS ON TMP (NS)');
    Add('ALTER INDEX TMP_3XFNS INACTIVE');
    Add('DROP INDEX TMP_3XFNS');
    Add('CREATE INDEX TMP_3XFNS ON TMP_3XF (NS)');
    Add('ALTER TABLE TMP_3XF ADD ID_TMP INTEGER');
    Add('ALTER TABLE TMP_3XF ADD CONSTRAINT FK_TMP_3XF_2 FOREIGN KEY (ID_TMP) REFERENCES TMP(INC) ' +
      'ON DELETE CASCADE ON UPDATE CASCADE');
    Add('update tmp_3xf ' +
      'set id_tmp  = (select inc from tmp where tmp.ns = tmp_3xf.ns and tmp.cod in ' +
      '(select addres.inc from addres where addres.cod = ' +
      '(select addresmain.inc from addresmain where addresmain.inc = ' +
      '(select addres.cod from addres where addres.inc = (select tmp.cod from tmp where tmp.inc = tmp_3xf.cod)))))');
    Add('ALTER TABLE ADDRESMAIN ADD LATITUDE  NUMERIC(10,6)');
    Add('ALTER TABLE ADDRESMAIN ADD LONGITUDE NUMERIC(10,6)');
    Add('ALTER TABLE ADDRESMAIN ADD REPAIR INTEGER');
    Add('ALTER TABLE ADDRESMAIN ADD BALANS VARCHAR(40)');
    Add('ALTER TABLE EXPORTENERGO ADD LIC_CH2 VARCHAR(15)');
    Add('ALTER TABLE EXPORTENERGO ADD LIC_CH3 VARCHAR(15)');
    Add('ALTER TABLE EXPORTENERGO ADD LIC_CH4 VARCHAR(15)');
    Add('ALTER TABLE KONCEN ADD IP_ADDRES VARCHAR(15)');
    Add('ALTER TABLE ADDRESMAIN ADD REZHIM INTEGER DEFAULT 0');
    Add('UPDATE ADDRESMAIN SET REZHIM = 0');
    Add('UPDATE TMP SET "PASSWORD" = 500001');
  end;

  sql := TpFIBQuery.Create(nil);
  sql.Database := dm1.database;
  sql.Transaction := dm1.updateTransact;
  sql.Transaction.StartTransaction;

  with sql do
    try
      for i := 0 to list_update.Count - 1 do
      begin
        Close;
        Transaction.StartTransaction;
        SQL.Clear;
        SQL.Text := list_update.Strings[i];
        try
          ExecQuery;
          Transaction.Commit;
          Close;
        except

        end;
      end;

      list_update.Clear;
      try
        list_update.LoadFromFile(ExtractFilePath(Application.ExeName) + '/Updates/1.txt');
        Close;
        Transaction.StartTransaction;
        SQL.Clear;
        SQL.Text := list_update.Text;
        ExecQuery;
        Transaction.Commit;
        list_update.Free;
        Close;
      except

      end;

    finally
      Free
    end;
  //Application.MessageBox('Структура таблицы успешно изменена','', MB_OK+MB_ICONINFORMATION);
end;

procedure TForm1.N43Click(Sender: TObject);
begin
  sSaveDialog1.Filter := 'Файлы конфигурации выделения|*.kfgv';
  sSaveDialog1.DefaultExt := 'kfgv';
  if sSaveDialog1.Execute then
    dm1.SaveKonfigCheckedToFile(sSaveDialog1.FileName);
end;

procedure TForm1.N44Click(Sender: TObject);
begin
  sOpenDialog1.Filter := 'Файлы конфигурации выделения|*.kfgv';
  if sOpenDialog1.Execute then
    dm1.LoadFonfigCheckedFromFile(sOpenDialog1.FileName);
end;

procedure TForm1.N45Click(Sender: TObject);
var
  OpenDialog: TsOpenDialog;
  ImportDataset: TClientDataSet;
  sql: TpFIBQuery;
begin
  OpenDialog := TsOpenDialog.Create(OpenDialog);
  OpenDialog.DefaultExt := 'exp';
  OpenDialog.Filter := 'Файлы экспорта структуры (*.exp)|*.exp|Файлы экспорта данных (*.zip)|*.zip';
  if not OpenDialog.Execute then
  begin
    OpenDialog.Free;
    sEdit1.SetFocus;
    exit;
  end;

  if (ExtractFileExt(OpenDialog.FileName) = '.exp') then
  begin
    ImportDataset := TClientDataSet.Create(ImportDataset);
    ImportDataset.LoadFromFile(OpenDialog.FileName);
    ImportDataset.Open;
    if ImportDataset.RecordCount = 0 then
    begin
      sMessageDlg('Файл импорта пуст', mtWarning, [mbOk], 0);
      exit
    end;

    DBGridEh8.DataSource := dm1.DSimport;
    DBGridEh8.Columns[1].FieldName := 'STREET';
    DBGridEh8.Columns[1].Title.Caption := 'Разъём';
    DBMemoKV.Visible := true;
    sLabel22.Visible := true;
    sql := TpFIBQuery.Create(nil);
    with sql do
      try
        Database := dm1.database;
        Transaction := dm1.database.DefaultUpdateTransaction;
        SQL.Text := 'delete from import';
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free
      end;

    dm1.import.CloseOpen(true);
    while not ImportDataset.Eof do
    begin
      with dm1 do
      begin
        import.Append;
        import.FieldByName('STREET').AsString := ImportDataset.FieldByName('STREET').AsString;
        import.FieldByName('KV').AsString := ImportDataset.FieldByName('KV').AsString;
        import.FieldByName('NS').AsString := ImportDataset.FieldByName('NS').AsString;
        import.FieldByName('SDF').AsString := ImportDataset.FieldByName('SDF').AsString;
        if ImportDataset.FieldCount > 5 then
        begin
          import.FieldByName('VARTAR').AsString := ImportDataset.FieldByName('VARTAR').AsString;
          import.FieldByName('DESK').AsString := ImportDataset.FieldByName('DESK').AsString;
        end;
        ImportCHEC.AsInteger := 1;
        Import.Post;
        ImportDataset.Next;
      end;
    end;
    sProgressBar3.Position := 0;
    DBLookupComboboxEh3.KeyValue := DBLookupComboboxEh1.KeyValue;
    nb.PageIndex := 10;
    sMemo2.SetFocus;
    vid_Export := 0;
  end
    //Старт импорта, если экспортый файл архив zip
  else if (ExtractFileExt(OpenDialog.FileName) = '.zip') then
  begin
    Screen.Cursor := crSQLWait;
    CreateDir(ExtractFilePath(Application.ExeName) + 'exp_tmp');
    dmExport_Import.ZipMaster1.ZipFileName := OpenDialog.FileName;
    dmExport_Import.ZipMaster1.Password := 'Delphi Project FZSoft';
    dmExport_Import.ZipMaster1.FSpecArgs.Add('*.fzs_exp');
    dmExport_Import.ZipMaster1.ExtrBaseDir := ExtractFilePath(Application.ExeName) + 'exp_tmp';
    dmExport_Import.ZipMaster1.ExtrOptions := dmExport_Import.ZipMaster1.ExtrOptions + [ExtrOverwrite];
    if dmExport_Import.ZipMaster1.Extract <> 0 then
    begin
      Application.MessageBox('Файл экспорта повреждён', 'Ошибка экспорта', MB_OK + MB_ICONERROR);
      Screen.Cursor := crDefault;
      Exit;
    end;
    DBGridEh8.DataSource := dmExport_Import.DSaddresmain;
    DBGridEh8.Columns[1].FieldName := 'ADDR';
    DBGridEh8.Columns[1].Title.Caption := 'Адрес';
    DBMemoKV.Visible := false;
    sLabel22.Visible := false;
    //Загрузка данных из файлов в ClientDataSet
    with dmExport_Import do
    begin
      CDS_addresmain.Close;
      CDS_addres.Close;
      CDS_tmp.Close;
      CDS_kv_konfig.Close;
      CDS_kv_konfig_arh.Close;
      CDS_arhiv.Close;
      CDS_tmp_3xf.Close;
      CDS_profmain.Close;
      CDS_sys_bd.Close;
      CDS_koncen.Close;
    end;

    try
      dmExport_Import.CDS_addresmain.LoadFromFile(ExtractFilePath(Application.ExeName) + 'exp_tmp\addresmain.fzs_exp');
      dmExport_Import.CDS_addresmain.Open;
    except
      Application.MessageBox(PChar('Неправильный формат файла '), 'Ошибка', MB_OK + MB_ICONERROR);
      Screen.Cursor := crDefault;
      Exit;
    end;

    try
      dmExport_Import.CDS_addres.LoadFromFile(ExtractFilePath(Application.ExeName) + 'exp_tmp\addres.fzs_exp');
      dmExport_Import.CDS_addres.Open;
    except
      Application.MessageBox(PChar('Неправильный формат файла '), 'Ошибка', MB_OK + MB_ICONERROR);
      Screen.Cursor := crDefault;
      Exit
    end;

    try
      dmExport_Import.CDS_tmp.LoadFromFile(ExtractFilePath(Application.ExeName) + 'exp_tmp\tmp.fzs_exp');
      dmExport_Import.CDS_tmp.Open;
    except
      Application.MessageBox(PChar('Неправильный формат файла '), 'Ошибка', MB_OK + MB_ICONERROR);
      Screen.Cursor := crDefault;
      Exit;
    end;

    try
      dmExport_Import.CDS_kv_konfig.LoadFromFile(ExtractFilePath(Application.ExeName) + 'exp_tmp\kv_konfig.fzs_exp');
      dmExport_Import.CDS_kv_konfig.Open;
    except
      Application.MessageBox(PChar('Неправильный формат файла '), 'Ошибка', MB_OK + MB_ICONERROR);
      Screen.Cursor := crDefault;
      Exit
    end;

    try
      dmExport_Import.CDS_kv_konfig_arh.LoadFromFile(ExtractFilePath(Application.ExeName) +
        'exp_tmp\kv_konfig_arh.fzs_exp');
      dmExport_Import.CDS_kv_konfig_arh.Open;
    except
      Application.MessageBox(PChar('Неправильный формат файла '), 'Ошибка', MB_OK + MB_ICONERROR);
      Screen.Cursor := crDefault;
      Exit
    end;

    try
      dmExport_Import.CDS_arhiv.LoadFromFile(ExtractFilePath(Application.ExeName) + 'exp_tmp\arhiv.fzs_exp');
      dmExport_Import.CDS_arhiv.Open;
    except
      Application.MessageBox(PChar('Неправильный формат файла '), 'Ошибка', MB_OK + MB_ICONERROR);
      Screen.Cursor := crDefault;
      Exit
    end;

    try
      dmExport_Import.CDS_tmp_3xf.LoadFromFile(ExtractFilePath(Application.ExeName) + 'exp_tmp\tmp_3xf.fzs_exp');
      dmExport_Import.CDS_tmp_3xf.Open;
    except
      Application.MessageBox(PChar('Неправильный формат файла '), 'Ошибка', MB_OK + MB_ICONERROR);
      Screen.Cursor := crDefault;
      Exit
    end;

    try
      dmExport_Import.CDS_profmain.LoadFromFile(ExtractFilePath(Application.ExeName) + 'exp_tmp\profmain.fzs_exp');
      dmExport_Import.CDS_profmain.Open;
    except
      Application.MessageBox(PChar('Неправильный формат файла '), 'Ошибка', MB_OK + MB_ICONERROR);
      Screen.Cursor := crDefault;
      Exit
    end;

    try
      dmExport_Import.CDS_sys_bd.LoadFromFile(ExtractFilePath(Application.ExeName) + 'exp_tmp\sys_bd.fzs_exp');
      dmExport_Import.CDS_sys_bd.Open;
    except
      Application.MessageBox(PChar('Неправильный формат файла '), 'Ошибка', MB_OK + MB_ICONERROR);
      Screen.Cursor := crDefault;
      Exit
    end;

    try
      dmExport_Import.CDS_koncen.LoadFromFile(ExtractFilePath(Application.ExeName) + 'exp_tmp\koncen.fzs_exp');
      dmExport_Import.CDS_koncen.Open;
    except
      Application.MessageBox(PChar('Неправильный формат файла '), 'Ошибка', MB_OK + MB_ICONERROR);
      Exit
    end;

    if dmExport_Import.CDS_addresmain.RecordCount = 0 then
    begin
      Application.MessageBox('Файл эксорта пуст', 'Предупреждение', MB_OK + MB_ICONINFORMATION);
      Screen.Cursor := crDefault;
      Exit
    end;

    DelDir(ExtractFilePath(Application.ExeName) + 'exp_tmp');
    sProgressBar3.Position := 0;
    vid_Export := 1;
    nb.PageIndex := 10;
    Screen.Cursor := crDefault;
  end
  else
    Application.MessageBox('Формат экспотра не поддерживается!', 'Предупреждение!', MB_OK + MB_ICONINFORMATION);

end;

procedure TForm1.N46Click(Sender: TObject);
begin
  FormOptions.nb.PageIndex := 1;
  FormOptions.ShowModal;
end;

procedure TForm1.N48Click(Sender: TObject);
begin
  Form_AutoUpload.ShowModal;
end;

procedure TForm1.N49Click(Sender: TObject);
var
  sql: TpFIBQuery;
  tempInc: integer;
begin
  if not (Application.MessageBox('Данная операция займет некоторое время!', 'Предупреждение', MB_OKCANCEL +
    MB_ICONWARNING) = ID_OK) then
    Exit;
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      Screen.Cursor := crSQLWait;

      //обновление значений генератора в таблице адресов
      SQL.Text := 'select max(inc) from addres';
      Transaction.StartTransaction;
      ExecQuery;
      tempInc := FN('max').AsInteger;
      Close;
      SQL.Text := 'set generator addres_gen to ' + IntToStr(tempInc);
      ExecQuery;
      close;

      //обновление значений генератора в таблице разъёмов
      SQL.Text := 'select max(inc) from addresmain';
      Transaction.StartTransaction;
      ExecQuery;
      tempInc := FN('max').AsInteger;
      Close;
      SQL.Text := 'set generator addresmain_gen to ' + IntToStr(tempInc);
      ExecQuery;
      Close;

      //обновление значений генератора в таблице концентраторов
      SQL.Text := 'select max(inc) from koncen';
      Transaction.StartTransaction;
      ExecQuery;
      tempInc := FN('max').AsInteger;
      Close;
      SQL.Text := 'set generator koncen_gen to ' + IntToStr(tempInc);
      ExecQuery;
      Close;

      //обновление значений генератора в таблице адресов
      SQL.Text := 'select max(inc) from tmp';
      Transaction.StartTransaction;
      ExecQuery;
      tempInc := FN('max').AsInteger;
      Close;
      SQL.Text := 'set generator tmp_gen to ' + IntToStr(tempInc);
      ExecQuery;
      close;

      //обновление значений генератора в таблице городов
      SQL.Text := 'select max(inc) from town';
      Transaction.StartTransaction;
      ExecQuery;
      tempInc := FN('max').AsInteger;
      Close;
      SQL.Text := 'set generator town_gen to ' + IntToStr(tempInc);
      ExecQuery;
      Close;

      //обновление значений генератора в таблице данных со счетчиков
      SQL.Text := 'select max(inc) from kv_konfig';
      Transaction.StartTransaction;
      ExecQuery;
      tempInc := FN('max').AsInteger;
      Close;
      SQL.Text := 'set generator kv_konfig_gen to ' + IntToStr(tempInc);
      ExecQuery;
      Close;

      //
      SQL.Text := 'select max(inc) from kv_konfig_arh';
      Transaction.StartTransaction;
      ExecQuery;
      tempInc := FN('max').AsInteger;
      Close;
      SQL.Text := 'set generator GEN_KV_KONFIG_ARH_ID to ' + IntToStr(tempInc);
      ExecQuery;
      Close;

      //
      SQL.Text := 'select max(inc) from arhiv';
      Transaction.StartTransaction;
      ExecQuery;
      tempInc := FN('max').AsInteger;
      Close;
      SQL.Text := 'set generator arhiv_gen to ' + IntToStr(tempInc);
      ExecQuery;
      Close;

      //
      SQL.Text := 'select max(UID) from addtmp';
      Transaction.StartTransaction;
      ExecQuery;
      tempInc := FN('max').AsInteger;
      Close;
      SQL.Text := 'set generator GEN_ADDTMP_ID to ' + IntToStr(tempInc);
      ExecQuery;
      Close;

      //
      SQL.Text := 'select max(inc) from tmp_3xf';
      Transaction.StartTransaction;
      ExecQuery;
      tempInc := FN('max').AsInteger;
      Close;
      SQL.Text := 'set generator tmp_3xf_gen to ' + IntToStr(tempInc);
      ExecQuery;
      Close;

      //
      SQL.Text := 'select max(inc) from profil';
      Transaction.StartTransaction;
      ExecQuery;
      tempInc := FN('max').AsInteger;
      Close;
      SQL.Text := 'set generator profil_gen to ' + IntToStr(tempInc);
      ExecQuery;
      Close;

      Transaction.Commit;
    finally
      Free;
      Screen.Cursor := crDefault;
      ShowMessage('Операция завершена успешно!');
    end;

end;

procedure TForm1.N50Click(Sender: TObject);
var
  sql: TpFIBQuery;
  list: TStrings;
  i: Integer;
begin
  if not (Application.MessageBox('Данная операция займет некоторое время!', 'Предупреждение', MB_OKCANCEL +
    MB_ICONWARNING) = ID_OK) then
    Exit;
  list := TStringList.Create;
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      Screen.Cursor := crSQLWait;

      SQL.Text := 'select inc from tmp ' +
        'where cod not in (select inc from addres)';
      Transaction.StartTransaction;
      ExecQuery;

      while not Eof do
      begin
        list.Add(FN('inc').AsString);
        Next
      end;

      Close;
      for i := 0 to List.Count - 1 do
      begin
        SQL.Text := 'delete from tmp where inc = ' + list.Strings[i];
        ExecQuery;
        Close;
      end;
      Transaction.Commit;
    finally
      Free;
      Screen.Cursor := crDefault;
      ShowMessage('Операция завершена успешно!');
    end;
end;

procedure TForm1.N51Click(Sender: TObject);
begin
  FormDelCounter.ShowModal;
end;

procedure TForm1.N52Click(Sender: TObject);
begin
  FormHistory.ShowModal;
end;

procedure TForm1.N56Click(Sender: TObject);
begin
  Form_AutoRead.ShowModal;
end;

procedure TForm1.N57Click(Sender: TObject);
var
  sql: TpFIBQuery;
begin
  if dm1.addresmain.State = dsEdit then
    dm1.addresmain.Post;
  DBGridEh1.Cursor := crSQLWait;
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.updateTransact;
      dm1.updateTransact.StartTransaction;
      SQL.Text :=
        'Update tmp set chec = 1 where cod in (select inc from addres where cod in (select inc from addresmain where rez = ' +
        dm1.townINC.AsString + ')) and hashr = 0';
      ExecQuery;
      SQL.Text :=
        'Update tmp set chec = 0 where cod in (select inc from addres where cod in (select inc from addresmain where rez = ' +
        dm1.townINC.AsString + ' and chec = 1)) and hashr = 1';
      ExecQuery;
      SQL.Text := 'update addres set chec = 0 where cod in (select inc from addresmain where rez = ' +
        dm1.townINC.AsString + ' and chec = 1)';
      ExecQuery;
      SQL.Text := 'update addres set chec = 1 where cod in (select inc from addresmain where rez = ' +
        dm1.townINC.AsString + ' and chec = 1) and inc in (select cod from tmp where chec = 1)';
      ExecQuery;
      dm1.updateTransact.Commit;
    finally
      Free;
    end;
  ReopenAdrTmp;
  DBGridEh1.Cursor := crDefault;
end;

procedure TForm1.N58Click(Sender: TObject);
begin
  Form_AutoUploadTeplo.ShowModal;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  FormPassword.ShowModal;
end;

procedure TForm1.nbPageChanged(Sender: TObject);
begin
  if nb.PageIndex = 0 then
  begin
    sCoolBar1.Visible := True;
    ToolButton1.Visible := True;
    ToolButton2.Visible := True;
  end
  else
  begin
    sCoolBar1.Visible := false;
    ToolButton1.Visible := false;
    ToolButton2.Visible := false;
  end;

  case nb.PageIndex of
    8:
      begin
        if sBitBtn51.Tag = 1 then
        begin
          sCheckBox4.Visible := false;
          sCheckBox5.Visible := false;
          sCheckBox6.Visible := false;
          sCheckBox7.Visible := false;
          sCheckBox8.Visible := false;
          sCheckBox9.Visible := false;
          sCheckBox10.Visible := false;
          sCheckBox14.Visible := True;
          sCheckBox14.Checked := False;
          sPanel36.Visible := false;
          sBitBtn52.Visible := false;
        end
        else if sBitBtn51.Tag = 3 then
        begin
          sCheckBox4.Visible := false;
          sCheckBox5.Visible := false;
          sCheckBox6.Visible := false;
          sCheckBox7.Visible := false;
          sCheckBox8.Visible := false;
          sCheckBox9.Visible := false;
          sCheckBox10.Visible := false;
          sCheckBox14.Visible := false;
          sGroupBox9.Visible := false;
          sPanel36.Visible := false;
          sBitBtn52.Visible := false;
        end
        else
        begin
          sCheckBox4.Visible := true;
          sCheckBox5.Visible := true;
          sCheckBox6.Visible := true;
          sCheckBox7.Visible := true;
          sCheckBox8.Visible := true;
          sCheckBox9.Visible := true;
          sCheckBox10.Visible := true;
          sCheckBox14.Visible := false;
          sGroupBox9.Visible := false;
          sPanel36.Visible := true;
          sBitBtn52.Visible := true;
        end;
      end;
  end;
end;

procedure TForm1.PeremSchetchikClick(Sender: TObject);
var
  nomRas: string;
begin
  FormPeremSchetchikaVDrRas.sLabel1.Caption := 'Переместить счётчик ' + dm1.tmp_korrektNS.AsString + ' из разъёма № ' +
    ReverseString(Trim(Copy(ReverseString(dm1.addres_korrektSTREET.AsString), 1, 2)));
  FormPeremSchetchikaVDrRas.sComboBox1.Items.Clear;
  dm1.addres.CloseOpen(true);
  dm1.addres.First;
  while not dm1.addres.Eof do
  begin
    nomRas := ReverseString(Trim(Copy(ReverseString(dm1.addresSTREET.AsString), 1, 2)));
    FormPeremSchetchikaVDrRas.sComboBox1.Items.Add(nomRas);
    FormPeremSchetchikaVDrRas.incAddres[StrToInt(nomRas)] := dm1.addresINC.AsString;
    dm1.addres.Next;
  end;
  FormPeremSchetchikaVDrRas.sComboBox1.ItemIndex := 0;
  FormPeremSchetchikaVDrRas.ShowModal;
end;

procedure TForm1.ProverkaVersDb;
var
  sql: TpFIBQuery;
  InsertStrVers: Boolean;
begin
  sql := TpFIBQuery.Create(nil);
  with sql do
    try
      Database := dm1.database;
      Transaction := dm1.database.DefaultUpdateTransaction;
      SQL.Text := 'select VERSIONPO from TABLEINFO';
      try
        Transaction.StartTransaction;
        ExecQuery;
        InsertStrVers := Eof;
        //Если номер версии не совпадает с номером в базе данных то вызываем процедуру обновления базы
        if FN('VersionPo').AsString <> GetMyVersion then
          if UpdateStructureDb(FN('VersionPo').AsString) then
          begin
            Close;
            Transaction.StartTransaction;
            //Процерка на существование хотябы одной записи в таблице
            if not InsertStrVers then
              SQL.Text := 'UPDATE TABLEINFO ' +
                ' SET VERSIONPO = ''' + GetMyVersion + ''''
            else
              SQL.Text := 'INSERT INTO TABLEINFO (ID, VERSIONPO) VALUES (1, ''' + GetMyVersion + ''')';
            ExecQuery;
            Transaction.Commit;
          end;
        //Исключение возникает если такой таблицы нет
      except
        Close;
        //Создание новой таблицы для хранения номера версии ПО
        Transaction.StartTransaction;
        SQL.Text := 'CREATE TABLE TABLEINFO (' +
          'ID INTEGER NOT NULL, ' +
          'VERSIONPO VARCHAR(20))';
        ExecQuery;
        SQL.Text := 'alter table TABLEINFO ' +
          'add constraint PK_TABLEINFO ' +
          'primary key (ID)';
        ExecQuery;
        Transaction.Commit;
        //Если структуру поменяли, то создаём запись
        //в таблице и заносим в неё номер поддерживаемой версии
        if UpdateStructureDb('3.0.0.7') then
        begin
          Close;
          Transaction.StartTransaction;
          SQL.Text := 'INSERT INTO TABLEINFO (ID, VERSIONPO) VALUES (1, ''' + GetMyVersion + ''')';
          ExecQuery;
          Transaction.Commit;
        end;
      end;
    finally
      Free
    end;
end;

procedure TForm1.ReopenAdrTmp;
begin
  dm1.addresmain.ReopenLocate('inc');
  if dm1.addres.Active then
    dm1.addres.ReopenLocate('inc');
  if dm1.tmp.Active then
    dm1.tmp.ReopenLocate('inc');
end;

procedure TForm1.SaveLog(log: TsRichEdit);
begin
  sSaveDialog1.Filter := 'Текстовый документ|*.doc*';
  sSaveDialog1.DefaultExt := 'doc';
  if sSaveDialog1.Execute then
    Log.Lines.SaveToFile(sSaveDialog1.FileName);
end;

procedure TForm1.SaveOptions;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(NahCataloga(ParamStr(0)) + 'options.ini');
  IniFile.WriteString('Options', 'PortKonc1', FormOptions.sComboBox2.Text);
  IniFile.WriteString('Options', 'CountDozvon1', FormOptions.sSpinEdit1.Text);
  IniFile.WriteString('Options', 'PortKonc2', FormOptions.sComboBox7.Text);
  IniFile.WriteString('Options', 'CountDozvon2', FormOptions.sSpinEdit4.Text);
  IniFile.WriteString('Options', 'PortSchit', FormOptions.sComboBox4.Text);
  IniFile.WriteBool('Options', 'EnableSkin', FormOptions.sCheckBox1.Checked);
  IniFile.WriteBool('Options', 'PolePrim', FormOptions.sCheckBox2.Checked);
  IniFile.WriteBool('Options', 'PoleDop', FormOptions.sCheckBox3.Checked);
  IniFile.WriteBool('Options', 'PoleHomeCod', FormOptions.sCheckBox7.Checked);
  IniFile.WriteBool('Options', 'LS_Tarrif', FormOptions.sCheckBox8.Checked);
  IniFile.WriteBool('Options', 'PoleLatitude', FormOptions.sCheckBox9.Checked);
  IniFile.WriteBool('Options', 'PoleLongitude', FormOptions.sCheckBox9.Checked);
  IniFile.WriteBool('Options', 'PoleBalans', FormOptions.sCheckBox10.Checked);
  IniFile.WriteBool('Options', 'SecondRead', FormOptions.schkSecondRead.Checked);

  IniFile.WriteInteger('Options', 'IndexSkin', FormOptions.sComboBox1.ItemIndex);
  IniFile.WriteString('Options', 'BaudRateConcentr1', FormOptions.sComboBox3.Text);
  IniFile.WriteString('Options', 'BaudRateConcentr2', FormOptions.sComboBox8.Text);
  IniFile.WriteString('Options', 'BaudRateSchit', FormOptions.sComboBox5.Text);
  IniFile.WriteString('Options', 'base', FormOptions.sEditFileBase.Text);
  IniFile.WriteBool('Options', 'passDefault', FormOptions.sCheckBox6.Checked);
  IniFile.WriteInteger('Options', 'Key_town', Integer(DBLookupComboboxEh1.KeyValue));
  IniFile.WriteInteger('Options', 'server', FormOptions.sRadioGroup1.ItemIndex);
  IniFile.WriteString('Options', 'Port_TCP/IP', FormOptions.sEdit4.Text);

  IniFile.WriteBool('DannieObmena', 'VarTar', sCheckBox3.Checked);
  IniFile.WriteBool('DannieObmena', 'TarNac', sCheckBox4.Checked);
  IniFile.WriteBool('DannieObmena', 'Power', sCheckBox5.Checked);
  IniFile.WriteBool('DannieObmena', 'Tarif_1', sCheckBox6.Checked);
  IniFile.WriteBool('DannieObmena', 'Tarif_2', sCheckBox7.Checked);
  IniFile.WriteBool('DannieObmena', 'Tarif_3', sCheckBox8.Checked);
  IniFile.WriteBool('DannieObmena', 'Tarif_4', sCheckBox9.Checked);
  IniFile.WriteBool('DannieObmena', 'JurnalSob', sCheckBox10.Checked);
  IniFile.WriteBool('DannieObmena', 'ProfilNagr', sCheckBox11.Checked);
  IniFile.WriteInteger('DannieObmena', 'ProfilNagrCount', sSpinEdit1.Value);
  IniFile.WriteBool('DannieObmena', 'AutomatCht', ChBoxAutomCht.Checked);

  IniFile.WriteFloat('Param', 'TimeOdinSch', FormOptions.sDecimalSpinEdit1.Value);
  IniFile.WriteInteger('Param', 'TimeIntervalPack', FormOptions.sSpinEdit2.Value);
  IniFile.WriteBool('Param', 'log', FormOptions.sCheckBox4.Checked);
  IniFile.WriteBool('Param', 'autoBackup', FormOptions.sCheckBox5.Checked);

  IniFile.WriteInteger('TEM_104', 'mode', FormOptions.sRadioGroup2.ItemIndex);
  IniFile.WriteInteger('TEM_104', 'CountRead', FormOptions.sSpinEdit3.Value);

  IniFile.WriteString('GPRS', 'APN', Form1.sEdit15.Text);
  IniFile.WriteString('GPRS', 'Login', Form1.sEdit23.Text);
  IniFile.WriteString('GPRS', 'Password', Form1.sEdit24.Text);

  IniFile.Free;
end;

procedure TForm1.sBitBtn10Click(Sender: TObject);
begin
  nb.PageIndex := 0;
  dm1.addresmain.AllowedUpdateKinds := [ukModify, ukDelete];
  dm1.addres_korrekt.Close;
  dm1.tmp_korrekt.Close;
end;

procedure TForm1.sBitBtn11Click(Sender: TObject);
begin
  if sPageControl1.ActivePageIndex = 0 then
    dm1.VarTar(dm1.tmp_1)
  else
    dm1.VarTar(dm1.tmp_2);
  FormVarTar.Show;
end;

procedure TForm1.sBitBtn12Click(Sender: TObject);
begin
  if sPageControl1.ActivePageIndex = 0 then
    dm1.DateTime(dm1.tmp_1)
  else
    dm1.DateTime(dm1.tmp_2);
  FormDataVrem.Show;
end;

procedure TForm1.sBitBtn13Click(Sender: TObject);
begin
  FormTEM_104.Load_TEM_104;
  FormTEM_104.ShowModal;
end;

procedure TForm1.sBitBtn14Click(Sender: TObject);
begin
  if sPageControl1.ActivePageIndex = 0 then
    dm1.TarNak(dm1.tmp_1)
  else
    dm1.TarNak(dm1.tmp_2);
  FormTarNak.Show;
end;

procedure TForm1.sBitBtn16Click(Sender: TObject);
begin
  if sPageControl1.ActivePageIndex = 0 then
    dm1.Power(dm1.tmp_1)
  else
    dm1.Power(dm1.tmp_2);
  FormPower.Show;
end;

procedure TForm1.sBitBtn17Click(Sender: TObject);
begin
  if sPageControl1.ActivePageIndex = 0 then
    dm1.MesPotr(dm1.tmp_1)
  else
    dm1.MesPotr(dm1.tmp_2);
  FormPomesPotr.Show;
end;

procedure TForm1.sBitBtn18Click(Sender: TObject);
begin
  if sPageControl1.ActivePageIndex = 0 then
    dm1.Na1ChisloMes(dm1.tmp_1)
  else
    dm1.Na1ChisloMes(dm1.tmp_2);
  FormNa1Chislo.Show;
end;

procedure TForm1.sBitBtn19Click(Sender: TObject);
begin
  if sPageControl1.ActivePageIndex = 0 then
    dm1.OtklPodkl(dm1.tmp_1)
  else
    dm1.OtklPodkl(dm1.tmp_2);
  FormOtklPodkl.Show;
end;

procedure TForm1.sBitBtn1Click(Sender: TObject);
begin
  nb.PageIndex := 0;
end;

procedure TForm1.sBitBtn20Click(Sender: TObject);
begin
  with FormProfil do
  begin
    if sPageControl1.ActivePageIndex = 0 then
    begin
      profmain.DataSource := dm1.DStmp_1;
      ns := dm1.tmp_1.FN('NS').AsString;
      Caption := 'Профиль нагрузки счётчика № ' + ns
    end
    else
    begin
      profmain.DataSource := dm1.DStmp_2;
      ns := dm1.tmp_2.FN('NS').AsString;
      Caption := 'Профиль нагрузки счётчика № ' + ns
    end;
    profmain.Open;
  end;
  FormProfil.ShowModal;
end;

procedure TForm1.sBitBtn21Click(Sender: TObject);
begin
  dmPrint.frxReport1.PreviewPages.Clear;
  if sPageControl1.TabIndex = 1 then
    FormPrint.PrintStrunktur(0)
  else if sPageControl1.TabIndex = 0 then
    FormPrint.PrintStrunktur(1);
end;

procedure TForm1.sBitBtn22Click(Sender: TObject);
begin
  try
    dm1.ViewText(dm1.addresmain.FieldByName('DESCRIPTION').AsString, false);
  except
    Application.MessageBox('Необходимо обновление программы. Обратитесь к разработчику.', 'Ошибка', MB_OK +
      MB_ICONERROR);
  end;
end;

procedure TForm1.sBitBtn23Click(Sender: TObject);
begin
  nb.PageIndex := 0;
  ActionNBExecute(self);
  dm1.tmp_2.Close;
  dm1.tmp_1.Close;
  dm1.addres_1.Close;
end;

procedure TForm1.sBitBtn24Click(Sender: TObject);
begin
  nb.PageIndex := 7;
  try
    dm1.tmp_summir.Open;
    dm1.addres_bal.Open;
    dm1.tmp_bal.Open;
    dm1.tmp_3xf.Open;
  except

  end;
end;

procedure TForm1.sBitBtn26Click(Sender: TObject);
begin
  sBitBtn51.Tag := 3; //Для последующего выбора действия при программировании
  pageKonc := (nb.PageIndex = 5);
  sLabel37.Caption := 'Программирование считывателя на запись';
  nb.PageIndex := 8;
end;

procedure TForm1.sBitBtn27Click(Sender: TObject);
begin
  EditPassCounter := False;
  sBitBtn51.Tag := 4; //Для последующего выбора действия при программировании
  pageKonc := (nb.PageIndex = 5);
  sLabel37.Caption := 'Программирование считывателя на чтение';
  nb.PageIndex := 8;
end;

procedure TForm1.sBitBtn28Click(Sender: TObject);
begin
  pageKonc := (nb.PageIndex = 5);
  if passwordDefault then
    FormPassSchit.sEdit1.Text := '000001';
  FormPassSchit.ShowModal;
end;

procedure TForm1.sBitBtn30Click(Sender: TObject);
begin
  nb.PageIndex := 0;
end;

procedure TForm1.sBitBtn31Click(Sender: TObject); //Кнопка программирования концентратора на запись
begin
  EditPassCounter := False;
  sBitBtn51.Tag := 1; //Для последующего выбора действия при программировании
  pageKonc := (nb.PageIndex = 5);
  sLabel37.Caption := 'Программирование концентратора на запись';
  //sCheckBox14.Visible := True;
  //sCheckBox14.Checked := False;
  nb.PageIndex := 8;
end;

procedure TForm1.sBitBtn32Click(Sender: TObject);
begin
  DBGridEh1.SetFocus;
end;

procedure TForm1.sBitBtn33Click(Sender: TObject); //Кнопка прграммирования концентратора на чтение
begin
  EditPassCounter := False;
  sBitBtn51.Tag := 2; //Для последующего выбора действия при программировании
  pageKonc := (nb.PageIndex = 5);
  sLabel37.Caption := 'Программирование концентратора на чтение';
  nb.PageIndex := 8;
end;

procedure TForm1.sBitBtn34Click(Sender: TObject); //Кнопка чтения данных с концентратора
begin
  pageKonc := (nb.PageIndex = 5);
  dm2.addresmain_konc.CloseOpen(true);
  FormFormirOprChtenie.sLabel2.Caption := 'Введите пароль для концентратора';
  FormFormirOprChtenie.ShowModal;
end;

procedure TForm1.sBitBtn35Click(Sender: TObject);
begin
  // Кнопка "Программирование концентратора на чтение"
  EditPassCounter := True;
  if Form_EditPassCounter.ShowModal <> mrOk then
    Exit;
  sBitBtn51.Tag := 2; //Для последующего выбора действия при программировании
  pageKonc := (nb.PageIndex = 5);
  sLabel37.Caption := 'Смена пароля счетчиков на чтение';
  nb.PageIndex := 8;

  sBitBtn51Click(self);

end;

procedure TForm1.sBitBtn36Click(Sender: TObject);
begin
  nb.PageIndex := 0;
end;

procedure TForm1.sBitBtn37Click(Sender: TObject);
begin
  SaveLog(Log);
end;

procedure TForm1.sBitBtn38Click(Sender: TObject);
begin
  nb.PageIndex := 8;
end;

procedure TForm1.sBitBtn39Click(Sender: TObject);
begin
  nb.PageIndex := 0;
end;

procedure TForm1.sBitBtn40Click(Sender: TObject);
begin
  Log.Clear;
  sRichEdit1.Clear;
  sRichEdit2.Clear;
end;

procedure TForm1.sBitBtn41Click(Sender: TObject);
begin
  with sBitBtn41 do
  begin
    if Tag = 0 then
    begin
      Port.Suspend;
      Caption := 'Продолжить';
      ImageIndex := 23;
      Tag := 1;
    end
    else
    begin
      Port.Resume;
      Caption := 'Пауза';
      ImageIndex := 25;
      Tag := 0;
    end;
  end;
end;

procedure TForm1.sBitBtn42Click(Sender: TObject);
begin
  Port.OtmenaBlokGlOkna;
  TerminateThread(Port.Handle, 0);
end;

procedure TForm1.sBitBtn47Click(Sender: TObject);
begin
  ActionBalanceExecute(self);
end;

procedure TForm1.sBitBtn48Click(Sender: TObject);
begin
  nb.PageIndex := 0;
  dm1.tmp_2.Close;
  dm1.tmp_1.Close;
  dm1.addres_1.Close;
  dm1.tmp_summir.Close;
  dm1.tmp_bal.Close;
  dm1.tmp_3xf.Close;
  dm1.addres_bal.Close;
end;

procedure TForm1.sBitBtn49Click(Sender: TObject);
begin
  nb.PageIndex := 0;
end;

//Процедура выделения/снятия галочек параметров опроса

procedure TForm1.sBitBtn50Click(Sender: TObject);
begin
  if pageKonc then
    nb.PageIndex := 5
  else
    nb.PageIndex := 4;
end;

procedure TForm1.sBitBtn51Click(Sender: TObject);
begin
  SaveOptions;
  case sBitBtn51.Tag of
    1: ActionProgrNaSapisExecute(self);
    2: ActionProgrNaChtenieExecute(self);
    3: ActionProgrNaSapisExecute(self); {программирование считывателя на запись edit 13.01.2013}
    4: ActionProgrNaChtenieExecute(self);
  else

  end;
end;

procedure TForm1.sBitBtn52Click(Sender: TObject);
begin
  if (Sender as TsBitBtn).Tag = 0 then
  begin
    sCheckBox3.Checked := true;
    sCheckBox4.Checked := true;
    sCheckBox5.Checked := true;
    sCheckBox6.Checked := true;
    sCheckBox7.Checked := true;
    sCheckBox8.Checked := true;
    sCheckBox9.Checked := true;
    sCheckBox10.Checked := true;
    sCheckBox11.Checked := true;
    (Sender as TsBitBtn).Caption := 'Снять всё';
    (Sender as TsBitBtn).Tag := 1;
  end
  else
  begin
    sCheckBox3.Checked := false;
    sCheckBox4.Checked := false;
    sCheckBox5.Checked := false;
    sCheckBox6.Checked := false;
    sCheckBox7.Checked := false;
    sCheckBox8.Checked := false;
    sCheckBox9.Checked := false;
    sCheckBox10.Checked := false;
    sCheckBox11.Checked := false;
    (Sender as TsBitBtn).Caption := 'Выделить всё';
    (Sender as TsBitBtn).Tag := 0;
  end;
end;

procedure TForm1.sBitBtn53Click(Sender: TObject);
begin
  nb.PageIndex := 3;
  dm1.tmp_summir.Close;
  dm1.tmp_bal.Close;
  dm1.tmp_3xf.Close;
  dm1.addres_bal.Close;
end;

procedure TForm1.sBitBtn54Click(Sender: TObject); //Кнопка найти
begin
  if sEdit1.Text = '' then
    exit;
  case sComboBox1.ItemIndex of
    3: FindSchetchik(sEdit1.Text, 'NS');
    2: FindSchetchik(sEdit1.Text, 'NDOG');
  end;
end;

procedure TForm1.sBitBtn55Click(Sender: TObject);
begin
  PeremSchetchikClick(self);
end;

procedure TForm1.sBitBtn57Click(Sender: TObject);
begin
  if dm1.tmp_korrekt_FIO_licSch.State = dsEdit then
    dm1.tmp_korrekt_FIO_licSch.Post;
  dm1.tmp_korrekt_FIO_licSch.Close;
  nb.PageIndex := 0;
end;

procedure TForm1.sBitBtn58Click(Sender: TObject);
var
  nom: integer;
begin
  nom := 1;
  with dm1 do
  begin
    tmp_korrekt_FIO_licSch.First;
    while not tmp_korrekt_FIO_licSch.Eof do
    begin
      tmp_korrekt_FIO_licSch.Edit;
      case tmp_korrekt_FIO_licSchSDF.AsInteger of
        1: tmp_korrekt_FIO_licSchFIO.AsString := 'Фам' + tmp_korrekt_FIO_licSchNDOG.AsString + 'Имя' +
          tmp_korrekt_FIO_licSchNDOG.AsString + 'Отч' + tmp_korrekt_FIO_licSchNDOG.AsString;
        3: tmp_korrekt_FIO_licSchFIO.AsString := 'Балансный|' + tmp_korrekt_FIO_licSchSPOL.AsString;
        4:
          begin
            tmp_korrekt_FIO_licSchFIO.AsString := 'Неквартирный учет' + FormatFloat('000', nom) + '|1';
            Inc(nom);
          end;
      end;
      tmp_korrekt_FIO_licSch.Post;
      tmp_korrekt_FIO_licSch.Next;
    end;
  end;
end;

procedure TForm1.sBitBtn59Click(Sender: TObject);
begin
  nb.PageIndex := 6;
end;

procedure TForm1.sBitBtn60Click(Sender: TObject);
begin
  FormTEM_104_Stat.ArhivTEM_104;
  FormTEM_104_Stat.ShowModal;
end;

procedure TForm1.sBitBtn61Click(Sender: TObject);
var
  i: Integer;
begin
  {with dmExport_Import do
    begin
      CDS_addres.IndexFieldNames := 'COD';
      CDS_koncen.IndexFieldNames := 'COD';
      CDS_tmp.IndexFieldNames := 'COD';
      CDS_kv_konfig.IndexFieldNames := 'COD';
      CDS_kv_konfig_arh.IndexFieldNames := 'COD';
      CDS_arhiv.IndexFieldNames := 'COD';
      CDS_profmain.IndexFieldNames := 'COD';
      CDS_tmp_3xf.IndexFieldNames := 'COD';

      CDS_addresmain.MasterFields := 'INC';
      CDS_addres.MasterFields := 'INC';
      CDS_tmp.MasterFields := 'INC';
    end;}
  dmExport_Import.DataModuleDestroy(dmExport_Import);
  nb.PageIndex := 0;
end;

procedure TForm1.sBitBtn62Click(Sender: TObject);
begin
  case vid_Export of
    0: ImportStructure;
    1: ImportAllStructure;
  end;
end;

procedure TForm1.sBitBtn63Click(Sender: TObject);
begin
  sBitBtn42Click(self);
  try
    Form1.Port := TDeviceThread.Create(true);
    Form1.Port.FreeOnTerminate := true;
    Form1.Port.flagTolkoChtenie := Form1.flagTolkoChtenie;
    Form1.flagTolkoChtenie := false;
    Form1.Port.flagSchitivatel := (Form1.sBitBtn51.Tag = 4);
    Form1.Port.stop := false;
    Form1.Port.Priority := tpHigher;
    Form1.Port.Resume;
  except

  end;
end;

procedure TForm1.sBitBtn64Click(Sender: TObject);
begin
  // Кнопка "Программирование концентратора на запись"
  EditPassCounter := True;
  if Form_EditPassCounter.ShowModal <> mrOk then
    Exit;
  sBitBtn51.Tag := 1; //Для последующего выбора действия при программировании
  pageKonc := (nb.PageIndex = 5);
  sLabel37.Caption := 'Смена пароля счетчиков на запись';
  nb.PageIndex := 8;

  sBitBtn51Click(self);
end;

procedure TForm1.sBitBtn65Click(Sender: TObject);
begin
  with dm1 do
  begin
    tmp_korrekt_FIO_licSch.First;
    while not tmp_korrekt_FIO_licSch.Eof do
    begin
      tmp_korrekt_FIO_licSch.Edit;
      case tmp_korrekt_FIO_licSchSDF.AsInteger of
        1: tmp_korrekt_FIO_licSchNDOG.AsString := sEdit16.Text + sEdit18.Text + sEdit17.Text + sEdit19.Text +
          FormatFloat(sEdit20.Text, tmp_korrekt_FIO_licSchKV.AsInteger) + sEdit21.Text;
        3: tmp_korrekt_FIO_licSchNDOG.AsString := sEdit16.Text + sEdit18.Text + sEdit17.Text + sEdit19.Text + '-111/' +
          sEdit7.Text + sEdit21.Text;
        4: tmp_korrekt_FIO_licSchNDOG.AsString := sEdit16.Text + sEdit18.Text + sEdit17.Text + sEdit19.Text + '-311/' +
          sEdit7.Text + sEdit21.Text;
      end;
      tmp_korrekt_FIO_licSch.Post;
      tmp_korrekt_FIO_licSch.Next;
    end;
  end;
end;

procedure TForm1.sBitBtn67Click(Sender: TObject);
begin
  FormBook.ShowModal;
end;

procedure TForm1.sBitBtn7Click(Sender: TObject);
begin
  FormRegistrNomer.ShowModal;
end;

procedure TForm1.sBitBtn8Click(Sender: TObject);
begin
  try
    dm1.ViewText(dm1.addresmain.FieldByName('DESCRIPTION').AsString, true);
  except
    Application.MessageBox('Необходимо обновление программы. Обратитесь к разработчику.', 'Ошибка', MB_OK +
      MB_ICONERROR);
  end;
end;

procedure TForm1.sBitBtn9Click(Sender: TObject);
begin
  nb.PageIndex := 0;
  dm1.addresmain.AllowedUpdateKinds := [ukModify, ukDelete];
  dm1.addres_korrekt.Close;
  dm1.tmp_korrekt.Close;
end;

procedure TForm1.sButton5Click(Sender: TObject);
begin
  nb.PageIndex := 4;
end;

procedure TForm1.sButton6Click(Sender: TObject);
begin
  nb.PageIndex := 5;
end;

procedure TForm1.sButton7Click(Sender: TObject);
begin
  nb.PageIndex := 6;
end;

procedure TForm1.sCheckBox12Exit(Sender: TObject);
begin
  if sCheckBox12.Checked = True then
  begin
    dm1.addresmain.Edit;
    dm1.addresmainREPAIR.AsInteger := 1;
    dm1.addresmain.Post;
  end
  else
  begin
    dm1.addresmain.Edit;
    dm1.addresmainREPAIR.AsInteger := 0;
    dm1.addresmain.Post;
  end;
end;

procedure TForm1.sCheckBox14Click(Sender: TObject);
begin
  if sCheckBox14.Checked = True then
  begin
    sGroupBox9.Visible := True;
  end
  else
  begin
    sGroupBox9.Visible := False;
  end;
end;

procedure TForm1.sCheckBox1Click(Sender: TObject);
begin
  sPanelLogSaveData.Visible := sCheckBox1.Checked;
end;

procedure TForm1.sCheckBox2Click(Sender: TObject);
begin
  if sCheckBox2.Checked then
    sCheckBox2.Caption := 'Связь через модем (вкл.)'
  else
    sCheckBox2.Caption := 'Связь через модем (выкл.)';
end;

procedure TForm1.sDBDateEdit1Exit(Sender: TObject);
begin
  dm1.addresmain.Edit;
  dm1.addresmainDATE_INSTAL.AsDateTime := sDBDateEdit1.Date;
  dm1.addresmain.Post;
end;

procedure TForm1.sDBRadioGroup1Exit(Sender: TObject);
begin
  if sDBRadioGroup1.ItemIndex = 0 then
  begin
    dm1.addresmain.Edit;
    dm1.addresmainREZHIM.AsInteger := 0;
    dm1.addresmain.Post;
  end
  else
  begin
    dm1.addresmain.Edit;
    dm1.addresmainREZHIM.AsInteger := 1;
    dm1.addresmain.Post;
  end;
end;

procedure TForm1.sEdit1KeyPress(Sender: TObject; var Key: Char); //Поиск счетчика
begin
  if key = #13 then
    sBitBtn54Click(self); //нажатие кнопки найти
end;

//Смена закладок в окне данных о счетчиках

procedure TForm1.sPageControl1Change(Sender: TObject);
begin
  ActionFormsClose.Execute;
  if sPageControl1.ActivePageIndex = 0 then
  begin
    dm1.kv_konfig.DataSource := dm1.Dstmp_1;
    dm1.kv_konfig.Open;
    dm1.addres_1.Open;
    dm1.tmp_1.Open;
    dm1.tmp_2.Close;
  end
  else
  begin
    dm1.kv_konfig.DataSource := dm1.DStmp_2;
    dm1.kv_konfig.Open;
    dm1.tmp_2.Open;
    dm1.tmp_1.Close;
    dm1.addres_1.Close;
  end;
end;

procedure TForm1.sRichEdit1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ActionShowHelpForLogExecute(self);
end;

procedure TForm1.sSpeedButton14Click(Sender: TObject);
begin
  Port.Priority := tpHigher;
  Port.Resume;
end;

procedure TForm1.sSpeedButton2Click(Sender: TObject);
begin
  if sPanel32.Visible then
    sSpeedButton3Click(self);
  if dm1.addres.Modified then
    dm1.addres.post;
  dm1.addres.Close;
  sPanel30.Visible := false;
end;

procedure TForm1.sSpeedButton3Click(Sender: TObject);
begin
  sPanel32.Visible := false;
  if dm1.tmp.Modified then
    dm1.tmp.Post;
  dm1.tmp.Close;
end;

procedure TForm1.sSpinEdit1Change(Sender: TObject);
var
  i: integer;
begin
  if (sSpinEdit1.Value >= 10) and (sSpinEdit1.Value <= 20) then
  begin
    sLabel38.Caption := 'дней';
    Exit
  end;
  i := sSpinEdit1.Value - (sSpinEdit1.Value div 10) * 10;
  case i of
    1: sLabel38.Caption := 'день';
    2, 3, 4: sLabel38.Caption := 'дня';
  else
    sLabel38.Caption := 'дней';
  end;
end;

procedure TForm1.sStatusBar1DblClick(Sender: TObject);
begin
  FormOptions.nb.PageIndex := 2;
  FormOptions.ShowModal;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Inc(timeOpr);
  SendMessage(Form1.sEdit8.Handle, WM_SETTEXT, 0, Lparam(LPCSTR(FormatFloat('00', timeOpr div 3600) + ':' +
    FormatFloat('00', timeOpr div 60) + ':' + FormatFloat('00', timeOpr mod 60))));
  //  sLabel18.Caption := FormatFloat('00', timeOpr div 3600) + ':' + FormatFloat('00', timeOpr div 60) + ':' + FormatFloat('00', timeOpr mod 60);
end;

procedure TForm1.TownBoxExit(Sender: TObject);
begin
  if TownBox.Text = '' then
    Exit;
  if not dm1.townAdd.Locate('town', TownBox.Text, [loCaseInsensitive]) then
  begin
    townAppend(TownBox.Text);
    ActionAddSpisGorodovAddGorod.Execute;
  end;
end;

procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  Form1.Visible := True;
end;

procedure TForm1.UpdateDB(versPO: Integer);
var
  sql: TpFIBQuery;
  list_update: TStrings;
  i: Integer;
begin

  list_update := TStringList.Create;
  with list_update do
  begin
    Add('ALTER TABLE KV_KONFIG ADD DATE_POVERKA DATE');
    Add('ALTER TABLE TMP_3XF ADD KV INTEGER');
    Add('ALTER TABLE IMPORT ADD INC INTEGER NOT NULL  PRIMARY KEY');
    Add('CREATE GENERATOR GEN_IMPORT_ID');
    Add('CREATE trigger import_bi for import active before insert position 0 ' +
      'BEGIN IF (NEW.INC IS NULL) THEN NEW.INC = GEN_ID(GEN_IMPORT_ID,1); END');
    Add('update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENGTH = 100 where RDB$FIELD_NAME = ''RDB$137''');
    Add('update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENGTH = 100 where RDB$FIELD_NAME = ''RDB$129''');
    Add('update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENGTH = 100 where RDB$FIELD_NAME = ''RDB$240''');
    Add('ALTER TABLE ADDRESMAIN ADD HOME_COD VARCHAR(20)');
    Add('ALTER TABLE TMP ADD "PASSWORD" VARCHAR(6) DEFAULT 500001');
    Add('update RDB$FIELDS set RDB$FIELD_LENGTH = 20, RDB$CHARACTER_LENGTH = 20 where RDB$FIELD_NAME = ''RDB$470''');
    if versPO < 36 then
    begin
      Add('ALTER INDEX NS INACTIVE');
      Add('DROP INDEX NS');
      Add('CREATE INDEX NS ON TMP (NS)');
      Add('ALTER INDEX TMP_3XFNS INACTIVE');
      Add('DROP INDEX TMP_3XFNS');
      Add('CREATE INDEX TMP_3XFNS ON TMP_3XF (NS)');
      Add('ALTER TABLE TMP_3XF ADD ID_TMP INTEGER');
      Add('ALTER TABLE TMP_3XF ADD CONSTRAINT FK_TMP_3XF_2 FOREIGN KEY (ID_TMP) REFERENCES TMP(INC) ' +
        'ON DELETE CASCADE ON UPDATE CASCADE');
      Add('update tmp_3xf ' +
        'set id_tmp  = (select inc from tmp where tmp.ns = tmp_3xf.ns and tmp.cod in ' +
        '(select addres.inc from addres where addres.cod = ' +
        '(select addresmain.inc from addresmain where addresmain.inc = ' +
        '(select addres.cod from addres where addres.inc = (select tmp.cod from tmp where tmp.inc = tmp_3xf.cod)))))');
      // Добавление таблицы типов счетчиков
      Add('CREATE TABLE COUNTER_TYPE (COUNTER_TYPE_ID INTEGER NOT NULL, NAME VARCHAR(50) NOT NULL)');
      Add('ALTER TABLE COUNTER_TYPE ADD CONSTRAINT PK_COUNTER_TYPE PRIMARY KEY (COUNTER_TYPE_ID)');
      Add('CREATE SEQUENCE GEN_COUNTER_TYPE_ID');
      Add('create trigger counter_type_bi for counter_type active before insert position 0 as ' +
        ' begin if (new.counter_type_id is null) then new.counter_type_id = gen_id(gen_counter_type_id,1); end');
      Add('ALTER TABLE TMP ADD ID_COUNTER_TYPE SMALLINT');
      Add('ALTER TABLE TMP ADD CONSTRAINT FK_TMP_2 FOREIGN KEY (ID_COUNTER_TYPE) REFERENCES ' +
        ' COUNTER_TYPE(COUNTER_TYPE_ID) ON DELETE CASCADE ON UPDATE CASCADE');
      Add('insert into counter_type (name) values (''ЭЭ 8003'')');
      Add('insert into counter_type (name) values (''ЭЭ 8005'')');
      Add('insert into counter_type (name) values (''ЭЭ 8007'')');
    end;
    if versPO < 38 then
      Add('insert into counter_type (name) values (''       '')');

    if versPO < 39 then
      Add('ALTER TABLE ADDRESMAIN ADD DATE_INSTAL DATE');

    if versPO < 41 then
    begin
      Add('ALTER TABLE TMP ADD COD_SCH VARCHAR(15)');
      Add('ALTER TABLE ADDRESMAIN ADD JEU VARCHAR(10)');
    end;

    if versPO < 42 then
    begin
      Add('ALTER TABLE ADDRESMAIN ADD "SCHEMA" BLOB SUB_TYPE 0 SEGMENT SIZE 4096');
      Add('ALTER TABLE ADDRESMAIN ADD DOC BLOB SUB_TYPE 0 SEGMENT SIZE 4096');
      Add('ALTER TABLE ADDRESMAIN ADD INFO BLOB SUB_TYPE 1 SEGMENT SIZE 4096 CHARACTER SET WIN1251');
    end;

    if versPO < 43 then
    begin
      Add('ALTER TABLE TMP ADD NDOG_2 VARCHAR(20)');
      Add('ALTER TABLE TMP ADD NDOG_3 VARCHAR(20)');
      Add('ALTER TABLE TMP ADD NDOG_4 VARCHAR(20)');
      Add('ALTER TABLE ADDRESMAIN ADD LATITUDE  NUMERIC(10,6)');
      Add('ALTER TABLE ADDRESMAIN ADD LONGITUDE NUMERIC(10,6)');
    end;

    if versPO < 46 then
    begin
      Add('ALTER TABLE ADDRESMAIN ADD REPAIR INTEGER');
      Add('ALTER TABLE ADDRESMAIN ADD BALANS VARCHAR(40)');
    end;

    if versPO < 47 then
    begin
      Add('ALTER TABLE KONCEN ADD IP_ADDRES VARCHAR(15)');
      Add('ALTER TABLE ADDRESMAIN ADD REZHIM INTEGER DEFAULT 0');
      Add('UPDATE ADDRESMAIN SET REZHIM = 0');
      //Add('UPDATE TMP SET "PASSWORD" = 500001');
    end;

  end;

  sql := TpFIBQuery.Create(nil);
  sql.Database := dm1.database;
  sql.Transaction := dm1.updateTransact;
  sql.Transaction.StartTransaction;

  with sql do
    try
      for i := 0 to list_update.Count - 1 do
      begin
        Close;
        Transaction.StartTransaction;
        SQL.Clear;
        SQL.Text := list_update.Strings[i];
        try
          ExecQuery;
          Transaction.Commit;
          Close;
        except

        end;
      end;

      list_update.Clear;
      try
        list_update.LoadFromFile(ExtractFilePath(Application.ExeName) + '/Updates/1.txt');
        Close;
        Transaction.StartTransaction;
        SQL.Clear;
        SQL.Text := list_update.Text;
        ExecQuery;
        Transaction.Commit;
        list_update.Free;
        Close;
      except

      end;

    finally
      Free
    end;

end;

function TForm1.UpdateStructureDb(vers: string): Boolean;
var
  myVersion: integer;
  DbVersion: integer;
begin
  myVersion := StrToIntDef(Copy(GetMyVersion, 7, 2), 0);
  DbVersion := StrToIntDef(Copy(vers, 7, 2), 0);

  if myVersion < DbVersion then
  begin
    Result := false;
    N41Click(self);
    Exit
  end;
  if Application.MessageBox('      Для правильной работы программы' + #13#10 +
    'необходимо обновить структуру базы данных!', 'Предупреждение', MB_YESNO + MB_ICONWARNING) <> IDYES then
  begin
    Result := false;
    Exit;
  end
  else
  begin
    Result := true;
    //N41Click(self);
    UpdateDB(DbVersion);
    FormExport.CreateTableExpGomel;
    ShowMessage('        Структура базы данных успешно обновлена' + #13#10 +
      'для возможности работы с данной версией ПО ' + GetMyVersion);
  end;

end;

end.

