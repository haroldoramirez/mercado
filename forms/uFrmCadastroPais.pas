unit uFrmCadastroPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uPais, uControllerPais;

type
  TFrmCadastroPais = class(TCadastroPai)
    lbl_Nome: TLabel;
    edt_Nome: TEdit;
    edt_DataCadastro: TEdit;
    edt_DataAlteracao: TEdit;
    lbl_DataCadastro: TLabel;
    lbl_DataAlteracao: TLabel;
    edt_Ddi: TEdit;
    lbl_Ddi: TLabel;
    procedure btn_SairClick(Sender: TObject);
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

procedure TFrmCadastroPais.carregaObj;
begin

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

end;

end.
