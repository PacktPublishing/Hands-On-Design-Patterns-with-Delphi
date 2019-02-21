unit DataAggregator.Template;

interface

type
  TDataAggregatorTemplate = class
  protected
    procedure CloseDataSource; virtual; abstract;
    function GetNextValue(var value: integer): boolean; virtual; abstract;
    function OpenDataSource: boolean; virtual; abstract;
  public
    function CalculateAverage: real;
  end;

implementation

uses
  System.SysUtils;

{ TDataAggregatorTemplate }

function TDataAggregatorTemplate.CalculateAverage: real;
var
  sum: integer;
  total: integer;
  value: integer;
begin
  if not OpenDataSource then
    raise Exception.Create('Failed!');
  try
    total := 0;
    sum := 0;
    while GetNextValue(value) do
    begin
      Inc(total);
      Inc(sum, value);
    end;
    if total = 0 then
      raise Exception.Create('Cannot calculate average of empty data set!');
    Result := sum/total;
  finally
    CloseDataSource;
  end;
end;

end.
