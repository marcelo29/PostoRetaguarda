program PostoRetaguarda;

uses
  Forms,
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmMenuPrincipal},
  UAbastecimento in 'UAbastecimento.pas' {frmAbastecimento},
  UDMPrincipal in 'UDMPrincipal.pas' {dmPrincipal: TDataModule},
  URelatorioPorPeriodo in 'URelatorioPorPeriodo.pas' {frmRelatorioPeriodo},
  URelatorio in 'URelatorio.pas' {frmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
