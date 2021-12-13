unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, udtmConexao, uEnum, RxCurrEdit, RxToolEdit;

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
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarBotoes(btnNovo, btnAlterar,
          btnCancelar, btnGravar, btnApagar: TBitBtn;
          btnNavigator: TDBNavigator; pgcPrincipal: TPageControl;
          flag: Boolean);
    procedure ControlarIndiceTab(
    pgcPrincial: TPageControl; Indice: integer);
    function RetornarCampoTraduzido(Campo: string): string;
    procedure ExibitLabelIndice(Campo: string; aLabel: TLabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdits;

  public
    { Public declarations }
    IndiceAtual: string;
    EstadoDoCadastro: TEstadoDoCadastro;
    function Apagar: boolean; virtual;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; virtual;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

{$Region 'Observações'}
  //TAG: 1 - Chave primária (PK)
  //TAG: 2 - Campos obrigatórios
{$EndRegion}

{$Region 'Funções e Procedures'}
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

function TfrmTelaHeranca.ExisteCampoObrigatorio: Boolean;
  var i: integer;
begin
  Result := false;

  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TLabeledEdit then begin
      if (TLabeledEdit(Components[i]).Tag = 2) and (TLabeledEdit(Components[i]).Text
          = EmptyStr) then begin
          MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption +
              ' é um campo obrigatório', mtInformation, [mbOk], 0);
          TLabeledEdit(Components[i]).SetFocus;
          Result := true;
          Break;
        end;

    end;
  end;
end;

procedure TfrmTelaHeranca.DesabilitarEditPK;
  var i: integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then begin
      if (TLabeledEdit(Components[i]).Tag = 1) then begin
        TLabeledEdit(Components[i]).Enabled := false;
        break;
      end;

    end;

  end;
end;

procedure TfrmTelaHeranca.LimparEdits;
  var i: integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TLabeledEdit then
      TLabeledEdit(Components[i]).Text := EmptyStr;
    if Components[i] is TMemo then
      TMemo(Components[i]).Text := EmptyStr;
    if Components[i] is tCurrencyEdit then
      TCurrencyEdit(Components[i]).Value := 0;
    if Components[i] is TDBLookupComboBox then
      TDBLookupComboBox(Components[i]).KeyValue := null;
    if Components[i] is TDateEdit then
      TDateEdit(Components[i]).Date := 0;
    if Components[i] is TMaskEdit then
      TMaskEdit(Components[i]).Text := EmptyStr;
  end;
end;
{$EndRegion}

{$Region 'Métodos Virtuais'}
function TfrmTelaHeranca.Apagar: boolean;
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
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
          btnApagar, btnNavigator, pgcPrincipal, false);
  EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  try
    if Apagar then begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                btnApagar, btnNavigator, pgcPrincipal, true);
      ControlarIndiceTab(pgcPrincipal, 0);
      LimparEdits;
      qryListagem.Refresh;
    end
    else begin
      MessageDlg('Erro na Exclusão', mtError, [mbOk],0);
    end;
  finally
    EstadoDoCadastro := ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
            btnApagar, btnNavigator, pgcPrincipal, true);
  ControlarIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro := ecNenhum;
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  if ExisteCampoObrigatorio then
    abort;
  try
    if Gravar(EstadoDoCadastro) then begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                btnApagar, btnNavigator, pgcPrincipal, true);
      ControlarIndiceTab(pgcPrincipal, 0);
      EstadoDoCadastro := ecNenhum;
      LimparEdits;
      qryListagem.Refresh;
    end
    else
      MessageDlg('Erro na gravação', mtError, [mbOk],0);
  finally
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
  ControlarIndiceTab(pgcPrincipal, 0);
  DesabilitarEditPK;
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                  btnApagar, btnNavigator, pgcPrincipal, true);

end;

procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
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
