unit uProduto;

interface
    uses uGenerico, uMarca, uCategoria, uUnidade;

    type Produto = class(Generico)

    protected
        tipo : String[1];
        umaMarca : Marca;
        umaCategoria : Categoria;
        umaUnidade : Unidade;
        quantidade : Double;
        icms : Double;
        ipi : Double;
        precoCompra : Double;
        precoVenda : Double;
        observacoes : String[200];
    public
        constructor crieObj;
        destructor destrua_se;

        procedure setTipo(pTipo: String);
        procedure setUmaMarca(pUmaMarca: Marca);
        procedure setUmaCategoria(pUmaCategoria: Categoria);
        procedure setUmaUnidade(pUmaUnidade: Unidade);
        procedure setQuantidade(pQuantidade: Double);
        procedure setIcms(pIcms: Double);
        procedure setIpi(pIpi: Double);
        procedure setPrecoCompra(pPrecoCompra: Double);
        procedure setPrecoVenda(pPrecoVenda: Double);
        procedure setObservacoes(pObservacoes: String);

        function getTipo: String;
        function getUmaMarca: Marca;
        function getUmaCategoria: Categoria;
        function getUmaUnidade: Unidade;
        function getQuantidade: Double;
        function getIcms: Double;
        function getIpi: Double;
        function getPrecoCompra: Double;
        function getPrecoVenda: Double;
        function getObservacoes: String;
    end;

implementation

{ Produto }

constructor Produto.crieObj;
begin
    inherited;
    tipo := '';
    umaMarca := Marca.crieObj;
    umaCategoria := Categoria.crieObj;
    umaUnidade := Unidade.crieObj;
    quantidade := 0;
    icms := 0;
    ipi := 0;
    precoCompra := 0;
    precoVenda := 0;
    observacoes := '';
end;

destructor Produto.destrua_se;
begin

end;

function Produto.getIcms: Double;
begin
    Result := icms;
end;

function Produto.getIpi: Double;
begin
    Result := ipi;
end;

function Produto.getObservacoes: String;
begin
    Result := observacoes;
end;

function Produto.getPrecoCompra: Double;
begin
    Result := precoCompra;
end;

function Produto.getPrecoVenda: Double;
begin
    Result := precoVenda;
end;

function Produto.getQuantidade: Double;
begin
    Result := quantidade;
end;

function Produto.getTipo: String;
begin
    Result := tipo;
end;

function Produto.getUmaCategoria: Categoria;
begin
    Result := umaCategoria;
end;

function Produto.getUmaMarca: Marca;
begin
    Result := umaMarca;
end;

function Produto.getUmaUnidade: Unidade;
begin
    Result := umaUnidade;
end;

procedure Produto.setIcms(pIcms: Double);
begin
    icms := pIcms;
end;

procedure Produto.setIpi(pIpi: Double);
begin
    ipi := pIpi;
end;

procedure Produto.setObservacoes(pObservacoes: String);
begin
    observacoes := pObservacoes;
end;

procedure Produto.setPrecoCompra(pPrecoCompra: Double);
begin
    precoCompra := pPrecoCompra;
end;

procedure Produto.setPrecoVenda(pPrecoVenda: Double);
begin
    precoVenda := pPrecoVenda
end;

procedure Produto.setQuantidade(pQuantidade: Double);
begin
    quantidade := pQuantidade;
end;

procedure Produto.setTipo(pTipo: String);
begin
    tipo := pTipo;
end;

procedure Produto.setUmaCategoria(pUmaCategoria: Categoria);
begin
    umaCategoria := pUmaCategoria;
end;

procedure Produto.setUmaMarca(pUmaMarca: Marca);
begin
    umaMarca := pUmaMarca;
end;

procedure Produto.setUmaUnidade(pUmaUnidade: Unidade);
begin
    umaUnidade := pUmaUnidade;
end;

end.
