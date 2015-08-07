unit uEndereco;

interface
    uses uCidade;

    type Endereco = class

    protected
        logradouro : String[50];
        numero : String[4];
        cep : String[9];
        bairro : String[50];
        complemento : String[50];
        umaCidade : Cidade;
    public
        constructor crieObj;
        destructor destrua_se;

        procedure setLogradouro(pLogradouro: String);
        procedure setNumero(pNumero: String);
        procedure setCep(pCep: String);
        procedure setBairro(pBairro: String);
        procedure setComplemento(pComplemento: String);
        procedure setUmaCidade(pUmaCidade: Cidade);

        function getLogradouro: String;
        function getNumero: String;
        function getCep: String;
        function getBairro: String;
        function getComplemento: string;
        function getUmaCidade: Cidade;
    end;

implementation

{ Endereco }

constructor Endereco.crieObj;
begin
    logradouro := '';
    numero := '';
    cep := '';
    bairro := '';
    complemento := '';
    umaCidade := Cidade.crieObj;
end;

destructor Endereco.destrua_se;
begin

end;

function Endereco.getBairro: String;
begin
    Result := bairro;
end;

function Endereco.getCep: String;
begin
    Result := cep;
end;

function Endereco.getComplemento: string;
begin
    Result := complemento;
end;

function Endereco.getLogradouro: String;
begin
    Result := logradouro;
end;

function Endereco.getNumero: String;
begin
    Result := numero;
end;

function Endereco.getUmaCidade: Cidade;
begin
    Result := umaCidade;
end;

procedure Endereco.setBairro(pBairro: String);
begin
    bairro := pBairro;
end;

procedure Endereco.setCep(pCep: String);
begin
    cep := pCep;
end;

procedure Endereco.setComplemento(pComplemento: String);
begin
    complemento := pComplemento;
end;

procedure Endereco.setLogradouro(pLogradouro: String);
begin
    logradouro := pLogradouro;
end;

procedure Endereco.setNumero(pNumero: String);
begin
    numero := pNumero;
end;

procedure Endereco.setUmaCidade(pUmaCidade: Cidade);
begin
    umaCidade := pUmaCidade;
end;

end.
