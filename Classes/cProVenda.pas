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
     Datasnap.DBClient,
     cControleEstoque,
     uEnum; //Lista de units

type
  TVenda = class //Tipo da classe
  private
  //Variáveis privadas
  Conexao: TZConnection;
  oControleEstoque: TControleEstoque;
  F_ID: Integer;
  F_ClienteID: Integer;
  F_DataVenda: TDateTime;
  F_TotalVenda: Double;
    function InserirItens(cds: TClientDataSet; IDVenda: Integer): Boolean;
    function ApagaItens(cds: TClientDataset): Boolean;
    function InNot(cds: TClientDataset): string;
    function EsteItemExiste(ID: Integer; ProdutoID: Integer): Boolean;
    function AtualizarItem(cds: TClientDataset): Boolean;
    procedure RetornarEstoque(sCodigo: String; Acao: TAcaoExcluirEstoque);
    procedure BaixarEstoque(ProdutoID: Integer; Quantidade: Double);

  public
  //Variáveis públicas
  constructor Create(aConexao: TZConnection);
  destructor Destroy; override;
  function Inserir(cds: TClientDataSet):Boolean;
  function Atualizar(cds: TClientDataSet):Boolean;
  function Apagar:Boolean;
  function Selecionar(id:Integer; var cds: TClientDataSet):Boolean;

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

function TVenda.Atualizar(cds: TClientDataSet): Boolean;
  var Qry: TZQuery;
begin
  try
    Result := True;
    //Inicia uma transação
    Conexao.StartTransaction;
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
        //Update Vendas
        Qry.ExecSQL;

        //Apagar itens no banco que foram apagados na tela
        ApagaItens(cds);

        cds.First;
        while not cds.Eof do begin
          if EsteItemExiste(Self.F_ID, cds.FieldByName('ProdutoID').AsInteger) then begin
            AtualizarItem(cds);
            cds.Next;
          end
          else begin
            InserirItens(cds, Self.ID);
          end;
        end


      except
        Result := False;
        //Se a transação der erro, cancela tudo
        Conexao.Rollback;
      end;
      //Se a transação não der erro, salva as alterações
      Conexao.Commit;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TVenda.AtualizarItem(cds: TClientDataset):Boolean;
var Qry: TZQuery;
begin
  try
    Result := true;
    RetornarEstoque(cds.FieldByName('ProdutoID').AsString, aeeAlterar);
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE Vendas_Items SET Valor_Unitario = :Valor_Unitario ' +
                                       ',Quantidade     = :Quantidade ' +
                                       ',Total_Produto  = :Total_Produto ' +
                'WHERE VendaID = :VendaID ' +
                'AND ProdutoID = :ProdutoID');
    Qry.ParamByName('VendaID').AsInteger      := Self.F_ID;
    Qry.ParamByName('ProdutoID').AsInteger    := cds.FieldByName('ProdutoID').AsInteger;
    Qry.ParamByName('Valor_Unitario').AsFloat := cds.FieldByName('ValorUnitario').AsFloat;
    Qry.ParamByName('Quantidade').AsFloat     := cds.FieldByName('Quantidade').AsFloat;
    Qry.ParamByName('Total_Produto').AsFloat  := cds.FieldByName('ValorTotalProduto').AsFloat;
    try
      Qry.ExecSQL;
      BaixarEstoque(cds.FieldByName('ProdutoID').AsInteger, cds.FieldByName('Quantidade').AsFloat);
    except
      Result := false;
    end;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TVenda.EsteItemExiste(ID: Integer; ProdutoID: Integer): Boolean;
var Qry :TZQuery;
begin
  try
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(VendaID) AS Qtde ' +
                'FROM dbo.Vendas_Items WITH(NOLOCK) ' +
                'WHERE VendaID = :VendaID ' +
                'AND ProdutoID = :ProdutoID');
    Qry.ParamByName('VendaID').AsInteger := ID;
    Qry.ParamByName('ProdutoID').AsInteger := ProdutoID;
    try
      Qry.Open;

      if Qry.FieldByName('Qtde').AsInteger > 0 then
        Result := true
      else
        Result := false;
    except
      Result := false;
    end;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;

end;

function TVenda.ApagaItens(cds:TClientDataset): Boolean;
var Qry: TZQuery;
begin
  try
    Result := true;
    Qry := TZQuery.Create(Nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM Vendas_Items ' +
                'WHERE VendaID = :VendaID ' +
                'AND ProdutoID NOT IN (' + InNot(cds) + ')');
    Qry.ParamByName('VendaID').AsInteger := Self.F_ID;

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

