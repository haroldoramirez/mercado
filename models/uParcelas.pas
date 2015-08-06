unit uParcelas;

interface
    type Parcelas = class

    protected
        numParcela : Integer;
        dias : Integer;
        porcentagem : Real;
    public
        constructor crieObj;
        destructor destrua_se;
        procedure setNumParcela(pNumParcela: Integer);
        procedure setDias(pDias: Integer);
        procedure setPorcentagem(pPorcentagem: Real);
        function getNumParcela: Integer;
        function getDias: Integer;
        function getPorcentagem: Real;

    end;

implementation

{ Parcelas }

constructor Parcelas.crieObj;
begin
    numParcela := 0;
    dias := 0;
    porcentagem := 0;
end;

destructor Parcelas.destrua_se;
begin

end;

function Parcelas.getDias: Integer;
begin
    Result := dias;
end;

function Parcelas.getNumParcela: Integer;
begin
    Result := numParcela;
end;

function Parcelas.getPorcentagem: Real;
begin
    Result := porcentagem;
end;

procedure Parcelas.setDias(pDias: Integer);
begin
    dias := pDias;
end;

procedure Parcelas.setNumParcela(pNumParcela: Integer);
begin
    numParcela := pNumParcela;
end;

procedure Parcelas.setPorcentagem(pPorcentagem: Real);
begin
    porcentagem := pPorcentagem;
end;

end.
