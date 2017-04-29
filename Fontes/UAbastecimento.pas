unit UAbastecimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, FMTBcd, DB, SqlExpr, UDMPrincipal, DBXpress,
  Buttons;

type
  TfrmAbastecimento = class(TForm)
    tanque: TLabel;
    Bomba: TLabel;
    Label3: TLabel;
    btnConfirmar: TButton;
    cbTanque: TComboBox;
    edtValor: TEdit;
    sqlQryBomba: TSQLQuery;
    sqlQryTanque: TSQLQuery;
    sqlQryTanqueID: TIntegerField;
    sqlDsAbastecimento: TSQLDataSet;
    cbBomba: TComboBox;
    btnCancelar: TButton;
    spBtnTanques: TSpeedButton;
    spBtnBombas: TSpeedButton;
    sqlQryBombaID_BOMBA: TIntegerField;
    sqlQryTanqueVALOR_DO_LITRO: TFloatField;
    procedure btnConfirmarClick(Sender: TObject);
    procedure limpaCampos();
    procedure btnCancelarClick(Sender: TObject);
    procedure spBtnTanquesClick(Sender: TObject);
    procedure spBtnBombasClick(Sender: TObject);
    procedure cbTanqueChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbastecimento: TfrmAbastecimento;
  Transacao: TTransactionDesc;

implementation

{$R *.dfm}

procedure TfrmAbastecimento.btnConfirmarClick(Sender: TObject);
var
  litros, valorAbastecido: Double;
  tanque, bomba: Integer;
const
  ID_DA_TRANSACAO = 1;
  VALOR_MINIMO = 1;
  TAXA = 0.13;
begin
  // insere os valores no banco e confirma
  valorAbastecido := StrToFloatDef(edtValor.Text, 0);
  tanque := StrToIntDef(cbTanque.Items[cbTanque.ItemIndex], 0);
  bomba := StrToIntDef(cbBomba.Items[cbBomba.ItemIndex], 0);

  if (tanque >= VALOR_MINIMO) and (bomba >= VALOR_MINIMO) and (valorAbastecido <> 0) then
  begin
    try
      Transacao.TransactionID := ID_DA_TRANSACAO;
      Transacao.IsolationLevel := xilREPEATABLEREAD;
      dmPrincipal.sqlConn.StartTransaction(Transacao);
      sqlDsAbastecimento.Close;
      sqlDsAbastecimento.ParamByName('ID_TANQUE').AsInteger := tanque;
      sqlDsAbastecimento.ParamByName('ID_BOMBA').AsInteger := bomba;
      sqlDsAbastecimento.ParamByName('VALOR_ABASTECIDO').AsFloat := valorAbastecido;
      sqlDsAbastecimento.ParamByName('IMPOSTO').AsFloat := valorAbastecido * TAXA;
      sqlDsAbastecimento.ParamByName('DIA').AsString := FormatDateTime('dd.mm.yyyy', now);
      try
        sqlQryTanque.Open;
        sqlQryTanque.First;
        while (sqlQryTanqueID.AsInteger <> 0) do
        begin
          if (sqlQryTanqueID.AsInteger = tanque) then
          begin
            litros := valorAbastecido / sqlQryTanqueVALOR_DO_LITRO.AsFloat;
            sqlDsAbastecimento.ParamByName('LITROS').AsFloat := litros;
            break;
          end;
          sqlQryTanque.Next;
        end;
      finally
        sqlQryTanque.Close;
      end;
      sqlDsAbastecimento.ExecSQL;
      dmPrincipal.sqlConn.Commit(Transacao);
      ShowMessage('Abastecimento realizado com sucesso!.');
      limpaCampos;
    except
      on Exc: Exception do
      begin
        ShowMessage('Erro ao confirmar abastecimento.' + Exc.Message);
        dmPrincipal.sqlConn.Rollback(Transacao);
      end;
    end;
  end
  else
    ShowMessage('Preencha todos os campos antes de confirmar o abastecimento.');
end;

procedure TfrmAbastecimento.limpaCampos;
begin
  cbTanque.Clear;
  cbBomba.Clear;
  edtValor.Clear;
end;

procedure TfrmAbastecimento.btnCancelarClick(Sender: TObject);
begin
  limpaCampos;
end;

procedure TfrmAbastecimento.spBtnTanquesClick(Sender: TObject);
begin
  // carrega tanques disponiveis
  cbTanque.Clear;
  try
    if (cbTanque.Items[0] = '') then
    begin
      sqlQryTanque.Open;
      try
        sqlQryTanque.First;
        while (sqlQryTanqueID.AsString <> '') do
        begin
          cbTanque.Items.Add(sqlQryTanqueID.AsString);
          sqlQryTanque.Next;
        end;
      except
        ShowMessage('Erro ao carregar os tanques.');
      end;
    end;
  finally
    sqlQryTanque.Close;
  end;
end;

procedure TfrmAbastecimento.spBtnBombasClick(Sender: TObject);
begin
  // carrega bombas desse tanque
  cbBomba.Items.Clear;
  try
    if (cbTanque.Items[cbTanque.ItemIndex] <> '') then
    begin
      sqlQryBomba.ParamByName('idTanque').AsString := cbTanque.Items[cbTanque.ItemIndex];
      sqlQryBomba.Open;
      try
        sqlQryBomba.First;
        while sqlQryBombaID_BOMBA.AsString <> '' do
        begin
          cbBomba.Items.Add(sqlQryBombaID_BOMBA.AsString);
          sqlQryBomba.Next;
        end;
      except
        ShowMessage('Erro ao carregar lista de bombas.');
      end;
    end
    else
      ShowMessage('Escolha o tanque que será utilizado, antes da bomba.');
  finally
    sqlQryBomba.Close;
  end;
end;

procedure TfrmAbastecimento.cbTanqueChange(Sender: TObject);
begin
  cbBomba.Clear;
end;

end.

