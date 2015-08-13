inherited FrmCadastroPais: TFrmCadastroPais
  Left = 49
  Caption = 'Cadastro Pa'#237's'
  ClientHeight = 182
  ClientWidth = 411
  Position = poDesigned
  ExplicitWidth = 427
  ExplicitHeight = 221
  PixelsPerInch = 96
  TextHeight = 13
  inherited LblCodigo: TLabel
    Left = 8
    Top = 8
    Width = 42
    Height = 15
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Consolas'
    ParentFont = False
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 42
    ExplicitHeight = 15
  end
  object lbl_Nome: TLabel [1]
    Left = 71
    Top = 8
    Width = 28
    Height = 15
    Caption = 'Nome'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object lbl_DataCadastro: TLabel [2]
    Left = 279
    Top = 70
    Width = 112
    Height = 15
    Caption = 'Data de Cadastro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object lbl_DataAlteracao: TLabel [3]
    Left = 136
    Top = 70
    Width = 119
    Height = 15
    Caption = 'Data de Altera'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object lbl_Ddi: TLabel [4]
    Left = 346
    Top = 8
    Width = 21
    Height = 15
    Caption = 'DDI'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  inherited edt_Codigo: TEdit
    Left = 8
    Top = 27
    Width = 42
    Height = 23
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Consolas'
    MaxLength = 4
    ParentFont = False
    ExplicitLeft = 8
    ExplicitTop = 27
    ExplicitWidth = 42
    ExplicitHeight = 23
  end
  inherited btn_Salvar: TButton
    Left = 232
    Top = 149
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Consolas'
    ParentFont = False
    ExplicitLeft = 232
    ExplicitTop = 149
  end
  inherited btn_Sair: TButton
    Left = 325
    Top = 149
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Consolas'
    ParentFont = False
    ExplicitLeft = 325
    ExplicitTop = 149
  end
  object edt_Nome: TEdit
    Left = 71
    Top = 27
    Width = 249
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 3
  end
  object edt_DataCadastro: TEdit
    Left = 279
    Top = 89
    Width = 116
    Height = 23
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object edt_DataAlteracao: TEdit
    Left = 136
    Top = 89
    Width = 121
    Height = 23
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object edt_Ddi: TEdit
    Left = 346
    Top = 27
    Width = 49
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 6
  end
end
