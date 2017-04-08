unit UDMPrincipal;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr;

type
  TdmPrincipal = class(TDataModule)
    sqlConn: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{$R *.dfm}

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  sqlConn.Connected := true;
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  sqlConn.Connected := false;
end;

end.
