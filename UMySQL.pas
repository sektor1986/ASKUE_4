unit UMySQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZConnection;

type
  TForm_MySQL = class(TForm)
    ZConnection1: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_MySQL: TForm_MySQL;

implementation

{$R *.dfm}

end.
