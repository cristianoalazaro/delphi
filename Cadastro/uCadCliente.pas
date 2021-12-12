unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, cCadCliente, uEnum, udtmConexao;

type
  TfrmCadCliente = class(TfrmTelaHeranca)
    edtClienteID: TLabeledEdit;
    edtNome: TLabeledEdit;
    mskCep: TMaskEdit;
    Label1: TLabel;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    mskTelefone: TMaskEdit;
    Label2: TLabel;
    edtEmail: TLabeledEdit;
    edtNascimento: TDateEdit;
    Label3: TLabel;
    qryListagemID: TIntegerField;
    qryListagemNome: TWideStringField;
    qryListagemEndereco: TWideStringField;
    qryListagemCidade: TWideStringField;
    qryListagemBairro: TWideStringField;
    qryListagemEstado: TWideStringField;
    qryListagemTelefone: TWideStringField;
    qryListagemEmail: TWideStringField;
    qryListagemDataNascimento: TDateTimeField;
    qryListagemCep: TWideStringField;
    edtEstado: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCliente: TCliente;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

{ TfrmCadCliente }

{$Region 'Override'}
function TfrmCadCliente.Apagar: Boolean;
begin
  if oCliente.Selecionar(qryListagem.FieldByName('ID').AsInteger) then
    Result := oCliente.Apagar;
end;

function TfrmCadCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtClienteID.Text <> EmptyStr then
    oCliente.ID := StrToInt(edtClienteID.Text)
  else
    oCliente.ID := 0;

  oCliente.Nome           := edtNome.Text;
  oCliente.Endereco       := edtEndereco.Text;
  oCliente.Cidade         := edtCidade.Text;
  oCliente.Bairro         := edtBairro.Text;
  oCliente.Cep            := mskCep.Text;
  oCliente.Estado         := edtEstado.Text;
  oCliente.Telefone       := mskTelefone.Text;
  oCliente.Email          := edtEmail.Text;
  oCliente.DataNascimento := StrToDate(edtNascimento.Text);

  if EstadoDoCadastro = ecInserir then
    Result := oCliente.Inserir
  else if EstadoDoCadastro = ecAlterar then
    Result := oCliente.Atualizar;
end;
{$EndRegion}

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  if oCliente.Selecionar(qryListagem.FieldByName('Id').AsInteger) then begin
    edtClienteID.Text     := IntToStr(oCliente.ID);
    edtNome.Text          := oCliente.Nome;
    edtEndereco.Text      := oCliente.Endereco;
    edtCidade.Text        := oCliente.Cidade;
    edtBairro.Text        := oCliente.Bairro;
    mskCep.Text           := oCliente.Cep;
    edtEstado.Text        := oCliente.Estado;
    mskTelefone.Text      := oCliente.Telefone;
    edtEmail.Text         := oCliente.Email;
    edtNascimento.Date    := oCliente.DataNascimento;

  end
  else begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNascimento.Date := Date;
  edtNome.SetFocus;
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCliente) then
    FreeAndNil(oCliente);
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente := TCliente.Create(dtmConexao.ConexaoDB);
  IndiceAtual := 'Nome';
end;

end.
