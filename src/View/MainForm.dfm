object MainView: TMainView
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Nome do Produto'
  ClientHeight = 625
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 8
    Top = 304
    Width = 833
    Height = 321
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SENHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_USUARIO'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 8
    Top = 16
    Width = 833
    Height = 282
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 11
      Height = 15
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 16
      Top = 61
      Width = 35
      Height = 15
      Caption = 'NOME'
    end
    object Label3: TLabel
      Left = 16
      Top = 109
      Width = 34
      Height = 15
      Caption = 'EMAIL'
    end
    object Label4: TLabel
      Left = 16
      Top = 157
      Width = 38
      Height = 15
      Caption = 'SENHA'
    end
    object Label5: TLabel
      Left = 368
      Top = 16
      Width = 54
      Height = 15
      Caption = 'TELEFONE'
    end
    object Label6: TLabel
      Left = 368
      Top = 64
      Width = 21
      Height = 15
      Caption = 'CPF'
    end
    object Label7: TLabel
      Left = 368
      Top = 112
      Width = 40
      Height = 15
      Caption = 'CARGO'
    end
    object Label8: TLabel
      Left = 368
      Top = 160
      Width = 89
      Height = 15
      Caption = 'NOME_USUARIO'
    end
    object btnInserir: TButton
      Left = 728
      Top = 240
      Width = 75
      Height = 25
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnDeletar: TButton
      Left = 624
      Top = 240
      Width = 75
      Height = 25
      Caption = 'Deletar'
      TabOrder = 1
      OnClick = btnDeletarClick
    end
    object btnAlterar: TButton
      Left = 507
      Top = 240
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 2
    end
    object id: TEdit
      Left = 16
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 3
      Text = 'id'
    end
    object nome: TEdit
      Left = 16
      Top = 82
      Width = 121
      Height = 23
      TabOrder = 4
      Text = 'nome'
    end
    object email: TEdit
      Left = 16
      Top = 128
      Width = 121
      Height = 23
      TabOrder = 5
      Text = 'email'
    end
    object senha: TEdit
      Left = 16
      Top = 178
      Width = 121
      Height = 23
      TabOrder = 6
      Text = 'senha'
    end
    object nome_usuario: TEdit
      Left = 368
      Top = 181
      Width = 121
      Height = 23
      TabOrder = 7
      Text = 'nome_usuario'
    end
    object cargo: TEdit
      Left = 368
      Top = 131
      Width = 121
      Height = 23
      TabOrder = 8
      Text = 'cargo'
    end
    object cpf: TEdit
      Left = 368
      Top = 83
      Width = 121
      Height = 23
      TabOrder = 9
      Text = 'cpf'
    end
    object telefone: TEdit
      Left = 368
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 10
      Text = 'telefone'
    end
  end
  object DataSource1: TDataSource
    DataSet = dmGenericDAO.SQLAll
    Left = 728
    Top = 408
  end
end