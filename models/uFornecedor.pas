unit uFornecedor;

interface
    uses Classes, uPessoa, uCondicaoPagamento, uProduto;

    type Fornecedor = class(Pessoa)

    protected
        tipoPessoa : String[8];
        tipoFavorecido : String[1];
        umaCondicaoPagamento : CondicaoPagamento;
        umProduto : Produto;
        ListaProdutos : TList;
    public
        verificaNome : Boolean;
        verificaTel : Boolean;
        constructor crieObj;
        destructor destrua_se;

        procedure setTipoPessoa(pTipoPessoa: String);
        procedure setTipoFavorecido(pTipoFavorecido: String);
        procedure setUmaCondicaoPagamento(pUmaCondicaoPagamento: CondicaoPagamento);
        procedure setUmProduto(pUmProduto: Produto);

        function getTipoPessoa: String;
        function getTipoFavorecido: String;
        function getUmaCondicaoPagamento: CondicaoPagamento;
        function getUmProduto: Produto;

        //Produto
        procedure criaObjetoProduto;
        procedure addProduto(pProduto: Produto);
        procedure limpaListaProduto;
        procedure removeItemProdutoVenda(Index: Integer);

        function getProduto(produto: Integer) : Produto;
        function countProdutos: Integer;
    end;

implementation

{ Fornecedor }

procedure Fornecedor.addProduto(pProduto: Produto);
begin
    ListaProdutos.Add(pProduto);
end;

function Fornecedor.countProdutos: Integer;
begin
    Result := ListaProdutos.Count;
end;

procedure Fornecedor.criaObjetoProduto;
begin
    umProduto := Produto.crieObj;
end;

constructor Fornecedor.crieObj;
begin
    inherited;
    tipoPessoa := '';
    tipoFavorecido := '';
    umaCondicaoPagamento := CondicaoPagamento.crieObj;
    ListaProdutos := TList.Create;
end;

destructor Fornecedor.destrua_se;
begin
    inherited;
end;

function Fornecedor.getProduto(produto: Integer): Produto;
begin
    Result := ListaProdutos[produto];
end;

function Fornecedor.getTipoFavorecido: String;
begin
    Result := tipoFavorecido;
end;

function Fornecedor.getTipoPessoa: String;
begin
    Result := tipoPessoa;
end;

function Fornecedor.getUmaCondicaoPagamento: CondicaoPagamento;
begin
    Result := umaCondicaoPagamento;
end;

function Fornecedor.getUmProduto: Produto;
begin
    Result := umProduto;
end;

procedure Fornecedor.limpaListaProduto;
var i : Integer;
begin
  for i := 0 to ListaProdutos.Count -1  do
    Produto(ListaProdutos[i]).Free;
  ListaProdutos.Clear;
end;

procedure Fornecedor.removeItemProdutoVenda(Index: Integer);
begin
    ListaProdutos.Delete(Index);
end;

procedure Fornecedor.setTipoFavorecido(pTipoFavorecido: String);
begin
    tipoFavorecido := pTipoFavorecido;
end;

procedure Fornecedor.setTipoPessoa(pTipoPessoa: String);
begin
    tipoPessoa := pTipoPessoa;
end;

procedure Fornecedor.setUmaCondicaoPagamento(
  pUmaCondicaoPagamento: CondicaoPagamento);
begin
    umaCondicaoPagamento := pUmaCondicaoPagamento;
end;

procedure Fornecedor.setUmProduto(pUmProduto: Produto);
begin
    umProduto := pUmProduto;
end;

end.
