unit DataProcessing.Reader;

interface

uses
  System.Classes;

type
  IReader = interface ['{9B32E26A-456F-45D1-A494-B331C7131020}']
    function GetNext(var value: integer): boolean;
  end;

  TReader = class(TInterfacedObject, IReader)
  strict private
    FData: TStream;
    FDataReader: TStreamReader;
  public
    constructor Create(const fileName: string);
    destructor Destroy; override;
    function GetNext(var value: integer): boolean;
  end;

implementation

uses
  System.SysUtils;

{ TReader }

constructor TReader.Create(const fileName: string);
begin
  inherited Create;
  FData := TFileStream.Create(fileName, fmOpenRead);
  FDataReader := TStreamReader.Create(FData);
end;

destructor TReader.Destroy;
begin
  FreeAndNil(FDataReader);
  FreeAndNil(FData);
  inherited;
end;

function TReader.GetNext(var value: integer): boolean;
begin
  Result := (not FDataReader.EndOfStream)
            and (TryStrToInt(FDataReader.ReadLine, value));
end;

end.
