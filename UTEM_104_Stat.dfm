object FormTEM_104_Stat: TFormTEM_104_Stat
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1040#1088#1093#1080#1074#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
  ClientHeight = 456
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 605
    Height = 456
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sListBox1: TsListBox
      Left = 16
      Top = 72
      Width = 129
      Height = 337
      ItemHeight = 13
      TabOrder = 0
      OnClick = sListBox1Click
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
    object sGroupBox1: TsGroupBox
      Left = 151
      Top = 72
      Width = 442
      Height = 337
      Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1089#1080#1089#1090#1077#1084#1072#1084
      ParentBackground = False
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object StringGrid1: TStringGrid
        Left = 10
        Top = 24
        Width = 424
        Height = 297
        DefaultColWidth = 74
        DefaultRowHeight = 16
        RowCount = 25
        ScrollBars = ssVertical
        TabOrder = 0
        ColWidths = (
          100
          74
          74
          74
          74)
      end
    end
    object sGroupBox2: TsGroupBox
      Left = 16
      Top = 8
      Width = 577
      Height = 58
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1090#1077#1087#1083#1086#1089#1095#1077#1090#1095#1080#1082#1072
      ParentBackground = False
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel1: TsLabel
        Left = 16
        Top = 16
        Width = 153
        Height = 13
        Caption = #1047#1072#1074#1086#1076#1089#1082#1086#1081' '#1085#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sLabel2: TsLabel
        Left = 183
        Top = 16
        Width = 36
        Height = 13
        Caption = 'sLabel2'
      end
      object sLabel3: TsLabel
        Left = 269
        Top = 16
        Width = 127
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072' '#1074' '#1089#1077#1090#1080
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sLabel4: TsLabel
        Left = 410
        Top = 16
        Width = 36
        Height = 13
        Caption = 'sLabel4'
      end
      object sLabel5: TsLabel
        Left = 16
        Top = 35
        Width = 133
        Height = 13
        Caption = #1058#1080#1087' '#1076#1072#1090#1095#1080#1082#1086#1074' '#1088#1072#1089#1093#1086#1076#1072
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sLabel6: TsLabel
        Left = 183
        Top = 35
        Width = 36
        Height = 13
        Caption = 'sLabel6'
      end
      object sLabel7: TsLabel
        Left = 269
        Top = 35
        Width = 111
        Height = 13
        Caption = #1058#1080#1087#1077#1076#1080#1085#1080#1094' '#1101#1085#1077#1088#1075#1080#1080
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sLabel8: TsLabel
        Left = 410
        Top = 35
        Width = 36
        Height = 13
        Caption = 'sLabel8'
      end
    end
    object sBitBtn1: TsBitBtn
      Left = 496
      Top = 415
      Width = 97
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
      OnClick = sBitBtn1Click
      Kind = bkCancel
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
