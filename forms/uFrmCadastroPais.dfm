inherited FrmCadastroPais: TFrmCadastroPais
  Left = 242
  Top = 222
  BorderStyle = bsSingle
  Caption = 'Cadastro Pa'#237's'
  ClientHeight = 134
  ClientWidth = 418
  Position = poDesigned
  ExplicitWidth = 424
  ExplicitHeight = 163
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Nome: TLabel [1]
    Left = 72
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Nome*'
  end
  object lbl_Ddi: TLabel [2]
    Left = 360
    Top = 8
    Width = 18
    Height = 13
    Caption = 'DDI'
  end
  inherited lbl_Obrigatorio: TLabel
    Top = 100
    ExplicitTop = 100
  end
  inherited btn_Salvar: TButton
    Left = 244
    Top = 88
    OnClick = btn_SalvarClick
    ExplicitLeft = 244
    ExplicitTop = 88
  end
  inherited btn_Sair: TButton
    Left = 334
    Top = 88
    ExplicitLeft = 334
    ExplicitTop = 88
  end
  inherited dataStatus: TStatusBar
    Top = 115
    Width = 418
    ExplicitLeft = 0
    ExplicitTop = 131
    ExplicitWidth = 427
  end
  object edt_Nome: TEdit
    Left = 72
    Top = 27
    Width = 273
    Height = 21
    MaxLength = 30
    TabOrder = 4
  end
  object edt_Ddi: TEdit
    Left = 360
    Top = 27
    Width = 49
    Height = 21
    MaxLength = 4
    TabOrder = 5
  end
end
