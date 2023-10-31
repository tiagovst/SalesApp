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
  UsuarioDAOInterface,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Usuario, UsuarioDAO;

type
  TMainView = class(TForm)
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
    lblResult: TLabel;
    txtNomeUsuario: TEdit;
    Button1: TButton;
    procedure btnInserirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure Button1Click(Sender: TObject);
  private
    DAOInterface: IUsuarioDAO;
    erro: String;
    Usuario: TUsuario;
  public

  end;

var
  MainView: TMainView;
  //DAOInterface: TdmGenericDAO;

implementation

{$R *.dfm}


procedure TMainView.FormCreate(Sender: TObject);
begin
  DAOInterface := TdmGenericDAO.Create;
end;

procedure TMainView.btnAlterarClick(Sender: TObject);
begin
  Usuario := TUsuario.Create;

  with Usuario, DAOInterface do
  begin
    ID := StrToInt(self.id.Text);
    Nome := self.nome.Text;
    Email := self.email.Text;
    Senha := self.senha.Text;
    Telefone := self.telefone.Text;
    CPF := self.cpf.Text;
    Cargo := self.cargo.Text;
    NomeUsuario := nome_usuario.Text;
  end;


  DAOInterface.Alterar(Usuario, erro);
  FreeAndNil(Usuario);
end;

procedure TMainView.btnDeletarClick(Sender: TObject);
var
  valor: integer;
begin

  //valor := DataSource1.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedRows.count].FieldName).Value;
  DAOInterface.Excluir(StrToInt(id.Text), erro);

end;

procedure TMainView.btnInserirClick(Sender: TObject);
begin
  Usuario := TUsuario.Create;

  with Usuario, DAOInterface do
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


  DAOInterface.Inserir(Usuario, erro);

  FreeAndNil(Usuario);
end;



(*
 ocedure TMainView.Button1Click(Sender: TObject);
begin
  UsuarioDAO := TdmGenericDAO.Create(nil);

  lblResult.Caption := UsuarioDAO.PesquisarNome(txtNomeUsuario.Text);

  FreeAndNil(UsuarioDAO);
end;
*)

end.
