object CadastroPai: TCadastroPai
  Left = 0
  Top = 0
  Caption = 'CadastroPai'
  ClientHeight = 271
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Codigo: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbl_Obrigatorio: TLabel
    Left = 8
    Top = 197
    Width = 117
    Height = 13
    Caption = '(*) Campos Obrigat'#243'rios'
  end
  object edt_Codigo: TEdit
    Left = 8
    Top = 27
    Width = 49
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object btn_Salvar: TButton
    Left = 184
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 1
  end
  object btn_Sair: TButton
    Left = 280
    Top = 192
    Width = 75
    Height = 25
    Caption = 'S&air'
    TabOrder = 2
    OnClick = btn_SairClick
  end
  object dataStatus: TStatusBar
    Left = 0
    Top = 252
    Width = 398
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitLeft = 104
    ExplicitTop = 256
    ExplicitWidth = 0
  end
end
