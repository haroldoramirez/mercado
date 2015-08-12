unit uGerente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uInter, uPais, uEstado, uCidade, uCliente;

type
  TGerente = class(TForm)
    MainMenu: TMainMenu;
    Cadastro: TMenuItem;
    Localidades: TMenuItem;
    Pais: TMenuItem;
    Estado: TMenuItem;
    Cidade: TMenuItem;
    Cliente: TMenuItem;
    Fornecedor: TMenuItem;
    ransportadora: TMenuItem;
    Estoque: TMenuItem;
    Produto: TMenuItem;
    Marca: TMenuItem;
    Categoria: TMenuItem;
    Unidade: TMenuItem;
    CompraVenda: TMenuItem;
    Compra: TMenuItem;
    Venda: TMenuItem;
    Financeiro: TMenuItem;
    ContasaPagar: TMenuItem;
    ContasaReceber: TMenuItem;
    N1: TMenuItem;
    FormadePagamento: TMenuItem;
    CondiodePagamento: TMenuItem;
    Sair: TMenuItem;
    procedure SairClick(Sender: TObject);
    procedure PaisClick(Sender: TObject);
    procedure EstadoClick(Sender: TObject);
    procedure CidadeClick(Sender: TObject);
    procedure ClienteClick(Sender: TObject);
  private
    { Private declarations }
    umaInter : Interfaces;
    umPais : Pais;
    umEstado : Estado;
    umaCidade : Cidade;
    umCliente : Cliente;
  public
    { Public declarations }
    procedure conhecaObj(pInter: Interfaces; pPais: Pais; pEstado: Estado; pCidade: Cidade;
    pCliente: Cliente);
  end;

var
  Gerente: TGerente;

implementation

{$R *.dfm}

procedure TGerente.ClienteClick(Sender: TObject);
begin
    umaInter.pecaDadosCliente(umCliente);
end;

procedure TGerente.conhecaObj(pInter: Interfaces; pPais: Pais; pEstado: Estado;
  pCidade: Cidade; pCliente: Cliente);
begin
    umaInter := pInter;
    umPais := pPais;
    umEstado := pEstado;
    umaCidade := pCidade;
    umCliente := pCliente;
end;

procedure TGerente.CidadeClick(Sender: TObject);
begin
    umaInter.pecaDadosCidade(umaCidade);
end;

procedure TGerente.EstadoClick(Sender: TObject);
begin
    umaInter.pecaDadosEstado(umEstado);
end;

procedure TGerente.PaisClick(Sender: TObject);
begin
    umaInter.pecaDadosPais(umPais);
end;

procedure TGerente.SairClick(Sender: TObject);
begin
    close;
end;

end.
