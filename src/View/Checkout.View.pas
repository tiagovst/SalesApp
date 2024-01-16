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
  ControladorVendaDAO,
  ItemVenda,
  ControladorVendaDAOInterface,
  ControladorItemVenda,
  ControladorItemVendaInterface,
  ControladorProdutoInterface,
  ControladorProduto,
  Produto,
  ControladorTelaCheckoutInterface, Vcl.Imaging.pngimage, Vcl.Mask,
  frxSmartMemo, frCoreClasses, frxClass, frxCross, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Conexao, frxDBSet;

type
  TTelaCheckout = class(TForm)
    pnlConteudo: TPanel;
    pnlBottom: TPanel;
    ProdutosGrid: TStringGrid;
    btnFinalizar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    btnLimpar: TButton;
    btnDeletar: TButton;
    pnlTop: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Image: TImage;
    Label4: TLabel;
    lblSubtotal: TLabel;
    txtDesconto: TLabeledEdit;
    txtIdentificadorCliente: TLabeledEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure txtDescontoKeyPress(Sender: TObject; var Key: Char);
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
procedure TTelaCheckout.txtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.', #8]) then
  begin
    Key := #0;
  end;
end;

end.
