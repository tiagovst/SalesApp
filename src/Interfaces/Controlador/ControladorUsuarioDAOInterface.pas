unit ControladorUsuarioDAOInterface;

interface

uses
  Usuario,
  Data.DB;

type
  IControladorUsuarioDAO = interface
    ['{9494E2EE-8DB0-4653-AACB-60241AC01264}']

    function gerarID: Integer;
    function Inserir(Usuario: TUsuario; out erro: String): Boolean;
    function Alterar(Usuario: TUsuario; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarNomeUsuario(Usuario: TUsuario; NomeDeUsuario: String);
    procedure Pesquisar(DataSource: TDataSource);
    procedure CarregarPessoa(Usuario: TUsuario; ID: Integer);
  end;

implementation

end.
