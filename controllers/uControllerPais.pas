unit uControllerPais;

interface
    uses uController, uDaoPais, uDM, DB;

    type ControllerPais = class(Controller)

    protected
        umaDaoPais : DaoPais;
    public
        constructor crieObj;
        destructor destrua_se;
        function Salvar(pObj: TObject): string;      virtual;
        function GetDS : TDataSource;                virtual;
        function Carrega(pObj: TObject): TObject;    virtual;
        function Buscar(pObj : TObject) : Boolean;   virtual;
        function Excluir(pObj : TObject) : string;   virtual;
    end;

implementation

{ ControllerPais }

function ControllerPais.Buscar(pObj: TObject): Boolean;
begin
    Result := umaDaoPais.Buscar(pObj);
end;

function ControllerPais.Carrega(pObj: TObject): TObject;
begin
    Result := umaDaoPais.Carrega(pObj);
end;

constructor ControllerPais.crieObj;
begin
    umaDaoPais := DaoPais.crieObj;
end;

destructor ControllerPais.destrua_se;
begin
    umaDaoPais.destrua_se;
end;

function ControllerPais.Excluir(pObj: TObject): string;
begin
    Result := umaDaoPais.Excluir(pObj);
end;

function ControllerPais.GetDS: TDataSource;
begin
    Result := umaDaoPais.GetDS;
end;

function ControllerPais.Salvar(pObj: TObject): string;
begin
    Result := umaDaoPais.Salvar(pObj);
end;

end.
