program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  udtmConexao in 'DataModule\udtmConexao.pas' {dtmConexao: TDataModule},
  uTelaHeranca in 'uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategoria in 'Cadastro\uCadCategoria.pas' {frmCadCategoria},
  uEnum in 'Heranca\uEnum.pas',
  cCadCategoria in 'Classes\cCadCategoria.pas',
  uCadCliente in 'Cadastro\uCadCliente.pas' {frmCadCliente},
  cCadCliente in 'Classes\cCadCliente.pas',
  uCadProduto in 'Cadastro\uCadProduto.pas' {frmCadProduto},
  cCadProduto in 'Classes\cCadProduto.pas',
  uFrmAtualizaDB in 'DataModule\uFrmAtualizaDB.pas' {frmAtualizaDB},
  udtmVenda in 'DataModule\udtmVenda.pas' {dtmVendas: TDataModule},
  uProVendas in 'Processo\uProVendas.pas' {frmProVenda},
  cProVenda in 'Classes\cProVenda.pas',
  cControleEstoque in 'Classes\cControleEstoque.pas',
  uRelCadClienteFicha in 'Relatorio\uRelCadClienteFicha.pas' {frmRelCadClienteFicha},
  uRelVenda in 'Relatorio\uRelVenda.pas' {frmRelVenda},
  uRelCadCliente in 'Relatorio\uRelCadCliente.pas' {frmRelCadCliente},
  uRelCategoria in 'Relatorio\uRelCategoria.pas' {frmRelCategoria},
  uRelCadProduto in 'Relatorio\uRelCadProduto.pas' {frmRelCadProduto},
  uSelecionarData in 'Relatorio\uSelecionarData.pas' {frmSelecionarData},
  uRelCadProdutoCategoria in 'Relatorio\uRelCadProdutoCategoria.pas' {frmRelCadProdutoCategoria},
  uRelVendaPorData in 'Relatorio\uRelVendaPorData.pas' {frmRelVendaPorData};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
