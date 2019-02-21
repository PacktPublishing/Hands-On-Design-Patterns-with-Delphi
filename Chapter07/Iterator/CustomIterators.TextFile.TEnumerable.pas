unit CustomIterators.TextFile.TEnumerable;

interface

uses
  System.Generics.Collections;

type
  TTextFileContentO = record
  private
    FFileName: string;
  public
    constructor Create(fileName: string);
    function GetEnumerator: TEnumerator<string>;
  end;

function TextFileContentO(fileName: string): TTextFileContentO;

implementation

uses
  System.SysUtils, System.Classes;

type
  TTextFileEnumerator = class(TEnumerator<string>)
  strict private
    FReader: TStreamReader;
    FLine: string;
  protected
    function DoGetCurrent: string; override;
    function DoMoveNext: Boolean; override;
  public
    constructor Create(const fileName: string);
    destructor Destroy; override;
  end;

{ exports }

function TextFileContentO(fileName: string): TTextFileContentO;
begin
  Result := TTextFileContentO.Create(fileName);
end;

{ TTextFileEnumerator }

constructor TTextFileEnumerator.Create(const fileName: string);
begin
  inherited Create;
  FReader := TStreamReader.Create(fileName, true);
end;

destructor TTextFileEnumerator.Destroy;
begin
  FreeAndNil(FReader);
  inherited;
end;

function TTextFileEnumerator.DoGetCurrent: string;
begin
  Result := FLine;
end;

function TTextFileEnumerator.DoMoveNext: Boolean;
begin
  Result := not FReader.EndOfStream;
  if Result then
    FLine := FReader.ReadLine;
end;

{ TTextFileContentO }

constructor TTextFileContentO.Create(fileName: string);
begin
  FFileName := fileName;
end;

function TTextFileContentO.GetEnumerator: TEnumerator<string>;
begin
  Result := TTextFileEnumerator.Create(FFileName);
end;

end.
