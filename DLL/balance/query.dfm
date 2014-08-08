object QueryForm: TQueryForm
  Left = 399
  Top = 284
  Width = 313
  Height = 71
  BorderIcons = []
  Caption = 'Построение запроса'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 16
    Width = 218
    Height = 13
    Caption = 'Идёт выполнение запроса. Ждите...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Animate1: TAnimate
    Left = 16
    Top = 16
    Width = 16
    Height = 16
    Active = True
    CommonAVI = aviFindFile
    StopFrame = 8
  end
end
