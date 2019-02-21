// Generic object pool implementation.

unit DPObjectPool;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TObjectPool<T:class,constructor> = class
  var
    FFactory: TFunc<T>;
    FMaxSize: integer;
    FPool: TStack<T>;
    FSize: integer;
  public
    constructor Create(maxSize: integer = 0; const factory: TFunc<T> = nil); overload;
    constructor Create(const factory: TFunc<T>); overload;
    destructor Destroy; override;
    function Allocate: T;
    procedure Release(const obj: T);
  end;

implementation

{ TObjectPool<T> }

constructor TObjectPool<T>.Create(maxSize: integer; const factory: TFunc<T>);
var
  i: Integer;
begin
  inherited Create;
  FFactory := factory;
  FMaxSize := maxSize;
  FPool := TStack<T>.Create;
end;

constructor TObjectPool<T>.Create(const factory: TFunc<T>);
begin
  Create(0, factory);
end;

destructor TObjectPool<T>.Destroy;
begin
  while FPool.Count > 0 do
    FPool.Pop.Free;
  FreeAndNil(FPool);

  inherited;
end;

function TObjectPool<T>.Allocate: T;
begin
  MonitorEnter(Self);
  try
    if FPool.Count > 0 then
      Exit(FPool.Pop);

    if (FMaxSize > 0) and (FSize >= FMaxSize) then
      Exit(nil);

    if assigned(FFactory) then
      Result := FFactory()
    else
      Result := T.Create;

    Inc(FSize);
  finally
    MonitorExit(Self);
  end;
end;

procedure TObjectPool<T>.Release(const obj: T);
begin
  MonitorEnter(Self);
  try
    FPool.Push(obj);
  finally
    MonitorExit(Self);
  end;
end;

end.
