unit uProVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, RxCurrEdit, udtmVenda, cProVenda, uEnum;

type
  TfrmProVenda = class(TfrmTelaHeranca)
    qryListagemID: TIntegerField;
    qryListagemNome: TWideStringField;
    qryListagemData_Venda: TDateTimeField;
    qryListagemTotal_Venda: TFloatField;
    qryListagemClienteID: TIntegerField;
    edtVendaID: TLabeledEdit;
    dboCliente: TDBLookupComboBox;
    Cliente: TLabel;
    edtDataVenda: TDateEdit;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    edtTotalVenda: TCurrencyEdit;
    Label1: TLabel;
    dbGridItemVendas: TDBGrid;
    Label2: TLabel;
    dboProduto: TDBLookupComboBox;
    edtValorUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    btnAidicionarItem: TBitBtn;
    btnApagarItem: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridItemVendasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAidicionarItemClick(Sender: TObject);
    procedure dboProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarItemClick(Sender: TObject);
    procedure dbGridItemVendasDblClick(Sender: TObject);
  private
    { Private declarations }
    dtmVendas: TdtmVendas;
    oVenda: TVenda;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro):Boolean; override;
    function TotalizarProduto(valorUnitario, quantidade: double): double;
    procedure LimparComponentesItem;
    procedure LimparCds;
    procedure CarregaRegistroSelecionado;
    function TotalizarVenda: Double;

  public
    { Public declarations }
  end;

var
  frmProVenda: TfrmProVenda;

implementation

{$R *.dfm}

uses udtmConexao, uRelVenda;

{$Region 'Override'}
function TfrmProVenda.Apagar: Boolean;
begin
  if oVenda.Selecionar(qryListagem.FieldByName('ID').AsInteger, dtmVendas.cdsItemsVenda) then
    Result := oVenda.Apagar;
end;

function TfrmProVenda.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtVendaID.Text <> EmptyStr then
    oVenda.ID := StrToInt(edtVendaID.Text)
  else
    oVenda.ID := 0;

  oVenda.ClienteID := dboCliente.KeyValue;
  oVenda.DataVenda := edtDataVenda.Date;
  oVenda.TotalVenda := edtTotalVenda.Value;

  if EstadoDoCadastro = ecInserir then
    oVenda.ID := oVenda.Inserir(dtmVendas.cdsItemsVenda)
  else if EstadoDoCadastro = ecAlterar then
    oVenda.Atualizar(dtmVendas.cdsItemsVenda);

  Result := true;

  frmRelVenda := TfrmRelVenda.Create(Self);
  frmRelVenda.qryVenda.Close;
  frmRelVenda.qryVenda.ParamByName('Vendas_ID').AsInteger := oVenda.ID;
  frmRelVenda.qryVenda.Open;

  frmRelVenda.qryVendaItem.Close;
  frmRelVenda.qryVendaItem.ParamByName('VendaID').AsInteger := oVenda.ID;
  frmRelVenda.qryVendaItem.Open;

  frmRelVenda.Relatorio.PreviewModal;
  frmRelVenda.Release;

end;
{$EndRegion}

procedure TfrmProVenda.btnAidicionarItemClick(Sender: TObject);
begin
  inherited;
  if dboProduto.KeyValue = null then begin
    MessageDlg('Produto é um campo obrigatório', mtInformation, [mbOK], 0);
    dboProduto.SetFocus;
    abort;
  end;

  if edtValorUnitario.Value <= 0 then begin
    MessageDlg('Valor unitário não pode ser Zero', mtInformation, [mbOK], 0);
      edtValorUnitario.SetFocus;
      abort;
  end;

  if edtQuantidade.Value <= 0 then begin
    MessageDlg('Quantidade não pode ser Zero', mtInformation, [mbOK], 0);
    edtQuantidade.SetFocus;
    abort;
  end;

  if dtmVendas.cdsItemsVenda.Locate('ProdutoID',dboProduto.KeyValue,[]) then begin
    MessageDlg('Este produto já foi selecionado', mtInformation, [mbOK], 0);
    dboProduto.SetFocus;
    abort;
  end;

  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);

  with dtmVendas.cdsItemsVenda do begin
    Append;
    FieldByName('ProdutoID').AsString := dboProduto.KeyValue;
    FieldByName('NomeProduto').AsString := dtmVendas.qryProduto.FieldByName('Nome').AsString;
    FieldByName('Quantidade').AsFloat := edtQuantidade.Value;
    FieldByName('ValorUnitario').AsFloat := edtValorUnitario.Value;
    FieldByName('ValorTotalProduto').AsFloat := edtTotalProduto.Value;
    Post;
    edtTotalVenda.Value := TotalizarVenda;
    LimparComponentesItem;
    dboProduto.SetFocus;
  end;

