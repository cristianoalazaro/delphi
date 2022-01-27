unit uSelecionarData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit,
  Vcl.Buttons, System.DateUtils;

type
  TfrmSelecionarData = class(TForm)
    edtDataInicial: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDataFinal: TDateEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarData: TfrmSelecionarData;

implementation

{$R *.dfm}

procedure TfrmSelecionarData.BitBtn1Click(Sender: TObject);
begin
  if (edtDataFinal.Date < edtDataInicial.Date) then begin
    MessageDlg('Data final n�o pode ser maior que a inicial', mtInformation,
    [mbOk],0);
    edtDataFinal.SetFocus;
    abort;
  end;

  if (edtDataInicial.Date = 0) OR (edtDataFinal.Date = 0) then begin
    MessageDlg('Data Inicial ou Final � campo obrigat�rio', mtInformation,
    [mbOk],0);
    edtDataInicial.SetFocus;
    abort;
  end;

  Close;
end;

procedure TfrmSelecionarData.FormShow(Sender: TObject);
begin
  edtDataInicial.Date := StartOfTheMonth(Date);
  edtDataFinal.Date := EndOfTheMonth(Date);
end;

end.
