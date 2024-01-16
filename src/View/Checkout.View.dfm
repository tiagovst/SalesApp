object TelaCheckout: TTelaCheckout
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Checkout'
  ClientHeight = 534
  ClientWidth = 1087
  Color = clBtnFace
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  TextHeight = 15
  object pnlConteudo: TPanel
    Left = 0
    Top = 96
    Width = 1087
    Height = 397
    Align = alClient
    Caption = 'frxUserDataSet1'
    Color = 16579321
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 1083
    ExplicitHeight = 396
    DesignSize = (
      1087
      397)
    object Label1: TLabel
      Left = 46
      Top = 76
      Width = 72
      Height = 23
      Caption = 'Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ProdutosGrid: TStringGrid
      Left = 46
      Top = 112
      Width = 957
      Height = 279
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clBtnFace
      FixedCols = 0
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitWidth = 953
      ExplicitHeight = 278
    end
    object btnLimpar: TButton
      Left = 928
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Limpar'
      TabOrder = 1
      ExplicitLeft = 924
    end
    object btnDeletar: TButton
      Left = 844
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Deletar'
      TabOrder = 2
      ExplicitLeft = 840
    end
    object txtDesconto: TLabeledEdit
      Left = 680
      Top = 75
      Width = 153
      Height = 23
      Anchors = [akTop, akRight]
      EditLabel.Width = 50
      EditLabel.Height = 15
      EditLabel.Caption = 'Desconto'
      NumbersOnly = True
      TabOrder = 3
      Text = ''
      ExplicitLeft = 676
    end
    object txtIdentificadorCliente: TLabeledEdit
      Left = 515
      Top = 75
      Width = 153
      Height = 23
      Anchors = [akTop, akRight]
      EditLabel.Width = 37
      EditLabel.Height = 15
      EditLabel.Caption = 'Cliente'
      TabOrder = 4
      Text = ''
      ExplicitLeft = 511
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 493
    Width = 1087
    Height = 41
    Align = alBottom
    Color = 16579321
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 492
    ExplicitWidth = 1083
    DesignSize = (
      1087
      41)
    object Label4: TLabel
      Left = 46
      Top = 11
      Width = 105
      Height = 23
      Caption = 'Subtotal: R$ '
    end
    object lblSubtotal: TLabel
      Left = 152
      Top = 11
      Width = 35
      Height = 23
      Caption = '00.0'
    end
    object btnFinalizar: TButton
      Left = 966
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Finalizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 962
    end
    object btnCancelar: TButton
      Left = 883
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
      ExplicitLeft = 879
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1087
    Height = 96
    Align = alTop
    Color = 16579321
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 1083
    object Label2: TLabel
      Left = 93
      Top = 40
      Width = 252
      Height = 30
      AutoSize = False
      Caption = 'Resumo da compra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 93
      Top = 24
      Width = 204
      Height = 17
      AutoSize = False
      Caption = 'Revise os produtos da sua compra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Image: TImage
      Left = 41
      Top = 22
      Width = 45
      Height = 45
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D494844520000002D0000
        002D08060000003A1AE29A00000006624B474400FF00FF00FFA0BDA793000000
        0970485973000001D8000001D801FA5CA6720000000774494D4507E70C01150F
        16D378C3FB000005E44944415478DAED997B6C544514C6BFB977DBDDB6DB52BA
        14A80A5885D248A2808A9218308A1A3520228AD1C8AB3C7C912642D450A42D16
        24108C14099AF2263E48101220261231D17F408C424C20B44579A8696D297DEC
        B6DDEDDE7BC76FB6BCDAEEDAEEB2F6D684939CCEDC99C9B9BF397B66CECCADC0
        FF50443C8D9D3D2BE13580241DB024A0D17AAB09A43A80ECECF8BD2A6E96A494
        387A1CF0A413D8C986162422096D1A2751D7003C780F5F26E2F3BAB858A9A087
        935C40CD457AD58D5C363D4B1D4ABDC037EC6D6842F92D0381E61660E41D37FE
        CAB84097131A32541D456796B27CE4BAEEC36CCB6779D2B480DCBE025D49681A
        D2C9B48C8F456186144A132B850633A7AF4057FC1E72730AAD6D613923CC90DD
        0CF93C96CD7D263C544C53DCD41DD4696186ECA5CEA2FA72E2B08BC41B7A3BF5
        B93043BEA2CEBE097D13BA37A0B9AA616C9F0C24040153C795A4154DF2F2A78E
        C49989EB92931A420B717A98217B5AD3316BF8F78B5B5CDEF21EDB95F272A960
        749E07820970CCDC0F616E9FC2BC60F19CA0C3849925849CC471C3394EEB39B6
        8499D03FB16A54D194807B786EE75EA7EFCCE9AC9345FBF5607D5B343FAE5460
        4C03843EAC074595C5338CB004847FFF58683543A039836338A5B51C349EEA42
        54A143EB7A326A47BE259A3DE3BBF4A6D41D4166F98752335BA233DB9E67FDD4
        2374E112AB4D3F61656B04DFF90C7BA49BBE8AB4C7F6C8B6E1CC44F55D8508B8
        B3AFA4F47611CAD36731F854311C81DA68A1AF973DC2B2E6084BFA4460DB932A
        7E1FE09BF6B1232B56689F6702FECE590C4B7376E9D5AC000655AC83BBEE871B
        81AE62BC4CA53F8E097FD9A3AAE12929E44E969E582D5ECA9A8EDADBE733C21C
        5DFA84349079AE0C19557B6235AFA48ED13C93E5D7C2B769A2F2D4683AE0002B
        B7C5624D6D414D9E89F86B440163DBD5D5D3A61FB75696208D9E96319FA9E59F
        649CCCB03821BCEBEFA355CD2985BE9107F9BC98A0554C27F4C78511C5F0A58F
        EB12D3A90D3F624865111CC17AC818C38373DD2260BC01690644F5DA5C2425A6
        706F1177326656D0EA546A720C9E408B7B14AA872C842FED5E48CDC1556E20B5
        E9670CFAE31324FB4E21A67816BC0309EC2375A106EBB7D66603A2BE741C815B
        E0303360580DFD9CF5E9C5B0C42244B54FB7432B311CFDD1929A8336D70024FA
        2F2299C9C461345C737B74262DE68DD240466391AEA5371A7A1DA192DBAD5C5A
        7F77E808AF7BD39054EB99CBA64DD4C4987EC7ABB1213AD56312958C5E6D1D50
        BBCD4CF5F2F2A92123FFD78ED68C77A7C1B2C414CE6E37DA138CDDE2E7B45FD0
        A476C0B1E6DACED301DA5C3A43AD6E95D2BEA5976288EB788B68E69F49DC9D8E
        EAAB768787B60A5FE11F2B87417F8C8FFDEC46A63472C18D832E2AB4E25D11A0
        DF9FAB4E294309AD52D730BB8929E7C933813C17B4F7B68687962BE7AB82A95C
        1E6439D66E62CA2F5CCB4F93B25A146C8E005D324F151EB67EC1F231BB892987
        A82F41A5F06EA0D3D8FA29CB17ED26A67C49C40524F346865E394F5D135C3C4C
        ACE3E3EB76135336323C9690D2DF0D34938E40211F97DB4D4C2986D079B460F6
        28288B00FDC17C184CBF7AD097CF83CD477613737FCEB752D24AF54B5510CB23
        ED1E6B16A2E6614ECE6ACB93BA73B3D4F48E27B65EA35577419317D8B63C6809
        5B330FBE06B1625F04E8D50B50F550A1029D693AFBED900E95C9EDA1D60C3FF4
        40A3FA94B673F0E1B7218A3E0B0FADC4BFA144158FF38CBC8B1BFB401B88AF90
        D570793145E3906BD1B24E5D9D4496CC51C5FDEC52531B611B3450499A9759FE
        24966DEB065A6545895CAE82CFF938C646E8E364606211A7C5D2CD1D3ABA42AF
        0AA5F24C860637F60E5FF47B5BBEE3994325B85AB1B4AC4347184F330141E7AD
        25B88A95776C0256AB7F35B540D5AF4F2CFF02ADBE46417D75F998439E50B3E8
        456083FA0DF54DEAB9106477D021F0B5DC699AB9DD251AC338CFE7D9341AEADF
        13FFBDA843FF712AAF29F2BCC2EB0C1C197ACD6CC04BC6243FD014E011CA95CA
        1F2CC63B6314227827D492BD087DF3BBDCD453E8ABF0AB17B4572CAB77728CA2
        61260C553B6D733D86EEABF20FA20923ACA7FA26F10000002574455874646174
        653A63726561746500323032332D31322D30315432313A31353A31372B30303A
        3030980D50280000002574455874646174653A6D6F6469667900323032332D31
        322D30315432313A31353A31372B30303A3030E950E894000000287445587464
        6174653A74696D657374616D7000323032332D31322D30315432313A31353A32
        322B30303A303062F2E10F0000001974455874536F667477617265007777772E
        696E6B73636170652E6F72679BEE3C1A0000000049454E44AE426082}
    end
  end
end