function TVenda.InNot(cds: TClientDataset):string;
var sInNot: string;
begin
  sInNot := EmptyStr;
  cds.First;
  while not cds.Eof do begin
    if sInNot = EmptyStr then
      sInNot := cds.FieldByName('ProdutoID').AsString
    else
      sInNot := sInNot + ',' + cds.FieldByName('ProdutoID').AsString;

    cds.Next;
  end;
  Result := sInNot;
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
      BaixarEstoque(cds.FieldByName('ProdutoID').AsInteger, cds.FieldByName('Quantidade').AsFloat);
    Except
      Result := false;
    End;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TVenda.Selecionar(id: Integer; var cds: TClientDataSet): Boolean;
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

        {$Region 'Selecionar na tabela VendasItems'}
          //apagar o ClientDataset caso esteja com registro
          cds.First;
          while not cds.Eof do  begin
            cds.Delete;
          end;

          //Seleciona os itens do banco com a propriedade F_VendaID
          Qry.Close;
          Qry.SQL.Clear;
          Qry.Sql.Add('SELECT Vendas_Items.ProdutoID ' +
                            ',Produtos.Nome ' +
                            ',Vendas_Items.Valor_Unitario ' +
                            ',Vendas_Items.Quantidade ' +
                            ',Vendas_Items.Total_Produto ' +
                      'FROM Vendas_Items ' +
                      'INNER JOIN Produtos ' +
                      'ON Produtos.ID = Vendas_Items.ProdutoID ' +
                      'WHERE Vendas_Items.VendaID = :VendaID');

          Qry.ParamByName('VendaID').AsInteger := Self.F_ID;
          Qry.Open;

          //Lê da query e coloca no ClientDataset
          Qry.First;
          while not Qry.Eof do begin
            cds.Append;
            cds.FieldByName('ProdutoID').AsInteger := Qry.FieldByName('ProdutoID').AsInteger;
            cds.FieldByName('NomeProduto').AsString := Qry.FieldByName('Nome').AsString;
            cds.FieldByName('Quantidade').AsFloat := Qry.FieldByName('Quantidade').AsFloat;
            cds.FieldByName('ValorUnitario').AsFloat := Qry.FieldByName('Valor_Unitario').AsFloat;
            cds.FieldByName('ValorTotalProduto').AsFloat := Qry.FieldByName('Total_Produto').AsFloat;
            cds.Post;
            Qry.Next;
          end;
          cds.First;

        {$EndRegion}
      except
        Result := False;
      end;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;
{$EndRegion}

{$Region 'Controle de Estoque'}
//Utilizar no Update e Delete
procedure TVenda.RetornarEstoque(sCodigo: String; Acao: TAcaoExcluirEstoque);
var Qry: TZQuery;
texto: string;

begin
  Qry := TZQuery.Create(nil);
  Qry.Connection := Conexao;
  Qry.SQL.Clear;
  Qry.SQL.Add('SELECT ProdutoID ' +
             ',Quantidade ' +
              'FROM dbo.Vendas_Items WITH (NOLOCK) ' +
              'WHERE VendaID = :VendaID ');
  if Acao = aeeApagar then
    Qry.SQL.Add('AND ProdutoID NOT IN (' + sCodigo + ')')
  else
    Qry.SQL.Add('AND ProdutoID = (' + sCodigo + ')');

  Qry.ParamByName('VendaID').AsInteger :=  Self.F_ID;
  try
    oControleEstoque := TControleEstoque.Create(Conexao);
    Qry.Open;
    Qry.First;

    while not Qry.Eof do begin
      oControleEstoque.ProdutoID := Qry.FieldByName('ProdutoID').AsInteger;
      oControleEstoque.Quantidade := Qry.FieldByName('Quantidade').AsFloat;
      oControleEstoque.RetornarEstoque;
      Qry.Next;
    end;
  finally
    if Assigned(oControleEstoque) then
      FreeAndNil(oControleEstoque);
  end;
end;

//Insert
procedure TVenda.BaixarEstoque(ProdutoID: Integer; Quantidade: Double);
var oControleEstoque: TControleEstoque;
begin
  try
    oControleEstoque := TControleEstoque.Create(Conexao);
    oControleEstoque.ProdutoID := ProdutoID;
    oControleEstoque.Quantidade := Quantidade;
    oControleEstoque.BaixarEstoque;
  finally
    if Assigned(oControleEstoque) then
      FreeAndNil(oControleEstoque);
  end;
end;
{$EndRegion}

end.
