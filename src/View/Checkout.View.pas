unit Checkout.View;

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
  Vcl.Grids,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Venda,
  ControladorVenda,
  ItemVenda,
  ControladorVendaInterface,
  ControladorItemVenda,
  ControladorItemVendaInterface;

type
  TTelaCheckout = class(TForm)
    pnlConteudo: TPanel;
    pnlBottom: TPanel;
    ProdutosGrid: TStringGrid;
    btnFinalizar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    pnpTop: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    btnLimpar: TButton;
    btnDeletar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
  private
  public

  end;

var
  TelaCheckout: TTelaCheckout;

implementation

{$R *.dfm}

{ TTelaCheckout }

procedure TTelaCheckout.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TTelaCheckout.btnFinalizarClick(Sender: TObject);
var
  RegistroVenda : TVenda;
  i : Integer;
  PrecoTotal : Double;
  uItemVenda: TItemVenda;
  uControladorVenda : IControladorVenda;
  uControladorItemVenda : IControladorItemVenda;
  erro: String;
begin
  RegistroVenda := TVenda.Create;
  uControladorVenda := TControladorVenda.Create;
  uControladorItemVenda := TControladorItemVenda.Create;
  PrecoTotal := 0.0;

  RegistroVenda.ID := uControladorVenda.gerarID;
  RegistroVenda.dataVenda := uControladorVenda.DataAtual;
  RegistroVenda.totalProdutos := ProdutosGrid.RowCount - 1;
  RegistroVenda.vendedor := 1; // Mudar quando tiver sess�o.
  RegistroVenda.Desconto := 20;

  // Calculando o pre�o total iterando pela lista de produtos.
  for i := 1 to (ProdutosGrid.Cols[3].Count - 1) do
  begin
    PrecoTotal := PrecoTotal + StrToFloat(ProdutosGrid.Cols[4].Strings[i]);
  end;
  RegistroVenda.totalPreco := StrToFloat(FormatFloat('#0.00', PrecoTotal));

  for i := 1 to (ProdutosGrid.Cols[0].Count - 1) do
    begin
      uItemVenda := TItemVenda.Create(
      RegistroVenda.ID,
      RegistroVenda.Desconto,
      StrToInt(ProdutosGrid.Cols[0].Strings[i]),
      StrToInt(ProdutosGrid.Cols[2].Strings[i]),
      StrToFloat(ProdutosGrid.Cols[3].Strings[i]),
      StrToFloat(ProdutosGrid.Cols[4].Strings[i])
      );

      uControladorItemVenda.Inserir(uItemVenda, erro);
    end;

  if uControladorVenda.Inserir(RegistroVenda, erro) then
  begin
    ShowMessage('Venda Cadastrda com Sucesso!');
  end
  else
  begin
    ShowMessage('Erro ao registrar a venda' + sLineBreak + erro); //Retirar erro dps
  end;
end;

end.
