object FormView: TFormView
  Left = 320
  Top = 270
  BorderStyle = bsToolWindow
  Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1072#1076#1088#1077#1089#1091
  ClientHeight = 241
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sMemo1: TsMemo
    Left = 0
    Top = 0
    Width = 396
    Height = 241
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 0
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
  end
  object MainMenu1: TMainMenu
    Left = 120
    Top = 8
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Action = ActionSave
      end
      object N7: TMenuItem
        Action = ActionSaveToFile
      end
      object N3: TMenuItem
        Action = ActionFont
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N5: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100
      end
    end
    object N6: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N6Click
    end
  end
  object sSaveDialog1: TsSaveDialog
    Left = 8
    Top = 8
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 8
    Top = 32
  end
  object PrintDialog1: TPrintDialog
    Left = 8
    Top = 64
  end
  object ActionList1: TActionList
    Left = 320
    Top = 8
    object ActionSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = ActionSaveExecute
    end
    object ActionSaveToFile: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
      OnExecute = ActionSaveToFileExecute
    end
    object ActionFont: TAction
      Caption = #1064#1088#1080#1092#1090
      OnExecute = ActionFontExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 104
    object N8: TMenuItem
      Action = ActionSave
    end
    object N9: TMenuItem
      Action = ActionSaveToFile
    end
    object N10: TMenuItem
      Action = ActionFont
    end
  end
end
