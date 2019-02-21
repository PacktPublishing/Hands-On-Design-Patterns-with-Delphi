unit CustomIterators.TextFile.IEnumerable;

interface

function TextFileContentI(const fileName: string): IEnumerable<string>;

implementation

uses
  System.SysUtils, System.Classes;

type
  TTextFileEnumeratorBase = class(TInterfacedObject, IEnumerable,
                                                     IEnumerator)
  public
    function GetEnumerator: IEnumerator; virtual; abstract;
    function GetCurrent: TObject; virtual; abstract;
    function MoveNext: Boolean; virtual; abstract;
    procedure Reset; virtual; abstract;
    property Current: TObject read GetCurrent;
  end;

  TTextFileEnumerator = class(TTextFileEnumeratorBase, IEnumerable<string>,
                                                       IEnumerator<string>)
  strict private
    FReader: TStreamReader;
    FLine: string;
  public
    constructor Create(const fileName: string);
    destructor Destroy; override;
    function GetEnumerator: IEnumerator<string>;
    function GetCurrent: string; reintroduce;
    function MoveNext: boolean; override;
    procedure Reset; override;
    property Current: string read GetCurrent;
  end;

{ exports }

function TextFileContentI(const fileName: string): IEnumerable<string>;
begin
  Result := TTextFileEnumerator.Create(fileName);
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

function TTextFileEnumerator.GetCurrent: string;
begin
  Result := FLine;
end;

function TTextFileEnumerator.GetEnumerator: IEnumerator<string>;
begin
  Result := Self;
end;

function TTextFileEnumerator.MoveNext: boolean;
begin
  Result := not FReader.EndOfStream;
  if Result then
    FLine := FReader.ReadLine;
end;

procedure TTextFileEnumerator.Reset;
begin
  FReader.BaseStream.Position := 0;
  FReader.DiscardBufferedData;
end;

end.
