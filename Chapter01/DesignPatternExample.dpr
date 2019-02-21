program DesignPatternExample;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TSparseRec = record
    IsEmpty: boolean;
    Value  : integer;
  end;

  TSparseArray = TArray<TSparseRec>;

  TSparseArrayEnumerator = record
  private
    FData: TSparseArray;
    FIndex: integer;
    function GetCurrent: integer;
  public
    constructor Create(const data: TSparseArray);
    function MoveNext: boolean;
    property Current: integer read GetCurrent;
    function GetEnumerator: TSparseArrayEnumerator;
  end;

  TSparseArrayHelper = record helper for TSparseArray
    function Iterator: TSparseArrayEnumerator;
  end;

var
  data: TSparseArray;

constructor TSparseArrayEnumerator.Create(const data: TSparseArray);
begin
  FData := data;
  FIndex := -1;
end;

function TSparseArrayEnumerator.GetCurrent: integer;
begin
  Result := FData[FIndex].Value;
end;

function TSparseArrayEnumerator.GetEnumerator: TSparseArrayEnumerator;
begin
  Result := Self;
end;

function TSparseArrayEnumerator.MoveNext: boolean;
begin
  Result := false;
  while FIndex < High(FData) do begin
    Inc(FIndex);
    if not FData[FIndex].IsEmpty then
      Exit(true);
  end;
end;

function TSparseArrayHelper.Iterator: TSparseArrayEnumerator;
begin
  Result := TSparseArrayEnumerator.Create(Self);
end;

function PrepareData: TSparseArray;
var
  i: integer;
begin
  SetLength(Result, 99);
  for i := Low(Result) to High(Result) do
  begin
    Result[i].IsEmpty := (i mod 3) = 0;
    if not Result[i].IsEmpty then
      Result[i].Value := i;
  end;
end;

procedure Iterate(const data: TSparseArray; const iterator: TProc<integer>);
var
  i: Integer;
begin
  for i := Low(data) to High(data) do
    if not data[i].IsEmpty then
      iterator(data[i].Value);
end;

procedure Process(value: integer);
begin
  Write(value, ' ');
end;

var
  i: integer;
  value: integer;

begin
  data := PrepareData;

  for i := Low(data) to High(data) do
    if not data[i].IsEmpty then
      Process(data[i].Value);
  Writeln;

  for i := 0 to Length(data) - 1 do
    if not data[i].IsEmpty then
      Process(data[i].Value);
  Writeln;

  Iterate(data,
    procedure (value: integer)
    begin
      Process(value);
    end);
  Writeln;

  for value in data.Iterator do
    Process(value);
  Writeln;

  Readln;
end.
