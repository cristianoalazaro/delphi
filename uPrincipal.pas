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
    procedure mnmFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cliente1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
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

uses uCadCategoria, uCadCliente, uCadProduto, uProVendas;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  frmCadCategoria := TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.ShowModal;
  frmCadCliente.Release;
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

procedure TfrmPrincipal.Venda1Click(Sender: TObject);
begin
   frmProVenda := tfrmProVenda.Create(Self);
   frmProVenda.ShowModal;
   frmProVenda.Release;
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
