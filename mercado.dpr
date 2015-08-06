program mercado;

uses
  Vcl.Forms,
  uGerente in 'forms\uGerente.pas' {Gerente},
  uGenerico in 'models\uGenerico.pas',
  uDao in 'dao\uDao.pas',
  uController in 'controllers\uController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '';
  Application.CreateForm(TGerente, Gerente);
  Application.Run;
end.
