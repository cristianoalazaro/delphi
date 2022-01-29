object frmRelVenda: TfrmRelVenda
  Left = 0
  Top = 0
  Caption = 'frmRelVenda'
  ClientHeight = 437
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
    Left = -8
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsVendaItem
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Transparent = False
    object Rodape: TRLBand
      Left = 38
      Top = 237
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
      Height = 123
      DataFields = 'vendaID'
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
          Width = 49
          Height = 16
          Caption = 'Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 60
          Top = 3
          Width = 16
          Height = 16
          DataField = 'ID'
          DataSource = dtsVenda
          Text = ''
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 23
        Width = 718
        Height = 24
        Transparent = False
        object RLDBText2: TRLDBText
          Left = 62
          Top = 3
          Width = 56
          Height = 16
          DataField = 'ClienteID'
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
        object RLDBText4: TRLDBText
          Left = 640
          Top = 3
          Width = 75
          Height = 16
          Alignment = taRightJustify
          DataField = 'Data_Venda'
          DataSource = dtsVenda
          Text = ''
          Transparent = False
        end
        object RLLabel9: TRLLabel
          Left = 3
          Top = 3
          Width = 53
          Height = 16
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText1: TRLDBText
          Left = 95
          Top = 3
          Width = 38
          Height = 16
          DataField = 'Nome'
          DataSource = dtsVenda
          Text = ''
          Transparent = False
        end
        object RLLabel11: TRLLabel
          Left = 79
          Top = 3
          Width = 8
          Height = 16
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 524
          Top = 3
          Width = 102
          Height = 16
          Caption = 'Data da Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLSubDetail1: TRLSubDetail
        Left = 0
        Top = 47
        Width = 718
        Height = 62
        DataSource = dtsVendaItem
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 25
          BandType = btHeader
          Color = clInfoBk
          ParentColor = False
          Transparent = False
          object RLLabel6: TRLLabel
            Left = 3
            Top = 3
            Width = 68
            Height = 16
            Caption = 'Produto(s)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel7: TRLLabel
            Left = 269
            Top = 3
            Width = 78
            Height = 16
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel12: TRLLabel
            Left = 431
            Top = 3
            Width = 92
            Height = 16
            Caption = 'Valor Unit'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel13: TRLLabel
            Left = 639
            Top = 3
            Width = 74
            Height = 16
            Caption = 'Valor Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
        object RLBand6: TRLBand
          Left = 0
          Top = 25
          Width = 718
          Height = 23
          object RLDBText3: TRLDBText
            Left = 3
            Top = 3
            Width = 61
            Height = 16
            DataField = 'ProdutoID'
            DataSource = dtsVendaItem
            Text = ''
            Transparent = False
          end
          object RLDBText6: TRLDBText
            Left = 36
            Top = 3
            Width = 38
            Height = 16
            DataField = 'Nome'
            DataSource = dtsVendaItem
            Text = ''
            Transparent = False
          end
          object RLDBText7: TRLDBText
            Left = 277
            Top = 3
            Width = 70
            Height = 16
            Alignment = taRightJustify
            DataField = 'Quantidade'
            DataSource = dtsVendaItem
            Text = ''
            Transparent = False
          end
          object RLDBText8: TRLDBText
            Left = 438
            Top = 3
            Width = 85
            Height = 16
            Alignment = taRightJustify
            DataField = 'Valor_Unitario'
            DataSource = dtsVendaItem
            Text = ''
            Transparent = False
          end
          object RLDBText9: TRLDBText
            Left = 631
            Top = 3
            Width = 84
            Height = 16
            Alignment = taRightJustify
            DataField = 'Total_Produto'
            DataSource = dtsVendaItem
            Text = ''
            Transparent = False
          end
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
        Width = 69
        Height = 24
        Caption = 'Venda'
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
      Top = 204
      Width = 718
      Height = 33
      BandType = btSummary
      object RLDBResult2: TRLDBResult
        Left = 603
        Top = 14
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
        Top = 6
        Width = 238
        Height = 11
        DrawKind = dkLine
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 490
        Top = 14
        Width = 103
        Height = 16
        Caption = 'Total da Venda:'
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
    Active = True
    SQL.Strings = (
      'SELECT Vendas.ID'
      '      ,Vendas.ClienteID'
      '      ,Clientes.Nome'
      '      ,Vendas.Data_Venda'
      '      ,Vendas.Total_Venda'
      'FROM dbo.Vendas WITH (NOLOCK)'
      'INNER JOIN dbo.Clientes WITH (NOLOCK)'
      'ON Clientes.ID = Vendas.ClienteID'
      'WHERE Vendas.ID = :Vendas_ID')
    Params = <
      item
        DataType = ftWideString
        Name = 'Vendas_ID'
        ParamType = ptUnknown
        Value = '1'
      end>
    Left = 416
    Top = 272
    ParamData = <
      item
        DataType = ftWideString
        Name = 'Vendas_ID'
        ParamType = ptUnknown
        Value = '1'
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
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryVendaTotal_Venda: TFloatField
      FieldName = 'Total_Venda'
      DisplayFormat = '#0.00'
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
    Left = 608
    Top = 280
  end
  object qryVendaItem: TZQuery
    Connection = dtmConexao.ConexaoDB
    Active = True
    SQL.Strings = (
      'SELECT Vendas_Items.vendaID'
      '      ,Vendas_Items.ProdutoID'
      '      ,Produtos.Nome'
      '      ,Vendas_Items.Quantidade'
      '      ,Vendas_Items.Valor_Unitario'
      '      ,Vendas_Items.Total_Produto'
      'FROM dbo.Vendas_Items WITH (NOLOCK)'
      'INNER JOIN dbo.Produtos WITH (NOLOCK)'
      'ON Produtos.ID = Vendas_Items.ProdutoID'
      'WHERE Vendas_Items.VendaID = :VendaID'
      'ORDER BY Vendas_Items.ProdutoID')
    Params = <
      item
        DataType = ftInteger
        Name = 'VendaID'
        ParamType = ptInput
        Value = '1'
      end>
    Left = 416
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VendaID'
        ParamType = ptInput
        Value = '1'
      end>
    object qryVendaItemvendaID: TIntegerField
      FieldName = 'vendaID'
      Required = True
    end
    object qryVendaItemProdutoID: TIntegerField
      FieldName = 'ProdutoID'
      Required = True
    end
    object qryVendaItemNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryVendaItemQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object qryVendaItemValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object qryVendaItemTotal_Produto: TFloatField
      FieldName = 'Total_Produto'
    end
  end
  object dtsVendaItem: TDataSource
    AutoEdit = False
    DataSet = qryVendaItem
    Left = 504
    Top = 360
  end
end
