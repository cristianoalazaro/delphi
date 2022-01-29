object frmRelVendaPorData: TfrmRelVendaPorData
  Left = 0
  Top = 0
  Caption = 'frmRelVendaPorData'
  ClientHeight = 413
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = -16
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsVenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Transparent = False
    object Rodape: TRLBand
      Left = 38
      Top = 233
      Width = 718
      Height = 32
      BandType = btFooter
      Transparent = False
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 9
        Align = faClientTop
        DrawKind = dkLine
        Pen.Width = 2
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 8
        Top = 12
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 633
        Top = 12
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
        Transparent = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 680
        Top = 12
        Width = 36
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 672
        Top = 12
        Width = 8
        Height = 16
        Caption = '-'
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 585
        Top = 12
        Width = 53
        Height = 16
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object BandaDoGrupo: TRLGroup
      Left = 38
      Top = 81
      Width = 718
      Height = 96
      DataFields = 'Data_Venda'
      Transparent = False
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 23
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLLabel8: TRLLabel
          Left = 3
          Top = 3
          Width = 37
          Height = 16
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 49
          Top = 3
          Width = 75
          Height = 16
          DataField = 'Data_Venda'
          DataSource = dtsVenda
          Text = ''
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 23
        Width = 718
        Height = 25
        BandType = btColumnHeader
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object RLLabel6: TRLLabel
          Left = 3
          Top = 3
          Width = 49
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 92
          Top = 3
          Width = 110
          Height = 16
          Caption = 'Nome do Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 612
          Top = 3
          Width = 103
          Height = 16
          Caption = 'Valor da Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 48
        Width = 718
        Height = 22
        Transparent = False
        object RLDBText2: TRLDBText
          Left = 92
          Top = 3
          Width = 38
          Height = 16
          DataField = 'Nome'
          DataSource = dtsVenda
          Text = ''
          Transparent = False
        end
        object DBEdit1: TDBEdit
          Left = 184
          Top = 24
          Width = 134
          Height = 24
          DataField = 'ID'
          DataSource = dtsVenda
          TabOrder = 1
        end
        object RLDBText1: TRLDBText
          Left = 3
          Top = 3
          Width = 16
          Height = 16
          DataField = 'ID'
          DataSource = dtsVenda
          Text = ''
          Transparent = False
        end
        object RLDBText4: TRLDBText
          Left = 639
          Top = 3
          Width = 76
          Height = 16
          Alignment = taRightJustify
          DataField = 'Total_Venda'
          DataSource = dtsVenda
          Text = ''
          Transparent = False
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 70
        Width = 718
        Height = 25
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 601
          Top = 4
          Width = 115
          Height = 16
          Alignment = taRightJustify
          DataField = 'Total_Venda'
          DataSource = dtsVenda
          Info = riSum
          Text = ''
        end
        object RLDraw3: TRLDraw
          Left = 480
          Top = -2
          Width = 238
          Height = 9
          DrawKind = dkLine
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 495
          Top = 4
          Width = 98
          Height = 16
          Caption = 'Total por Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btHeader
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 0
        Top = 8
        Width = 291
        Height = 24
        Caption = 'Listagem de Venda por Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 34
        Width = 718
        Height = 9
        Align = faClientBottom
        DrawKind = dkLine
        Pen.Width = 2
        Transparent = False
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 177
      Width = 718
      Height = 56
      BandType = btSummary
      object RLDBResult2: TRLDBResult
        Left = 603
        Top = 7
        Width = 115
        Height = 20
        Alignment = taRightJustify
        DataField = 'Total_Venda'
        DataSource = dtsVenda
        Info = riSum
        Text = ''
      end
      object RLDraw4: TRLDraw
        Left = 480
        Top = -2
        Width = 238
        Height = 11
        DrawKind = dkLine
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 503
        Top = 7
        Width = 91
        Height = 16
        Caption = 'Total Vendas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
  end
  object qryVenda: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT Vendas.ID'
      '      ,Vendas.ClienteID'
      '      ,Clientes.Nome'
      '      ,Vendas.Data_Venda'
      '      ,Vendas.Total_Venda'
      'FROM dbo.Vendas WITH (NOLOCK)'
      'INNER JOIN dbo.Clientes WITH (NOLOCK)'
      'ON Clientes.ID = Vendas.ClienteID'
      'WHERE Vendas.Data_Venda BETWEEN :Data_Inicial AND :Data_Final'
      'ORDER BY Vendas.Data_Venda, Vendas.ClienteID')
    Params = <
      item
        DataType = ftDate
        Name = 'Data_Inicial'
        ParamType = ptInput
        Value = '01/01/2021'
      end
      item
        DataType = ftDate
        Name = 'Data_Final'
        ParamType = ptInput
        Value = '31/01/2022'
      end>
    Left = 416
    Top = 272
    ParamData = <
      item
        DataType = ftDate
        Name = 'Data_Inicial'
        ParamType = ptInput
        Value = '01/01/2021'
      end
      item
        DataType = ftDate
        Name = 'Data_Final'
        ParamType = ptInput
        Value = '31/01/2022'
      end>
    object qryVendaID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryVendaClienteID: TIntegerField
      FieldName = 'ClienteID'
      Required = True
    end
    object qryVendaNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryVendaData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qryVendaTotal_Venda: TFloatField
      FieldName = 'Total_Venda'
    end
  end
  object dtsVenda: TDataSource
    AutoEdit = False
    DataSet = qryVenda
    Left = 504
    Top = 272
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 456
    Top = 328
  end
end
