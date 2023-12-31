program AppVendas;

uses
  Vcl.Forms,
  Venda in 'src\Model\Venda\Venda.pas',
  Usuario in 'src\Model\Usuario\Usuario.pas',
  Produto in 'src\Model\Produto\Produto.pas',
  Conexao in 'src\Model\ConexaoDAO\Conexao.pas' {dmConexao},
  VendaDAO in 'src\Model\Venda\VendaDAO.pas',
  ProdutoDAO in 'src\Model\Produto\ProdutoDAO.pas',
  UsuarioDAO in 'src\Model\Usuario\UsuarioDAO.pas' {dmGenericDAO: TDataModule},
  ControladorUsuario in 'src\Controller\ControladorUsuario.pas',
  VendaDAOInterface in 'src\Interfaces\DAO\VendaDAOInterface.pas',
  ControladorUsuarioInterface in 'src\Interfaces\Controlador\ControladorUsuarioInterface.pas',
  UsuarioDAOInterface in 'src\Interfaces\DAO\UsuarioDAOInterface.pas',
  ProdutoDAOInterface in 'src\Interfaces\DAO\ProdutoDAOInterface.pas',
  ControladorProduto in 'src\Controller\ControladorProduto.pas',
  ControladorVenda in 'src\Controller\ControladorVenda.pas',
  ControladorProdutoInterface in 'src\Interfaces\Controlador\ControladorProdutoInterface.pas',
  ControladorVendaInterface in 'src\Interfaces\Controlador\ControladorVendaInterface.pas',
  CadastroProduto.View in 'src\View\CadastroProduto.View.pas' {TelaCadastroProduto},
  Principal.View in 'src\View\Principal.View.pas' {TelaPrincipal},
  ListagemUsuario.View in 'src\View\ListagemUsuario.View.pas' {TelaListagemUsuario},
  Estoque.View in 'src\View\Estoque.View.pas' {TelaEstoque},
  ManejoUsuario.View in 'src\View\ManejoUsuario.View.pas' {TelaManejoUsuario},
  CompraProduto.View in 'src\View\CompraProduto.View.pas' {TelaAdicionarProduto},
  ControladorCompra in 'src\Controller\ControladorCompra.pas',
  ControladorCompraInterface in 'src\Interfaces\Controlador\ControladorCompraInterface.pas',
  Compra in 'src\Model\Compra\Compra.pas',
  Checkout.View in 'src\View\Checkout.View.pas' {TelaCheckout},
  ControladorCheckout in 'src\Controller\ControladorCheckout.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.

