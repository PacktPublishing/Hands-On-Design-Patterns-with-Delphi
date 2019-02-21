unit DataProcessing.InjectedParam;

interface

uses
  DataProcessing.Reader,
  DataProcessing.Writer;

type
  TDataProcessor = class
  public
    procedure ProcessData(AReader: TReader; AWriter: TWriter);
  end;

implementation

uses
  System.SysUtils;

procedure TDataProcessor.ProcessData(AReader: TReader; AWriter: TWriter);
var
  count: integer;
  sum  : int64;
  value: integer;
begin
  sum := 0;
  count := 0;
  while AReader.GetNext(value) do begin
    Inc(sum, value);
    Inc(count);
  end;
  AWriter.WriteOut(count, sum, sum/count);
end;

end.

