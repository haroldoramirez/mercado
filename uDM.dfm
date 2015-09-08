object DM: TDM
  OldCreateOrder = False
  Height = 366
  Width = 788
  object Mercado: TFDConnection
    Params.Strings = (
      'Database=mercadodb'
      'User_Name=postgres'
      'Password=haroldo'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 32
  end
  object FDTransaction: TFDTransaction
    Connection = Mercado
    Left = 64
    Top = 120
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 712
    Top = 32
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    Left = 712
    Top = 96
  end
  object DSPais: TDataSource
    DataSet = DQPais
    Left = 64
    Top = 192
  end
  object DQPais: TFDQuery
    Active = True
    Connection = Mercado
    SQL.Strings = (
      'select * from pais')
    Left = 64
    Top = 264
    object DQPaisidPais: TIntegerField
      FieldName = 'idPais'
      Origin = '"idPais"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DQPaisnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object DQPaisddi: TWideStringField
      FieldName = 'ddi'
      Origin = 'ddi'
      Size = 4
    end
    object DQPaisdatacadastro: TDateField
      FieldName = 'datacadastro'
      Origin = 'datacadastro'
    end
    object DQPaisdataalteracao: TDateField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
  end
  object DSEstado: TDataSource
    DataSet = DQEstado
    Left = 160
    Top = 192
  end
  object DQEstado: TFDQuery
    Active = True
    Connection = Mercado
    SQL.Strings = (
      'select * from estado')
    Left = 160
    Top = 264
    object DQEstadoidEstado: TIntegerField
      FieldName = 'idEstado'
      Origin = '"idEstado"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DQEstadonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object DQEstadouf: TWideStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object DQEstadocodPais: TIntegerField
      FieldName = 'codPais'
      Origin = '"codPais"'
    end
    object DQEstadodatacadastro: TDateField
      FieldName = 'datacadastro'
      Origin = 'datacadastro'
    end
    object DQEstadodataalteracao: TDateField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
  end
  object DSCidade: TDataSource
    DataSet = DQCidade
    Left = 264
    Top = 192
  end
  object DQCidade: TFDQuery
    Connection = Mercado
    SQL.Strings = (
      'select * from cidade')
    Left = 264
    Top = 264
  end
end
