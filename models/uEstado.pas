unit uEstado;

interface
    uses uPais, uGenerico;

    type Estado = class(Generico)

    protected
        uf : String[2];
        umPais : Pais;
    public
        constructor crieObj;
        destructor destrua_se;

        procedure setUf(pUf: String);
        procedure setUmPais(pUmPais: Pais);

        function getUf: String;
        function getUmPais: Pais;
    end;

implementation

{ Estado }

constructor Estado.crieObj;
begin
    inherited;
    uf:= '';
    umPais := Pais.crieObj;
end;

destructor Estado.destrua_se;
begin

end;

function Estado.getUf: String;
begin
    Result := uf;
end;

function Estado.getUmPais: Pais;
begin
    Result := umPais;
end;

procedure Estado.setUf(pUf: String);
begin
    uf := pUf;
end;

procedure Estado.setUmPais(pUmPais: Pais);
begin
    umPais := pUmPais;
end;

end.
