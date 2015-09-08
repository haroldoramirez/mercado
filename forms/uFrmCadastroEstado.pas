unit uFrmCadastroEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uEstado, uControllerEstado;

type
  TFrmCadastroEstado = class(TCadastroPai)
    lbl_Nome: TLabel;
    edt_Nome: TEdit;
    lbl_Uf: TLabel;
    edt_Uf: TEdit;
    lbl_Pais: TLabel;
    edt_Pais: TEdit;
    Consultar: TButton;
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    umEstado: Estado;
    umaControllerEstado: ControllerEstado;
  public
    { Public declarations }
    procedure conhecaObj(pEstado: Estado; pControllerEstado: ControllerEstado);
    procedure habilitaCampos;
    procedure limpaCampos;
    procedure carregaObj;
  end;

var
  FrmCadastroEstado: TFrmCadastroEstado;

implementation

{$R *.dfm}

{ TFrmCadastroEstado }

procedure TFrmCadastroEstado.btn_SalvarClick(Sender: TObject);
var
  msg : String;
  botaoSelecionado : Integer;
begin
  inherited;
  if edt_Nome.Text = '' then
    begin
      showmessage('O campo nome não pode estar em branco!');
      edt_Nome.SetFocus;
    end
  else
  if edt_Pais.Text = '' then
    begin
      showmessage('O campo País não pode estar em branco!');
      edt_Pais.SetFocus;
    end
  else
  if self.btn_Salvar.Caption = '&Salvar' then
    begin
      umEstado.setNome(edt_Nome.Text);
      umEstado.setUf(edt_Uf.Text);
      self.edt_Nome.Enabled := false;
      self.edt_Uf.Enabled := false;
      self.btn_Salvar.Enabled := false;
      self.btn_Sair.Enabled := false;
      self.Close;
      showMessage(umaControllerEstado.Salvar(umEstado));
    end
    else
    begin
      botaoSelecionado:= MessageDlg('ATENÇÃO! Deseja realmente excluir o Estado "' + umEstado.getNome + '"',mtWarning, mbOKCancel, 0);
      if botaoSelecionado = mrOK then
      begin
        self.Close;
        showMessage(umaControllerEstado.Excluir(umEstado));
      end;
    end;
end;

procedure TFrmCadastroEstado.carregaObj;
begin

end;

procedure TFrmCadastroEstado.conhecaObj(pEstado: Estado;
  pControllerEstado: ControllerEstado);
begin
    umEstado := pEstado;
    umaControllerEstado := pControllerEstado;

    self.habilitaCampos;
    self.limpaCampos;
end;

procedure TFrmCadastroEstado.habilitaCampos;
begin

end;

procedure TFrmCadastroEstado.limpaCampos;
begin

end;

end.
