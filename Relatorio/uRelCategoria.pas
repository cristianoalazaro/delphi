unit uRelCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmRelCategoria = class(TForm)
    qryCategoria: TZQuery;
    qryCategoriaID: TIntegerField;
    qryCategoriaDESCRIPTION: TWideStringField;
    dtsCategoria: TDataSource;
    Relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
    Rodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand1: TRLBand;
    RLDBText2: TRLDBText;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    DBEdit1: TDBEdit;
    RLDBText1: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCategoria: TfrmRelCategoria;

implementation

{$R *.dfm}

uses udtmConexao;

procedure TfrmRelCategoria.FormCreate(Sender: TObject);
begin
  qryCategoria.Open;
end;

procedure TfrmRelCategoria.FormDestroy(Sender: TObject);
begin
  qryCategoria.Close;
end;

end.
