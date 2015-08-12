unit uAplicacao;

interface
    uses uGerente, uInter, uPais, uEstado, uCidade, uCliente;

    type Aplicacao = class

    private
        umGerente : TGerente;
        umaInter : Interfaces;
        umPais : Pais;
        umEstado : Estado;
        umaCidade : Cidade;
        umCliente : Cliente;

    public
        constructor crieObj;
        destructor destrua_se;
        procedure execute_se;
    end;

implementation

{ Aplicacao }

constructor Aplicacao.crieObj;
begin
    umGerente := TGerente.Create(nil);
    umaInter := Interfaces.crieObj;
    umPais := Pais.crieObj;
    umEstado := Estado.crieObj;
    umaCidade := Cidade.crieObj;
    umCliente := Cliente.crieObj;
end;

destructor Aplicacao.destrua_se;
begin
    umaInter.destrua_se;
    umGerente.Free;
    umCliente.destrua_se;
    umaCidade.destrua_se;
    umEstado.destrua_se;
    umPais.destrua_se;
end;

procedure Aplicacao.execute_se;
begin
    umGerente.conhecaObj(umaInter, umPais, umEstado, umaCidade, umCliente);
    umGerente.ShowModal;
end;

end.
