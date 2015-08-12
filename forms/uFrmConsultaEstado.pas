unit uFrmConsultaEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls,
  uEstado;

type
  TConsultaEstado = class(TConsultaPai)
  private
    { Private declarations }
    umEstado : Estado;
  public
    { Public declarations }
    procedure conhecaObj(pObj: TObject);
  end;

var
  ConsultaEstado: TConsultaEstado;

implementation

{$R *.dfm}

{ TConsultaEstado }

procedure TConsultaEstado.conhecaObj(pObj: TObject);
begin
    umEstado := Estado(pObj);
end;

end.
