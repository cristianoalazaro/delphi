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
  TCategoria = class //Declara��o do tipo da classe
  private
    //Vari�veis privadas
    Conexao: TZConnection;
    F_ID: Integer;        //Integer
    F_Description: String;
    function getDescription: String;
    function getID: Integer;
    procedure setDescription(const Value: String);
    procedure setID(const Value: Integer);//Varchar
  public
    //Vari�veis p�blicas
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;

  published
    //Vari�veis p�blicas utilizadas para propriedades da classe
    //Para fornecer informa��es em runtime
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
begin
  ShowMessage('Apagado');
  Result := true;
end;

function TCategoria.Atualizar: Boolean;
begin
  ShowMessage('Atualizado');
  Result := true;
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
    Qry.ParamByName('Description').Value := Self.Description;

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
begin
  Result := true;
end;
{$EndRegion}

end.
