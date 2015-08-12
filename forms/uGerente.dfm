object Gerente: TGerente
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Sistema de Gest'#227'o de Mercados'
  ClientHeight = 447
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 32
    Top = 32
    object Cadastro: TMenuItem
      Caption = '&Cadastro'
      object Cliente: TMenuItem
        Caption = 'C&liente'
        OnClick = ClienteClick
      end
      object Fornecedor: TMenuItem
        Caption = '&Fornecedor'
      end
      object ransportadora: TMenuItem
        Caption = '&Transportadora'
      end
    end
    object Localidades: TMenuItem
      Caption = '&Localidades'
      object Pais: TMenuItem
        Caption = '&Pais'
        OnClick = PaisClick
      end
      object Estado: TMenuItem
        Caption = '&Estado'
        OnClick = EstadoClick
      end
      object Cidade: TMenuItem
        Caption = '&Cidade'
        OnClick = CidadeClick
      end
    end
    object Estoque: TMenuItem
      Caption = '&Estoque'
      object Produto: TMenuItem
        Caption = '&Produto'
      end
      object Marca: TMenuItem
        Caption = '&Marca'
      end
      object Categoria: TMenuItem
        Caption = '&Categoria'
      end
      object Unidade: TMenuItem
        Caption = '&Unidade'
      end
    end
    object CompraVenda: TMenuItem
      Caption = 'Compra/Venda'
      object Compra: TMenuItem
        Caption = '&Compra'
      end
      object Venda: TMenuItem
        Caption = '&Venda'
      end
    end
    object Financeiro: TMenuItem
      Caption = 'Financeiro'
      object ContasaPagar: TMenuItem
        Caption = 'Contas a Pagar'
      end
      object ContasaReceber: TMenuItem
        Caption = 'Contas a Receber'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FormadePagamento: TMenuItem
        Caption = 'Forma de Pagamento'
      end
      object CondiodePagamento: TMenuItem
        Caption = 'Condi'#231#227'o de Pagamento'
      end
    end
    object Sair: TMenuItem
      Caption = '&Sair'
      OnClick = SairClick
    end
  end
end
