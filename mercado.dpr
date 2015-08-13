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
  uFornecedor in 'models\uFornecedor.pas',
  uAplicacao in 'uAplicacao.pas',
  uInter in 'uInter.pas',
  uCadastroPai in 'forms\uCadastroPai.pas' {CadastroPai},
  uConsultaPai in 'forms\uConsultaPai.pas' {ConsultaPai},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFrmConsultaPais in 'forms\uFrmConsultaPais.pas' {ConsultaPais},
  uFrmConsultaEstado in 'forms\uFrmConsultaEstado.pas' {ConsultaEstado},
  uFrmConsultaCidade in 'forms\uFrmConsultaCidade.pas' {ConsultaCidade},
  uFrmConsultaCliente in 'forms\uFrmConsultaCliente.pas' {ConsultaCliente},
  uControllerPais in 'controllers\uControllerPais.pas',
  uDaoPais in 'dao\uDaoPais.pas',
  uSingleton in 'uSingleton.pas',
  uFrmCadastroPais in 'forms\uFrmCadastroPais.pas' {FrmCadastroPais};

{$R *.res}

var
  umaAplicacao : Aplicacao;

begin
    umaAplicacao := Aplicacao.crieObj;
    umaAplicacao.execute_se;
    umaAplicacao.destrua_se;
end.
