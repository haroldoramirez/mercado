unit uCidade;

interface
    uses uEstado, uGenerico;

    type Cidade = class(Generico)

    protected
        ddd : String[4];
        umEstado : Estado;
    public
        constructor crieObj;
        destructor destrua_se;

        procedure setDdd(pDdd: String);
        procedure setUmEstado(pUmEstado: Estado);

        function getDdd: String;
        function getUmEstado: Estado;
    end;

implementation

{ Cidade }

constructor Cidade.crieObj;
begin
    ddd := '';
    umEstado := Estado.crieObj;
end;

destructor Cidade.destrua_se;
begin

end;

function Cidade.getDdd: String;
begin
    Result := ddd;
end;

function Cidade.getUmEstado: Estado;
begin
    Result := umEstado;
end;

procedure Cidade.setDdd(pDdd: String);
begin
    ddd := pDdd;
end;

procedure Cidade.setUmEstado(pUmEstado: Estado);
begin
    umEstado := pUmEstado;
end;

end.
