unit uUnidade;

interface
    uses uGenerico;

    type Unidade = class(Generico)

    public
        constructor crieObj;
        destructor destrua_se;
    end;

implementation

{ Unidade }

constructor Unidade.crieObj;
begin
    inherited;
end;

destructor Unidade.destrua_se;
begin

end;

end.
