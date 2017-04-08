unit URelatorioPorPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, StdCtrls, ComCtrls, Buttons, DBXpress, DB, SqlExpr,
  DBClient, Provider, FMTBcd;

type
  TfrmRelatorioPeriodo = class(TForm)
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    lblInicio: TLabel;
    lblFim: TLabel;
    spdBtnPesquisar: TSpeedButton;
    dsRelatorio: TDataSource;
    sqlQryRelatorio: TSQLQuery;
    sqlQryValorTotal: TSQLQuery;
    sqlQryValorTotalVALOR_PERIODO: TFloatField;
    dsValorTotal: TDataSource;
    sqlQryRelatorioDIA: TDateField;
    sqlQryRelatorioTANQUE: TIntegerField;
    sqlQryRelatorioBOMBA: TIntegerField;
    sqlQryRelatorioVALOR_DIARIO: TFloatField;
    cdsRelatorio: TClientDataSet;
    dspRelatorio: TDataSetProvider;
    cdsRelatorioDIA: TDateField;
    cdsRelatorioTANQUE: TIntegerField;
    cdsRelatorioBOMBA: TIntegerField;
    cdsRelatorioVALOR_DIARIO: TFloatField;
    procedure spdBtnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioPeriodo: TfrmRelatorioPeriodo;

implementation

uses UDMPrincipal, RLConsts, URelatorio;

{$R *.dfm}

procedure TfrmRelatorioPeriodo.spdBtnPesquisarClick(Sender: TObject);
var
  dataInicio, dataFim: string;
begin
  // mostra os dados no relatorio
<<<<<<< HEAD
  if (frmRelatorio = nil) then
    frmRelatorio := TfrmRelatorio.Create(self);
  try
    try
      dataInicio := FormatDateTime('dd.mm.yyyy', dtpInicio.Date);
      dataFim := FormatDateTime('dd.mm.yyyy', dtpFim.Date);

      sqlQryRelatorio.ParamByName('DATA_INICIO').Value := dataInicio;
      sqlQryRelatorio.ParamByName('DATA_FIM').Value := dataFim;

      cdsRelatorio.Open;

      sqlQryValorTotal.ParamByName('DATA_INICIO').AsString := dataInicio;
      sqlQryValorTotal.ParamByName('DATA_FIM').AsString := dataFim;
      sqlQryValorTotal.Open;

      frmRelatorio.RLReport1.Preview();
    except
      ShowMessage('Erro ao exibir relatório');
    end;
=======
  frmRelatorio := TfrmRelatorio.Create(self);
  try
    dataInicio := FormatDateTime('dd.mm.yyyy', dtpInicio.Date);
    dataFim := FormatDateTime('dd.mm.yyyy', dtpFim.Date);

    sqlQryRelatorio.ParamByName('DATA_INICIO').Value := dataInicio;
    sqlQryRelatorio.ParamByName('DATA_FIM').Value := dataFim;

    cdsRelatorio.Open;

    sqlQryValorTotal.ParamByName('DATA_INICIO').AsString := dataInicio;
    sqlQryValorTotal.ParamByName('DATA_FIM').AsString := dataFim;
    sqlQryValorTotal.Open;

    frmRelatorio.RLReport1.Preview();
>>>>>>> 0dce214d261d9b75fc2e9581956d196c78fa662a
  finally
    sqlQryRelatorio.Close;
    cdsRelatorio.Close;
    sqlQryValorTotal.Close;
    FreeAndNil(frmRelatorio);
  end;
end;

procedure TfrmRelatorioPeriodo.FormCreate(Sender: TObject);
begin
  RLConsts.SetVersion(3, 72, 'B');
end;

end.
<<<<<<< HEAD
=======

>>>>>>> 0dce214d261d9b75fc2e9581956d196c78fa662a
