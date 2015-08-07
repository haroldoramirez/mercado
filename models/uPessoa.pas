unit uPessoa;

interface
    uses DateUtils, SysUtils, uEndereco;

    type Pessoa = class

    protected
        id : Integer;
        nome_razaoSocial : String[100];
        rg_ie : String[11];
        cpf_cnpj : String[18];
        dataNasci_Fund : TDateTime;
        umEndereco : Endereco;
        email : String[100];
        telefone : String[13];
        celular : String[13];
        observacoes : String[200];
        dataCadastro : TDateTime;
        dataAlteracao : TDateTime;
    public
        constructor crieObj;
        destructor destrua_se;

        procedure setId(pId: Integer);
        procedure setNome_razaoSocial(pNome_razaoSocial: String);
        procedure setRg_Ie(pRg_Ie: String);
        procedure setCpf_Cnpj(pCpf_Cnpj: String);
        procedure setDataNasci_Fund(pDataNasci_Fund: TDateTime);
        procedure setUmEndereco(pUmEndereco: Endereco);
        procedure setEmail(pEmail: String);
        procedure setTelefone(pTelefone: String);
        procedure setCelular(pCelular: String);
        procedure setObservacoes(pObservacoes: String);
        procedure setDataCadastro(pDataCadastro: TDateTime);
        procedure setDataAlteracao(pDataAlteracao: TDateTime);

        function getId: Integer;
        function getNome_razaoSocial: String;
        function getRg_Ie: String;
        function getCpf_Cnpj: String;
        function getDataNasci_Fund: TDateTime;
        function getUmEndereco: Endereco;
        function getEmail: String;
        function getTelefone: String;
        function getCelular: String;
        function getObservacoes: String;
        function getDataCadastro: TDateTime;
        function getDataAlteracao: TDateTime;
    end;

implementation

{ Pessoa }

constructor Pessoa.crieObj;
var
  dataAtual : TDateTime;
begin
    dataAtual := Date;
    id := 0;
    nome_razaoSocial := '';
    rg_ie := '';
    cpf_cnpj := '';
    dataNasci_Fund := dataAtual;
    umEndereco := Endereco.crieObj;
    email := '';
    telefone := '';
    celular := '';
    observacoes := '';
    dataCadastro := dataAtual;
    dataAlteracao := dataAtual;
end;

destructor Pessoa.destrua_se;
begin

end;

function Pessoa.getCelular: String;
begin
    Result := celular;
end;

function Pessoa.getCpf_Cnpj: String;
begin
    Result := cpf_cnpj;
end;

function Pessoa.getDataAlteracao: TDateTime;
begin
    Result := dataAlteracao;
end;

function Pessoa.getDataCadastro: TDateTime;
begin
    Result := dataCadastro;
end;

function Pessoa.getDataNasci_Fund: TDateTime;
begin
    Result := dataNasci_Fund;
end;

function Pessoa.getEmail: String;
begin
    Result := email;
end;

function Pessoa.getId: Integer;
begin
    Result := id;
end;

function Pessoa.getNome_razaoSocial: String;
begin
    Result := nome_razaoSocial;
end;

function Pessoa.getObservacoes: String;
begin
    Result := observacoes;
end;

function Pessoa.getRg_Ie: String;
begin
    Result := rg_ie;
end;

function Pessoa.getTelefone: String;
begin
    Result := telefone;
end;

function Pessoa.getUmEndereco: Endereco;
begin
    Result := umEndereco;
end;

procedure Pessoa.setCelular(pCelular: String);
begin
    celular := pCelular;
end;

procedure Pessoa.setCpf_Cnpj(pCpf_Cnpj: String);
begin
    cpf_cnpj := pCpf_Cnpj;
end;

procedure Pessoa.setDataAlteracao(pDataAlteracao: TDateTime);
begin
    dataAlteracao := pDataAlteracao;
end;

procedure Pessoa.setDataCadastro(pDataCadastro: TDateTime);
begin
    dataCadastro := pDataCadastro;
end;

procedure Pessoa.setDataNasci_Fund(pDataNasci_Fund: TDateTime);
begin
    dataNasci_Fund := pDataNasci_Fund;
end;

procedure Pessoa.setEmail(pEmail: String);
begin
    email := pEmail;
end;

procedure Pessoa.setId(pId: Integer);
begin
    id := pId;
end;

procedure Pessoa.setNome_razaoSocial(pNome_razaoSocial: String);
begin
    nome_razaoSocial := pNome_razaoSocial;
end;

procedure Pessoa.setObservacoes(pObservacoes: String);
begin
    observacoes := pObservacoes;
end;

procedure Pessoa.setRg_Ie(pRg_Ie: String);
begin
    rg_ie := pRg_Ie;
end;

procedure Pessoa.setTelefone(pTelefone: String);
begin
    telefone := pTelefone;
end;

procedure Pessoa.setUmEndereco(pUmEndereco: Endereco);
begin
    umEndereco := pUmEndereco;
end;

end.
