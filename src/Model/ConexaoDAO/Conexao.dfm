object dmConexao: TdmConexao
  Left = 0
  Top = 0
  Caption = 'dmConexao'
  ClientHeight = 227
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=Localhost'
      'Port=3050'
      'CharacterSet=WIN1252'
      
        'Database=D:\Tiago\Programming\Delphi\SalesApp\Win32\Debug\DataBa' +
        'se\RAZER.FDB'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 72
  end
  object DriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
    Left = 215
    Top = 88
  end
end
