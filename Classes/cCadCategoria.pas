unit cCadCategoria;

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
  TCategoria = class //Declaração do tipo da classe
  private
    //Variáveis privadas
    Conexao: TZConnection;
    F_ID: Integer;        //Integer
    F_Description: String;
    function getDescription: String;
    function getID: Integer;
    procedure setDescription(const Value: String);
    procedure setID(const Value: Integer);//Varchar
  public
    //Variáveis públicas
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;

  published
    //Variáveis públicas utilizadas para propriedades da classe
    //Para fornecer informações em runtime
    property ID: Integer read getID write setID;
    property Description: String read getDescription write setDescription;
  end;

implementation

{ TCategoria }

{$Region 'Contrctor and Destructor'}
constructor TCategoria.Create(aConexao:TZConnection);
begin
  Conexao := aConexao;
end;

destructor TCategoria.Destroy;
begin

  inherited;
end;
{$EndRegion}

{$Region 'Gets'}
function TCategoria.getDescription: String;
begin
  Result := Self.F_Description;
end;

function TCategoria.getID: Integer;
begin
  Result := Self.F_ID;
end;
{$EndRegion}

{$Region 'Sets'}
procedure TCategoria.setDescription(const Value: String);
begin
  Self.F_Description := Value;
end;

procedure TCategoria.setID(const Value: Integer);
begin
  Self.F_ID := Value;
end;
{$EndRegion}

{$Region 'Crud'}
function TCategoria.Apagar: Boolean;
  var Qry: TZQuery;
begin

  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+IntToStr(F_ID)+#13+
                'Descrição: '+F_Description, mtConfirmation,[mbYes, mbNo],0) = mrNo then begin
    Result := false;
    abort;
end;

  try
    Result := true;
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM Categorias ' +
                'WHERE Id = :Id ');
    Qry.ParamByName('Id').AsInteger := id;
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

function TCategoria.Atualizar: Boolean;
  var Qry: TZQuery;
begin
  try
    Result := true;
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE CATEGORIAS ' +
                'SET Description = :Description ' +
                'WHERE Id = :Id ');
    Qry.ParamByName('Id').AsInteger         := Self.ID;
    Qry.ParamByName('Description').AsString := Self.Description;
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

function TCategoria.Inserir: Boolean;
  var Qry: TZQuery;
begin
  try
    Result := true;
    Qry := TZQuery.Create(nil);
    Qry.Connection := Conexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO Categorias (Description) VALUES (:Description)');
    Qry.ParamByName('Description').AsString := Self.Description;

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

function TCategoria.Selecionar(id: Integer): Boolean;
  var Qry: TZQuery;
begin
  try
  Result := true;
  Qry := TZQuery.Create(nil);
  Qry.Connection := Conexao;
  Qry.SQL.Clear;
  Qry.SQL.Add(' SELECT Id '          +
              ' ,Description '       +
              ' FROM dbo.CATEGORIAS' +
              ' WHERE Id = :Id ');
  Qry.ParamByName('Id').AsInteger := id;

  try
    Qry.Open;
    Self.ID          := Qry.FieldByName('Id').AsInteger;
    Self.Description := Qry.FieldByName('Description').AsString;
  Except
    Result := false;
  end;
  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;
{$EndRegion}

end.
