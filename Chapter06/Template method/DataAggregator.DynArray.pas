unit DataAggregator.DynArray;

interface

uses
  DataAggregator.Template;

type
  TArrayDataAggregator = class(TDataAggregatorTemplate)
  strict private
    FIndex: integer;
    FValues: TArray<integer>;
  protected
    procedure CloseDataSource; override;
    function GetNextValue(var value: integer): boolean; override;
    function OpenDataSource: boolean; override;
  public
    constructor Create(const values: TArray<integer>);
  end;

implementation

{ TArrayDataAggregator }

constructor TArrayDataAggregator.Create(const values: TArray<integer>);
begin
  inherited Create;
  FValues := values;
end;

procedure TArrayDataAggregator.CloseDataSource;
begin
end;

function TArrayDataAggregator.GetNextValue(var value: integer): boolean;
begin
  Result := (FIndex <= High(FValues));
  if Result then
  begin
    value := FValues[FIndex];
    Inc(FIndex);
  end;
end;

function TArrayDataAggregator.OpenDataSource: boolean;
begin
  FIndex := 0;
  Result := true;
end;

end.
