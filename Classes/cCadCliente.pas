unit cCadCliente;

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
  TCliente = class //Tipo da classe
  private
  //Variáveis privadas
  Conexao: TZConnection;
  F_ID: Integer;
  F_Nome: String;
  F_Endereco: String;
  F_Cidade: String;
  F_Bairro: String;
  F_Cep: String;
  F_Estado: String;
  F_Telefone: String;
  F_Email: String;
  F_DataNascimento: TDateTime;

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
  property ID:              Integer   read F_ID             write F_ID;
  property Nome:            String    read F_Nome           write F_Nome;
  property Endereco:        String    read F_Endereco       write F_Endereco;
  property Cidade:          String    read F_Cidade         write F_Cidade;
  property Bairro:          String    read F_Bairro         write F_Bairro;
  property Cep:             String    read F_Cep            write F_Cep;
  property Estado:          String    read F_Estado         write F_Estado;
  property Telefone:        String    read F_Telefone       write F_Telefone;
  property Email:           String    read F_Email          write F_Email;
  property DataNascimento:  TDateTime read F_DataNascimento write F_DataNascimento;

  end;

implementation

{ TCliente }

{$Region 'Constructor and Destructor'}
constructor TCliente.Create(aConexao: TZConnection);
begin
  Conexao := aConexao;
end;

destructor TCliente.Destroy;
begin

  inherited;
end;

{$EndRegion}

{$Region 'CRUD'}
function TCliente.Apagar: Boolean;
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
    Qry.SQL.Add('DELETE FROM Clientes ' +
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

function TCliente.Atualizar: Boolean;
  var Qry: TZQuery;
begin
  try
    Result := True;
    Qry := TZQuery.Create(nil);
      Qry.Connection := Conexao;
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE Clientes SET Nome           = :Nome ' +
                                     ',Endereco       = :Endereco ' +
                                     ',Cidade         = :Cidade ' +
                                     ',Bairro         = :Bairro ' +
                                     ',Cep            = :Cep ' +
                                     ',Estado         = :Estado ' +
                                     ',Telefone       = :Telefone ' +
                                     ',Email          = :Email ' +
                                     ',DataNascimento = :DataNascimento ' +
                  'WHERE ID = :ID');
      Qry.ParamByName('ID').AsInteger               := F_ID;
      Qry.ParamByName('Nome').AsString              := F_Nome;
      Qry.ParamByName('Endereco').AsString          := F_Endereco;
      Qry.ParamByName('Cidade').AsString            := F_Cidade;
      Qry.ParamByName('Bairro').AsString            := F_Bairro;
      Qry.ParamByName('Cep').AsString               := F_Cep;
      Qry.ParamByName('Estado').AsString            := F_Estado;
      Qry.ParamByName('Telefone').AsString          := F_Telefone;
      Qry.ParamByName('Email').AsString             := F_Email;
      Qry.ParamByName('DataNascimento').AsDateTime  := F_DataNascimento;

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

function TCliente.Inserir: Boolean;
  var Qry: TZQuery;
begin
  try
    Result := True;
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO Clientes (Nome ' +
                                     ',Endereco ' +
                                     ',Cidade ' +
                                     ',Bairro ' +
                                     ',Cep ' +
                                     ',Estado ' +
                                     ',Telefone ' +
                                     ',Email ' +
                                     ',DataNascimento) ' +
                'VALUES(:Nome ' +
                      ',:Endereco ' +
                      ',:Cidade ' +
                      ',:Bairro ' +
                      ',:Cep ' +
                      ',:Estado '+
                      ',:Telefone ' +
                      ',:Email ' +
                      ',:DataNascimento)');
    Qry.ParamByName('Nome').AsString              := F_Nome;
    Qry.ParamByName('Endereco').AsString          := F_Endereco;
    Qry.ParamByName('Cidade').AsString            := F_Cidade;
    Qry.ParamByName('Bairro').AsString            := F_Bairro;
    Qry.ParamByName('Cep').AsString               := F_Cep;
    Qry.ParamByName('Estado').AsString            := F_Estado;
    Qry.ParamByName('Telefone').AsString          := F_Telefone;
    Qry.ParamByName('Email').AsString             := F_Email;
    Qry.ParamByName('DataNascimento').AsDateTime  := F_DataNascimento;

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

function TCliente.Selecionar(id: Integer): Boolean;
  var Qry: TZQuery;
begin
  try
    Result := True;
    Qry := TZQuery.Create(nil);
      Qry.Connection := Conexao;
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT ID ' +
                        ',Nome ' +
                        ',Endereco ' +
                        ',Cidade ' +
                        ',Bairro ' +
                        ',Cep ' +
                        ',Estado ' +
                        ',Telefone ' +
                        ',Email ' +
                        ',DataNascimento ' +
                  'FROM dbo.Clientes WITH (NOLOCK) ' +
                  'WHERE ID = :Id' );
      Qry.ParamByName('Id').AsInteger := id;

      try
        Qry.Open;

        Self.ID             := Qry.FieldByName('ID').AsInteger;
        Self.Nome           := Qry.FieldByName('Nome').AsString;
        Self.Endereco       := Qry.FieldByName('Endereco').AsString;
        Self.Cidade         := Qry.FieldByName('Cidade').AsString;
        Self.Bairro         := Qry.FieldByName('Bairro').AsString;
        Self.Cep            := Qry.FieldByName('Cep').AsString;
        Self.Estado         := Qry.FieldByName('Estado').AsString;
        Self.Telefone       := Qry.FieldByName('Telefone').AsString;
        Self.Email          := Qry.FieldByName('Email').AsString;
        Self.DataNascimento := Qry.FieldByName('DataNascimento').AsDateTime;
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
