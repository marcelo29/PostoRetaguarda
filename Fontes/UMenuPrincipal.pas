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
<<<<<<< HEAD
    procedure FormCreate(Sender: TObject); private
=======
    procedure FormCreate(Sender: TObject);  private
>>>>>>> 0dce214d261d9b75fc2e9581956d196c78fa662a
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
<<<<<<< HEAD
  if (frmAbastecimento = nil) then
    frmAbastecimento := TfrmAbastecimento.Create(Self);
=======
  frmAbastecimento := TfrmAbastecimento.Create(Self);
>>>>>>> 0dce214d261d9b75fc2e9581956d196c78fa662a
  try
    frmAbastecimento.ShowModal;
  finally
    FreeAndNil(frmAbastecimento);
  end;
end;

procedure TfrmMenuPrincipal.Relatorio1Click(Sender: TObject);
begin
<<<<<<< HEAD
  if (frmRelatorioPeriodo = nil) then
    frmRelatorioPeriodo := TfrmRelatorioPeriodo.Create(Self);
=======
  frmRelatorioPeriodo := TfrmRelatorioPeriodo.Create(Self);
>>>>>>> 0dce214d261d9b75fc2e9581956d196c78fa662a
  try
    frmRelatorioPeriodo.ShowModal;
  finally
    FreeAndNil(frmRelatorioPeriodo);
  end;
end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
begin
<<<<<<< HEAD
  RLConsts.SetVersion(3, 72, 'B');
end;

end.

=======
  RLConsts.SetVersion(3,72,'B');
end;

end.
>>>>>>> 0dce214d261d9b75fc2e9581956d196c78fa662a
