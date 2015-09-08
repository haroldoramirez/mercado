unit uDaoEstado;

interface
  uses  uDao, DB, SysUtils, Messages, uEstado, uDaoPais;

  type DaoEstado = class(Dao)

  protected
    umEstado : Estado;
    umaDaoPais : DaoPais;
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

{ DaoEstado }

procedure DaoEstado.atualizaGrid;
begin
    with umDM do
      begin
        DQEstado.Close;
        DQEstado.SQL.Text := 'select * from estado order by nome';
        DQEstado.Open();
      end;
end;

function DaoEstado.Buscar(pObj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umEstado: Estado;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umEstado := Estado(pObj);
    sql := 'select * from estado';
    if umEstado.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idestado = '+inttostr(umEstado.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umEstado.getNome <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' nome like '+quotedstr('%'+umEstado.getNome+'%');
    end;
    if umEstado.getUmPais.getId <> 0 then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' idpais = '+inttostr(umEstado.getUmPais.getId);
    end;
    with umDM do
    begin
        DQEstado.Close;
        DQEstado.sql.Text := sql+' order by nome';
        DQEstado.Open;
        if DQEstado.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

function DaoEstado.Carrega(pObj: TObject): TObject;
var
    umEstado: Estado;
begin
    umEstado := Estado(pObj);
    with umDM do
    begin
      if not DQEstado.Active then
          DQEstado.Open;

      if umEstado.getId <> 0 then
        begin
          DQEstado.Close;
          DQEstado.SQL.Text := 'select * from estado where idestado = '+IntToStr(umEstado.getId);
          DQEstado.Open;
        end;

        umEstado.setId(DQEstadoidEstado.AsInteger);
        umEstado.setNome(DQEstadonome.AsString);
        umEstado.setUf(DQEstadouf.AsString);
        umEstado.setDataCadastro(DQEstadodatacadastro.AsDateTime);
        umEstado.setDataAlteracao(DQPaisdataalteracao.AsDateTime);

        //Busca o país referente ao estado
        umEstado.getUmPais.setId(DQEstadocodPais.AsInteger);
        umaDaoPais.Carrega(umEstado.getUmPais);
    end;
    result := umEstado;
end;

constructor DaoEstado.crieObj;
begin
    inherited;
    umaDaoPais := DaoPais.crieObj;
end;

destructor DaoEstado.destrua_se;
begin
    inherited;
end;

function DaoEstado.Excluir(pObj: TObject): string;
var
  umEstado : Estado;
  msg : String;
begin
    umEstado := Estado(pObj);
    try
      if not umDM.FDTransaction.Active then
        umDM.FDTransaction.StartTransaction;

      if not umDM.DQEstado.Active then
        umDM.DQEstado.Open();

      umDM.DQEstado.Delete;

      umDM.FDTransaction.CommitRetaining;

      msg := 'O Estado ' + umEstado.getNome + ' foi excluido com sucesso!';

    except
    on e: Exception do
      begin
        umDM.FDTransaction.RollbackRetaining;
        if pos('chave estrangeira',e.Message)>0 then
          result := 'Ocorreu um erro! O Estado não pode ser excluído pois ja está sendo usado pelo sistema.'
        else
          msg := 'Nao foi possivel excluir o Estado "'+ umEstado.getNome +'" Erro: '+e.Message;
      end;
    end;
    Result := msg;
end;

function DaoEstado.GetDS: TDataSource;
begin
    Result := umDM.DSEstado;
    self.AtualizaGrid;
end;

procedure DaoEstado.ordena(campo: String);
begin
    umDM.DQEstado.IndexFieldNames := campo;
end;

function DaoEstado.Salvar(pObj: TObject): string;
var
  umEstado : Estado;
  msg : String;
begin
    umEstado := Estado(pObj);
    try
      if not umDM.FDTransaction.Active then
        umDM.FDTransaction.StartTransaction;

      if not umDM.DQEstado.Active then
        umDM.DQEstado.Open();

      if umEstado.getId = 0 then
        begin
        if (Self.Buscar(umEstado)) then
          begin
            Result := 'Estado "'+umEstado.getNome+'" já esta cadastrado no sistema!';
            Self.AtualizaGrid;
            Exit;
          end;

          umDM.DQEstado.Insert;
          umDM.DQEstadodatacadastro.Value := now;
        end
      else
        umDM.DQPais.Edit;

      umDM.DQEstadodataalteracao.Value := now;
      umDM.DQEstadonome.Value := umEstado.getNome;
      umDM.DQEstadouf.Value := umEstado.getUf;
      umDM.DQEstadocodPais.Value := umEstado.getUmPais.getId;

      umDM.DQPais.Post;
      umDM.FDTransaction.Commit;

      msg := 'O Estado "'+ umEstado.getNome +'" foi salvo com sucesso!';
    except
    on e: Exception do
      begin
        umDM.FDTransaction.Rollback;
        msg := 'Não foi possível salvar o Estado "'+ umEstado.getNome +'" Erro: '+e.Message;
      end;
    end;
    Result := msg;
    self.AtualizaGrid;
end;

end.
