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
    Result := umDM.DSPais;
    self.AtualizaGrid;
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
    if umPais.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ � O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDI�OES
            sql := sql+e;
        sql := sql+' idPais = '+inttostr(umPais.getId); //COLOCA CONDI�AO NO SQL
    end;
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
          DQPais.SQL.Text := 'select * from pais where idPais = '+IntToStr(umPais.getId);
          DQPais.Open;
        end;

        umPais.setId(DQPaisidPais.AsInteger);
        umPais.setNome(DQPaisnome.AsString);
        umPais.setDdi(DQPaisddi.AsString);
        umPais.setDataCadastro(DQPaisdatacadastro.AsDateTime);
        umPais.setDataAlteracao(DQPaisdataalteracao.AsDateTime);
    end;
    result := umPais;
end;

function DaoPais.Excluir(pObj: TObject): string;
var
  umPais : Pais;
  msg : String;
begin
    umPais := Pais(pObj);
    try
      if not umDM.FDTransaction.Active then
        umDM.FDTransaction.StartTransaction;

      if not umDM.DQPais.Active then
        umDM.DQPais.Open();

      umDM.DQPais.Delete;

      umDM.FDTransaction.CommitRetaining;

      msg := 'O Pa�s "'+ umPais.getNome +'" foi excluido com sucesso!';

    except
    on e: Exception do
      begin
        umDM.FDTransaction.RollbackRetaining;
        if pos('foreign key',e.Message) > 0 then
          msg := 'Ocorreu um erro! O Pa�s n�o pode ser exclu�do pois ja est� sendo utilizado pelo sistema.'
        else
          msg := 'N�o foi possivel excluir o Pa�s "' + umPais.getNome + '" Erro: '+e.Message;
      end;
    end;
    Result := msg;
end;

function DaoPais.Salvar(pObj: TObject): string;
var
  umPais : Pais;
  msg : String;
begin
    umPais := Pais(pObj);
    try
      if not umDM.FDTransaction.Active then
        umDM.FDTransaction.StartTransaction;

      if not umDM.DQPais.Active then
        umDM.DQPais.Open();

      if umPais.getId = 0 then
        begin
        if (Self.Buscar(umPais)) then
          begin
            Result := 'Pa�s "'+umPais.getNome+'" j� esta cadastrado no sistema!';
            Self.AtualizaGrid;
            Exit;
          end;

          umDM.DQPais.Insert;
          umDM.DQPaisdatacadastro.Value := now;
        end
      else
        umDM.DQPais.Edit;

      umDM.DQPaisdataalteracao.Value := now;
      umDM.DQPaisnome.Value := umPais.getNome;
      umDM.DQPaisddi.Value := umPais.getDdi;

      umDM.DQPais.Post;
      umDM.FDTransaction.Commit;

      msg := 'O Pa�s "' + umPais.getNome + '" foi salvo com sucesso!';
    except
    on e: Exception do
      begin
        umDM.FDTransaction.Rollback;
        msg := 'N�o foi poss�vel salvar o Pais ' + umPais.getNome + 'Erro: '+e.Message;
      end;
    end;
    Result := msg;
    self.AtualizaGrid;
end;
end.
