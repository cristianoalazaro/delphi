object dtmConexao: TdtmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 306
  Width = 521
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    Connected = True
    SQLHourGlass = True
    HostName = '.\SQLEXPRESS'
    Port = 0
    Database = 'Vendas'
    User = ''
    Password = 'fael'
    Protocol = 'mssql'
    LibraryLocation = 'D:\Projetos\Delphi\Projeto2\Lib\ntwdblib.dll'
    Left = 24
    Top = 32
  end
  object qryScriptCategorias: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'CATEGORIAS'#39') IS NULL'
      'BEGIN'
      '  CREATE TABLE Categorias(ID INTEGER IDENTITY(1,1) NOT NULL'
      '                         ,Descricao VARCHAR(30)'
      #9#9#9#9#9#9'             ,PRIMARY KEY(ID))'
      'END')
    Params = <>
    Left = 88
    Top = 32
  end
  object qryProdutos: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'PRODUTOS'#39') IS NULL'
      'BEGIN'
      '  CREATE TABLE PRODUTOS(ID INTEGER IDENTITY(1,1) NOT NULL'
      '                       ,Nome VARCHAR(60)'
      #9#9#9#9#9'             ,Descricao VARCHAR(255)'
      #9#9#9#9#9'             ,Valor DECIMAL(18,5) DEFAULT 0.00000'
      #9#9#9#9#9'             ,Quantidade DECIMAL(18,5) default 0.00000'
      #9#9#9#9#9'             ,CategoriaID INTEGER'
      #9#9#9#9#9'             ,PRIMARY KEY(ID)'
      
        #9#9#9#9#9'             ,CONSTRAINT FK_PRODUTOS_CATEGORIAS FOREIGN KEY' +
        ' (CategoriaID) REFERENCES Categorias(ID))'
      'END')
    Params = <>
    Left = 175
    Top = 32
  end
  object qryClientes: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'CLIENTES'#39') IS NULL'
      'BEGIN'
      '  CREATE TABLE Clientes(ID INTEGER IDENTITY(1,1) NOT NULL'
      '                       ,Nome VARCHAR(60)'
      #9#9#9#9#9'   ,Endereco VARCHAR(60)'
      #9#9#9#9#9'   ,Cidade VARCHAR(50)'
      #9#9#9#9#9'   ,Bairro VARCHAR(40)'
      #9#9#9#9#9'   ,Estado CHAR(2)'
      #9#9#9#9#9'   ,CEP VARCHAR(9)'
      #9#9#9#9#9'   ,Telefone VARCHAR(14)'
      #9#9#9#9#9'   ,Email VARCHAR(100)'
      #9#9#9#9#9'   ,DataNascimento DATETIME'
      #9#9#9#9#9'   ,PRIMARY KEY(ID))'
      'END')
    Params = <>
    Left = 245
    Top = 32
  end
  object qryVendas: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'VENDAS'#39') IS NULL'
      'BEGIN'
      'CREATE TABLE VENDAS(ID INTEGER IDENTITY(1,1) NOT NULL'
      '                   ,ClienteID INTEGER NOT NULL'
      #9#9#9#9'           ,Data_Venda DATETIME DEFAULT GETDATE()'
      #9#9#9#9'           ,Total_Venda DECIMAL(18,5) DEFAULT 0.0000'
      #9#9#9#9'           ,PRIMARY KEY(ID)'
      
        #9#9#9#9'           ,CONSTRAINT FK_VENDAS_CLIENTES FOREIGN KEY (Clien' +
        'teID) REFERENCES Clientes(ID))'
      'END')
    Params = <>
    Left = 309
    Top = 33
  end
  object qryItemsVendas: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'VENDAS_ITEMS'#39') IS NULL'
      'BEGIN'
      'CREATE TABLE VENDAS_ITEMS(VendaID INTEGER NOT NULL'
      '                         ,ProdutoID INTEGER NOT NULL'
      #9#9#9#9#9#9'             ,Data_Venda DATETIME DEFAULT GETDATE()'
      #9#9#9#9#9#9'             ,Valor_Unitario DECIMAL(18,5) DEFAULT 0.0000'
      #9#9#9#9#9#9'             ,Quantidade DECIMAL(18,5) DEFAULT 0.0000'
      #9#9#9#9#9#9'             ,Total_Produto DECIMAL(18,5) DEFAULT 0.0000'
      #9#9#9#9#9#9'             ,PRIMARY KEY(VendaID, ProdutoID)'
      
        #9#9#9#9#9#9'             ,CONSTRAINT FK_Vendas_Items_Produtos FOREIGN ' +
        'KEY (ProdutoID) REFERENCES Produtos(ID))'
      'END')
    Params = <>
    Left = 381
    Top = 34
  end
end
