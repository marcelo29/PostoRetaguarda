unit UMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UAbastecimento, ComCtrls;

type
  TfrmMenuPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Relatorio1: TMenuItem;
    Abastecer1: TMenuItem;
    procedure Abastecer1Click(Sender: TObject);
    procedure Relatorio1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

uses DateUtils, URelatorioPorPeriodo, RLConsts;

{$R *.dfm}

procedure TfrmMenuPrincipal.Abastecer1Click(Sender: TObject);
begin
  if (frmAbastecimento = nil) then
    frmAbastecimento := TfrmAbastecimento.Create(Self);
  try
    frmAbastecimento.ShowModal;
  finally
    FreeAndNil(frmAbastecimento);
  end;
end;

procedure TfrmMenuPrincipal.Relatorio1Click(Sender: TObject);
begin
  if (frmRelatorioPeriodo = nil) then
    frmRelatorioPeriodo := TfrmRelatorioPeriodo.Create(Self);
  try
    frmRelatorioPeriodo.ShowModal;
  finally
    FreeAndNil(frmRelatorioPeriodo);
  end;
end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
begin
  RLConsts.SetVersion(3, 72, 'B');
end;

end.
