unit uFrmConsultaCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls,
  uCidade;

type
  TConsultaCidade = class(TConsultaPai)
  private
    { Private declarations }
    umaCidade : Cidade;
  public
    { Public declarations }
    procedure conhecaObj(pObj: TObject);
  end;

var
  ConsultaCidade: TConsultaCidade;

implementation

{$R *.dfm}

{ TConsultaCidade }

procedure TConsultaCidade.conhecaObj(pObj: TObject);
begin
    umaCidade := Cidade(pObj);
end;

end.
