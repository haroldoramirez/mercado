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

procedure TConsultaPais.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umPais.getId <> 0 then
    umPais.crieObj;
  umFrmCadastroPais.btn_Salvar.Caption := 'Salvar';
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
    MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    paisBusca.destrua_se;
    edt_Pesquisar.Clear;
end;

procedure TConsultaPais.conhecaObj(pObj: TObject);
begin
    umPais := Pais(pObj);
    umaControllerPais := ControllerPais.crieObj;
    self.gridConsulta.DataSource := umaControllerPais.GetDS;
    umFrmCadastroPais := TFrmCadastroPais.Create(nil);
end;

end.
