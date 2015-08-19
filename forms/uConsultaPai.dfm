object ConsultaPai: TConsultaPai
  Left = 0
  Top = 0
  Caption = 'ConsultaPai'
  ClientHeight = 409
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edt_Pesquisar: TEdit
    Left = 17
    Top = 17
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object btn_Pesquisar: TButton
    Left = 280
    Top = 15
    Width = 75
    Height = 25
    Caption = '&Pesquisar'
    TabOrder = 1
    OnClick = btn_PesquisarClick
  end
  object btn_Novo: TButton
    Left = 331
    Top = 373
    Width = 76
    Height = 25
    Caption = '&Novo'
    TabOrder = 2
    OnClick = btn_NovoClick
  end
  object btn_Alterar: TButton
    Left = 432
    Top = 373
    Width = 75
    Height = 25
    Caption = '&Alterar'
    TabOrder = 3
    OnClick = btn_AlterarClick
  end
  object btn_Excluir: TButton
    Left = 529
    Top = 373
    Width = 75
    Height = 25
    Caption = '&Excluir'
    TabOrder = 4
    OnClick = btn_ExcluirClick
  end
  object btn_Sair: TButton
    Left = 631
    Top = 373
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 5
    OnClick = btn_SairClick
  end
  object gridConsulta: TDBGrid
    Left = 17
    Top = 46
    Width = 689
    Height = 307
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
