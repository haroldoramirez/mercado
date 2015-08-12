unit uFrmConsultaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls,
  uCliente;

type
  TConsultaCliente = class(TConsultaPai)
  private
    { Private declarations }
    umCliente : Cliente;
  public
    { Public declarations }
    procedure conhecaObj(pObj: TObject);
  end;

var
  ConsultaCliente: TConsultaCliente;

implementation

{$R *.dfm}

{ TConsultaCliente }

procedure TConsultaCliente.conhecaObj(pObj: TObject);
begin
    umCliente := Cliente(pObj);
end;

end.
