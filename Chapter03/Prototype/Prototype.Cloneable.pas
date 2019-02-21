unit Prototype.Cloneable;

interface

uses
  System.Classes;

type
  TCloneable = class
  strict private
    FData: TStream;
    FIsBar: boolean;
    FName: string;
  public
    constructor Create;
    constructor CreateFrom(baseObj: TCloneable);
    destructor Destroy; override;
    procedure Assign(baseObj: TCloneable);
    function Clone: TCloneable;
    function FooBar: string;
    property Data: TStream read FData;
    property Name: string read FName write FName;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils;

constructor TCloneable.Create;
begin
  inherited Create;
  FData := TMemoryStream.Create;
end;

constructor TCloneable.CreateFrom(baseObj: TCloneable);
begin
  Create;
  Assign(baseObj);
end;

destructor TCloneable.Destroy;
begin
  FreeAndNil(FData);
  inherited;
end;

procedure TCloneable.Assign(baseObj: TCloneable);
var
  dataPos: int64;
begin
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

function TCloneable.Clone: TCloneable;
var
  dataPos: int64;
begin
  Result := TCloneable.Create;

  // make copy of published data
  Result.Name := Name;

  // clone state of owned objects
  // make sure not to destroy the state of owned objects during the process!
  dataPos := Data.Position;
  Result.Data.CopyFrom(Data, 0);
  Data.Position := dataPos;
  Result.Data.Position := dataPos;

  // clone private state
  Result.FIsBar := FIsBar;
end;

function TCloneable.FooBar: string;
begin
  Result := IfThen(FIsBar, 'Bar', 'Foo');
  FIsBar := not FIsBar;
end;

end.
