object dtmConexao: TdtmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 306
  Width = 420
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
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
end
