unit DataProcessing.Reader.DUnit;

interface

uses
  System.Generics.Collections,
  DataProcessing.Reader;

type
  TTestReader = class(TInterfacedObject, IReader)
  strict private
    FData: TList<integer>;
    FEnum: TEnumerator<integer>;
  public
    constructor Create(values: TArray<integer>);
    destructor Destroy; override;
    function GetNext(var value: integer): boolean;
  end;

implementation

uses
  System.SysUtils;

{ TTestReader }

constructor TTestReader.Create(values: TArray<integer>);
begin
  inherited Create;
  FData := TList<integer>.Create;
  FData.AddRange(values);
  FEnum := FData.GetEnumerator;
end;

destructor TTestReader.Destroy;
begin
  FreeAndNil(FData);
  inherited;
end;

function TTestReader.GetNext(var value: integer): boolean;
begin
  Result := FEnum.MoveNext;
  if Result then
    value := FEnum.Current;
end;

end.
