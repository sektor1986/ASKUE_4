object FormDLL1: TFormDLL1
  Left = 442
  Top = 169
  Anchors = [akTop, akRight]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1041#1072#1083#1072#1085#1089' '#1101#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1080
  ClientHeight = 431
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = BalanceMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Notebook1: TNotebook
    Left = 0
    Top = 0
    Width = 350
    Height = 431
    Align = alClient
    PageIndex = 1
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = #1089#1090#1072#1088#1099#1081' '#1073#1072#1083#1072#1085#1089
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label5: TLabel
        Left = 48
        Top = 80
        Width = 12
        Height = 13
        Caption = 'c  '
        Visible = False
      end
      object Label6: TLabel
        Left = 152
        Top = 80
        Width = 12
        Height = 13
        Caption = #1087#1086
        Visible = False
      end
      object BalButton1: TButton
        Left = 16
        Top = 368
        Width = 113
        Height = 33
        Caption = #1041#1072#1083#1072#1085#1089' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        TabOrder = 0
        Visible = False
        OnClick = BalButton1Click
      end
      object Memo_tar_nak_summ: TMemo
        Left = 88
        Top = 192
        Width = 81
        Height = 145
        Lines.Strings = (
          '')
        TabOrder = 1
        Visible = False
      end
      object Memo_tar_nak_kvart: TMemo
        Left = 88
        Top = 96
        Width = 89
        Height = 89
        TabOrder = 2
        Visible = False
      end
      object Memo_mes_pot_kvart: TMemo
        Left = 184
        Top = 96
        Width = 89
        Height = 89
        TabOrder = 3
        Visible = False
      end
      object NacMesac: TDateTimePicker
        Left = 64
        Top = 72
        Width = 81
        Height = 21
        Date = 38534.000000000000000000
        Time = 38534.000000000000000000
        DateMode = dmUpDown
        TabOrder = 4
        Visible = False
        OnChange = nacSrokChange
      end
      object BalButton3: TBitBtn
        Left = 136
        Top = 368
        Width = 97
        Height = 33
        Caption = #1041#1072#1083#1072#1085#1089' '#1079#1072' '#13#10#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
        TabOrder = 5
        Visible = False
        OnClick = BalButton3Click
      end
      object tekMesac: TDateTimePicker
        Left = 168
        Top = 72
        Width = 89
        Height = 21
        Date = 38565.000000000000000000
        Time = 38565.000000000000000000
        DateMode = dmUpDown
        TabOrder = 6
        Visible = False
        OnChange = konSrokChange
      end
      object Memo_mes_pot_summ: TMemo
        Left = 176
        Top = 192
        Width = 81
        Height = 145
        Lines.Strings = (
          '')
        TabOrder = 7
        Visible = False
      end
      object editId: TEdit
        Left = 16
        Top = 264
        Width = 65
        Height = 21
        TabOrder = 8
        Visible = False
      end
      object mm1: TDateTimePicker
        Left = 48
        Top = 36
        Width = 81
        Height = 21
        Date = 38534.000000000000000000
        Time = 38534.000000000000000000
        DateMode = dmUpDown
        TabOrder = 9
        Visible = False
        OnChange = nacSrokChange
      end
      object mm2: TDateTimePicker
        Left = 136
        Top = 36
        Width = 81
        Height = 21
        Date = 38534.000000000000000000
        Time = 38534.000000000000000000
        DateMode = dmUpDown
        TabOrder = 10
        Visible = False
        OnChange = nacSrokChange
      end
      object Button2: TButton
        Left = 264
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Button2'
        TabOrder = 11
        OnClick = Button2Click
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #1085#1086#1074#1099#1081' '#1073#1072#1083#1072#1085#1089
      object Label8: TLabel
        Left = 307
        Top = 6
        Width = 22
        Height = 13
        Caption = #1042#1090'/'#1095
      end
      object RadioGroup1: TRadioGroup
        Left = 12
        Top = 84
        Width = 327
        Height = 60
        TabOrder = 0
      end
      object RadioButton1: TRadioButton
        Left = 20
        Top = 92
        Width = 193
        Height = 17
        Caption = #1041#1072#1083#1072#1085#1089' '#1079#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1077' '#1084#1077#1089#1103#1094#1099
        TabOrder = 1
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 20
        Top = 108
        Width = 169
        Height = 17
        Caption = #1041#1072#1083#1072#1085#1089' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = RadioButton2Click
      end
      object RadioButton3: TRadioButton
        Left = 20
        Top = 124
        Width = 297
        Height = 17
        Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1073#1072#1083#1072#1085#1089' '#1087#1086' 10 '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1084' '#1089#1095#1080#1090#1099#1074#1072#1085#1080#1103#1084
        TabOrder = 3
        OnClick = RadioButton3Click
      end
      object Button1: TButton
        Left = 12
        Top = 388
        Width = 145
        Height = 33
        Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1073#1072#1083#1072#1085#1089
        Enabled = False
        TabOrder = 4
        OnClick = Button1Click
      end
      object BalButton2: TButton
        Left = 200
        Top = 388
        Width = 129
        Height = 33
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 5
        OnClick = BalButton2Click
      end
      object LogMemo: TRichEdit
        Left = 14
        Top = 150
        Width = 325
        Height = 210
        HideSelection = False
        HideScrollBars = False
        Lines.Strings = (
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object ProgressBar1: TProgressBar
        Left = 12
        Top = 366
        Width = 317
        Height = 16
        Smooth = True
        Step = 5
        TabOrder = 7
      end
      object GroupBox1: TGroupBox
        Left = 12
        Top = 23
        Width = 327
        Height = 59
        TabOrder = 8
        object Label1: TLabel
          Left = 46
          Top = 23
          Width = 12
          Height = 13
          Caption = 'c  '
        end
        object Label2: TLabel
          Left = 151
          Top = 23
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object Label3: TLabel
          Left = 79
          Top = 1
          Width = 178
          Height = 13
          Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1073#1072#1083#1072#1085#1089' '#1079#1072' '#1087#1077#1088#1080#1086#1076':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 6
          Top = 36
          Width = 123
          Height = 13
          Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1077#1077' '#1089#1095#1090#1099#1074#1072#1085#1080#1077
          Visible = False
        end
        object Label7: TLabel
          Left = 6
          Top = 8
          Width = 119
          Height = 13
          Caption = #1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1089#1095#1080#1090#1099#1074#1072#1085#1080#1077
          Visible = False
        end
        object konSrok: TDateTimePicker
          Left = 176
          Top = 20
          Width = 89
          Height = 21
          Date = 38565.000000000000000000
          Time = 38565.000000000000000000
          DateMode = dmUpDown
          TabOrder = 0
          OnChange = konSrokChange
        end
        object nacSrok: TDateTimePicker
          Left = 64
          Top = 20
          Width = 81
          Height = 21
          Date = 38534.000000000000000000
          Time = 38534.000000000000000000
          DateMode = dmUpDown
          TabOrder = 1
          OnChange = nacSrokChange
        end
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 2
        Width = 253
        Height = 23
        Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1087#1086#1090#1088#1077#1073#1083'. '#1089#1095#1105#1090#1095#1080#1082#1086#1074' '
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object nacSrokposl: TComboBox
        Left = 144
        Top = 57
        Width = 189
        Height = 21
        ItemHeight = 13
        TabOrder = 10
        Text = #1044#1072#1090#1072' - 14.12.06 '#1042#1088#1077#1084#1103' - 11:02:05'
        Visible = False
      end
      object konSrokposl: TComboBox
        Left = 144
        Top = 30
        Width = 189
        Height = 21
        ItemHeight = 13
        TabOrder = 11
        Text = #1044#1072#1090#1072' - 14.12.06 '#1042#1088#1077#1084#1103' - 11:02:05'
        Visible = False
      end
      object graph: TCheckBox
        Left = 16
        Top = 348
        Width = 193
        Height = 17
        Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1075#1080#1089#1090#1086#1075#1088#1072#1084#1084#1091
        TabOrder = 12
        Visible = False
      end
      object Button3: TButton
        Left = 244
        Top = 312
        Width = 57
        Height = 25
        Caption = 'pageIndex'
        TabOrder = 13
        Visible = False
        OnClick = Button2Click
      end
      object SobstPotr: TMaskEdit
        Left = 264
        Top = 3
        Width = 37
        Height = 21
        EditMask = '9,9;1;_'
        MaxLength = 3
        TabOrder = 14
        Text = '1,5'
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 219
        Top = 88
        Width = 121
        Height = 21
        EditButtons = <>
        TabOrder = 15
        Visible = True
      end
    end
  end
  object BalanceMenu: TMainMenu
    Left = 148
    Top = 288
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      Checked = True
      object N2: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'rtf'
    Filter = #1060#1072#1081#1083#1099' RTF(*.rtf)|*.rtf|Word (*.doc)|*.doc'
    Left = 184
    Top = 224
  end
  object IBDatabase2: TpFIBDatabase
    AutoReconnect = True
    DBName = 'ascue.fdb'
    DBParams.Strings = (
      'user_name=ASCUE_XL'
      'password=555'
      'sql_role_name=3')
    DefaultTransaction = transact
    DefaultUpdateTransaction = transact2
    SQLDialect = 3
    Timeout = 0
    LibraryName = 'fbclient.dll'
    WaitForRestoreConnect = 0
    Left = 40
    Top = 160
  end
  object Qkv_konfig_arh: TpFIBDataSet
    SelectSQL.Strings = (
      
        'Select cod, tar_nak,ns_time, ncount,date_time from kv_konfig_arh' +
        ' where cod=36032')
    Transaction = transact
    Database = IBDatabase2
    Left = 44
    Top = 200
  end
  object Qkv_konfig_arh_z: TpFIBDataSet
    SelectSQL.Strings = (
      'select inc from tmp where ns='#39'452943'#39)
    Transaction = transact
    Database = IBDatabase2
    Left = 44
    Top = 232
  end
  object select_kvart: TpFIBDataSet
    Transaction = transact
    Database = IBDatabase2
    Left = 44
    Top = 268
  end
  object bal_summ: TpFIBDataSet
    Transaction = transact
    Database = IBDatabase2
    Left = 80
    Top = 200
  end
  object bal_kvart: TpFIBDataSet
    Transaction = transact
    Database = IBDatabase2
    DataSource = DataSource3
    Left = 80
    Top = 232
  end
  object transact: TpFIBTransaction
    DefaultDatabase = IBDatabase2
    TimeoutAction = TARollback
    Left = 80
    Top = 160
  end
  object DataSource3: TDataSource
    DataSet = bal_summ
    Left = 120
    Top = 196
  end
  object DataSource2: TDataSource
    DataSet = bal_kvart
    Left = 120
    Top = 232
  end
  object transact2: TpFIBTransaction
    DefaultDatabase = IBDatabase2
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'read_committed'
      'wait'
      'rec_version')
    TPBMode = tpbDefault
    Left = 248
    Top = 160
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = transact2
    Database = IBDatabase2
    SQL.Strings = (
      'UPDATE ADDRESMAIN'
      'SET '
      '    BALANS = :BALANS'
      'WHERE'
      '    INC = :INC'
      '    ')
    Left = 280
    Top = 160
    qoAutoCommit = True
  end
end
