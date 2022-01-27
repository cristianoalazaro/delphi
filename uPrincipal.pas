unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, udtmConexao, uFrmAtualizaDB;

type
  TfrmPrincipal = class(TForm)
    mnmPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentao1: TMenuItem;
    Relatrio1: TMenuItem;
    Cliente1: TMenuItem;
    N1: TMenuItem;
    Categoria1: TMenuItem;
    Produto1: TMenuItem;
    N2: TMenuItem;
    mnmFechar: TMenuItem;
    Venda1: TMenuItem;
    Cliente2: TMenuItem;
    N3: TMenuItem;
    Produto2: TMenuItem;
    N4: TMenuItem;
    Vendapordata1: TMenuItem;
    Categoria2: TMenuItem;
    FichadeCliente1: TMenuItem;
    ProdutosporCategoria1: TMenuItem;
    procedure mnmFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cliente1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure Categoria2Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure FichadeCliente1Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure ProdutosporCategoria1Click(Sender: TObject);
    procedure Vendapordata1Click(Sender: TObject);
  private
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente, uCadProduto, uProVendas, uRelCategoria,
  uRelCadCliente, uRelCadClienteFicha, uRelCadProduto, uRelCadProdutoCategoria,
  uSelecionarData;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  frmCadCategoria := TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.Categoria2Click(Sender: TObject);
begin
  frmRelCategoria := TfrmRelCategoria.Create(Self);
  frmRelCategoria.Relatorio.PreviewModal;
  frmRelCategoria.Release;
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.ShowModal;
  frmCadCliente.Release;
end;

procedure TfrmPrincipal.Cliente2Click(Sender: TObject);
begin
  frmRelCadCliente := TfrmRelCadCliente.Create(Self);
  frmRelCadCliente.Relatorio.PreviewModal;
  frmRelCadCliente.Release;
end;

procedure TfrmPrincipal.FichadeCliente1Click(Sender: TObject);
begin
  frmRelCadClienteFicha := TfrmRelCadClienteFicha.Create(Self);
  frmRelCadClienteFicha.Relatorio.PreviewModal;
  frmRelCadClienteFicha.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dtmConexao);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmAtualizaDB := TfrmAtualizaDB.Create(Self);
  frmAtualizaDB.Show;
  frmAtualizaDB.Refresh;
  dtmConexao := TdtmConexao.Create(Self);
  with dtmConexao.ConexaoDB do
  begin
    SQLHourGlass := true;
    Connected := true;
  end;
  AtualizacaoBancoDados(frmAtualizaDB);
  frmAtualizaDB.Free;
end;

procedure TfrmPrincipal.mnmFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.Produto1Click(Sender: TObject);
begin
  frmCadProduto := TfrmCadProduto.Create(Self);
  frmCadProduto.ShowModal;
  frmCadProduto.Release;
end;

procedure TfrmPrincipal.Produto2Click(Sender: TObject);
begin
  frmRelCadProduto := TfrmRelCadProduto.Create(Self);
  frmRelCadProduto.Relatorio.PreviewModal;
  frmRelCadProduto.Release;
end;

procedure TfrmPrincipal.ProdutosporCategoria1Click(Sender: TObject);
begin
  frmRelCadProdutoCategoria := TfrmRelCadProdutoCategoria.Create(Self);
  frmRelCadProdutoCategoria.Relatorio.PreviewModal;
  frmRelCadProdutoCategoria.Release;
end;

procedure TfrmPrincipal.Venda1Click(Sender: TObject);
begin
   frmProVenda := tfrmProVenda.Create(Self);
   frmProVenda.ShowModal;
   frmProVenda.Release;
end;

procedure TfrmPrincipal.Vendapordata1Click(Sender: TObject);
begin
  frmSelecionarData :=  TfrmSelecionarData.Create(Self);
  frmSelecionarData.ShowModal;
  frmSelecionarData.Release;
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
begin
  aForm.chkConexao.Checked := true;
  aForm.Refresh;
  dtmConexao.qryScriptCategorias.ExecSQL;
  aForm.chkCategoria.Checked := true;
  aForm.Refresh;
  Sleep(100);
  dtmConexao.qryProdutos.ExecSQL;
  aForm.chkProduto.Checked := true;
  aForm.Refresh;
  Sleep(100);
  dtmConexao.qryClientes.ExecSQL;
  aForm.chkCliente.Checked := true;
  aForm.Refresh;
  Sleep(100);
  dtmConexao.qryVendas.ExecSQL;
  aForm.chkVenda.Checked := true;
  aForm.Refresh;
  Sleep(100);
  dtmConexao.qryItemsVendas.ExecSQL;
  aForm.chkItemsVenda.Checked := true;
  aForm.Refresh;
  Sleep(100);

end;

end.
