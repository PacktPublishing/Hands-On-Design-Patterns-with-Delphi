program CompositionVsInheritance;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes;

// Implementing a class that exposes a list which only provides three operations:
// - Add
// - Count
// - Items[]

type
  TInheritedLimitedList = class(TList)
  strict private
    FAllowClear: boolean;
  protected
    function Get(Index: Integer): Integer;
    procedure Put(Index: Integer; const Value: Integer);
  public
    destructor Destroy; override;
    function Add(Item: Integer): Integer; inline;
    procedure Clear; override;
    procedure Delete(Index: Integer); reintroduce;
    procedure Exchange(Index1, Index2: Integer); reintroduce;
    function Expand: TList; reintroduce;
    function Extract(Item: Pointer): Pointer; reintroduce;
    function First: Pointer; reintroduce;
    function GetEnumerator: TListEnumerator; reintroduce;
    procedure Insert(Index: Integer; Item: Pointer);  reintroduce;
    function Last: Pointer; reintroduce;
    procedure Move(CurIndex, NewIndex: Integer); reintroduce;
    function Remove(Item: Pointer): Integer; reintroduce;
    function RemoveItem(Item: Pointer; Direction: TList.TDirection): Integer; reintroduce;
    property Items[Index: Integer]: Integer read Get write Put; default;
  end;

  TCompositedLimitedList = class
  strict private
    FList: TList;
  strict protected
    function Get(Index: Integer): Pointer; inline;
    function GetCount: Integer; inline;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(Item: Pointer): Integer; inline;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: Pointer read Get; default;
  end;

{ TInheritedLimitedList }

destructor TInheritedLimitedList.Destroy;
begin
  FAllowClear := true;
  inherited;
end;

function TInheritedLimitedList.Add(Item: Integer): Integer;
begin
  Result := inherited Add(pointer(Item));
end;

procedure TInheritedLimitedList.Clear;
begin
  if FAllowClear then
    inherited
  else
    raise Exception.Create('Not supported');
end;

procedure TInheritedLimitedList.Delete(Index: Integer);
begin
  raise Exception.Create('Not supported');
end;

procedure TInheritedLimitedList.Exchange(Index1, Index2: Integer);
begin
  raise Exception.Create('Not supported');
end;

function TInheritedLimitedList.Expand: TList;
begin
  raise Exception.Create('Not supported');
end;

function TInheritedLimitedList.Extract(Item: Pointer): Pointer;
begin
  raise Exception.Create('Not supported');
end;

function TInheritedLimitedList.First: Pointer;
begin
  raise Exception.Create('Not supported');
end;

function TInheritedLimitedList.Get(Index: Integer): Integer;
begin
  Result := Integer(inherited Get(Index));
end;

function TInheritedLimitedList.GetEnumerator: TListEnumerator;
begin
  raise Exception.Create('Not supported');
end;

procedure TInheritedLimitedList.Insert(Index: Integer; Item: Pointer);
begin
  raise Exception.Create('Not supported');
end;

function TInheritedLimitedList.Last: Pointer;
begin
  raise Exception.Create('Not supported');
end;

procedure TInheritedLimitedList.Move(CurIndex, NewIndex: Integer);
begin
  raise Exception.Create('Not supported');
end;

procedure TInheritedLimitedList.Put(Index: Integer; const Value: Integer);
begin
  raise Exception.Create('Not supported');
end;

function TInheritedLimitedList.Remove(Item: Pointer): Integer;
begin
  raise Exception.Create('Not supported');
end;

function TInheritedLimitedList.RemoveItem(Item: Pointer;
  Direction: TList.TDirection): Integer;
begin
  raise Exception.Create('Not supported');
end;

{ TCompositedLimitedList }

constructor TCompositedLimitedList.Create;
begin
  inherited Create;
  FList := TList.Create;
end;

destructor TCompositedLimitedList.Destroy;
begin
  FList.Free;
  inherited;
end;

function TCompositedLimitedList.Add(Item: Pointer): Integer;
begin
  Result := FList.Add(Item);
end;

function TCompositedLimitedList.Get(Index: Integer): Pointer;
begin
  Result := FList[Index];
end;

function TCompositedLimitedList.GetCount: Integer;
begin
  Result := FList.Count;
end;

procedure ChangeList(list: TList);
begin
  list[1] := pointer(42);
end;

procedure PrintList(list: TInheritedLimitedList);
var
  i: Integer;
begin
  for i := 0 to list.Count - 1 do
    Write(list[i], ' ');
  Writeln;
end;

var
  list: TInheritedLimitedList;

begin
  try
    list := TInheritedLimitedList.Create;
    try
      list.Add(1);
      list.Add(2);
      list.Add(3);
//      list[1] := 42;
      ChangeList(list);
      PrintList(list);
    finally
      FreeAndNil(list);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn;
end.
