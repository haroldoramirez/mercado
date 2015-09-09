unit uFrmConsultaEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls,
  uEstado, uControllerEstado, uFrmCadastroEstado;

type
  TConsultaEstado = class(TConsultaPai)
    procedure btn_SairClick(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
  private
    { Private declarations }
    umEstado : Estado;
    umaControllerEstado: ControllerEstado;
    umFrmCadastroEstado: TFrmCadastroEstado;
  public
    { Public declarations }
    procedure conhecaObj(pObj: TObject);
  end;

var
  ConsultaEstado: TConsultaEstado;

implementation

{$R *.dfm}

{ TConsultaEstado }

procedure TConsultaEstado.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  umEstado.setId(0);
  umEstado := Estado(umaControllerEstado.Carrega(umEstado));

  if (umEstado.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadastroEstado.conhecaObj(umEstado, umaControllerEstado);
    umFrmCadastroEstado.btn_Salvar.Caption := '&Salvar';
    umFrmCadastroEstado.btn_Salvar.Enabled := true;
    umFrmCadastroEstado.btn_Sair.Enabled := true;
    umFrmCadastroEstado.carregaObj;
    umFrmCadastroEstado.ShowModal;
  end;
end;

procedure TConsultaEstado.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umEstado.getId <> 0 then
    umEstado.crieObj;

  umFrmCadastroEstado.btn_Salvar.Enabled := True;
  umFrmCadastroEstado.btn_Sair.Enabled := True;
  umFrmCadastroEstado.btn_Salvar.Caption := '&Salvar';
  umFrmCadastroEstado.conhecaObj(umEstado, umaControllerEstado);

  umFrmCadastroEstado.ShowModal;
end;

procedure TConsultaEstado.btn_PesquisarClick(Sender: TObject);
var
  estadoBusca : Estado;
begin
  inherited;
  estadoBusca := Estado.crieObj;
  estadoBusca.setNome(edt_Pesquisar.Text);

  if not umaControllerEstado.Buscar(estadoBusca) then
  begin
    MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    self.gridConsulta.DataSource := umaControllerEstado.GetDS;
  end;

  estadoBusca.destrua_se;
  edt_Pesquisar.Clear;
end;

procedure TConsultaEstado.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = '&Selecionar' then
    begin
      umEstado.setId(0);
      umaControllerEstado.Carrega(umEstado);
    end;
  self.Close;
end;

procedure TConsultaEstado.conhecaObj(pObj: TObject);
begin
    umEstado := Estado(pObj);
    umaControllerEstado := ControllerEstado.crieObj;
    self.gridConsulta.DataSource := umaControllerEstado.GetDS;
    self.edt_Pesquisar.Text := '';
    umFrmCadastroEstado := TFrmCadastroEstado.Create(nil);
end;

end.
