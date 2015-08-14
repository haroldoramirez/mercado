unit uDaoPais;

interface
    uses uDao, DB, SysUtils, Messages, uPais;

    type DaoPais = class(Dao)

    protected
        umPais : Pais;
    public
        constructor crieObj;
        destructor destrua_se;
        function Salvar(pObj: TObject): string;      override;
        function GetDS : TDataSource;                override;
        function Carrega(pObj: TObject): TObject;    override;
        function Buscar(pObj : TObject) : Boolean;   override;
        function Excluir(pObj : TObject) : string;   override;
        procedure atualizaGrid;
        procedure ordena(campo: String);
    end;

implementation

{ DaoPais }

constructor DaoPais.crieObj;
begin
    inherited;
end;

destructor DaoPais.destrua_se;
begin
    inherited;
end;

procedure DaoPais.atualizaGrid;

begin
    with umDM do
      begin
        DQPais.Close;
        DQPais.sql.Text := 'select * from pais order by nome';
        DQPais.Open();
      end;
end;

function DaoPais.GetDS: TDataSource;
begin
    umDM.DQPais.FieldByName('nome').DisplayWidth := 50;
    umDM.DQPais.FieldByName('datacadastro').DisplayWidth := 7;
    umDM.DQPais.FieldByName('dataalteracao').DisplayWidth := 7;
    Self.AtualizaGrid;
    Result := umDM.DSPais;
end;

function DaoPais.Buscar(pObj: TObject): Boolean;

var
    prim: Boolean;
    sql, e, onde: string;
    umPais: Pais;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umPais := Pais(pObj);
    sql := 'select * from pais';
    if umPais.getNome <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' nome like '+quotedstr('%'+umPais.getNome+'%');
    end;
    with umDM do
    begin
        DQPais.Close;
        DQPais.sql.Text := sql+' order by nome';
        DQPais.Open;
        if DQPais.RecordCount > 0 then
          result := True
        else
          result := false;
    end;

end;

procedure DaoPais.ordena(campo: String);
begin
  umDM.DQPais.IndexFieldNames := campo;
end;

function DaoPais.Carrega(pObj: TObject): TObject;
var
    umPais: Pais;
begin
    umPais := Pais(pObj);
    with umDM do
    begin
        if not DQPais.Active then
            DQPais.Open;

        if umPais.getId <> 0 then
          begin
            DQPais.Close;
            DQPais.SQL.Text := 'select * from pais where idpais = '+IntToStr(umPais.getId);
            DQPais.Open;
          end;

        umPais.setId(DQPaisidPais.AsInteger);
        umPais.setNome(DQPaisnome.AsString);
        umPais.setDdi(DQPaisddi.AsString);
        umPais.setDataCadastro(DQPaisdatacadastro.AsDateTime);
        umPais.setDataAlteracao(DQPaisdataalteracao.AsDateTime);
    end;
    result := umPais;
    Self.AtualizaGrid;
end;

//verificar
function DaoPais.Excluir(pObj: TObject): string;
var
    umPais: Pais;
begin
    umPais := Pais(pObj);
    with umDM do
    begin
        try
          beginTrans;
          //DQPais.SQL := UpdatePais.DeleteSQL;
          DQPais.Params.ParamByName('OLD_idpais').Value := umPais.getId;
          DQPais.ExecSQL;
          Commit;
          Result := 'País excluído com sucesso!';
        except
            on e:Exception do
            begin
              rollback;
              if pos('chave estrangeira',e.Message)>0 then
                Result := 'Ocorreu um erro! O País não pode ser excluído pois ja está sendo usado pelo sistema.'
              else
                Result := 'Ocorreu um erro! País não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

//verificar
function DaoPais.Salvar(pObj: TObject): string;
var
    umPais : Pais;
begin
    umPais := Pais(pObj);
    with umDM do
    begin
        try
            beginTrans;
            DQPais.Close;
            if umPais.getId = 0 then
            begin
                if(Self.Buscar(umPais)) then
                begin
                  Result := 'Esse País já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                //DQPais.SQL := UpdatePais.InsertSQL
            end
            else
            begin
                if(not Self.Buscar(umPais)) then
                begin
                  Result := 'Esse País já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end
                else
                begin
                  //DQPais.SQL := UpdatePais.ModifySQL;
                  DQPais.Params.ParamByName('OLD_idpais').Value := umPais.getId;
                end;
            end;

            DQPais.Params.ParamByName('nome').Value := umPais.getNome;
            DQPais.Params.ParamByName('ddi').Value := umPais.getDdi;
            DQPais.Params.ParamByName('datacadastro').Value := now;
            DQPais.Params.ParamByName('dataalteracao').Value := now;

            DQPais.ExecSQL;

            Commit;

            Result := 'País salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;

              Result := 'Ocorreu um erro! País não foi salvo. Erro: '+e.Message;
          end;
        end;
    end;

    Self.AtualizaGrid;
end;

end.
