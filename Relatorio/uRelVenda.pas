unit uRelVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmRelVenda = class(TForm)
    qryVenda: TZQuery;
    dtsVenda: TDataSource;
    Relatorio: TRLReport;
    RLPDFFilter1: TRLPDFFilter;
    Rodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    BandaDoGrupo: TRLGroup;
    RLBand3: TRLBand;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLBand1: TRLBand;
    RLDBText2: TRLDBText;
    DBEdit1: TDBEdit;
    RLDBText4: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText5: TRLDBText;
    RLBand5: TRLBand;
    RLDBResult2: TRLDBResult;
    RLDraw4: TRLDraw;
    RLLabel4: TRLLabel;
    qryVendaItem: TZQuery;
    dtsVendaItem: TDataSource;
    qryVendaItemvendaID: TIntegerField;
    qryVendaItemProdutoID: TIntegerField;
    qryVendaItemNome: TWideStringField;
    qryVendaItemQuantidade: TFloatField;
    qryVendaItemValor_Unitario: TFloatField;
    qryVendaItemTotal_Produto: TFloatField;
    qryVendaID: TIntegerField;
    qryVendaClienteID: TIntegerField;
    qryVendaNome: TWideStringField;
    qryVendaData_Venda: TDateTimeField;
    qryVendaTotal_Venda: TFloatField;
    RLLabel9: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel5: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLBand2: TRLBand;
    RLBand6: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVenda: TfrmRelVenda;

implementation

{$R *.dfm}

uses udtmConexao;

procedure TfrmRelVenda.FormCreate(Sender: TObject);
begin
  qryVenda.Open;
  qryVendaItem.Open;
end;

procedure TfrmRelVenda.FormDestroy(Sender: TObject);
begin
  qryVenda.Close;
  qryVendaItem.Close;
end;

end.
