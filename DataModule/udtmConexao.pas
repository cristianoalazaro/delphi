unit udtmConexao;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdtmConexao = class(TDataModule)
    ConexaoDB: TZConnection;
    qryScriptCategorias: TZQuery;
    qryProdutos: TZQuery;
    qryClientes: TZQuery;
    qryVendas: TZQuery;
    qryItemsVendas: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmConexao.DataModuleCreate(Sender: TObject);
begin
  with ConexaoDB do
  begin
    User:= 'sa';
    Password := 'fael';
  end;
end;

end.
