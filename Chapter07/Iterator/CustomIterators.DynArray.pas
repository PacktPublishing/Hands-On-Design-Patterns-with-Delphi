unit CustomIterators.DynArray;

interface

uses
  System.Generics.Collections;

type
  TArrayEnumerator<T> = class(TEnumerator<T>)
  private
    FData: TArray<T>;
    FCurrent: integer;
  protected
    function DoGetCurrent: T; override;
    function DoMoveNext: Boolean; override;
  public
    constructor Create(const data: TArray<T>);
  end;

  TArrayEnumerable<T> = record
  private
    FData: TArray<T>;
  public
    constructor Create(const data: TArray<T>);
    function GetEnumerator: TEnumerator<T>;
  end;

  ArrayEnum = record
  public
    class function Enum<T>(const data: TArray<T>): TArrayEnumerable<T>; static;
  end;

implementation

{ TArrayEnumerable<T> }

constructor TArrayEnumerable<T>.Create(const data: TArray<T>);
begin
  FData := data;
end;

function TArrayEnumerable<T>.GetEnumerator: TEnumerator<T>;
begin
  Result := TArrayEnumerator<T>.Create(FData);
end;

{ ArrayEnum }

class function ArrayEnum.Enum<T>(const data: TArray<T>): TArrayEnumerable<T>;
begin
  Result := TArrayEnumerable<T>.Create(data);
end;

{ TArrayEnumerator<T> }

constructor TArrayEnumerator<T>.Create(const data: TArray<T>);
begin
  inherited Create;
  FData := data;
  FCurrent := -1;
end;

function TArrayEnumerator<T>.DoGetCurrent: T;
begin
  Result := FData[FCurrent];
end;

function TArrayEnumerator<T>.DoMoveNext: Boolean;
begin
  Result := FCurrent < High(FData);
  if Result then
    Inc(FCurrent);
end;

end.
