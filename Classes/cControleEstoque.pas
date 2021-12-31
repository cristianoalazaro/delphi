unit cControleEstoque;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils,
     Data.DB,
     Datasnap.DBClient; //Lista de units

type
  TControleEstoque = class
  private
    ConexaoDB: TZConnection;
    F_ProdutoId: Integer;
    F_Quantidade: Double;
  public
    constructor Create(aConexao: TZConnection);
    destructor Destroy; override;
    function BaixarEstoque: Boolean;
    function RetornarEstoque: Boolean;
  published
    property ProdutoID: Integer   read F_ProdutoID  write F_ProdutoID;
    property Quantidade: Double   read F_Quantidade write F_Quantidade;
  end;

implementation

{$Region 'Contructor and Destructor}
constructor TControleEstoque.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
end;

destructor TControleEstoque.Destroy;
begin

  inherited;
end;

{$EndRegion}

{ TControleEstoque }

function TControleEstoque.BaixarEstoque: Boolean;
var Qry: TZQuery;
begin
  try
    Result := true;
    Qry:= TZQuery.Create(nil);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE Produtos SET Quantidade = Quantidade - :QtdeBaixa ' +
                'WHERE ID = :ProdutoID');
    Qry.ParamByName('ProdutoID').AsInteger := ProdutoID;
    Qry.ParamByName('QtdeBaixa').AsFloat := Quantidade;
    try
      Qry.ExecSQL;
    except
      Result := false;
    end;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TControleEstoque.RetornarEstoque: Boolean;
var Qry: TZQuery;
begin
  try
    Result := true;
    Qry:= TZQuery.Create(nil);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE Produtos SET Quantidade = Quantidade + :QtdeRetorno ' +
                'WHERE ID = :ProdutoID');
    Qry.ParamByName('ProdutoID').AsInteger := ProdutoID;
    Qry.ParamByName('QtdeRetorno').AsFloat := Quantidade;
    try
      Qry.ExecSQL;
    except
      Result := false;
    end;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

end.
