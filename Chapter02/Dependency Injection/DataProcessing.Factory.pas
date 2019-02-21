unit DataProcessing.Factory;

interface

uses
  System.SysUtils,
  DataProcessing.Reader,
  DataProcessing.Writer;

type
  TDataProcessor = class
  strict private
    FReader: IReader;
    FWriterFactory: TFunc<IWriter>;
  public
    procedure ProcessData;
    property Reader: IReader read FReader write FReader;
    property WriterFactory: TFunc<IWriter> read FWriterFactory write FWriterFactory;
  end;

implementation

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

  if count > 0 then
    FWriterFactory.WriteOut(count, sum, sum/count);
end;

end.

