inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = tabManutencao
    inherited tabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao_Categoria'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object Label1: TLabel
        Left = 12
        Top = 95
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 12
        Top = 184
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label3: TLabel
        Left = 150
        Top = 184
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object Label4: TLabel
        Left = 303
        Top = 51
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object edtProdutoID: TLabeledEdit
        Tag = 1
        Left = 12
        Top = 21
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 12
        Top = 66
        Width = 276
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object mmoDescricao: TMemo
        Left = 12
        Top = 111
        Width = 573
        Height = 66
        Lines.Strings = (
          'mmoDescricao')
        MaxLength = 255
        TabOrder = 3
      end
      object edtValor: TCurrencyEdit
        Left = 12
        Top = 200
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edtQuantidade: TCurrencyEdit
        Left = 146
        Top = 200
        Width = 121
        Height = 21
        DisplayFormat = '0.00; ,0.00'
        TabOrder = 5
      end
      object cboCategoria: TDBLookupComboBox
        Left = 304
        Top = 66
        Width = 281
        Height = 21
        KeyField = 'ID'
        ListField = 'Description'
        ListSource = dtsCategoria
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT p.ID'
      '           ,p.Nome'
      '           ,p.Descricao'
      '           ,p.Valor'
      '           ,p.Quantidade'
      '           ,p.CategoriaID'
      '           ,c.Description AS Descricao_Categoria'
      'FROM dbo.PRODUTOS AS p  WITH (NOLOCK)'
      'LEFT JOIN dbo.Categorias c WITH (NOLOCK)'
      'ON c.ID = p.CategoriaID')
    object qryListagemID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryListagemNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryListagemDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 255
    end
    object qryListagemValor: TFloatField
      FieldName = 'Valor'
    end
    object qryListagemQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object qryListagemCategoriaID: TIntegerField
      DisplayLabel = 'Cod Categoria'
      FieldName = 'CategoriaID'
    end
    object qryListagemDescricao_Categoria: TWideStringField
      DisplayLabel = 'Descri'#231#227'o da Categoria'
      FieldName = 'Descricao_Categoria'
      Required = True
      Size = 50
    end
  end
  object qryCategoria: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT ID'
      '            ,Description'
      'FROM dbo.Categorias WITH (NOLOCK)')
    Params = <>
    Left = 332
    Top = 80
    object qryCategoriaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryCategoriaDescription: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Description'
      Required = True
      Size = 50
    end
  end
  object dtsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 388
    Top = 80
  end
end
