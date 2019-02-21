unit CustomIterators.Filter;

interface

uses
  System.Generics.Collections;

type
  TFilterFunc<T> = reference to function (index: integer; const item: T): boolean;

  TFilterEnumerator<T> = class(TEnumerator<T>)
  private
    FSource: TEnumerator<T>;
    FFilter: TFilterFunc<T>;
    FIndex: integer;
  protected
    function DoGetCurrent: T; override;
    function DoMoveNext: Boolean; override;
  public
    constructor Create(source: TEnumerator<T>; const filter: TFilterFunc<T>);
  end;

  TFilterEnumerable<T> = record
  private
    FSource: TEnumerator<T>;
    FFilter: TFilterFunc<T>;
  public
    constructor Create(source: TEnumerator<T>; const filter: TFilterFunc<T>);
    function GetEnumerator: TEnumerator<T>;
  end;

  Filter = record
    class function Process<T>(source: TEnumerator<T>;
      const filter: TFilterFunc<T>): TFilterEnumerable<T>; static;
  end;

implementation

{ TFilterEnumerator<T> }

constructor TFilterEnumerator<T>.Create(source: TEnumerator<T>;
  const filter: TFilterFunc<T>);
begin
  inherited Create;
  FSource := source;
  FFilter := filter;
  FIndex := -1;
end;

function TFilterEnumerator<T>.DoGetCurrent: T;
begin
  Result := FSource.Current;
end;

function TFilterEnumerator<T>.DoMoveNext: Boolean;
begin
  repeat
    Result := FSource.MoveNext;
    if not Result then
      break;
    Inc(FIndex);
  until FFilter(FIndex, Current);
end;

{ TFilterEnumerable<T> }

constructor TFilterEnumerable<T>.Create(source: TEnumerator<T>;
  const filter: TFilterFunc<T>);
begin
  FSource := source;
  FFilter := filter;
end;

function TFilterEnumerable<T>.GetEnumerator: TEnumerator<T>;
begin
  Result := TFilterEnumerator<T>.Create(FSource, FFilter);
end;

{ Filter }

class function Filter.Process<T>(source: TEnumerator<T>;
  const filter: TFilterFunc<T>): TFilterEnumerable<T>;
begin
  Result := TFilterEnumerable<T>.Create(source, filter);
end;

end.
