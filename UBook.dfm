object FormBook: TFormBook
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083
  ClientHeight = 351
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 470
    Height = 351
    Align = alClient
    DataGrouping.GroupLevels = <>
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    PopupMenu = PopupMenu1
    RowDetailPanel.Color = clBtnFace
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnExit = DBGridEh1Exit
    OnKeyPress = DBGridEh1KeyPress
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'TEXT'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 374
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object ActionList1: TActionList
    Left = 272
    Top = 8
    object ActionSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    end
    object ActionSaveToFile: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
    end
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 40
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Action = ActionSave
      end
      object N7: TMenuItem
        Action = ActionSaveToFile
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
  object PopupMenu1: TPopupMenu
    Left = 328
    Top = 128
    object N3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
    end
    object TMenuItem
    end
  end
end
