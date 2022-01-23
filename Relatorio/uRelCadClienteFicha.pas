unit uRelCadClienteFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, RLXLSXFilter;

type
  TfrmRelCadClienteFicha = class(TForm)
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
    RLDBText1: TRLDBText;
    qryClienteID: TIntegerField;
    qryClienteNome: TWideStringField;
    qryClienteEmail: TWideStringField;
    qryClienteTelefone: TWideStringField;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLXLSXFilter1: TRLXLSXFilter;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel8: TRLLabel;
    qryClienteEndereco: TWideStringField;
    qryClienteBairro: TWideStringField;
    qryClienteCidade: TWideStringField;
    qryClienteEstado: TWideStringField;
    qryClienteDataNascimento: TDateTimeField;
    qryClienteCEP: TWideStringField;
    RLLabel9: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel13: TRLLabel;
    RLDBText10: TRLDBText;
    RLDraw3: TRLDraw;
    RLAngleLabel1: TRLAngleLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadClienteFicha: TfrmRelCadClienteFicha;

implementation

{$R *.dfm}

uses udtmConexao;

procedure TfrmRelCadClienteFicha.FormCreate(Sender: TObject);
begin
  qryCliente.Open;
end;

procedure TfrmRelCadClienteFicha.FormDestroy(Sender: TObject);
begin
  qryCliente.Close;
end;

end.
