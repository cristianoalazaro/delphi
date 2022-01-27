unit uRelCadProdutoCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmRelCadProdutoCategoria = class(TForm)
    qryProduto: TZQuery;
    dtsProduto: TDataSource;
    Relatorio: TRLReport;
    RLPDFFilter1: TRLPDFFilter;
    Rodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    qryProdutoID: TIntegerField;
    qryProdutoNome: TWideStringField;
    qryProdutoDescricao: TWideStringField;
    qryProdutoValor: TFloatField;
    qryProdutoQuantidade: TFloatField;
    qryProdutoCategoriaID: TIntegerField;
    qryProdutoDescricaoCategoria: TWideStringField;
    BandaDoGrupo: TRLGroup;
    RLBand3: TRLBand;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLBand2: TRLBand;
    RLBand1: TRLBand;
    RLDBText2: TRLDBText;
    DBEdit1: TDBEdit;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDraw3: TRLDraw;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLDBResult2: TRLDBResult;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadProdutoCategoria: TfrmRelCadProdutoCategoria;

implementation

{$R *.dfm}

uses udtmConexao;

procedure TfrmRelCadProdutoCategoria.FormCreate(Sender: TObject);
begin
  qryProduto.Open;
end;

procedure TfrmRelCadProdutoCategoria.FormDestroy(Sender: TObject);
begin
  qryProduto.Close;
end;

end.
