unit DataProcessing.InjectedProperties;

interface

uses
  DataProcessing.Reader,
  DataProcessing.Writer;

type
  TDataProcessor = class
  strict private
    FReader: IReader;
    FWriter: IWriter;
  public
    procedure ProcessData;
    property Reader: IReader read FReader write FReader;
    property Writer: IWriter read FWriter write FWriter;
  end;

implementation

uses
  System.SysUtils;

procedure TDataProcessor.ProcessData;
var
  count: integer;
  sum  : int64;
  value: integer;
begin
  sum := 0;
  count := 0;
  while FReader.GetNext(value) do begin
    Inc(sum, value);
    Inc(count);
  end;

  FWriter.WriteOut(count, sum, sum/count);
end;

end.

