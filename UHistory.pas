unit UHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, ExtCtrls, sPanel, ComCtrls, sRichEdit;

type
  TFormHistory = class(TForm)
    sRichEdit1: TsRichEdit;
    sPanel1: TsPanel;
    sBitBtn1: TsBitBtn;
    procedure FormShow(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHistory: TFormHistory;

implementation

{$R *.dfm}

procedure TFormHistory.FormShow(Sender: TObject);
begin
  try
    sRichEdit1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'ReadMe.txt');
  except
    Application.MessageBox('Не найден файл истории версий!', 'О программе', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TFormHistory.sBitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.

