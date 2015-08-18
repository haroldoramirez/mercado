unit uFrmCadastroPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uPais, uControllerPais, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrmCadastroPais = class(TCadastroPai)
    edt_Nome: TEdit;
    lbl_Nome: TLabel;
    edt_Ddi: TEdit;
    lbl_Ddi: TLabel;
    procedure btn_SairClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    umPais : Pais;
    umaControllerPais : ControllerPais;
  public
    { Public declarations }
    procedure conhecaObj(pPais: Pais; pControllerPais: ControllerPais);
    procedure habilitaCampos;
    procedure limpaCampos;
    procedure carregaObj;
  end;

var
  FrmCadastroPais: TFrmCadastroPais;

implementation

{$R *.dfm}

{ TFrmCadastroPais }

procedure TFrmCadastroPais.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.habilitaCampos;
end;

procedure TFrmCadastroPais.btn_SalvarClick(Sender: TObject);
var
  msg : String;
begin
  inherited;
  if edt_Nome.Text = '' then
    begin
      showmessage('O campo nome não pode estar em branco!');
      edt_Nome.SetFocus;
    end
  else
  if self.btn_Salvar.Caption = '&Salvar' then
    begin
      umPais.setNome(edt_Nome.Text);
      umPais.setDdi(edt_Ddi.Text);

      showMessage(umaControllerPais.Salvar(umPais));
    end
    else
    begin
      ShowMessage(umaControllerPais.Excluir(umPais));
      self.Close;
    end;
end;

procedure TFrmCadastroPais.carregaObj;
begin
    self.edt_Codigo.Text := inttostr(umPais.getId);
    self.edt_Nome.Text := umPais.getNome;
    self.edt_Ddi.Text := umPais.getDdi;
    self.dataStatus.Panels[0].Text := 'Data de Cadastro: '+datetoStr(umPais.getDataCadastro);
    self.dataStatus.Panels[1].Text := 'Data de Alteração: '+datetoStr(umPais.getDataAlteracao);
end;

procedure TFrmCadastroPais.conhecaObj(pPais: Pais;
  pControllerPais: ControllerPais);
begin
    umPais := pPais;
    umaControllerPais := pControllerPais;

    self.habilitaCampos;
    self.limpaCampos;
end;

procedure TFrmCadastroPais.habilitaCampos;
begin
    self.btn_Salvar.Caption := '&Salvar';
end;

procedure TFrmCadastroPais.limpaCampos;
begin
    self.edt_Nome.Clear;
    self.edt_Ddi.Clear;
    self.edt_Codigo.Clear;
end;

end.
