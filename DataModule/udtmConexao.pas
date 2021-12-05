unit udtmConexao;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection;

type
  TdtmConexao = class(TDataModule)
    ConexaoDB: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmConexao.DataModuleCreate(Sender: TObject);
begin
  with ConexaoDB do
  begin
    User:= 'sa';
    Password := 'fael';
  end;
end;

end.
