program mercado;

uses
  Vcl.Forms,
  uGerente in 'forms\uGerente.pas' {Gerente},
  uGenerico in 'models\uGenerico.pas',
  uDao in 'dao\uDao.pas',
  uController in 'controllers\uController.pas',
  uFormaPagamento in 'models\uFormaPagamento.pas',
  uParcelas in 'models\uParcelas.pas',
  uCondicaoPagamento in 'models\uCondicaoPagamento.pas',
  uPais in 'models\uPais.pas',
  uEstado in 'models\uEstado.pas',
  uCidade in 'models\uCidade.pas',
  uEndereco in 'models\uEndereco.pas',
  uPessoa in 'models\uPessoa.pas',
  uCategoria in 'models\uCategoria.pas',
  uUnidade in 'models\uUnidade.pas',
  uMarca in 'models\uMarca.pas',
  uProduto in 'models\uProduto.pas',
  uCliente in 'models\uCliente.pas',
  uFornecedor in 'models\uFornecedor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '';
  Application.CreateForm(TGerente, Gerente);
  Application.Run;
end.
