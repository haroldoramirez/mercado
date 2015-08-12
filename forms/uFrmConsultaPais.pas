unit uFrmConsultaPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls,
  uPais;

type
  TConsultaPais = class(TConsultaPai)
  private
    { Private declarations }
    umPais : Pais;
  public
    { Public declarations }
    procedure conhecaObj(pObj: TObject);
  end;

var
  ConsultaPais: TConsultaPais;

implementation

{$R *.dfm}

{ TConsultaPais }

procedure TConsultaPais.conhecaObj(pObj: TObject);
begin
    umPais := Pais(pObj);
end;

end.
