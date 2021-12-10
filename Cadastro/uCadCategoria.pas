unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  cCadCategoria, udtmConexao, uEnum;

type
  TfrmCadCategoria = class(TfrmTelaHeranca)
    qryListagemID: TIntegerField;
    qryListagemDESCRIPTION: TWideStringField;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    oCategoria: TCategoria;
    function Apagar: boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean; override;

  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

{$Region 'Override'}
function TfrmCadCategoria.Apagar: boolean;
begin
  Result := oCategoria.Apagar;
end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if edtCategoriaId.Text <> EmptyStr then
    oCategoria.ID := StrToInt(edtCategoriaId.Text)
  else
    oCategoria.ID := 0;

    oCategoria.Description := edtDescricao.Text;

  if EstadoDoCadastro = ecInserir then
    Result := oCategoria.Inserir
  else if EstadoDoCadastro = ecAlterar then
    Result := oCategoria.Atualizar;
end;
{$EndRegion}

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
    FreeAndNil(oCategoria);
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria := TCategoria.Create(dtmConexao.ConexaoDB);
  IndiceAtual := 'DESCRIPTION';
end;

end.
