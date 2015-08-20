unit uFrmConsultaPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls,
  uPais, uControllerPais, uFrmCadastroPais;

type
  TConsultaPais = class(TConsultaPai)
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private
    { Private declarations }
    umPais : Pais;
    umaControllerPais : ControllerPais;
    umFrmCadastroPais : TFrmCadastroPais;
  public
    { Public declarations }
    procedure conhecaObj(pObj: TObject);
  end;

var
  ConsultaPais: TConsultaPais;

implementation

{$R *.dfm}

{ TConsultaPais }

procedure TConsultaPais.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  umPais.setId(0);
  umPais := Pais(umaControllerPais.Carrega(umPais));

  if (umPais.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadastroPais.conhecaObj(umPais, umaControllerPais);
    umFrmCadastroPais.btn_Salvar.Caption := '&Salvar';
    umFrmCadastroPais.btn_Salvar.Enabled := true;
    umFrmCadastroPais.btn_Sair.Enabled := true;
    umFrmCadastroPais.carregaObj;
    umFrmCadastroPais.ShowModal;
  end;
end;

procedure TConsultaPais.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umPais.setId(0);
  umaControllerPais.Carrega(umPais);

  if (umPais.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadastroPais.conhecaObj(umPais, umaControllerPais);
    umFrmCadastroPais.btn_Salvar.Caption := '&Excluir';
    umFrmCadastroPais.carregaObj;
    umFrmCadastroPais.edt_Nome.Enabled := false;
    umFrmCadastroPais.edt_Ddi.Enabled := false;
    umFrmCadastroPais.btn_Salvar.Enabled := true;
    umFrmCadastroPais.btn_Sair.Enabled := true;
    umFrmCadastroPais.ShowModal;
  end;
end;

procedure TConsultaPais.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umPais.getId <> 0 then
    umPais.crieObj;

  umFrmCadastroPais.btn_Salvar.Enabled := True;
  umFrmCadastroPais.btn_Sair.Enabled := True;
  umFrmCadastroPais.btn_Salvar.Caption := '&Salvar';
  umFrmCadastroPais.conhecaObj(umPais, umaControllerPais);

  umFrmCadastroPais.ShowModal;
end;

procedure TConsultaPais.btn_PesquisarClick(Sender: TObject);
var
  paisBusca : Pais;
begin
  inherited;
  paisBusca := Pais.crieObj;
  paisBusca.setNome(edt_Pesquisar.Text);
  if not umaControllerPais.Buscar(paisBusca) then
  begin
    MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    self.gridConsulta.DataSource := umaControllerPais.GetDS;
  end;

  paisBusca.destrua_se;
  edt_Pesquisar.Clear;
end;

procedure TConsultaPais.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = '&Selecionar' then
    begin
      umPais.setId(0);
      umaControllerPais.Carrega(umPais);
    end;
  self.Close;
end;

procedure TConsultaPais.conhecaObj(pObj: TObject);
begin
  umPais := Pais(pObj);
  umaControllerPais := ControllerPais.crieObj;
  self.gridConsulta.DataSource := umaControllerPais.GetDS;
  self.edt_Pesquisar.Text := '';
  umFrmCadastroPais := TFrmCadastroPais.Create(nil);
end;

end.
