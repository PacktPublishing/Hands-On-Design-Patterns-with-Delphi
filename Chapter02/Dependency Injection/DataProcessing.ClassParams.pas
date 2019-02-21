unit DataProcessing.ClassParams;

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
    constructor Create(const AReader: IReader; const AWriter: IWriter);
    procedure ProcessData;
  end;

implementation

uses
  System.SysUtils;

constructor TDataProcessor.Create(const AReader: IReader; const AWriter:
  IWriter);
begin
  inherited Create;
  FReader := AReader;
  FWriter := AWriter;
end;

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

