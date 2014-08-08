unit query;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TQueryForm = class(TForm)
    Animate1: TAnimate;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryForm: TQueryForm;

implementation

{$R *.DFM}

procedure TQueryForm.FormActivate(Sender: TObject);
begin
// Animate1.Play
end;

end.
