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
     System.SysUtils; //Lista de units

type
  TVenda = class //Tipo da classe
  private
  //Vari�veis privadas
  Conexao: TZConnection;
  F_ID: Integer;
  F_ClienteID: Integer;
  F_DataVenda: TDateTime;
  F_TotalVenda: Double;

  public
  //Vari�veis p�blicas
  constructor Create(aConexao: TZConnection);
  destructor Destroy; override;
  function Inserir:Boolean;
  function Atualizar:Boolean;
  function Apagar:Boolean;
  function Selecionar(id:Integer):Boolean;

  published
  //Vari�veis p�blicas - Runtime
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
                                     ',DataVenda  = :DataVenda ' +
                                     ',TotalVenda = :TotalVenda ' +
                  'WHERE ID = :ID');
      Qry.ParamByName('ID').AsInteger         := F_ID;
      Qry.ParamByName('ClienteID').AsInteger  := F_ClienteID;
      Qry.ParamByName('DataVenda').AsDateTime := F_DataVenda;
      Qry.ParamByName('TotalVenda').AsFloat   := F_TotalVenda;

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

function TVenda.Inserir: Boolean;
  var Qry: TZQuery;
      IDVendaGerado: Integer;
begin
  try
    Result := True;
    Conexao.StartTransaction;
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    //Faz a inclus�o no banco
    Qry.SQL.Add('INSERT INTO Vendas(ClienteID ' +
                                  ',DataVenda ' +
                                  ',TotalVenda) ' +
                'VALUES(:ClienteID ' +
                      ',:DataVenda ' +
                      ',:TotalVenda ');
    Qry.ParamByName('ClienteID').AsInteger  := F_ClienteID;
    Qry.ParamByName('DataVenda').AsDateTime := F_DataVenda;
    Qry.ParamByName('TotalVenda').AsFloat   := F_TotalVenda;

    try
      Qry.ExecSQL;
      //Recupera o ID gerado no Insert
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT SCOPE_IDENTITY() AS ID');
      Qry.Open;

      //ID da tabela MASTER (Vendas)
      IDVendaGerado := Qry.FieldByName('ID').AsInteger;

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
                        ',DataVenda ' +
                        ',TotalVenda ' +
                  'FROM dbo.Vendas WITH (NOLOCK) ' +
                  'WHERE ID = :Id' );
      Qry.ParamByName('Id').AsInteger := id;

      try
        Qry.Open;

        Self.ID         := Qry.FieldByName('ID').AsInteger;
        Self.ClienteID  := Qry.FieldByName('ClienteID').AsInteger;
        Self.DataVenda  := Qry.FieldByName('DataVenda').AsDateTime;
        Self.TotalVenda := Qry.FieldByName('TotalVenda').AsFloat;
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
