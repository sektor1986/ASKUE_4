unit UPassKoncSchit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sBevel, StdCtrls, Buttons, sBitBtn, sEdit, sLabel, sPanel,
  sCheckBox;

type
  TFormPassKonsSchit = class(TForm)
    sPanel1: TsPanel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sLabel3: TsLabel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sBevel1: TsBevel;
    sCheckBox1: TsCheckBox;
    procedure sEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sEdit1Change(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure ProgRead;     //действие при программирование на чтение
    procedure ProgrWrite;   //действие при программировании на запись
  public
    { Public declarations }
  end;

var
  FormPassKonsSchit: TFormPassKonsSchit;

implementation

uses UFormOpr, Unit1, UEditPassCounter;

{$R *.dfm}

procedure TFormPassKonsSchit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormPassKonsSchit.Tag = 0 then
    FormOpr.StopTComThread;
end;

procedure TFormPassKonsSchit.FormShow(Sender: TObject);
begin
  if Form1.sBitBtn51.Tag in [1,3] then
    sLabel3.Caption := 'на запись'
  else
    sLabel3.Caption := 'на чтение';
  if not sCheckBox1.Checked then
    begin
      sEdit1.Clear;
      sEdit2.Clear;
    end;
  if Form1.passwordDefault and (Form1.sBitBtn51.Tag in [2,4]) then
    begin
      sEdit1.Text := '000001';
      sEdit2.Text := '000001';
    end;
 { if Form1.passwordDefaultNote and (Form1.sBitBtn51.Tag in [1,3]) then
    begin
      sEdit1.Text := '500001';
      sEdit2.Text := '500001';
    end ;      }
 { else
     begin
     if (Form1.passwordDefaultNote = False) and (Form1.sBitBtn51.Tag in [1,3]) then
        begin
           sEdit1.Visible := False;
           sLabel1.Visible := False;
           sLabel3.Visible := False;
        end;
     end;     }

  if Form1.EditPassCounter then
    begin
      sEdit1.Text := Form_EditPassCounter.sEdit1.Text;
      sEdit2.Text := '000001';
    end;  
  FormPassKonsSchit.Tag := 0;
end;

procedure TFormPassKonsSchit.ProgRead;
begin
  with Form1 do
    begin
      sLabel19.Caption := 'Считано:';
      sLabel21.Caption := 'Не считано:';
      sLabel23.Visible := True;
      sEdit11.Visible := True;
    end;
end;

procedure TFormPassKonsSchit.ProgrWrite;
begin
  with Form1 do
    begin
      sLabel19.Caption := 'Записано:';
      sLabel21.Caption := 'Не записано:';
      sLabel23.Visible := False;
      sEdit11.Visible := False;
    end;
end;

procedure TFormPassKonsSchit.sBitBtn1Click(Sender: TObject);
var
  i: Integer;
begin
  if Length(sEdit1.Text) <> 6 then
    begin
      Application.MessageBox('Пароль для счётчиков должен иметь 6 знаков!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
      sEdit1.SetFocus;
      exit;
    end;

  if Length(sEdit2.Text) <> 6 then
    begin
      Application.MessageBox('Пароль для концентратора/считывателя должен иметь 6 знаков!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
      sEdit2.SetFocus;
      exit;
    end;

  case Form1.sBitBtn51.Tag of
  1: ProgrWrite;                  //Если программируем на запись
  2: ProgRead;                    //Если программиуем на чтение
  3: ProgrWrite;
  4: ProgRead;
  else

  end;
  Form1.nb.PageIndex := 6;        //Переход на страницу протокола обмена
  Form1.Port.stop := false;
  FormOpr.Close;
  //----------Заполнение паролей----------------
  for i := 0 to Length(Form1.Port.massivOprosa) - 1 do
    begin
      Form1.Port.massivOprosa[i, 0, 0, 3] := sEdit2.Text;
      Form1.Port.massivOprosa[i, 0, 0, 4] := sEdit1.Text;
      if Form1.EditPassCounter then
        begin
          Form1.Port.massivOprosa[i, 0, 0, 8] := Form_EditPassCounter.sEdit2.Text;
        end
      else
        begin
          Form1.Port.massivOprosa[i, 0, 0, 8] := sEdit1.Text;
        end;

      Form1.massivOprosa[i, 0, 0, 3] := Form1.Port.massivOprosa[i, 0, 0, 3];
      Form1.massivOprosa[i, 0, 0, 4] := Form1.Port.massivOprosa[i, 0, 0, 4];
      Form1.massivOprosa[i, 0, 0, 8] := Form1.Port.massivOprosa[i, 0, 0, 8];
    end;
  //********************************
  Form1.Port.Priority := tpHigher;
  Form1.Port.Resume;
  FormPassKonsSchit.Tag := 1;     //Используется при закрытии формы для завершения потока
  Close;
end;

procedure TFormPassKonsSchit.sBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormPassKonsSchit.sEdit1Change(Sender: TObject);
begin
  if Length((Sender as TsEdit).Text) = 6 then
    (Sender as TsEdit).Color := clWindow
  else
    (Sender as TsEdit).Color := $00D5D5FF;
end;

procedure TFormPassKonsSchit.sEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if  not (key in['0'..'9', #8]) then
    key := #0;
end;

end.
