unit Prototype.CloneablePersistent;

interface

uses
  System.Classes;

type
  TCloneablePersistent = class(TPersistent)
  strict private
    FData: TStream;
    FIsBar: boolean;
    FName: string;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function Clone: TCloneablePersistent;
    function FooBar: string;
    property Data: TStream read FData;
    property Name: string read FName write FName;
  end;

  TNewCloneable = class(TCloneablePersistent)
  strict private
    FValue: integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    function Clone: TNewCloneable;
    property Value: integer read FValue write FValue;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils;

procedure TCloneablePersistent.Assign(Source: TPersistent);
var
  baseObj: TCloneablePersistent;
  dataPos: int64;
begin
  if not (Source is TCloneablePersistent) then
    inherited
  else begin
    baseObj := TCloneablePersistent(Source);

    // make copy of published data
    Name := baseObj.Name;

    // clone state of owned objects
    // make sure not to destroy the state of owned objects during the process!
    dataPos := baseObj.Data.Position;
    Data.CopyFrom(baseObj.Data, 0);
    baseObj.Data.Position := dataPos;
    Data.Position := dataPos;

    // clone private state
    FIsBar := baseObj.FIsBar;
  end;
end;

constructor TCloneablePersistent.Create;
begin
  inherited Create;
  FData := TMemoryStream.Create;
end;

destructor TCloneablePersistent.Destroy;
begin
  FreeAndNil(FData);
  inherited;
end;

procedure TCloneablePersistent.AssignTo(Dest: TPersistent);
var
  dataPos: int64;
  s      : string;
  strings: TStrings;
  value  : Integer;
begin
  if not (Dest is TStrings) then
    inherited
  else begin
    strings := TStrings(Dest);
    strings.Add('Name: ' + Name);
    strings.Add('Next is: ' + IfThen(FIsBar, 'Bar', 'Foo'));

    dataPos := Data.Position;
    Data.Position := 0;
    s := IfThen(DataPos = 0, '^', '');
    while Data.Read(value, SizeOf(integer)) = SizeOf(integer) do
      s := s + value.ToString + IfThen(Data.Position = dataPos, '^', ' ');
    Data.Position := dataPos;
    strings.Add(s);
  end;
end;

function TCloneablePersistent.Clone: TCloneablePersistent;
begin
  Result := TCloneablePersistent.Create;
  Result.Assign(Self);
end;

function TCloneablePersistent.FooBar: string;
begin
  Result := IfThen(FIsBar, 'Bar', 'Foo');
  FIsBar := not FIsBar;
end;

{ TNewCloneable }

constructor TNewCloneable.Create;
begin
  inherited;
  FValue := 42;
end;

procedure TNewCloneable.Assign(Source: TPersistent);
begin
  if Source is TNewCloneable then
    Value := TNewCloneable(Source).Value;

  inherited;
end;

procedure TNewCloneable.AssignTo(Dest: TPersistent);
begin
  inherited;

  if Dest is TStrings then
    TStrings(Dest).Add('Value: ' + Value.ToString);
end;

function TNewCloneable.Clone: TNewCloneable;
begin
  Result := TNewCloneable.Create;
  Result.Assign(Self);
end;

end.
