unit DataAggregator.TextFile;

interface

uses
  System.Classes,
  DataAggregator.Template;

type
  TFileDataAggregator = class(TDataAggregatorTemplate)
  strict private
    FFileName: string;
    FReader: TStreamReader;
  protected
    procedure CloseDataSource; override;
    function GetNextValue(var value: integer): boolean; override;
    function OpenDataSource: boolean; override;
  public
    constructor Create(const fileName: string);
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TFileDataAggregator }

constructor TFileDataAggregator.Create(const fileName: string);
begin
  inherited Create;
  FFileName := fileName;
end;

destructor TFileDataAggregator.Destroy;
begin
  CloseDataSource;
  inherited;
end;

procedure TFileDataAggregator.CloseDataSource;
begin
  FreeAndNil(FReader);
end;

function TFileDataAggregator.GetNextValue(var value: integer): boolean;
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

function TFileDataAggregator.OpenDataSource: boolean;
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
