unit uInter;

interface
    uses uPais, uFrmConsultaPais, uEstado, uFrmConsultaEstado, uCidade, uFrmConsultaCidade,
    uCliente, uFrmConsultaCliente;

    type Interfaces = class

    protected
        umFrmConsultaPais : TConsultaPais;
        umFrmConsultaEstado : TConsultaEstado;
        umFrmConsultaCidade : TConsultaCidade;

        umFrmConsultaCliente : TConsultaCliente;
    public
        constructor crieObj;
        destructor destrua_se;

        procedure pecaDadosPais(pPais: Pais);
        procedure pecaDadosEstado(pEstado: Estado);
        procedure pecaDadosCidade(pCidade: Cidade);
        procedure pecaDadosCliente(pCliente: Cliente);
    end;

implementation

{ Interfaces }

constructor Interfaces.crieObj;
begin
    umFrmConsultaPais := TConsultaPais.Create(nil);
    umFrmConsultaEstado := TConsultaEstado.Create(nil);
    umFrmConsultaCidade := TConsultaCidade.Create(nil);

    umFrmConsultaCliente := TConsultaCliente.Create(nil);
end;

destructor Interfaces.destrua_se;
begin
    umFrmConsultaPais.Free;
    umFrmConsultaEstado.Free;
    umFrmConsultaCidade.Free;
    umFrmConsultaCliente.Free;
end;

procedure Interfaces.pecaDadosCidade(pCidade: Cidade);
begin
    umFrmConsultaCidade.conhecaObj(pCidade);
    umFrmConsultaCidade.ShowModal;
end;

procedure Interfaces.pecaDadosCliente(pCliente: Cliente);
begin
    umFrmConsultaCliente.conhecaObj(pCliente);
    umFrmConsultaCliente.ShowModal;
end;

procedure Interfaces.pecaDadosEstado(pEstado: Estado);
begin
    umFrmConsultaEstado.conhecaObj(pEstado);
    umFrmConsultaEstado.ShowModal;
end;

procedure Interfaces.pecaDadosPais(pPais: Pais);
begin
    umFrmConsultaPais.conhecaObj(pPais);
    umFrmConsultaPais.ShowModal;
end;

end.
