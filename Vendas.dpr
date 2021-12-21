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
  cProVenda in 'Classes\cProVenda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
