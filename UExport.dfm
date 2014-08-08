object FormExport: TFormExport
  Left = 256
  Top = 227
  BorderStyle = bsSingle
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 343
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 547
    Height = 343
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sPanel2: TsPanel
      Left = 1
      Top = 1
      Width = 208
      Height = 341
      Align = alLeft
      ParentBackground = False
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sRadioGroup1: TsRadioGroup
        Left = 8
        Top = 111
        Width = 185
        Height = 135
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1083#1103' '#1069#1085#1077#1088#1075#1086#1057#1073#1099#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnClick = sRadioGroup1Click
        CaptionLayout = clTopCenter
        SkinData.SkinSection = 'GROUPBOX'
        ItemIndex = 0
        Items.Strings = (
          #1042#1080#1090#1077#1073#1089#1082#1080#1081' '#1069#1053#1045#1056#1043#1054#1057#1041#1067#1058
          #1043#1086#1084#1077#1083#1100#1089#1082#1080#1081' '#1069#1053#1045#1056#1043#1054#1057#1041#1067#1058
          #1052#1086#1075#1080#1083#1077#1074#1089#1082#1080#1080' '#1069#1053#1045#1056#1043#1054#1057#1041#1067#1058' '
          #1052#1080#1085#1089#1082#1080#1081' '#1069#1053#1045#1056#1043#1054#1057#1041#1067#1058
          #1052#1080#1085#1089#1082#1080#1081' '#1069#1053#1045#1056#1043#1054#1057#1041#1067#1058' ('#1040#1084#1087#1077#1088')')
      end
      object sRadioGroup2: TsRadioGroup
        Left = 8
        Top = 16
        Width = 185
        Height = 89
        Caption = #1042#1080#1076' '#1101#1082#1089#1087#1086#1088#1090#1072
        ParentBackground = False
        TabOrder = 1
        OnClick = sRadioGroup2Click
        SkinData.SkinSection = 'GROUPBOX'
        ItemIndex = 0
        Items.Strings = (
          #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1076#1072#1085#1085#1099#1093
          #1042#1089#1077' '#1076#1072#1085#1085#1099#1077
          #1069#1082#1089#1087#1086#1088#1090' '#1076#1083#1103' '#1069#1085#1077#1088#1075#1086#1089#1073#1099#1090)
      end
      object sRadioGroup3: TsRadioGroup
        Left = 8
        Top = 271
        Width = 185
        Height = 56
        Caption = #1044#1072#1090#1072' '#1074' '#1092#1072#1081#1083#1077' '#1101#1082#1089#1087#1086#1088#1090#1072
        ParentBackground = False
        TabOrder = 2
        Visible = False
        SkinData.SkinSection = 'GROUPBOX'
        ItemIndex = 0
        Items.Strings = (
          #1050#1086#1085#1077#1094' '#1084#1077#1089#1103#1094#1072
          #1053#1072#1095#1072#1083#1086' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072)
      end
      object sCheckBox1: TsCheckBox
        Left = 16
        Top = 252
        Width = 124
        Height = 20
        Caption = #1058#1086#1083#1100#1082#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077
        TabOrder = 3
        Visible = False
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
    object sPanel3: TsPanel
      Left = 209
      Top = 1
      Width = 337
      Height = 341
      Align = alClient
      ParentBackground = False
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object sGauge1: TsGauge
        Left = 16
        Top = 176
        Width = 305
        Height = 18
        SkinData.SkinSection = 'GAUGE'
        ForeColor = clBlack
        MaxValue = 60
        Progress = 0
        Suffix = '%'
      end
      object sBevel1: TsBevel
        Left = 16
        Top = 293
        Width = 305
        Height = 10
        Shape = bsTopLine
      end
      object DBGridEh1: TDBGridEh
        Left = 16
        Top = 40
        Width = 305
        Height = 130
        AutoFitColWidths = True
        DataGrouping.GroupLevels = <>
        DataSource = DSaddresmain_exp
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'TOWN'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1043#1086#1088#1086#1076
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'ADDR'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object sBitBtn1: TsBitBtn
        Left = 117
        Top = 302
        Width = 102
        Height = 25
        Caption = #1069#1082#1089#1087#1086#1088#1090
        TabOrder = 1
        OnClick = sBitBtn1Click
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 11
        Images = Form1.ImageList2
      end
      object sComboBox1: TsComboBox
        Left = 128
        Top = 13
        Width = 145
        Height = 22
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = #1069#1082#1089#1087#1086#1088#1090' '#1079#1072' '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clBlack
        BoundLabel.Font.Height = -13
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        Style = csOwnerDrawFixed
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 16
        ItemIndex = -1
        ParentFont = False
        TabOrder = 2
      end
      object sMemo1: TsMemo
        Left = 16
        Top = 200
        Width = 305
        Height = 87
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 3
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'EDIT'
      end
      object sBitBtn2: TsBitBtn
        Left = 225
        Top = 302
        Width = 95
        Height = 25
        Cancel = True
        Caption = 'Cancel'
        TabOrder = 4
        OnClick = sBitBtn2Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        SkinData.SkinSection = 'BUTTON'
      end
      object sBitBtn3: TsBitBtn
        Left = 16
        Top = 302
        Width = 95
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 5
        OnClick = sBitBtn3Click
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 12
        Images = Form1.ImageList1
      end
    end
  end
  object ExportEnergo: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EXPORTENERGO'
      'SET '
      '    COD = :COD,'
      '    LIC_CH = :LIC_CH,'
      '    REGISTR_NOMER = :REGISTR_NOMER,'
      '    FIO = :FIO,'
      '    NAM_PUNK = :NAM_PUNK,'
      '    NAS_STR = :NAS_STR,'
      '    DOM = :DOM,'
      '    KORP = :KORP,'
      '    KVAR = :KVAR,'
      '    STAMP = :STAMP,'
      '    NOM_SCH = :NOM_SCH,'
      '    D1 = :D1,'
      '    D2 = :D2,'
      '    VAL_K1 = :VAL_K1,'
      '    VAL_MAX1 = :VAL_MAX1,'
      '    VAL_MIN1 = :VAL_MIN1,'
      '    VAL_K2 = :VAL_K2,'
      '    VAL_MAX2 = :VAL_MAX2,'
      '    VAL_MIN2 = :VAL_MIN2,'
      '    R_MAX = :R_MAX,'
      '    R_MIN = :R_MIN,'
      '    R_ALL = :R_ALL,'
      '    POK_T3 = :POK_T3,'
      '    POK_T4 = :POK_T4,'
      '    POK_T5 = :POK_T5,'
      '    POK_HOUSE = :POK_HOUSE,'
      '    POK_ALL = :POK_ALL,'
      '    DATE_TIME = :DATE_TIME,'
      '    FLAG = :FLAG,'
      '    LIC_CH2 = :LIC_CH2,'
      '    LIC_CH3 = :LIC_CH3,'
      '    LIC_CH4 = :LIC_CH4'
      'WHERE'
      '    COD = :COD'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EXPORTENERGO'
      'WHERE'
      '     COD = :COD   ')
    InsertSQL.Strings = (
      'INSERT INTO EXPORTENERGO('
      '    COD,'
      '    LIC_CH,'
      '    REGISTR_NOMER,'
      '    FIO,'
      '    NAM_PUNK,'
      '    NAS_STR,'
      '    DOM,'
      '    KORP,'
      '    KVAR,'
      '    STAMP,'
      '    NOM_SCH,'
      '    D1,'
      '    D2,'
      '    VAL_K1,'
      '    VAL_MAX1,'
      '    VAL_MIN1,'
      '    VAL_K2,'
      '    VAL_MAX2,'
      '    VAL_MIN2,'
      '    R_MAX,'
      '    R_MIN,'
      '    R_ALL,'
      '    POK_T3,'
      '    POK_T4,'
      '    POK_T5,'
      '    POK_HOUSE,'
      '    POK_ALL,'
      '    DATE_TIME,'
      '    FLAG,'
      '    LIC_CH2,'
      '    LIC_CH3,'
      '    LIC_CH4'
      ')'
      'VALUES('
      '    :COD,'
      '    :LIC_CH,'
      '    :REGISTR_NOMER,'
      '    :FIO,'
      '    :NAM_PUNK,'
      '    :NAS_STR,'
      '    :DOM,'
      '    :KORP,'
      '    :KVAR,'
      '    :STAMP,'
      '    :NOM_SCH,'
      '    :D1,'
      '    :D2,'
      '    :VAL_K1,'
      '    :VAL_MAX1,'
      '    :VAL_MIN1,'
      '    :VAL_K2,'
      '    :VAL_MAX2,'
      '    :VAL_MIN2,'
      '    :R_MAX,'
      '    :R_MIN,'
      '    :R_ALL,'
      '    :POK_T3,'
      '    :POK_T4,'
      '    :POK_T5,'
      '    :POK_HOUSE,'
      '    :POK_ALL,'
      '    :DATE_TIME,'
      '    :FLAG,'
      '    :LIC_CH2,'
      '    :LIC_CH3,'
      '    :LIC_CH4'
      ')')
    RefreshSQL.Strings = (
      'select *'
      '       FROM ExportEnergo'
      'where'
      '     COD = :COD')
    SelectSQL.Strings = (
      'select *'
      '       FROM ExportEnergo'
      'order by LIC_CH')
    Transaction = dm1.transact1
    Database = dm1.database
    UpdateTransaction = dm1.updateTransact
    Left = 192
    Top = 152
    poAskRecordCount = True
  end
  object DSExpGomel: TDataSource
    DataSet = ExportEnergo
    Left = 128
    Top = 136
  end
  object MainMenu1: TMainMenu
    Left = 144
    Top = 8
    object N1: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object N2: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' '#1101#1082#1089#1087#1086#1088#1090#1072
        OnClick = N2Click
      end
    end
  end
  object ExpGomelDbf: TQExport4DBF
    DataSet = ExportEnergo
    ExportedFields.Strings = (
      'LIC_CH'
      'FIO'
      'NAM_PUNK'
      'NAS_STR'
      'DOM'
      'KORP'
      'KVAR'
      'STAMP'
      'NOM_SCH'
      'D1'
      'D2'
      'VAL_K1'
      'VAL_MAX1'
      'VAL_MIN1'
      'VAL_K2'
      'VAL_MAX2'
      'VAL_MIN2'
      'R_MAX'
      'R_MIN'
      'R_ALL')
    About = '(About EMS AdvancedExport)'
    _Version = '4.1.0.1'
    FileName = 'E:\sektor\Project\ASCUE 4\As290109.dbf'
    DefaultFloatSize = 11
    DefaultFloatDecimal = 2
    ExportTimeAsStr = False
    NullValue = 'null'
    Left = 184
    Top = 200
  end
  object addresmain_exp: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    addresmain.INC,'
      '    ADDR,'
      '    REZ,'
      '    REZ1,'
      '    REZ2,'
      '    CHEC,'
      '    CHECKED,'
      '    PIC,'
      '    DESCRIPTION,'
      '    TOWN'
      'FROM'
      '    ADDRESMAIN, town'
      'where chec = 1 and town.inc = rez'
      'order by addr'
      '')
    AfterScroll = addresmain_expAfterScroll
    Transaction = dm1.transact1
    Database = dm1.database
    UpdateTransaction = dm1.updateTransact
    SQLScreenCursor = crSQLWait
    Left = 192
    Top = 39
    poAskRecordCount = True
    object addresmain_expINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object addresmain_expADDR: TFIBStringField
      FieldName = 'ADDR'
      Size = 40
      EmptyStrToNull = True
    end
    object addresmain_expREZ1: TFIBStringField
      FieldName = 'REZ1'
      Size = 40
      EmptyStrToNull = True
    end
    object addresmain_expREZ: TFIBIntegerField
      FieldName = 'REZ'
    end
    object addresmain_expREZ2: TFIBStringField
      FieldName = 'REZ2'
      Size = 40
      EmptyStrToNull = True
    end
    object addresmain_expCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
    object addresmain_expCHECKED: TFIBIntegerField
      FieldName = 'CHECKED'
    end
    object addresmain_expPIC: TFIBBlobField
      FieldName = 'PIC'
      Size = 8
    end
    object addresmain_expDESCRIPTION: TFIBMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object addresmain_expTOWN: TFIBStringField
      FieldName = 'TOWN'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object DSaddresmain_exp: TDataSource
    DataSet = addresmain_exp
    Left = 400
    Top = 56
  end
  object sSaveDialog1: TsSaveDialog
    Filter = #1060#1072#1081#1083' '#1101#1082#1089#1087#1086#1088#1090#1072'|*.exp'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 200
    Top = 8
  end
  object ExpVitebskDbf: TQExport4DBF
    DataSet = ExportEnergo
    ExportedFields.Strings = (
      'LIC_CH'
      'POK_ALL'
      'VAL_MAX2'
      'VAL_MIN2'
      'POK_T3'
      'POK_T4'
      'POK_T5'
      'POK_HOUSE'
      'DATE_TIME'
      'FLAG')
    About = '(About EMS AdvancedExport)'
    _Version = '4.1.0.1'
    Captions.Strings = (
      'LIC_CH=NUMABON'
      'VAL_MAX2=POK_T1'
      'VAL_MIN2=POK_T2'
      'DATE_TIME=TIME')
    DefaultFloatSize = 11
    DefaultFloatDecimal = 2
    ExportTimeAsStr = False
    NullValue = 'null'
    Left = 148
    Top = 196
  end
  object ExpMinskDbf: TQExport4DBF
    DataSet = ExportEnergo
    ExportedFields.Strings = (
      'LIC_CH'
      'FIO'
      'NAM_PUNK'
      'NOM_SCH'
      'NAS_STR'
      'DOM'
      'KORP'
      'KVAR'
      'STAMP'
      'POK_ALL'
      'VAL_MAX2'
      'VAL_MIN2'
      'POK_T3'
      'POK_T4')
    About = '(About EMS AdvancedExport)'
    _Version = '4.1.0.1'
    FileName = 'E:\sektor\Project\ASCUE 4\As290109.dbf'
    Captions.Strings = (
      'TYPE=NAM_PUNK'
      'WORKS=FIO'
      'VAL_MAX2=POK_T1'
      'VAL_MIN2=POK_T2')
    DefaultFloatSize = 11
    DefaultFloatDecimal = 2
    ExportTimeAsStr = False
    NullValue = 'null'
    Left = 160
    Top = 240
  end
end
