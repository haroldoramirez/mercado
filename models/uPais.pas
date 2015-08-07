unit uPais;

interface
    uses uGenerico;

    type Pais = class(Generico)

    protected
        ddi : String[4];
    public
        constructor crieObj;
        destructor destrua_se;

        procedure setDdi(pDdi: String);

        function getDdi: String;
    end;

implementation

{ Pais }

constructor Pais.crieObj;
begin
    inherited;
    ddi := '';
end;

destructor Pais.destrua_se;
begin

end;

function Pais.getDdi: String;
begin
    Result := ddi;
end;

procedure Pais.setDdi(pDdi: String);
begin
    ddi := pDdi;
end;

end.
