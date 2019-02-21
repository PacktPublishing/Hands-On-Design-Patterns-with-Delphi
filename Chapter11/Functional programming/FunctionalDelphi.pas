unit FunctionalDelphi;

interface

uses
  System.SysUtils;

type
  TCFunc<T1,T2> = reference to function (const input: T1): T2;
  TMapFilter<T1,T2> = function (const input: T1; var output: T2): boolean;

  Functional = record
    class function Filter<T>(const input: TArray<T>; const filter: TFunc<T,boolean>): TArray<T>; overload; static;
    class function Filter<T>(const input: TArray<T>; const filter: TCFunc<T,boolean>): TArray<T>; overload; static;
    class function Map<T1,T2>(const input: TArray<T1>; const mapper: TFunc<T1,T2>): TArray<T2>; overload; static;
    class function Map<T1,T2>(const input: TArray<T1>; const mapper: TCFunc<T1,T2>): TArray<T2>; overload; static;
    class function Map<T1,T2>(const input: TArray<T1>; const mapper: TMapFilter<T1,T2>): TArray<T2>; overload; static;
  end;

implementation

{ Functional }

class function Functional.Map<T1, T2>(const input: TArray<T1>;
  const mapper: TFunc<T1, T2>): TArray<T2>;
var
  i: integer;
begin
  SetLength(Result, Length(input));
  for i := 0 to High(input) do
    Result[i] := mapper(input[i]);
end;

class function Functional.Map<T1, T2>(const input: TArray<T1>;
  const mapper: TCFunc<T1, T2>): TArray<T2>;
var
  i: integer;
begin
  SetLength(Result, Length(input));
  for i := 0 to High(input) do
    Result[i] := mapper(input[i]);
end;

class function Functional.Filter<T>(const input: TArray<T>;
  const filter: TCFunc<T, boolean>): TArray<T>;
var
  iIn: integer;
  iOut: integer;
begin
  SetLength(Result, Length(input));
  iOut := 0;
  for iIn := 0 to High(input) do
  begin
    if filter(input[iIn]) then
    begin
      Result[iOut] := input[iIn];
      Inc(iOut);
    end;
  end;
  SetLength(Result, iOut);
end;

class function Functional.Filter<T>(const input: TArray<T>;
  const filter: TFunc<T, boolean>): TArray<T>;
var
  iIn: integer;
  iOut: integer;
begin
  SetLength(Result, Length(input));
  iOut := 0;
  for iIn := 0 to High(input) do
  begin
    if filter(input[iIn]) then
    begin
      Result[iOut] := input[iIn];
      Inc(iOut);
    end;
  end;
  SetLength(Result, iOut);
end;

class function Functional.Map<T1, T2>(const input: TArray<T1>;
  const mapper: TMapFilter<T1, T2>): TArray<T2>;
var
  iIn: integer;
  iOut: integer;
  outValue: T2;
begin
  SetLength(Result, Length(input));
  iOut := 0;
  for iIn := 0 to High(input) do
  begin
    if mapper(input[iIn], outValue) then
    begin
      Result[iOut] := outValue;
      Inc(iOut);
    end;
  end;
  SetLength(Result, iOut);
end;

end.
