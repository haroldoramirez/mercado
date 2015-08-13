unit uDao;

interface
  uses uDM, DB, uSingleton;
    type Dao = class

    protected
        umDM : TDM;
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

{ Dao }

function Dao.Buscar(pObj: TObject): Boolean;
begin

end;

function Dao.Carrega(pObj: TObject): TObject;
begin

end;

constructor Dao.crieObj;
begin
    //umDM := TDM.Create(nil);
    umDM := USingleton.getInstance;
end;

destructor Dao.destrua_se;
begin
    umDM.FreeInstance;
end;

function Dao.Excluir(pObj: TObject): string;
begin

end;

function Dao.GetDS: TDataSource;
begin

end;

function Dao.Salvar(pObj: TObject): string;
begin

end;

end.
