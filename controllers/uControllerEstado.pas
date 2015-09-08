unit uControllerEstado;

interface
    uses uController, uDaoEstado, uDM, DB;

    type ControllerEstado = class(Controller)

    protected
          umaDaoEstado: DaoEstado;
    public
        constructor crieObj;
        destructor destrua_se;
        function Salvar(pObj: TObject): string;      override;
        function GetDS : TDataSource;                override;
        function Carrega(pObj: TObject): TObject;    override;
        function Buscar(pObj : TObject) : Boolean;   override;
        function Excluir(pObj : TObject) : string;   override;
    end;

implementation

{ ControllerEstado }

function ControllerEstado.Buscar(pObj: TObject): Boolean;
begin
    Result := umaDaoEstado.Buscar(pObj);
end;

function ControllerEstado.Carrega(pObj: TObject): TObject;
begin
    Result := umaDaoEstado.Carrega(pObj);
end;

constructor ControllerEstado.crieObj;
begin
    umaDaoEstado := DaoEstado.crieObj;
end;

destructor ControllerEstado.destrua_se;
begin
    umaDaoEstado.destrua_se;
end;

function ControllerEstado.Excluir(pObj: TObject): string;
begin
    result := umaDaoEstado.Excluir(pObj);
end;

function ControllerEstado.GetDS: TDataSource;
begin
    result := umaDaoEstado.GetDS;
end;

function ControllerEstado.Salvar(pObj: TObject): string;
begin
    result := umaDaoEstado.Salvar(pObj);
end;

end.
