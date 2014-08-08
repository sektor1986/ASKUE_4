object FormProfil: TFormProfil
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1092#1080#1083#1100' '#1085#1072#1075#1088#1091#1079#1082#1080
  ClientHeight = 447
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 675
    Height = 447
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      675
      447)
    object sPanel2: TsPanel
      Left = 1
      Top = 1
      Width = 673
      Height = 376
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      ParentBackground = False
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sPanel3: TsPanel
        Left = 1
        Top = 1
        Width = 147
        Height = 374
        Align = alLeft
        ParentBackground = False
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        DesignSize = (
          147
          374)
        object DBGridEh1: TDBGridEh
          Left = 8
          Top = 40
          Width = 133
          Height = 321
          Anchors = [akLeft, akTop, akBottom]
          DataGrouping.GroupLevels = <>
          DataSource = DSProfmain
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          HorzScrollBar.Visible = False
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
              Checkboxes = True
              EditButtons = <>
              FieldName = 'CHEC'
              Footers = <>
              Title.Caption = ' '
              Width = 28
            end
            item
              EditButtons = <>
              FieldName = 'DATA'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1044#1072#1090#1072
              Width = 78
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object sPanel4: TsPanel
        Left = 148
        Top = 1
        Width = 524
        Height = 374
        Align = alClient
        ParentBackground = False
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object Chart1: TChart
          Left = 1
          Top = 1
          Width = 522
          Height = 372
          Foot.Font.Color = clBlack
          Foot.Font.Height = -12
          Foot.Font.Style = [fsBold]
          Foot.Font.InterCharSize = 6
          Foot.Font.Shadow.HorizSize = 2
          Foot.Font.Shadow.VertSize = 2
          Foot.Text.Strings = (
            #1042#1088#1077#1084#1103)
          Legend.Visible = False
          MarginBottom = 3
          MarginTop = 3
          PrintProportional = False
          SubFoot.Font.Height = -16
          SubFoot.Font.Style = []
          Title.Font.Height = -15
          Title.Font.Style = [fsBold]
          Title.Font.InterCharSize = 3
          Title.Font.Shadow.Color = 16744448
          Title.Font.Shadow.HorizSize = 2
          Title.Font.Shadow.VertSize = 2
          Title.Text.Strings = (
            #1055#1088#1086#1092#1080#1083#1100' '#1085#1072#1075#1088#1091#1079#1082#1080)
          DepthAxis.Automatic = False
          DepthAxis.AutomaticMaximum = False
          DepthAxis.AutomaticMinimum = False
          DepthAxis.Maximum = 0.470000000000000000
          DepthAxis.Minimum = -0.530000000000000000
          DepthTopAxis.Automatic = False
          DepthTopAxis.AutomaticMaximum = False
          DepthTopAxis.AutomaticMinimum = False
          DepthTopAxis.Maximum = 0.470000000000000000
          DepthTopAxis.Minimum = -0.530000000000000000
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.LabelsSeparation = 20
          LeftAxis.StartPosition = 5.000000000000000000
          LeftAxis.Title.Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1082#1042#1090
          LeftAxis.Title.Font.Style = [fsBold]
          LeftAxis.Title.Font.InterCharSize = 6
          LeftAxis.Title.Font.OutLine.Width = 3
          LeftAxis.Title.Font.OutLine.EndStyle = esSquare
          LeftAxis.Title.Font.Shadow.Transparency = 1
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          Zoom.Animated = True
          Align = alClient
          TabOrder = 0
          PrintMargins = (
            15
            8
            15
            8)
          object Series1: TFastLineSeries
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.ArrowHeadSize = 7
            Marks.Callout.Length = 20
            Marks.DrawEvery = 2
            Marks.MultiLine = True
            Marks.Style = smsValue
            Marks.Symbol.Gradient.Balance = 4
            Marks.Symbol.Gradient.Direction = gdBottomTop
            Marks.Symbol.Gradient.EndColor = 25284
            Marks.Symbol.Gradient.MidColor = clWhite
            Marks.Symbol.Gradient.StartColor = 27349
            Marks.Symbol.Gradient.Visible = True
            Marks.Visible = True
            SeriesColor = 16744448
            LinePen.Color = 16744448
            LinePen.Width = 2
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series2: TBarSeries
            Active = False
            Marks.Callout.Brush.Color = clBlack
            Marks.DrawEvery = 2
            Marks.Visible = True
            SeriesColor = 16744448
            BarWidthPercent = 50
            Gradient.Direction = gdTopBottom
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
    end
    object sGroupBox1: TsGroupBox
      Left = 10
      Top = 381
      Width = 215
      Height = 60
      Anchors = [akLeft, akBottom]
      Caption = #1055#1077#1095#1072#1090#1100
      ParentBackground = False
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      DesignSize = (
        215
        60)
      object sBitBtn1: TsBitBtn
        Left = 15
        Top = 16
        Width = 90
        Height = 28
        Anchors = [akLeft, akBottom]
        Caption = #1055#1077#1095#1072#1090#1100' '
        TabOrder = 0
        OnClick = sBitBtn1Click
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 28
        Images = Form1.ImageList2
      end
      object sRadioButton1: TsRadioButton
        Left = 123
        Top = 16
        Width = 65
        Height = 20
        Caption = #1050#1085#1080#1078#1085#1072#1103
        TabOrder = 1
        SkinData.SkinSection = 'RADIOBUTTON'
      end
      object sRadioButton2: TsRadioButton
        Left = 123
        Top = 35
        Width = 75
        Height = 20
        Caption = #1040#1083#1100#1073#1086#1084#1085#1072#1103
        Checked = True
        TabOrder = 2
        TabStop = True
        SkinData.SkinSection = 'RADIOBUTTON'
      end
    end
    object sRadioGroup1: TsRadioGroup
      Left = 231
      Top = 381
      Width = 114
      Height = 60
      Anchors = [akLeft, akBottom]
      Caption = #1042#1080#1076' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      ParentBackground = False
      TabOrder = 2
      OnClick = sRadioGroup1Click
      SkinData.SkinSection = 'GROUPBOX'
      ItemIndex = 0
      Items.Strings = (
        #1043#1088#1072#1092#1080#1082
        #1043#1080#1089#1090#1086#1075#1088#1072#1084#1084#1072)
    end
  end
  object profmain: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PROFMAIN'
      'SET '
      '    COD = :COD,'
      '    DATA = :DATA,'
      '    PROFIL = :PROFIL,'
      '    REZ = :REZ,'
      '    CHEC = :CHEC'
      'WHERE'
      '    INC = :OLD_INC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PROFMAIN'
      'WHERE'
      '        INC = :OLD_INC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PROFMAIN('
      '    INC,'
      '    COD,'
      '    DATA,'
      '    PROFIL,'
      '    REZ,'
      '    CHEC'
      ')'
      'VALUES('
      '    :INC,'
      '    :COD,'
      '    :DATA,'
      '    :PROFIL,'
      '    :REZ,'
      '    :CHEC'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    DATA,'
      '    PROFIL,'
      '    REZ,'
      '    CHEC'
      'FROM'
      '    PROFMAIN'
      'where(  cod = :inc'
      '     ) and (     PROFMAIN.INC = :OLD_INC'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    INC,'
      '    COD,'
      '    DATA ,'
      '    PROFIL,'
      '    REZ,'
      '    CHEC'
      'FROM'
      '    PROFMAIN'
      'where cod = :inc'
      'order by inc'
      ' ')
    AfterScroll = profmainAfterScroll
    AllowedUpdateKinds = [ukModify, ukDelete]
    Transaction = dm1.transact1
    Database = dm1.database
    UpdateTransaction = dm1.updateTransact
    AutoCommit = True
    DataSource = dm1.DStmp_1
    Left = 24
    Top = 296
    object profmainINC: TFIBIntegerField
      FieldName = 'INC'
    end
    object profmainCOD: TFIBIntegerField
      FieldName = 'COD'
    end
    object profmainDATA: TFIBStringField
      FieldName = 'DATA'
      ReadOnly = True
      Size = 10
      EmptyStrToNull = True
    end
    object profmainPROFIL: TFIBMemoField
      FieldName = 'PROFIL'
      ReadOnly = True
      BlobType = ftMemo
      Size = 8
    end
    object profmainREZ: TFIBStringField
      FieldName = 'REZ'
      Size = 6
      EmptyStrToNull = True
    end
    object profmainCHEC: TFIBIntegerField
      FieldName = 'CHEC'
    end
  end
  object DSProfmain: TDataSource
    DataSet = profmain
    Left = 88
    Top = 288
  end
end
