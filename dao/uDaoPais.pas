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
    Self.AtualizaGrid;
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

      msg := 'O País ' + umPais.getNome + ' Foi Excluido com sucesso!';

    except
    on e: Exception do
      begin
        umDM.FDTransaction.RollbackRetaining;
        msg := 'Nao foi possivel excluir o Pais "' + umPais.getNome + '" Erro: '+e.Message;
      end;
    end;
    Self.AtualizaGrid;
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
            Result := 'País "'+umPais.getNome+'" já esta cadastrado no sistema!';
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

      msg := 'O Pais "' + umPais.getNome + '" foi salvo com sucesso!';
    except
    on e: Exception do
      begin
        umDM.FDTransaction.Rollback;
        msg := 'Nao foi possivel salvar o Pais ' + umPais.getNome + 'Erro: '+e.Message;
      end;
    end;
    Self.AtualizaGrid;
    Result := msg;
end;
end.
