unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, Data.DB, FireDAC.Comp.Client, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, Data.FMTBcd, Data.SqlExpr, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Mercado: TFDConnection;
    FDTransaction: TFDTransaction;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysPgDriverLink: TFDPhysPgDriverLink;
    DSPais: TDataSource;
    DQPais: TFDQuery;
    DSEstado: TDataSource;
    DQEstado: TFDQuery;
    DSCidade: TDataSource;
    DQCidade: TFDQuery;
    DQPaisidPais: TIntegerField;
    DQPaisnome: TWideStringField;
    DQPaisddi: TWideStringField;
    DQPaisdatacadastro: TDateField;
    DQPaisdataalteracao: TDateField;
    DQEstadoidEstado: TIntegerField;
    DQEstadonome: TWideStringField;
    DQEstadouf: TWideStringField;
    DQEstadocodPais: TIntegerField;
    DQEstadodatacadastro: TDateField;
    DQEstadodataalteracao: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

end.
