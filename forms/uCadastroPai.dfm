object CadastroPai: TCadastroPai
  Left = 0
  Top = 0
  Caption = 'CadastroPai'
  ClientHeight = 359
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LblCodigo: TLabel
    Left = 24
    Top = 24
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object edt_Codigo: TEdit
    Left = 24
    Top = 43
    Width = 49
    Height = 21
    TabOrder = 0
  end
  object btn_Salvar: TButton
    Left = 384
    Top = 320
    Width = 75
    Height = 25
    Caption = 'S&alvar'
    TabOrder = 1
  end
  object btn_Sair: TButton
    Left = 488
    Top = 320
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 2
    OnClick = btn_SairClick
  end
end
