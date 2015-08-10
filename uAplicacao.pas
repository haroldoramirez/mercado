unit uAplicacao;

interface
    uses uGerente, uInter, uPais;

    type Aplicacao = class

    private
        umGerente : TGerente;
        umaInterface : Interfaces;
        umPais : Pais;
    public
        constructor crieObj;
        destructor destrua_se;
        procedure execute_se;
    end;

implementation

{ Aplicacao }

constructor Aplicacao.crieObj;
begin

end;

destructor Aplicacao.destrua_se;
begin

end;

procedure Aplicacao.execute_se;
begin

end;

end.
