unit uFrmCadastroEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uEstado, uControllerEstado, uFrmConsultaPais, uValidacao;

type
  TFrmCadastroEstado = class(TCadastroPai)
    lbl_Nome: TLabel;
    edt_Nome: TEdit;
    lbl_Uf: TLabel;
    edt_Uf: TEdit;
    lbl_Pais: TLabel;
    edt_Pais: TEdit;
    btn_Consultar: TButton;
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private
    { Private declarations }
    umEstado: Estado;
    umaControllerEstado: ControllerEstado;
    umFrmConsultaPais: TConsultaPais;
    umaValidacao : Validacao;
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

procedure TFrmCadastroEstado.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.habilitaCampos;
  umaValidacao.destrua_se;
end;

procedure TFrmCadastroEstado.btn_SalvarClick(Sender: TObject);
var
  msg : String;
  botaoSelecionado : Integer;
begin
  inherited;
  if edt_Nome.Text = '' then
    begin
      showMessage('O campo nome não pode estar em branco!');
      edt_Nome.SetFocus;
    end
  else
    if ((not umaValidacao.validarUF(edt_UF.Text) and (edt_Pais.Text = 'Brasil') OR (edt_Pais.Text = 'Brazil'))) then
  begin
    ShowMessage('UF do estado inválida!');
    edt_Uf.SetFocus;
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
      umEstado.getUmPais.setNome(edt_Pais.Text);
      self.edt_Nome.Enabled := false;
      self.edt_Uf.Enabled := false;
      self.edt_Pais.Enabled := false;
      self.btn_Salvar.Enabled := false;
      self.btn_Sair.Enabled := false;
      self.btn_Consultar.Enabled := false;
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
    self.edt_Codigo.Text := inttostr(umEstado.getId);
    self.edt_Nome.Text := umEstado.getNome;
    self.edt_Pais.Text := umEstado.getUmPais.getNome;
    self.dataStatus.Panels[0].Text := 'Data de Cadastro: '+datetoStr(umEstado.getDataCadastro);
    self.dataStatus.Panels[1].Text := 'Data de Alteração: '+datetoStr(umEstado.getDataAlteracao);
end;

procedure TFrmCadastroEstado.conhecaObj(pEstado: Estado;
  pControllerEstado: ControllerEstado);
begin
    umEstado := pEstado;
    umaControllerEstado := pControllerEstado;

    umaValidacao := Validacao.crieObj;

    self.habilitaCampos;
    self.limpaCampos;
end;

procedure TFrmCadastroEstado.btn_ConsultarClick(Sender: TObject);
begin
  inherited;
  umFrmConsultaPais := TConsultaPais.Create(nil);
  umFrmConsultaPais.conhecaObj(umEstado.getUmPais);
  umFrmConsultaPais.btn_Sair.Caption := 'S&elecionar';
  umFrmConsultaPais.ShowModal;
  self.edt_Pais.Text := umEstado.getUmPais.getNome;
end;

procedure TFrmCadastroEstado.habilitaCampos;
begin
    self.edt_Nome.Enabled := true;
    self.edt_Uf.Enabled := true;
    self.edt_Pais.Enabled := true;
    self.btn_Consultar.Enabled := true;
end;

procedure TFrmCadastroEstado.limpaCampos;
begin
    self.edt_Nome.Clear;
    self.edt_Uf.Clear;
    self.edt_Pais.Clear;
end;

end.
