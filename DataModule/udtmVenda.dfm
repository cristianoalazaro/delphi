object dtmVenda: TdtmVenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 332
  Width = 557
  object qryCliente: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT ID'
      '            ,Nome'
      'FROM dbo.Clientes WITH (NOLOCK)')
    Params = <>
    Left = 32
    Top = 24
    object qryClienteID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
      DisplayFormat = 'C'#243'digo'
    end
    object qryClienteNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
  end
  object qryProduto: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT ID'
      '            ,Nome'
      '            ,Valor'
      '            ,Quantidade'
      'FROM dbo.Produtos WITH (NOLOCK)')
    Params = <>
    Left = 111
    Top = 25
    object qryProdutoID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
      DisplayFormat = 'C'#243'digo'
    end
    object qryProdutoNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryProdutoValor: TFloatField
      FieldName = 'Valor'
    end
    object qryProdutoQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
  end
  object cdsItemsVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 24
    object cdsItemsVendaProdutoID: TIntegerField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'ProdutoID'
    end
    object cdsItemsVendaNomeProduto: TStringField
      DisplayLabel = 'Nome do Produto'
      FieldName = 'NomeProduto'
    end
    object cdsItemsVendaQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object cdsItemsVendaValorUnitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'ValorUnitario'
    end
    object cdsItemsVendaValorTotalProduto: TFloatField
      DisplayLabel = 'Total do Produto'
      FieldName = 'ValorTotalProduto'
    end
    object cdsItemsVendaValorTotalVenda: TAggregateField
      FieldName = 'ValorTotalVenda'
      DisplayName = ''
      Expression = 'SUM(ValorTotalProduto)'
    end
  end
  object dtsCliente: TDataSource
    DataSet = qryCliente
    Left = 40
    Top = 80
  end
  object dtsProduto: TDataSource
    DataSet = qryProduto
    Left = 112
    Top = 80
  end
  object dtsItemsVenda: TDataSource
    DataSet = cdsItemsVenda
    Left = 208
    Top = 80
  end
end
