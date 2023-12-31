unit ListagemUsuario.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, ControladorUsuarioInterface, ControladorUsuario;

type
  TTelaListagemUsuario = class(TForm)
    Panel: TPanel;
    Top: TPanel;
    client: TPanel;
    scPesquisa: TSearchBox;
    Label1: TLabel;
    gridProdutos: TDBGrid;
    dsUsuario: TDataSource;
    gboxAcoes: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    btnVoltar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  public
  end;

var
  TelaListagemUsuario: TTelaListagemUsuario;

implementation

{$R *.dfm}

{ TListagemUsuario }

procedure TTelaListagemUsuario.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TTelaListagemUsuario.FormShow(Sender: TObject);
var
  ControladorUsuario: IControladorUsuario;
begin
  ControladorUsuario := TControladorUsuario.Create;
  ControladorUsuario.Pesquisar(dsUsuario);
end;

end.
