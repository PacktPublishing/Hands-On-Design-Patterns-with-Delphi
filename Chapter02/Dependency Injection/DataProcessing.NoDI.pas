unit DataProcessing.NoDI;

interface

type
  TDataProcessor = class
  public
    procedure ProcessData;
  end;

implementation

uses
  System.SysUtils,
  DataProcessing.Reader,
  DataProcessing.Writer;

procedure TDataProcessor.ProcessData;
var
  count : integer;
  reader: TReader;
  sum   : int64;
  value : integer;
  writer: TWriter;
begin
  reader := TReader.Create('..\..\data.txt');
  try

    sum := 0;
    count := 0;
    while reader.GetNext(value) do begin
      Inc(sum, value);
      Inc(count);
    end;

    writer := TWriter.Create('..\..\data.csv');
    try
      writer.WriteOut(count, sum, sum/count);
    finally
      FreeAndNil(writer);
    end;

  finally
    FreeAndNil(reader);
  end;
end;

end.
