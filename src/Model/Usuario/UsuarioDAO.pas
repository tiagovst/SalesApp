unit UsuarioDAO;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Phys.FBDef,
  FireDAC.Phys,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Usuario,
  Conexao;

type
  TdmGenericDAO = class(TDataModule)
    SQLSave: TFDQuery;
    SQLDelete: TFDQuery;
    SQLUpdate: TFDQuery;
    SQLSearch: TFDQuery;
    SQLAll: TFDQuery;
    SQLAllID: TIntegerField;
    SQLAllNOME: TStringField;
    SQLAllEMAIL: TStringField;
    SQLAllSENHA: TStringField;
    SQLAllTELEFONE: TStringField;
    SQLAllCPF: TStringField;
    SQLAllCARGO: TStringField;
    SQLAllNOME_USUARIO: TStringField;

  public
    function gerarID: Integer;
    function Inserir(Usuario: TUsuario; out erro: String): Boolean;
    function Alterar(Usuario: TUsuario; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarNome(Nome: String);
    procedure Pesquisar();
    procedure CarregarPessoa(Usuario: TUsuario; ID: Integer);
  end;

var
  dmGenericDAO: TdmGenericDAO;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmGenericDAO }

function TdmGenericDAO.Alterar(Usuario: TUsuario; out erro: String): Boolean;
begin
  with SQLUpdate, Usuario do
  begin
    SQL.Text := 'update USUARIO set NOME = :NOME, EMAIL = :EMAIL, SENHA = :SENHA, ' +
    'TELEFONE = :TELEFONE, CPF = :CPF, CARGO = :CARGO, NOME_USUARIO = :NOME_USUARIO where (ID = :ID)';

    Params.ParamByName('ID').AsInteger := ID;
    Params.ParamByName('Nome').AsString := Nome;
    Params.ParamByName('email').AsString := Email;
    Params.ParamByName('senha').AsString := Senha;
    Params.ParamByName('cpf').AsString := CPF;
    Params.ParamByName('telefone').AsString := Telefone;
    Params.ParamByName('nome_usuario').AsString := NomeUsuario;
    Params.ParamByName('cargo').AsString := Cargo;

    try
      ExecSQL();
      Result := True;

    except on E: Exception do
      begin
        erro := 'Ocorreu um erro ao tentar persistir: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TdmGenericDAO.CarregarPessoa(Usuario: TUsuario; ID: Integer);
var
  sql: TFDQuery;
begin
  sql := TFDQuery.Create(nil);

  with sql, Usuario do
  begin
    try
      Connection := dmConexao.FDConnection;

      SQL.Text := 'select * from usuario where (id = :id);';

      Params.ParamByName('ID').AsInteger := id;
      Open();

      ID := FieldByName('id').AsInteger;
      Nome := FieldByName('NOME').AsString;
      Email := FieldByName('EMAIL').AsString;
      Senha := FieldByName('SENHA').AsString;
      Telefone := FieldByName('TELEFONE').AsString;
      Cargo := FieldByName('CARGO').AsString;
      CPF := FieldByName('CPF').AsString;
      NomeUsuario := FieldByName('NOME_USUARIO').AsString;

    finally
      FreeAndNil(sql);
    end;
  end;
end;

function TdmGenericDAO.Excluir(ID: Integer; out erro: String): Boolean;
begin
  with SQLDelete do
  begin
    SQL.Text := 'delete from USUARIO where (ID = :ID)';
    Params.ParamByName('ID').AsInteger := id;

    try
      ExecSQL();
      Result := True;

      except on E: Exception do
      begin
        erro := 'Ocorreu um erro ao tentar excluir o elemento: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TdmGenericDAO.gerarID: Integer;
var
  sql: TFDQuery;
begin
  sql := TFDQuery.Create(nil);

  with sql do
  begin

    try
      Connection := dmConexao.FDConnection;
      SQL.Text := 'select coalesce(max(id), 0) + 1 as seq from usuario';
      Open();

      Result := FieldByName('seq').AsInteger;
    finally
      FreeAndNil(sql);
    end;
  end;
end;

function TdmGenericDAO.Inserir(Usuario: TUsuario; out erro: String): Boolean;
begin
  with SQLSave, Usuario do
    begin

      //SQL.Text := 'insert into USUARIO (ID, NOME, EMAIL, SENHA, TELEFONE, CPF, CARGO, NOME_USUARIO) ' +
      //'values (:ID, :NOME, :EMAIL, :SENHA, :TELEFONE, :CPF, :CARGO, :NOME_USUARIO)';

      Params.ParamByName('ID').AsInteger := ID;
      Params.ParamByName('NOME').AsString := Nome;
      Params.ParamByName('EMAIL').AsString := Email;
      Params.ParamByName('SENHA').AsString := Senha;
      Params.ParamByName('CPF').AsString := CPF;
      Params.ParamByName('TELEFONE').AsString := Telefone;
      Params.ParamByName('NOME_USUARIO').AsString := NomeUsuario;
      Params.ParamByName('CARGO').AsString := Cargo;
    end;

  try
      SQLSave.ExecSQL;
      Result := True;

      except on E: Exception do
      begin
        Erro := 'Ocorreu um erro ao tentar persistir: ' + sLineBreak + E.Message;
        Result := False;
      end;
  end;
end;

procedure TdmGenericDAO.Pesquisar;
begin
  with SQLALL do
  begin
    if Active then
      Close;

   Open();
  end;
end;

procedure TdmGenericDAO.PesquisarNome(Nome: String);
begin
  with SQLSearch do
  begin
    SQL.Text := 'select * from USUARIO';

    if Active then
      Close;

    Params.ParamByName('NOME').AsString := '%' + Nome + '%';
    Open();
    First;
  end;
end;

end.
