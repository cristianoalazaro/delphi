object frmRelCadProdutoCategoria: TfrmRelCadProdutoCategoria
  Left = 0
  Top = 0
  Caption = 'frmRelCadProdutoCategoria'
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
    DataSource = dtsProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Transparent = False
    object Rodape: TRLBand
      Left = 38
      Top = 217
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
      Height = 136
      DataFields = 'CategoriaID'
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
          Width = 70
          Height = 16
          Caption = 'Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 77
          Top = 3
          Width = 20
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'CategoriaID'
          DataSource = dtsProduto
          Text = ''
        end
        object RLLabel9: TRLLabel
          Left = 103
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
        end
        object RLDBText6: TRLDBText
          Left = 117
          Top = 3
          Width = 117
          Height = 16
          DataField = 'DescricaoCategoria'
          DataSource = dtsProduto
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
          Width = 41
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel4: TRLLabel
          Left = 444
          Top = 3
          Width = 132
          Height = 16
          Caption = 'Quantidade Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 673
          Top = 3
          Width = 38
          Height = 16
          Caption = 'Valor'
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
          DataSource = dtsProduto
          Text = ''
          Transparent = False
        end
        object DBEdit1: TDBEdit
          Left = 184
          Top = 24
          Width = 134
          Height = 24
          DataField = 'ID'
          DataSource = dtsProduto
          TabOrder = 1
        end
        object RLDBText1: TRLDBText
          Left = 3
          Top = 3
          Width = 16
          Height = 16
          DataField = 'ID'
          DataSource = dtsProduto
          Text = ''
          Transparent = False
        end
        object RLDBText3: TRLDBText
          Left = 506
          Top = 0
          Width = 70
          Height = 16
          Alignment = taRightJustify
          DataField = 'Quantidade'
          DataSource = dtsProduto
          Text = ''
          Transparent = False
        end
        object RLDBText4: TRLDBText
          Left = 677
          Top = 3
          Width = 34
          Height = 16
          Alignment = taRightJustify
          DataField = 'Valor'
          DataSource = dtsProduto
          Text = ''
          Transparent = False
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 70
        Width = 718
        Height = 43
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 602
          Top = 4
          Width = 109
          Height = 16
          Alignment = taRightJustify
          DataField = 'Quantidade'
          DataSource = dtsProduto
          Info = riSum
          Text = ''
        end
        object RLDraw3: TRLDraw
          Left = 506
          Top = -2
          Width = 212
          Height = 9
          DrawKind = dkLine
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 343
          Top = 4
          Width = 247
          Height = 16
          Caption = 'Quantidade de Estoque por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel11: TRLLabel
          Left = 394
          Top = 23
          Width = 196
          Height = 16
          Caption = 'M'#233'dia do Valor por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBResult2: TRLDBResult
          Left = 619
          Top = 23
          Width = 92
          Height = 16
          Alignment = taRightJustify
          DataField = 'Valor'
          DataSource = dtsProduto
          Info = riAverage
          Text = ''
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
        Width = 372
        Height = 24
        Caption = 'Listagem de Produtos por Categoria'
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
  end
  object qryProduto: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT Produtos.ID'
      '      ,Produtos.Nome'
      '      ,Produtos.Descricao'
      '      ,Produtos.Valor'
      '      ,Produtos.Quantidade'
      '      ,Produtos.CategoriaID'
      '      ,Categorias.Description AS DescricaoCategoria'
      'FROM dbo.Produtos WITH (NOLOCK)'
      'LEFT JOIN dbo.Categorias WITH (NOLOCK)'
      'ON Categorias.ID = Produtos.ID'
      'ORDER BY Produtos.CategoriaID, Produtos.ID')
    Params = <>
    Left = 416
    Top = 272
    object qryProdutoID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryProdutoNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryProdutoDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object qryProdutoValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.00'
    end
    object qryProdutoQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '#0.00'
    end
    object qryProdutoCategoriaID: TIntegerField
      FieldName = 'CategoriaID'
    end
    object qryProdutoDescricaoCategoria: TWideStringField
      FieldName = 'DescricaoCategoria'
      Required = True
      Size = 50
    end
  end
  object dtsProduto: TDataSource
    AutoEdit = False
    DataSet = qryProduto
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
