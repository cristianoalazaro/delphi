unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, udtmConexao, uEnum;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    qryListagem: TZQuery;
    dtsListagem: TDataSource;
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
  private
    { Private declarations }
    EstadoDoCadastro: TEstadoDoCadastro;
    procedure ControlarBotoes(btnNovo, btnAlterar,
          btnCancelar, btnGravar, btnApagar: TBitBtn;
          btnNavigator: TDBNavigator; pgcPrincipal: TPageControl;
          flag: Boolean);
    procedure ControlarIndiceTab(
    pgcPrincial: TPageControl; Indice: integer);
    function RetornarCampoTraduzido(Campo: string): string;
    procedure ExibitLabelIndice(Campo: string; aLabel: TLabel);

  public
    { Public declarations }
    IndiceAtual: string;
    function Excluir: boolean; virtual;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; virtual;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

{$Region 'Funções e Procedures}
 procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar,
          btnCancelar, btnGravar, btnApagar: TBitBtn;
          btnNavigator: TDBNavigator; pgcPrincipal: TPageControl;
          flag: Boolean);
begin
  btnNovo.Enabled := flag;
  btnAlterar.Enabled := flag;
  btnCancelar.Enabled := not flag;
  btnGravar.Enabled := not flag;
  btnApagar.Enabled := flag;
  btnNavigator.Enabled := flag;
  pgcPrincipal.Pages[0].TabVisible := flag;
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(
      pgcPrincial: TPageControl; Indice: integer);
begin
  if (pgcPrincipal.Pages[Indice].TabVisible) then
    pgcPrincipal.TabIndex := indice;
end;

function TfrmTelaHeranca.RetornarCampoTraduzido(Campo: string):string;
  var i: integer;
begin
  for i := 0 to qryListagem.Fields.Count -1 do begin
    if (LowerCase(qryListagem.Fields[i].FieldName) = LowerCase(Campo)) then begin
      Result := qryListagem.Fields[i].DisplayLabel;
      Break;
    end;
  end;
end;

procedure TfrmTelaHeranca.ExibitLabelIndice(Campo: string; aLabel: TLabel);
begin
  aLabel.Caption := RetornarCampoTraduzido(Campo);
end;

{$EndRegion}

{$Region 'Métodos Virtuais'}
function TfrmTelaHeranca.Excluir: boolean;
begin
  ShowMessage('Deletado');
  Result := true;
end;

function TfrmTelaHeranca.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if EstadoDoCadastro = ecInserir then
    ShowMessage('Inserir')
  else if EstadoDoCadastro = ecAlterar then
    ShowMessage('Alterar');

  Result := true;
end;

{$endRegion}

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
            btnApagar, btnNavigator, pgcPrincipal, false);
  EstadoDoCadastro := ecInserir;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
          btnApagar, btnNavigator, pgcPrincipal, false);
  EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  if Excluir then begin
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
              btnApagar, btnNavigator, pgcPrincipal, true);
    ControlarIndiceTab(pgcPrincipal, 0);
    EstadoDoCadastro := ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
            btnApagar, btnNavigator, pgcPrincipal, true);
  ControlarIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  try
    if Gravar(EstadoDoCadastro) then begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                btnApagar, btnNavigator, pgcPrincipal, true);
      ControlarIndiceTab(pgcPrincipal, 0);
    end;
  finally
    EstadoDoCadastro := ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  qryListagem.Connection := dtmConexao.ConexaoDB;
  dtsListagem.DataSet := qryListagem;
  grdListagem.DataSource := dtsListagem;
end;

procedure TfrmTelaHeranca.FormDestroy(Sender: TObject);
begin
  qryListagem.Active := false;
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if qryListagem.SQL.Text <> EmptyStr then  begin
    qryListagem.IndexFieldNames:= IndiceAtual;
    ExibitLabelIndice(IndiceAtual, lblIndice);
    qryListagem.Open;
  end;
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                  btnApagar, btnNavigator, pgcPrincipal, true);

end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  qryListagem.IndexFieldNames := IndiceAtual;
  ExibitLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
  qryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey, loCaseInsensitive]);
  //qryListagem.Locate(IndiceAtual, mskPesquisar.Text, [loPartialKey, loCaseInsensitive]);
end;

end.
