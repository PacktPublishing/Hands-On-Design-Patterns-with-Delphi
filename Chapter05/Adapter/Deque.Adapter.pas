unit Deque.Adapter;

interface

uses
  System.Generics.Collections,
  Deque.Intf;

type
  TDequeList<T> = class(TInterfacedObject, IDeque<T>)
  strict private
    FStorage: TList<T>;
  public
    constructor Create(storage: TList<T>);
    function IsEmpty: boolean;
    procedure PushBack(const element: T);
    procedure PushFront(const element: T);
    function PopBack: T;
    function PopFront: T;
  end;

implementation

uses
  System.SysUtils;

{ TDequeList<T> }

constructor TDequeList<T>.Create(storage: TList<T>);
begin
  inherited Create;
  FStorage := storage;
end;

function TDequeList<T>.IsEmpty: boolean;
begin
  Result := FStorage.Count = 0;
end;

function TDequeList<T>.PopBack: T;
begin
  if IsEmpty then
    raise Exception.Create('TDequeList<T>.PopBack: List is empty')
  else
  begin
    Result := FStorage[FStorage.Count - 1];
    FStorage.Delete(FStorage.Count - 1);
  end;
end;

function TDequeList<T>.PopFront: T;
begin
  if IsEmpty then
    raise Exception.Create('TDequeList<T>.PopFront: List is empty')
  else
  begin
    Result := FStorage[0];
    FStorage.Delete(0);
  end;
end;

procedure TDequeList<T>.PushBack(const element: T);
begin
  FStorage.Add(element);
end;

procedure TDequeList<T>.PushFront(const element: T);
begin
  FStorage.Insert(0, element);
end;

end.
