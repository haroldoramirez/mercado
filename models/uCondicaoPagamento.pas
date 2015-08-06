unit uCondicaoPagamento;

interface
    uses uGenerico, uFormaPagamento, uParcelas;

    type CondicaoPagamento = class(Generico)

    protected
        umaFormaPagamento : FormaPagamento;
        ListaParcela : array of Parcelas;
    public
        p: Integer;
        constructor crieObj;
        destructor destrua_se;

        procedure setUmaFormaPagamento(pUmaFormaPagamento: FormaPagamento);
        function getUmFormaPagamento: FormaPagamento;

        procedure addParcela;
        procedure removeParcela;
        function getParcela: Parcelas; overload;
        function getParcela(parc: Integer): Parcelas; overload;
    end;

implementation

{ CondicaoPagamento }

procedure CondicaoPagamento.addParcela;
begin
    inc(p);
    SetLength(ListaParcela,p);
    ListaParcela[p-1] := Parcelas.crieObj;
end;

constructor CondicaoPagamento.crieObj;
begin
    inherited;
    umaFormaPagamento := FormaPagamento.crieObj;
end;

destructor CondicaoPagamento.destrua_se;
begin

end;

function CondicaoPagamento.getParcela: Parcelas;
begin
    Result := ListaParcela[p-1];
end;

function CondicaoPagamento.getParcela(parc: Integer): Parcelas;
begin
    Result := ListaParcela[parc];
end;

function CondicaoPagamento.getUmFormaPagamento: FormaPagamento;
begin
    Result := umaFormaPagamento;
end;

procedure CondicaoPagamento.removeParcela;
begin
    dec(p);
    SetLength(ListaParcela,p);
    //ListaParcela[p-1] := Parcelas.crieObj;
end;

procedure CondicaoPagamento.setUmaFormaPagamento(
  pUmaFormaPagamento: FormaPagamento);
begin
    umaFormaPagamento := pUmaFormaPagamento;
end;

end.
