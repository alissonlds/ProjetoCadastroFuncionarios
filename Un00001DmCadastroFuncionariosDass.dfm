object DmCadastroFuncionariosDass: TDmCadastroFuncionariosDass
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FdConexaoProjeto: TFDConnection
    Params.Strings = (
      
        'Database=C:\Projetos\Projeto Cadastro Funcionarios Dass\Base de ' +
        'dados\FUNCIONARIOS_DASS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=FB')
    Left = 88
    Top = 32
  end
  object FdLink: TFDPhysFBDriverLink
    VendorLib = 
      'C:\Program Files (x86)\HK-Software\IBExpert\Firebird3\fbclient.d' +
      'll'
    Left = 184
    Top = 32
  end
  object FdTabelaFuncionarios: TFDQuery
    AfterOpen = FdTabelaFuncionariosAfterOpen
    BeforePost = FdTabelaFuncionariosBeforePost
    OnNewRecord = FdTabelaFuncionariosNewRecord
    Connection = FdConexaoProjeto
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIOS')
    Left = 80
    Top = 96
    object FdTabelaFuncionariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FdTabelaFuncionariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object FdTabelaFuncionariosCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      OnGetText = FdTabelaFuncionariosCPFGetText
      EditMask = '999.999.999-99;0;'
      Size = 11
    end
    object FdTabelaFuncionariosEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object FdTabelaFuncionariosTAMANHO_CAMISA: TStringField
      FieldName = 'TAMANHO_CAMISA'
      Origin = 'TAMANHO_CAMISA'
      Size = 3
    end
    object FdTabelaFuncionariosTAMANHO_CALCADO: TIntegerField
      FieldName = 'TAMANHO_CALCADO'
      Origin = 'TAMANHO_CALCADO'
    end
  end
end
