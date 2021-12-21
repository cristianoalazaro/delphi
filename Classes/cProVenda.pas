unit cProVenda;

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
  TVenda = class //Tipo da classe
  private
  //Variáveis privadas
  Conexao: TZConnection;
  F_ID: Integer;
  F_ClienteID: Integer;
  F_DataVenda: TDateTime;
  F_TotalVenda: Double;
    function InserirItens(cds: TClientDataSet; IDVenda: Integer): Boolean;

  public
  //Variáveis públicas
  constructor Create(aConexao: TZConnection);
  destructor Destroy; override;
  function Inserir(cds: TClientDataSet):Boolean;
  function Atualizar:Boolean;
  function Apagar:Boolean;
  function Selecionar(id:Integer):Boolean;

  published
  //Variáveis públicas - Runtime
  property ID:         Integer   read F_ID         write F_ID;
  property ClienteID:  Integer   read F_ClienteID  write F_ClienteID;
  property DataVenda:  TDateTime read F_DataVenda  write F_DataVenda;
  property TotalVenda: Double    read F_TotalVenda write F_TotalVenda;

  end;

implementation

{ TCliente }

{$Region 'Constructor and Destructor'}
constructor TVenda.Create(aConexao: TZConnection);
begin
  Conexao := aConexao;
end;

destructor TVenda.Destroy;
begin

  inherited;
end;

{$EndRegion}

{$Region 'CRUD'}
function TVenda.Apagar: Boolean;
  var Qry: TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Venda Nro: '+ IntToStr(F_ID), mtInformation, [mbYes, mbNo], 0) = mrNo then begin
    Result := False;
    Abort;
  end;

  try
    Result := True;
    Conexao.StartTransaction;
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    //Apaga os items primeiro
    Qry.SQL.Add('DELETE FROM Vendas_Items ' +
                'WHERE VendaID = :VendaID');
    Qry.ParamByName('VendaID').AsInteger := F_ID;
    Try
      Qry.ExecSQL;
      //Apaga a tabela Master
      Qry.SQL.Clear;
      qry.SQL.Add('DELETE FROM Vendas ' +
                  'WHERE ID = :ID');
      Qry.ParamByName('ID').AsInteger := F_ID;
      Qry.ExecSQL;

      Conexao.Commit;
    Except
      Conexao.Rollback;
      Result := False;
    End;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;

end;

function TVenda.Atualizar: Boolean;
  var Qry: TZQuery;
begin
  try
    Result := True;
    Qry := TZQuery.Create(nil);
      Qry.Connection := Conexao;
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE Vendas SET ClienteID    = :ClienteID ' +
                                     ',Data_Venda  = :Data_Venda ' +
                                     ',Total_Venda = :Total_Venda ' +
                  'WHERE ID = :ID');
      Qry.ParamByName('ID').AsInteger         := F_ID;
      Qry.ParamByName('ClienteID').AsInteger  := F_ClienteID;
      Qry.ParamByName('Data_Venda').AsDateTime := F_DataVenda;
      Qry.ParamByName('Total_Venda').AsFloat   := F_TotalVenda;

      try
        Qry.ExecSQL;
      except
        Result := False;
      end;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TVenda.Inserir(cds: TClientDataSet): Boolean;
  var Qry: TZQuery;
      IDVendaGerado: Integer;
begin
  try
    Result := True;
    Conexao.StartTransaction;
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    //Faz a inclusão no banco
    Qry.SQL.Add('INSERT INTO Vendas(ClienteID ' +
                                  ',Data_Venda ' +
                                  ',Total_Venda) ' +
                'VALUES(:ClienteID ' +
                      ',:Data_Venda ' +
                      ',:Total_Venda)');
    Qry.ParamByName('ClienteID').AsInteger  := F_ClienteID;
    Qry.ParamByName('Data_Venda').AsDateTime := F_DataVenda;
    Qry.ParamByName('Total_Venda').AsFloat   := F_TotalVenda;

    try
      Qry.ExecSQL;
      //Recupera o ID gerado no Insert
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT SCOPE_IDENTITY() AS ID');
      Qry.Open;

      //ID da tabela MASTER (Vendas)
      IDVendaGerado := Qry.FieldByName('ID').AsInteger;

      {$Region 'Gravar na tabela VendaItems'}
        cds.First;
        while not cds.Eof do begin
          InserirItens(cds, IDVendaGerado);
          cds.Next;
        end;

      {$EndRegion}

      Conexao.Commit;
    except
      Conexao.Rollback;
      Result := False;
    end;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TVenda.InserirItens(cds: TClientDataSet; IDVenda: Integer):Boolean;
var Qry: TZQuery;
begin
  try
    Result := true;
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO Vendas_Items(VendaID ' +
                                        ',ProdutoID ' +
                                        ',Valor_Unitario ' +
                                        ',Quantidade ' +
                                        ',Total_Produto) ' +
                'VALUES(:VendaID ' +
                      ',:ProdutoID ' +
                      ',:Valor_Unitario ' +
                      ',:Quantidade ' +
                      ',:Total_Produto)');
    Qry.ParamByName('VendaID').AsInteger := IDVenda;
    Qry.ParamByName('ProdutoID').AsInteger := cds.FieldByName('ProdutoID').AsInteger;
    Qry.ParamByName('Valor_Unitario').AsFloat := cds.FieldByName('ValorUnitario').AsFloat;
    Qry.ParamByName('Quantidade').AsFloat := cds.FieldByName('Quantidade').AsFloat;
    Qry.ParamByName('Total_Produto').AsFloat := cds.FieldByName('ValorTotalProduto').AsFloat;
    Try
      Qry.ExecSQL;
    Except
      Result := false;
    End;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TVenda.Selecionar(id: Integer): Boolean;
  var Qry: TZQuery;
begin
  try
    Result := True;
    Qry := TZQuery.Create(nil);
      Qry.Connection := Conexao;
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT ID ' +
                        ',ClienteID ' +
                        ',Data_Venda ' +
                        ',Total_Venda ' +
                  'FROM dbo.Vendas WITH (NOLOCK) ' +
                  'WHERE ID = :Id' );
      Qry.ParamByName('Id').AsInteger := id;

      try
        Qry.Open;

        Self.ID         := Qry.FieldByName('ID').AsInteger;
        Self.ClienteID  := Qry.FieldByName('ClienteID').AsInteger;
        Self.DataVenda  := Qry.FieldByName('Data_Venda').AsDateTime;
        Self.TotalVenda := Qry.FieldByName('Total_Venda').AsFloat;
      except
        Result := False;
      end;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;
{$EndRegion}


end.
