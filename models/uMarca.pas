unit uMarca;

interface
    uses uGenerico;

    type Marca = class(Generico)

    public
        constructor crieObj;
        destructor destrua_se;
    end;

implementation

{ Marca }

constructor Marca.crieObj;
begin
    inherited;
end;

destructor Marca.destrua_se;
begin

end;

end.
