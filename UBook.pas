unit UBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, StdCtrls, DBGridEhGrouping, GridsEh, DBGridEh,
  sEdit;

type
  TFormBook = class(TForm)
    ActionList1: TActionList;
    ActionSave: TAction;
    ActionSaveToFile: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N7: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    procedure N6Click(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBook: TFormBook;

implementation

uses Udm1;
{$R *.dfm}

procedure TFormBook.DBGridEh1Exit(Sender: TObject);
begin
  //if dm1.book.State = dsEdit then
  //  dm1.book.Post;
end;

procedure TFormBook.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  //if (Key = #13) and (dm1.book.State = dsEdit) then
  //  dm1.book.Post;
end;

procedure TFormBook.N6Click(Sender: TObject);
begin
  close;
end;

end.
