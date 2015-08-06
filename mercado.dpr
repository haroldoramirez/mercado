program mercado;

uses
  Vcl.Forms,
  uGerente in 'uGerente.pas' {Gerente},
  uGenerico in 'uGenerico.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGerente, Gerente);
  Application.Run;
end.
