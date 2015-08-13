unit uController;

interface
  uses Classes, DB, uDM;

    type Controller = class

    protected

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

{ Controller }

function Controller.Buscar(pObj: TObject): Boolean;
begin

end;

function Controller.Carrega(pObj: TObject): TObject;
begin

end;

constructor Controller.crieObj;
begin

end;

destructor Controller.destrua_se;
begin

end;

function Controller.Excluir(pObj: TObject): string;
begin

end;

function Controller.GetDS: TDataSource;
begin

end;

function Controller.Salvar(pObj: TObject): string;
begin

end;

end.
