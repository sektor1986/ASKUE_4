unit UView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, sDialogs, Menus, StdCtrls, sMemo;

type
  TFormView = class(TForm)
    sMemo1: TsMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    sSaveDialog1: TsSaveDialog;
    FontDialog1: TFontDialog;
    PrintDialog1: TPrintDialog;
    ActionList1: TActionList;
    ActionSave: TAction;
    ActionSaveToFile: TAction;
    N7: TMenuItem;
    ActionFont: TAction;
    PopupMenu1: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure N6Click(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure ActionSaveToFileExecute(Sender: TObject);
    procedure ActionFontExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    save: Boolean;
  end;

var
  FormView: TFormView;

implementation

uses Udm1;

{$R *.dfm}

procedure TFormView.ActionFontExecute(Sender: TObject);
begin
if FontDialog1.Execute then
  sMemo1.Font := FontDialog1.Font;
end;

procedure TFormView.ActionSaveExecute(Sender: TObject);
begin
try
  dm1.addresmain.Edit;
  dm1.addresmain.FieldByName('DESCRIPTION').AsString := sMemo1.Text;
  dm1.addresmain.Post;
except
  Application.MessageBox('Ошибка при сохранении', 'Ошибка', MB_OK + MB_ICONERROR);
end;
end;

procedure TFormView.ActionSaveToFileExecute(Sender: TObject);
begin
if sMemo1.Text <> '' then
  if sSaveDialog1.Execute then
  sMemo1.Lines.SaveToFile(sSaveDialog1.FileName);
end;

procedure TFormView.N6Click(Sender: TObject);
begin
close;
end;

end.
