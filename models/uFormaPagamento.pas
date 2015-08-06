unit uFormaPagamento;

interface
    uses uGenerico;
    type FormaPagamento = class(Generico)

    public
        constructor crieObj;
        destructor destrua_se;
    end;

implementation

{ FormaPagamento }

constructor FormaPagamento.crieObj;
begin
     inherited;
end;

destructor FormaPagamento.destrua_se;
begin

end;

end.
