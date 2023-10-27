unit MainForm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Conexao,
  UsuarioDAO,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Usuario;

type
  TMainView = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnInserir: TButton;
    btnDeletar: TButton;
    btnAlterar: TButton;
    id: TEdit;
    nome: TEdit;
    email: TEdit;
    senha: TEdit;
    nome_usuario: TEdit;
    cargo: TEdit;
    cpf: TEdit;
    telefone: TEdit;
    procedure btnInserirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    UsuarioDAO: TdmGenericDAO;
    erro: String;
    Usuario: TUsuario;
  public

  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}


procedure TMainView.btnDeletarClick(Sender: TObject);
var
  valor: integer;
begin
  UsuarioDAO := TdmGenericDAO.Create(nil);

  valor := DataSource1.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedRows.count].FieldName).Value;
  UsuarioDAO.Excluir(valor, erro);

  FreeAndNil(UsuarioDAO);
end;

procedure TMainView.btnInserirClick(Sender: TObject);
begin
  UsuarioDAO := TdmGenericDAO.Create(nil);
  Usuario := TUsuario.Create;

  with Usuario, UsuarioDAO do
  begin
    ID := gerarID;
    Nome := self.nome.Text;
    Email := self.email.Text;
    Senha := self.senha.Text;
    Telefone := self.telefone.Text;
    CPF := self.cpf.Text;
    Cargo := self.cargo.Text;
    NomeUsuario := nome_usuario.Text;
  end;


  UsuarioDAO.Inserir(Usuario, erro);

  FreeAndNil(UsuarioDAO);
  FreeAndNil(Usuario);
end;

end.