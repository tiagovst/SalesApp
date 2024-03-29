unit ControladorTelaCadastroProduto;

interface

uses
  System.SysUtils,
  ControladorTelaCadastroProdutoInterface,
  CadastroProduto.View,
  Vcl.Forms,
  Vcl.ActnList,
  Vcl.Controls,
  Vcl.Dialogs,
  ControladorProdutoInterface,
  ControladorProduto,
  Produto,
  SessaoUsuario;

type
  TControladorTelaCadastroProduto = class(TInterfacedObject, IControladorTelaCadastroProduto)
  private
    produtoSelecionado : TProduto;
    FTelaCadastroProduto : TTelaCadastroProduto;
    ActionBtnSalvar : TAction;
    uControladorProduto: IControladorProduto;

    procedure AcaoSalvar(Sender: TObject);
    procedure PreencherTelaEditarProduto;
    procedure MostrarTela;
    procedure FecharTela;
    procedure CadastrarNovoProduto;

    function PreencherProduto(ProdutoVazio: TProduto): Boolean;

  public
    constructor CreateEditarProduto(const produto : TProduto) overload;
    constructor Create overload;
  end;

implementation

{ TControladorTelaCadastroProduto }

constructor TControladorTelaCadastroProduto.CreateEditarProduto(const produto: TProduto);
begin
  produtoSelecionado := produto;
  FTelaCadastroProduto := TTelaCadastroProduto.Create(nil);
  FTelaCadastroProduto.BorderStyle := bsDialog;
  FTelaCadastroProduto.Label1.Caption := 'Manejo de produto';
  FTelaCadastroProduto.txtID.Visible := True;
  FTelaCadastroProduto.CheckBoxStatus.Enabled := True;
  PreencherTelaEditarProduto;
  
  FTelaCadastroProduto.CheckBox1.Enabled := False;

  if produtoSelecionado.Ativo = -1 then
  begin
    FTelaCadastroProduto.CheckBoxStatus.Checked := True;
  end
  else
  begin
    FTelaCadastroProduto.CheckBoxStatus.Checked := False;
  end;

  ActionBtnSalvar := TAction.Create(nil);
  ActionBtnSalvar.OnExecute := AcaoSalvar;
  ActionBtnSalvar.Caption := 'Salvar';
  FTelaCadastroProduto.btnSalvar.Action := ActionBtnSalvar;


  if TSessaoUsuario.cargo.Equals('Vendedor') then
  begin
    FTelaCadastroProduto.btnSalvar.Enabled := False;
  end
  else
  begin
    FTelaCadastroProduto.btnSalvar.Enabled := True;
  end;

  MostrarTela;
end;

constructor TControladorTelaCadastroProduto.Create;
begin
  FTelaCadastroProduto := TTelaCadastroProduto.Create(nil);
  FTelaCadastroProduto.BorderStyle := bsDialog;
  //FTelaCadastroProduto.Position := poDesktopCenter;

  ActionBtnSalvar := TAction.Create(nil);
  ActionBtnSalvar.OnExecute := AcaoSalvar;
  ActionBtnSalvar.Caption := 'Salvar';
  FTelaCadastroProduto.btnSalvar.Action := ActionBtnSalvar;

  MostrarTela;
end;

procedure TControladorTelaCadastroProduto.FecharTela;
begin
  FTelaCadastroProduto.Close;
end;

procedure TControladorTelaCadastroProduto.MostrarTela;
begin
  FTelaCadastroProduto.ShowModal;
end;


procedure TControladorTelaCadastroProduto.PreencherTelaEditarProduto;
var
  formatoData: TFormatSettings;
  DataStringFormato, DataFormatada: String;
