unit uRelCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, RLXLSXFilter;

type
  TfrmRelCadCliente = class(TForm)
    qryCliente: TZQuery;
    dtsCliente: TDataSource;
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
    qryClienteID: TIntegerField;
    qryClienteNome: TWideStringField;
    qryClienteEmail: TWideStringField;
    qryClienteTelefone: TWideStringField;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLXLSXFilter1: TRLXLSXFilter;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadCliente: TfrmRelCadCliente;

implementation

{$R *.dfm}

uses udtmConexao;

procedure TfrmRelCadCliente.FormCreate(Sender: TObject);
begin
  qryCliente.Open;
end;

procedure TfrmRelCadCliente.FormDestroy(Sender: TObject);
begin
  qryCliente.Close;
end;

end.
