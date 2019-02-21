unit LazySpring4D.Lazy;

interface

uses
  System.SysUtils,
  Spring;

type
  TLazyObj = class
    constructor Create;
    destructor Destroy; override;
    procedure DoSomething;
  end;

  ILazyInt = interface['{E56A0AF5-FE16-4B8B-A69C-DC66BD6EDAF3}']
    procedure DoSomething;
  end;

  TLazyOwner = class
  strict private
    FLazyObj: Lazy<TLazyObj>;
    FLazyInt: Lazy<ILazyInt>;
  strict protected
    function GetLazy: TLazyObj;
    function GetLazyInt: ILazyInt;
  public
    constructor Create;
    destructor Destroy; override;
    property Lazy: TLazyObj read GetLazy;
    property LazyInt: ILazyInt read GetLazyInt;
  end;

var
  GLogger: TProc<string>;

implementation

type
  TLazyInt = class(TInterfacedObject, ILazyInt)
  public
    constructor Create;
    destructor Destroy; override;
    procedure DoSomething;
  end;

procedure Log(const msg: string);
begin
  GLogger(msg);
end;

{ TLazyOwner }

constructor TLazyOwner.Create;
begin
  inherited Create;
  FLazyObj := Lazy<TLazyObj>.Create;

  FLazyInt := Lazy<ILazyInt>.Create(
    function: ILazyInt
    begin
      Result := TLazyInt.Create;
    end);

  Log('TLazyOwner created');
end;

destructor TLazyOwner.Destroy;
begin
  FLazyObj.Value.Free;

  Log('TLazyOwner destroyed');
  inherited;
end;

function TLazyOwner.GetLazy: TLazyObj;
begin
  Result := FLazyObj;
end;

function TLazyOwner.GetLazyInt: ILazyInt;
begin
  Result := FLazyInt;
end;

{ TLazyObj }

constructor TLazyObj.Create;
begin
  inherited Create;
  Log('TLazyObj created');
end;

destructor TLazyObj.Destroy;
begin
  Log('TLazyObj destroyed');
  inherited;
end;

procedure TLazyObj.DoSomething;
begin
  Log('TLazyObj.DoSomething');
end;

{ TLazyInt }

constructor TLazyInt.Create;
begin
  inherited Create;
  Log('TLazyInt created');
end;

destructor TLazyInt.Destroy;
begin
  Log('TLazyInt destroyed');
  inherited;
end;

procedure TLazyInt.DoSomething;
begin
  Log('TLazyInt.DoSomething');
end;

end.

