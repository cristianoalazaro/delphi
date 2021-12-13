unit cCadProduto;

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
  TProduto = class //Tipo da classe
  private
  //Variáveis privadas
  Conexao: TZConnection;
  F_ID: Integer;
  F_Nome: String;
  F_Descricao: String;
  F_Valor: Double;
  F_Quantidade: Double;
  F_CategoriaId: Integer;

  public
  //Variáveis públicas
  constructor Create(aConexao: TZConnection);
  destructor Destroy; override;
  function Inserir:Boolean;
  function Atualizar:Boolean;
  function Apagar:Boolean;
  function Selecionar(id:Integer):Boolean;

  published
  //Variáveis públicas - Runtime
  property ID:          Integer   read F_ID          write F_ID;
  property Nome:        String    read F_Nome        write F_Nome;
  property Descricao:   String    read F_Descricao   write F_Descricao;
  property Valor:       Double    read F_Valor       write F_Valor;
  property Quantidade:  Double    read F_Quantidade  write F_Quantidade;
  property CategoriaId: Integer   read F_CategoriaId write F_CategoriaId;

  end;
implementation

{ TProduto }

{$Region 'Constructor and Destructor'}
constructor TProduto.Create(aConexao: TZConnection);
begin
  Conexao := aConexao;
end;

destructor TProduto.Destroy;
begin

  inherited;
end;

{$EndRegion}

{$Region 'CRUD'}
function TProduto.Apagar: Boolean;
  var Qry: TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+ IntToStr(F_ID) + #13 +
                'Nome: ' + F_Nome, mtInformation, [mbYes, mbNo], 0) = mrNo then begin
    Result := False;
    Abort;
  end;

  try
    Result := True;
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM Produtos ' +
                'WHERE ID = :Id');
    Qry.ParamByName('Id').AsInteger := F_ID;
    Try
      Qry.ExecSQL;
    Except
      Result := False;
    End;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TProduto.Atualizar: Boolean;
  var Qry: TZQuery;
begin
  try
    Result := True;
    Qry := TZQuery.Create(nil);
      Qry.Connection := Conexao;
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE Produtos SET Nome           = :Nome ' +
                                     ',Descricao      = :Descricao ' +
                                     ',Valor          = :Valor ' +
                                     ',Quantidade     = :Quantidade ' +
                                     ',CategoriaID    = :CategoriaID ' +
                  'WHERE ID = :ID');
      Qry.ParamByName('ID').AsInteger               := F_ID;
      Qry.ParamByName('Nome').AsString              := F_Nome;
      Qry.ParamByName('Descricao').AsString         := F_Descricao;
      Qry.ParamByName('Valor').AsFloat              := F_Valor;
      Qry.ParamByName('Quantidade').AsFloat         := F_Quantidade;
      Qry.ParamByName('CategoriaID').AsInteger      := F_CategoriaId;

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

function TProduto.Inserir: Boolean;
  var Qry: TZQuery;
begin
  try
    Result := True;
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO Produtos (Nome ' +
                                     ',Descricao ' +
                                     ',Valor ' +
                                     ',Quantidade ' +
                                     ',CategoriaID) ' +
                'VALUES(:Nome ' +
                      ',:Descricao ' +
                      ',:Valor ' +
                      ',:Quantidade ' +
                      ',:CategoriaID)');

    Qry.ParamByName('Nome').AsString         := F_Nome;
    Qry.ParamByName('Descricao').AsString    := F_Descricao;
    Qry.ParamByName('Valor').AsFloat         := F_Valor;
    Qry.ParamByName('Quantidade').AsFloat    := F_Quantidade;
    Qry.ParamByName('CategoriaID').AsInteger := F_CategoriaID;

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

function TProduto.Selecionar(id: Integer): Boolean;
  var Qry: TZQuery;
begin
  try
    Result := True;
    Qry := TZQuery.Create(nil);
      Qry.Connection := Conexao;
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT ID ' +
                        ',Nome ' +
                        ',Descricao ' +
                        ',Valor ' +
                        ',Quantidade ' +
                        ',CategoriaID ' +
                  'FROM dbo.Produtos WITH (NOLOCK) ' +
                  'WHERE ID = :Id' );
      Qry.ParamByName('Id').AsInteger := id;

      try
        Qry.Open;

        Self.ID          := Qry.FieldByName('ID').AsInteger;
        Self.Nome        := Qry.FieldByName('Nome').AsString;
        Self.Descricao   := Qry.FieldByName('Descricao').AsString;
        Self.Valor       := Qry.FieldByName('Valor').AsFloat;
        Self.Quantidade  := Qry.FieldByName('Quantidade').AsFloat;
        Self.CategoriaId := Qry.FieldByName('CategoriaID').AsInteger;
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
