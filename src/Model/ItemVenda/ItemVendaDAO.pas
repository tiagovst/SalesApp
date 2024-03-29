unit ItemVendaDAO;

interface

uses
  ItemVendaDAOInterface,
  ItemVenda,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  System.SysUtils,
  ConexaoIniciar,
  System.Generics.Collections,
  Vcl.Dialogs;

type
  TItemVendaDAO = class(TInterfacedObject, IItemVendaDAO)
    //campo de atributos
    SQLQuery : TFDQuery;

    private
    //funcoes de persistencia
    function Inserir(ItemVenda: TItemVenda; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;
    function GerarID: Integer;

    procedure Pesquisar();

    function CarregarItemVenda(IDVendaSelecionada: Integer): TList<TItemVenda>;
  end;

implementation

{ TItemVendaDAO }

function TItemVendaDAO.CarregarItemVenda(IDVendaSelecionada: Integer): TList<TItemVenda>;
var
  uItemVenda: TItemVenda;
  ArrayItemVenda: TList<TItemVenda>;
begin
  SQLQuery := TFDQuery.Create(nil);
  ArrayItemVenda := TList<TItemVenda>.Create;

  with SQLQuery do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'SELECT * FROM ITEM_VENDA WHERE (ID_VENDA = :ID_VENDA)';
      Params.ParamByName('ID_VENDA').AsInteger := IDVendaSelecionada;
      Open();

      while not Eof do
      begin
        uITemVenda := TItemVenda.Create;
        with uItemVenda do
        begin

          Id := FieldByName('ID').AsInteger;
          IdVenda := FieldByName('ID_VENDA').AsInteger;
          IdProduto := FieldByName('ID_PRODUTO').AsInteger;
          Preco := FieldByName('PRECO').AsFloat;
          Quantidade := FieldByName('QUANTIDADE').AsInteger;
          Desconto := FieldByName('DESCONTO').AsInteger;
          Subtotal := FieldByName('SUBTOTAL').AsFloat;

          ArrayItemVenda.Add(uItemVenda);
          Next;
        end;
      end;

    finally
      Result := ArrayItemVenda;
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TItemVendaDAO.Excluir(ID: Integer; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'DELETE FROM ITEM_VENDA WHERE (ID = :ID)';
      Params.ParamByName('ID').AsInteger := ID;
      ExecSQL;
      Result := True
    except on E: Exception do
      begin
        erro := 'Ocorreu um erro ao tentar excluir o elemento: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
    FreeAndNil(SQLQuery);
  end;
end;

function TItemVendaDAO.GerarID: Integer;
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'SELECT COALESCE(max(id), 0) + 1 AS seq FROM ITEM_VENDA';
      Open();
      Result := FieldByName('seq').AsInteger;
    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TItemVendaDAO.Inserir(ItemVenda: TItemVenda; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery, ItemVenda do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'insert into item_venda (ID, id_produto, ID_VENDA, quantidade, preco, desconto, subtotal) ' +
      'values (:id, :id_produto, :ID_VENDA, :quantidade, :preco, :desconto, :subtotal)';

      Params.ParamByName('ID').AsInteger := ID;
      Params.ParamByName('id_produto').AsInteger := IdProduto;
      Params.ParamByName('ID_VENDA').AsInteger := IdVenda;
      Params.ParamByName('quantidade').AsFloat := Quantidade;
      Params.ParamByName('preco').AsFloat := Preco;
      Params.ParamByName('subtotal').AsFloat := Subtotal;
      Params.ParamByName('desconto').AsFloat := Desconto;


      ExecSQL;

      //ShowMessage('id Produto: ' + FieldByName('id_produto').AsString);
      Result := True;

    except on E: Exception do
    begin
      Erro := 'Ocorreu um erro ao tentar persistir: ' + sLineBreak + E.Message;
      Result := False;
    end;
    end;
    FreeAndNil(SQLQuery);
    FreeAndNil(ItemVenda);
  end;
end;

procedure TItemVendaDAO.Pesquisar;
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'SELECT * FROM ITEM_VENDA';
      Open();
      First;
    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

end.
