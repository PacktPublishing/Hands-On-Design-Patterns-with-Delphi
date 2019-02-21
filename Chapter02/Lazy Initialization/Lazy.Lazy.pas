unit Lazy.Lazy;

interface

uses
  System.SysUtils;

type
  TLazyInternal = class
  public
    constructor Create;
    destructor Destroy; override;
    procedure DoSomething;
  end;

  TLazyObject = class
  public
    constructor Create;
    destructor Destroy; override;
    procedure DoSomething;
  end;

  TLazyOwner = class
  strict private
  type
    THiddenLazyInternal = class
    strict private
      FLazyInternalSafe: TLazyInternal;
    public
      constructor Create;
      destructor Destroy; override;
      property LazyInternal: TLazyInternal read FLazyInternalSafe;
    end;
  var
    FLazyInternal    : TLazyInternal;
    FLazyInternalSafe: THiddenLazyInternal;
    FLazyObject      : TLazyObject;
  strict protected
    function GetLazyInternal: TLazyInternal;
    function GetLazyObject: TLazyObject;
    function LazyInternalSafe: TLazyInternal;
    property LazyInternal: TLazyInternal read GetLazyInternal;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ProcessUsingLazy;
    procedure ProcessUsingLazySafe;
    property LazyObject: TLazyObject read GetLazyObject;
  end;

var
  GLogger: TProc<string>;

implementation

procedure Log(const msg: string);
begin
  GLogger(msg);
end;

{ TLazyOwner }

constructor TLazyOwner.Create;
begin
  inherited;
  Log('TLazyOwner created');
end;

destructor TLazyOwner.Destroy;
begin
  FreeAndNil(FLazyInternal);
  FreeAndNil(FLazyInternalSafe);
  FreeAndNil(FLazyObject);

  Log('TLazyOwner destroyed');
  inherited;
end;

function TLazyOwner.GetLazyInternal: TLazyInternal;
begin
  if not assigned(FLazyInternal) then
    FLazyInternal := TLazyInternal.Create;
  Result := FLazyInternal;
end;

function TLazyOwner.GetLazyObject: TLazyObject;
begin
  if not assigned(FLazyObject) then
    FLazyObject := TLazyObject.Create;
  Result := FLazyObject;
end;

function TLazyOwner.LazyInternalSafe: TLazyInternal;
begin
  if not assigned(FLazyInternalSafe) then
    FLazyInternalSafe := THiddenLazyInternal.Create;
  Result := FLazyInternalSafe.LazyInternal;
end;

procedure TLazyOwner.ProcessUsingLazy;
begin
  // Must take care not to use FLazyInternal directly!
  LazyInternal.DoSomething;
end;

procedure TLazyOwner.ProcessUsingLazySafe;
begin
  // FLazyInternalSafe is hidden and impossible to use directly
  LazyInternalSafe.DoSomething;
end;

{ DoSomething }

constructor TLazyInternal.Create;
begin
  inherited;
  Log('TLazyInternal created');
end;

destructor TLazyInternal.Destroy;
begin
  Log('TLazyInternal destroyed');
  inherited;
end;

procedure TLazyInternal.DoSomething;
begin
  Log('TLazyInternal.DoSomething');
end;

{ TLazyObject }

constructor TLazyObject.Create;
begin
  inherited;
  Log('TLazyObject created');
end;

destructor TLazyObject.Destroy;
begin
  Log('TLazyObject destroy');
  inherited;
end;

procedure TLazyObject.DoSomething;
begin
  Log('TLazyObject.DoSomething');
end;

{ TLazyOwner.THiddenLazyInternal }

constructor TLazyOwner.THiddenLazyInternal.Create;
begin
  inherited Create;
  Log('TLazyOwner.THiddenLazyInternal created');

  FLazyInternalSafe := TLazyInternal.Create;
end;

destructor TLazyOwner.THiddenLazyInternal.Destroy;
begin
  FreeAndNil(FLazyInternalSafe);

  Log('TLazyOwner.THiddenLazyInternal destroyed');
  inherited;
end;

end.
