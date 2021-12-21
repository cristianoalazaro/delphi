unit udtmVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Datasnap.DBClient;

type
  TdtmVendas = class(TDataModule)
    qryCliente: TZQuery;
    qryClienteID: TIntegerField;
    qryClienteNome: TWideStringField;
    qryProduto: TZQuery;
    qryProdutoID: TIntegerField;
    qryProdutoNome: TWideStringField;
    qryProdutoValor: TFloatField;
    qryProdutoQuantidade: TFloatField;
    cdsItemsVenda: TClientDataSet;
    dtsCliente: TDataSource;
    dtsProduto: TDataSource;
    dtsItemsVenda: TDataSource;
    cdsItemsVendaProdutoID: TIntegerField;
    cdsItemsVendaNomeProduto: TStringField;
    cdsItemsVendaQuantidade: TFloatField;
    cdsItemsVendaValorUnitario: TFloatField;
    cdsItemsVendaValorTotalProduto: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVendas: TdtmVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udtmConexao;

{$R *.dfm}

procedure TdtmVendas.DataModuleCreate(Sender: TObject);
begin
  cdsItemsVenda.CreateDataSet;
  qryCliente.Open;
  qryProduto.Open;
end;

procedure TdtmVendas.DataModuleDestroy(Sender: TObject);
begin
  cdsItemsVenda.Destroy;
  qryCliente.Close;
  qryProduto.Close;
end;

end.
