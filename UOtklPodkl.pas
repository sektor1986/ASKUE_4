unit UOtklPodkl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrameOtklPodkl, ComCtrls, sPageControl, StdCtrls, sMemo;

type
  TFormOtklPodkl = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    frameOtklPodkl1: TfarmeOtklPodkl;
    frameOtklPodkl2: TfarmeOtklPodkl;
    sMemo1: TsMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOtklPodkl: TFormOtklPodkl;

implementation

{$R *.dfm}

end.
