unit DataSource.DynArray;

interface

uses
  System.Classes,
  DataSource.Intf;

type
  TArrayDataSource = class(TInterfacedObject, IDataSource)
  strict private
    FIndex: integer;
    FValues: TArray<integer>;
  public
    constructor Create(const values: TArray<integer>);
    procedure CloseDataSource;
    function GetNextValue(var value: integer): boolean;
    function OpenDataSource: boolean;
  end;

implementation

{ TArrayDataSource }

constructor TArrayDataSource.Create(const values: TArray<integer>);
begin
  inherited Create;
  FValues := values;
end;

procedure TArrayDataSource.CloseDataSource;
begin
end;

function TArrayDataSource.GetNextValue(var value: integer): boolean;
begin
  Result := (FIndex <= High(FValues));
  if Result then
  begin
    value := FValues[FIndex];
    Inc(FIndex);
  end;
end;

function TArrayDataSource.OpenDataSource: boolean;
begin
  FIndex := 0;
  Result := true;
end;

end.
