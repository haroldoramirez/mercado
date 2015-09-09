inherited FrmCadastroEstado: TFrmCadastroEstado
  Caption = 'Cadastro de Estado'
  ClientHeight = 139
  ClientWidth = 540
  ExplicitWidth = 556
  ExplicitHeight = 178
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbl_Obrigatorio: TLabel
    Top = 100
    ExplicitTop = 100
  end
  object lbl_Nome: TLabel [2]
    Left = 72
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Nome*'
  end
  object lbl_Uf: TLabel [3]
    Left = 280
    Top = 8
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object lbl_Pais: TLabel [4]
    Left = 328
    Top = 8
    Width = 25
    Height = 13
    Caption = 'Pa'#237's*'
  end
  inherited btn_Salvar: TButton
    Left = 374
    Top = 88
    OnClick = btn_SalvarClick
    ExplicitLeft = 374
    ExplicitTop = 88
  end
  inherited btn_Sair: TButton
    Left = 457
    Top = 89
    ExplicitLeft = 457
    ExplicitTop = 89
  end
  inherited dataStatus: TStatusBar
    Top = 120
    Width = 540
    ExplicitLeft = 0
    ExplicitTop = 120
    ExplicitWidth = 540
  end
  object edt_Nome: TEdit
    Left = 72
    Top = 27
    Width = 193
    Height = 21
    MaxLength = 20
    TabOrder = 4
  end
  object edt_Uf: TEdit
    Left = 280
    Top = 27
    Width = 31
    Height = 21
    MaxLength = 3
    TabOrder = 5
  end
  object edt_Pais: TEdit
    Left = 328
    Top = 27
    Width = 121
    Height = 21
    MaxLength = 11
    TabOrder = 6
  end
  object btn_Consultar: TButton
    Left = 455
    Top = 25
    Width = 75
    Height = 25
    Caption = '&Consultar'
    TabOrder = 7
    OnClick = btn_ConsultarClick
  end
end