begin
  formatoData := TFormatSettings.Create;

  with FTelaCadastroProduto, produtoSelecionado do
  begin
    txtNomeProduto.Text := Nome;
    txtID.Text := IntToStr(ID);
    txtDescricaoProduto.Text := Descricao;
    txtQuantidadeEstoque.Text := FloatToStr(QuantidadeEstoque);
    txtPreco.Text := FloatToStr(Preco);
    txtReferencia.Text := Referencia;
    cbxCategoria.Text := Categoria;
    txtFornecedor.Text := Fornecedor;
    txtCodigoBarras.Text := CodigoBarras;

    DataStringFormato := FormatDateTime(formatoData.ShortDateFormat, EncodeDate(1899, 12, 30));
    DataFormatada := FormatDateTime(formatoData.ShortDateFormat, produtoSelecionado.DataValidade);

    if DataStringFormato.Equals(DataFormatada) then
    begin
      txtValidade.Text := '';
      CheckBox1.Checked := True;
    end
    else
    begin
      txtValidade.Text := FormatDateTime('dd/mm/yyyy', DataValidade);
    end;
  end;
end;

procedure TControladorTelaCadastroProduto.AcaoSalvar(Sender: TObject);
begin
  CadastrarNovoProduto;
end;

procedure TControladorTelaCadastroProduto.CadastrarNovoProduto;
var
  NovoProduto : TProduto;
  erro: String;
  CamposNaTela: TArray<string>;
  item: String;
begin
  NovoProduto := TProduto.Create;
  if PreencherProduto(NovoProduto) then
  begin
    uControladorProduto := TControladorProduto.Create;

    if uControladorProduto.Inserir(NovoProduto, erro) then
    begin
      ShowMessage('Produto inserido com sucesso');
      FecharTela;
    end
    else
    begin
      ShowMessage('Ocorreu um erro ao cadastrar o produto. Verifique todos os campos e tente novamente');
    end;
  end;

end;

function TControladorTelaCadastroProduto.PreencherProduto(ProdutoVazio: TProduto): Boolean;
var
  ProdutoId: String;
  DataProduto : String;
  ArrayDataProduto : TArray<System.string>;
  FormatoData : TFormatSettings;
  CamposNaTela: TArray<string>;
  item: String;
begin
  SetLength(CamposNaTela, 6);
  ProdutoId := FTelaCadastroProduto.txtID.Text;
  uControladorProduto := TControladorProduto.Create;

  with FTelaCadastroProduto do
  begin
    CamposNaTela[0] := txtNomeProduto.Text;
    CamposNaTela[1] := txtCodigoBarras.Text;
    CamposNaTela[2] := txtDescricaoProduto.Text;
    CamposNaTela[3] := txtReferencia.Text;
    CamposNaTela[4] := txtPreco.Text;
    CamposNaTela[5] := cbxCategoria.Text;
  end;

  for item in CamposNaTela do
  begin
    if item.IsEmpty then
    begin
      ShowMessage('Por favor, preencha todos os campos!');
      Result := False;
      Exit;
    end;
  end;

  with ProdutoVazio, FTelaCadastroProduto do
  begin
    if not ProdutoId.IsEmpty then
    begin
      ID := StrToInt(ProdutoId);
    end
    else
    begin
      ID := uControladorProduto.gerarID;
    end;

    if CheckBoxStatus.Checked then
    begin
      Ativo := -1;
    end
    else
    begin
      Ativo := 0;
    end;

    Nome := txtNomeProduto.Text;
    CodigoBarras := txtCodigoBarras.Text;
    Descricao := txtDescricaoProduto.Text;
    Referencia := txtReferencia.Text;
    Preco := StrToFloat(txtPreco.Text);
    Categoria := cbxCategoria.Text;
    Fornecedor := txtFornecedor.Text;

    if (StrToFloat(txtQuantidadeEstoque.Text) > 0) then
    begin
      QuantidadeEstoque := StrToFloat(txtQuantidadeEstoque.Text);
    end
    else
    begin
      ShowMessage('Informe uma quantidade v�lida do produto!');
    end;

    DataProduto := txtValidade.Text;
    if not DataProduto.IsEmpty then
    begin
      ArrayDataProduto := DataProduto.Split(['/']);

      DataProduto := FormatDateTime(formatoData.ShortDateFormat, EncodeDate(
      ArrayDataProduto[2].ToInteger, ArrayDataProduto[1].ToInteger, ArrayDataProduto[0].ToInteger));
      if not FTelaCadastroProduto.CheckBox1.Checked then
        DataValidade := StrToDate(DataProduto);
    end;
  end;

  Result := True;

end;

end.
