unit DataSource.TextFile;

interface

uses
  System.Classes,
  DataSource.Intf;

type
  TFileDataSource = class(TInterfacedObject, IDataSource)
  strict private
    FFileName: string;
    FReader: TStreamReader;
  public
    constructor Create(const fileName: string);
    destructor Destroy; override;
    procedure CloseDataSource;
    function GetNextValue(var value: integer): boolean;
    function OpenDataSource: boolean;
  end;

implementation

uses
  System.SysUtils;

{ TFileDataSource }

constructor TFileDataSource.Create(const fileName: string);
begin
  inherited Create;
  FFileName := fileName;
end;

destructor TFileDataSource.Destroy;
begin
  CloseDataSource;
  inherited;
end;

procedure TFileDataSource.CloseDataSource;
begin
  FreeAndNil(FReader);
end;

function TFileDataSource.GetNextValue(var value: integer): boolean;
var
  line: string;
begin
  while not FReader.EndOfStream do
  begin
    line := FReader.ReadLine;
    if TryStrToInt(line, value) then
      Exit(true);
  end;
  Result := false;
end;

function TFileDataSource.OpenDataSource: boolean;
var
  fileStream: TFileStream;
begin
  CloseDataSource;
  try
    FReader := TStreamReader.Create(FFileName);
  except
    on E: EFOpenError do
      Exit(false);
  end;
  Result := true;
end;

end.
