unit DataAggregatorIoC;

interface

uses
  DataSource.Intf;

function CalculateAverage(const dataSource: IDataSource): real;

implementation

uses
  System.SysUtils;

function CalculateAverage(const dataSource: IDataSource): real;
var
  sum: integer;
  total: integer;
  value: integer;
begin
  if not dataSource.OpenDataSource then
    raise Exception.Create('Failed!');
  try
    total := 0;
    sum := 0;
    while dataSource.GetNextValue(value) do
    begin
      Inc(total);
      Inc(sum, value);
    end;
    if total = 0 then
      raise Exception.Create('Cannot calculate average of empty data set!');
    Result := sum/total;
  finally
    dataSource.CloseDataSource;
  end;
end;

end.
