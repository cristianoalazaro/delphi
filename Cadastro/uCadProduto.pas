unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, RxCurrEdit ,cCadProduto, ueNum, udtmConexao;

type
  TfrmCadProduto = class(TfrmTelaHeranca)
    qryListagemID: TIntegerField;
    qryListagemNome: TWideStringField;
    qryListagemDescricao: TWideStringField;
    qryListagemValor: TFloatField;
    qryListagemQuantidade: TFloatField;
    qryListagemCategoriaID: TIntegerField;
    qryListagemDescricao_Categoria: TWideStringField;
    edtProdutoID: TLabeledEdit;
    edtNome: TLabeledEdit;
    mmoDescricao: TMemo;
    Label1: TLabel;
    edtValor: TCurrencyEdit;
    Label2: TLabel;
    edtQuantidade: TCurrencyEdit;
    Label3: TLabel;
    cboCategoria: TDBLookupComboBox;
    qryCategoria: TZQuery;
    dtsCategoria: TDataSource;
    qryCategoriaID: TIntegerField;
    qryCategoriaDescription: TWideStringField;
    Label4: TLabel;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    oProduto: TProduto;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro):Boolean; override;

  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

{ TfrmCadProduto }

{$Region 'Override'}
function TfrmCadProduto.Apagar: Boolean;
begin
  if oProduto.Selecionar(qryListagem.FieldByName('ID').AsInteger) then
    Result := oProduto.Apagar;
end;

function TfrmCadProduto.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtProdutoID.Text <> EmptyStr then
    oProduto.ID := StrToInt(edtProdutoID.Text)
  else
    oProduto.ID := 0;

  oProduto.Nome        := edtNome.Text;
  oProduto.Descricao   := mmoDescricao.Text;
  oProduto.Valor       := StrToFloat(edtValor.Text);
  oProduto.quantidade  := StrToFloat(edtQuantidade.Text);
  oProduto.CategoriaId := cboCategoria.KeyValue;

  if EstadoDoCadastro = ecInserir then
    Result := oProduto.Inserir
  else if EstadoDoCadastro = ecAlterar then
    Result := oProduto.Atualizar;
end;

{$EndRegion}

procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
begin
  if oProduto.Selecionar(qryListagem.FieldByName('Id').AsInteger) then begin
    edtProdutoID.Text     := IntToStr(oProduto.ID);
    edtNome.Text          := oProduto.Nome;
    mmoDescricao.Text     := oProduto.Descricao;
    edtValor.Text         := FloatToStr(oProduto.Valor);
    edtQuantidade.Text    := FloatToStr(oProduto.Quantidade);
    cboCategoria.KeyValue := oProduto.CategoriaId;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;

end;

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oProduto) then
    FreeAndNil(oProduto);
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  oProduto := TProduto.Create(dtmConexao.ConexaoDB);
  IndiceAtual := 'Nome';
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  qryCategoria.Open;
end;

end.
