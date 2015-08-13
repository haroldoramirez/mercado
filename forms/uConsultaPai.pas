unit uConsultaPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TConsultaPai = class(TForm)
    edt_Pesquisar: TEdit;
    btn_Pesquisar: TButton;
    gridConsulta: TDBGrid;
    btn_Novo: TButton;
    btn_Alterar: TButton;
    btn_Excluir: TButton;
    btn_Sair: TButton;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Novo; virtual;
    procedure Alterar; virtual;
    procedure Excluir; virtual;
    procedure Sair; virtual;
    procedure Pesquisar; virtual;
    procedure setCadastro(pObj: TObject); virtual;
    procedure conhecaObj(pObj: TObject; pCtrl: TObject); virtual;
  end;

var
  ConsultaPai: TConsultaPai;

implementation

{$R *.dfm}

procedure TConsultaPai.Alterar;
begin

end;

procedure TConsultaPai.btn_AlterarClick(Sender: TObject);
begin
    Alterar;
end;

procedure TConsultaPai.btn_ExcluirClick(Sender: TObject);
begin
    Excluir;
end;

procedure TConsultaPai.btn_NovoClick(Sender: TObject);
begin
    Novo;
end;

procedure TConsultaPai.btn_PesquisarClick(Sender: TObject);
begin
    Pesquisar;
end;

procedure TConsultaPai.btn_SairClick(Sender: TObject);
begin
    Sair;
end;

procedure TConsultaPai.conhecaObj(pObj, pCtrl: TObject);
begin

end;

procedure TConsultaPai.Excluir;
begin

end;

procedure TConsultaPai.Novo;
begin

end;

procedure TConsultaPai.pesquisar;
begin

end;

procedure TConsultaPai.Sair;
begin
    close;
end;

procedure TConsultaPai.setCadastro(pObj: TObject);
begin

end;

end.
