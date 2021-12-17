unit uProVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, RxCurrEdit, udtmVenda;

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
    edtValorTotal: TCurrencyEdit;
    Label1: TLabel;
    dbGridItemVendas: TDBGrid;
    Label2: TLabel;
    dboProduto: TDBLookupComboBox;
    edtValorUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridItemVendasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    dtmVenda: TdtmVenda;
  public
    { Public declarations }
  end;

var
  frmProVenda: TfrmProVenda;

implementation

{$R *.dfm}

uses udtmConexao;

procedure TfrmProVenda.dbGridItemVendasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    BloqueiaCTRL_DEL_DBGRID(Key,Shift);
end;

procedure TfrmProVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVenda) then
    FreeAndNil(dtmVenda);
end;

procedure TfrmProVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVenda := TdtmVenda.Create(Self);
end;

end.
