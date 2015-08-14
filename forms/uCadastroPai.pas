unit uCadastroPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TCadastroPai = class(TForm)
    lbl_Codigo: TLabel;
    edt_Codigo: TEdit;
    btn_Salvar: TButton;
    btn_Sair: TButton;
    dataStatus: TStatusBar;
    lbl_Obrigatorio: TLabel;
    procedure btn_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroPai: TCadastroPai;

implementation

{$R *.dfm}

procedure TCadastroPai.btn_SairClick(Sender: TObject);
begin
    close;
end;

end.
