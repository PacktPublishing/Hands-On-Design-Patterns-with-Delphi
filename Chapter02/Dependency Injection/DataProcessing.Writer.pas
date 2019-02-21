unit DataProcessing.Writer;

interface

uses
  System.Classes;

type
  IWriter = interface ['{ED6D0678-5FCE-41BA-A161-BE691FCB6B7B}']
    procedure WriteOut(count: integer; sum: int64; average: real);
  end;

  TWriter = class(TInterfacedObject, IWriter)
  strict private
    FData: TStream;
    FDataWriter: TStreamWriter;
  public
    constructor Create(const fileName: string);
    destructor Destroy; override;
    procedure WriteOut(count: integer; sum: int64; average: real);
  end;

implementation

uses
  System.SysUtils;

{ TWriter }

constructor TWriter.Create(const fileName: string);
begin
  inherited Create;
  FData := TFileStream.Create(fileName, fmCreate);
  FDataWriter := TStreamWriter.Create(FData);
end;

destructor TWriter.Destroy;
begin
  FreeAndNil(FDataWriter);
  FreeAndNil(FData);
  inherited;
end;

procedure TWriter.WriteOut(count: integer; sum: int64; average: real);
begin
  FDataWriter.WriteLine('Count;Summary;Average');
  FDataWriter.Write(count);
  FDataWriter.Write(';');
  FDataWriter.Write(sum);
  FDataWriter.Write(';');
  FDataWriter.Write(average);
  FDataWriter.WriteLine;
end;

end.
