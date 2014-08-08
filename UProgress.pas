unit UProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sGauge, ExtCtrls;

type
  TFormProgress = class(TForm)
    Panel1: TPanel;
    sGauge1: TsGauge;
    sLabel1: TsLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProgress: TFormProgress;

implementation

{$R *.dfm}

end.
