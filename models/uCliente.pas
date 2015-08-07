unit uCliente;

interface
    uses uPessoa, uCondicaoPagamento;

    type Cliente = class(Pessoa)

    protected
        tipoPessoa : String[8];
        umaCondicaoPagamento : CondicaoPagamento;
    public
        verificaNome : Boolean;
        verificaTel : Boolean;
        constructor crieObj;
        destructor destrua_se;

        procedure setUmaCondicaoPagamento(pUmaCondicaoPagamento: CondicaoPagamento);
        procedure setTipoPessoa(pTipoPessoa: String);

        function getUmaCondicaoPagamento: CondicaoPagamento;
        function getTipoPessoa: String;
    end;

implementation

{ Cliente }

constructor Cliente.crieObj;
begin
    inherited;
    tipoPessoa := '';
    umaCondicaoPagamento := CondicaoPagamento.crieObj;
end;

destructor Cliente.destrua_se;
begin
    inherited;
end;

function Cliente.getTipoPessoa: String;
begin
    Result := tipoPessoa;
end;

function Cliente.getUmaCondicaoPagamento: CondicaoPagamento;
begin
    Result := umaCondicaoPagamento;
end;

procedure Cliente.setTipoPessoa(pTipoPessoa: String);
begin
    tipoPessoa := pTipoPessoa;
end;

procedure Cliente.setUmaCondicaoPagamento(
  pUmaCondicaoPagamento: CondicaoPagamento);
begin
    umaCondicaoPagamento := pUmaCondicaoPagamento;
end;

end.
