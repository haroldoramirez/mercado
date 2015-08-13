unit uGenerico;

interface
    uses DateUtils, SysUtils;

    type Generico = class

    protected
        id : Integer;
        nome : String[50];
        dataCadastro : TDateTime;
        dataAlteracao : TDateTime;

    public
        constructor crieObj;
        destructor destrua_se;
        procedure setId(pId: Integer);
        procedure setNome(pNome: String);
        procedure setDataCadastro(pDataCadastro: TDateTime);
        procedure setDataAlteracao(pDataAlteracao: TDateTime);
        function getId : Integer;
        function getNome : String;
        function getDataCadastro : TDateTime;
        function getDataAlteracao : TDateTime;
    end;

implementation

{ Generico }

constructor Generico.crieObj;
var
  dataAtual : TDateTime;
begin
    dataAtual := Date;
    id := 0;
    nome := '';
    dataCadastro := dataAtual;
    dataAlteracao := dataAtual;
end;

destructor Generico.destrua_se;
begin

end;

function Generico.getDataAlteracao: TDateTime;
begin
    Result := dataAlteracao;
end;

function Generico.getDataCadastro: TDateTime;
begin
    Result := dataCadastro;
end;

function Generico.getNome: String;
begin
    Result := nome;
end;

function Generico.getId: Integer;
begin
    Result := id;
end;

procedure Generico.setDataAlteracao(pDataAlteracao: TDateTime);
begin
    dataAlteracao := pDataAlteracao;
end;

procedure Generico.setDataCadastro(pDataCadastro: TDateTime);
begin
    dataCadastro := pDataCadastro;
end;

procedure Generico.setNome(pNome: String);
begin
    nome := pNome;
end;

procedure Generico.setId(pId: Integer);
begin
    id := pId;
end;

end.
