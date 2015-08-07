unit uCategoria;

interface
    uses uGenerico;

    type Categoria = class(Generico)

    public
        constructor crieObj;
        destructor destrua_se;
    end;

implementation

{ Categoria }

constructor Categoria.crieObj;
begin
    inherited;
end;

destructor Categoria.destrua_se;
begin

end;

end.