end;

procedure TfrmProVenda.LimparComponentesItem;
begin
  dboProduto.KeyValue := null;
  edtQuantidade.Value := 0;
  edtValorUnitario.Value := 0;
  edtTotalProduto.Value := 0;
end;

function TfrmProVenda.TotalizarProduto(valorUnitario, quantidade:double):double;
begin
  Result := valorUnitario * quantidade;
end;

procedure TfrmProVenda.LimparCds;
begin
  while not dtmVendas.cdsItemsVenda.Eof do
    dtmVendas.cdsItemsVenda.Delete;
end;

procedure TfrmProVenda.CarregaRegistroSelecionado;
begin
  dboProduto.KeyValue := dtmVendas.cdsItemsVenda.FieldByName('ProdutoID').AsInteger;
  edtQuantidade.Value := dtmVendas.cdsItemsVenda.FieldByName('Quantidade').AsInteger;
  edtValorUnitario.Value := dtmVendas.cdsItemsVenda.FieldByName('ValorUnitario').AsFloat;
  edtTotalProduto.Value := dtmVendas.cdsItemsVenda.FieldByName('ValorTotalProduto').AsFloat;
end;

procedure TfrmProVenda.btnAlterarClick(Sender: TObject);
begin
  if oVenda.Selecionar(qryListagem.FieldByName('ID').AsInteger, dtmVendas.cdsItemsVenda) then begin
    edtVendaID.Text := IntToStr(oVenda.ID);
    dboCliente.KeyValue := oVenda.ClienteID;
    edtDataVenda.Date := oVenda.DataVenda;
    edtTotalVenda.Text := FloatToStr(oVenda.TotalVenda);
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
end;

procedure TfrmProVenda.btnApagarItemClick(Sender: TObject);
begin
  inherited;
  if dboProduto.KeyValue = null then begin
    MessageDlg('Selecione o produto a ser excluido', mtInformation, [mbOK], 0);
    dbGridItemVendas.SetFocus;
    abort;
  end;

  if dtmVendas.cdsItemsVenda.Locate('ProdutoID', dboProduto.KeyValue, []) then begin
    dtmVendas.cdsItemsVenda.Delete;
    edtTotalVenda.Value := TotalizarVenda;
    LimparComponentesItem;
  end;


end;

procedure TfrmProVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVenda.btnGravarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVenda.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date := Date;
  dboCliente.SetFocus;
  LimparCds;
end;

procedure TfrmProVenda.dbGridItemVendasDblClick(Sender: TObject);
begin
  inherited;
  CarregaRegistroSelecionado;
end;

procedure TfrmProVenda.dbGridItemVendasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    BloqueiaCTRL_DEL_DBGRID(Key,Shift);
end;

procedure TfrmProVenda.dboProdutoExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(Sender).KeyValue <> null then begin
    edtValorUnitario.Value := dtmVendas.qryProduto.FieldByName('Valor').AsFloat;
    edtQuantidade.Value := 1;
    edtTotalProduto.Value := totalizarProduto(edtQuantidade.Value, edtValorUnitario.Value);
  end;
end;

procedure TfrmProVenda.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.edtValorUnitarioExit(Sender: TObject);
begin
  inherited;
    edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVendas) then
    FreeAndNil(dtmVendas);

  if Assigned(oVenda) then
    FreeAndNil(oVenda);
end;

function TfrmProVenda.TotalizarVenda:Double;
begin
  Result := 0;
  dtmVendas.cdsItemsVenda.First;
  while not dtmVendas.cdsItemsVenda.Eof do begin
    Result := Result + dtmVendas.cdsItemsVenda.FieldByName('ValorTotalProduto').AsFloat;
    dtmVendas.cdsItemsVenda.Next;
  end;
end;

procedure TfrmProVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVendas := TdtmVendas.Create(Self);
  oVenda := TVenda.Create(dtmConexao.ConexaoDB);
  IndiceAtual := 'ClienteID';
end;

end.
