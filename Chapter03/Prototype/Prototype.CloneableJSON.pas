unit Prototype.CloneableJSON;

interface

uses
  System.Classes;

type
  TData = class
  strict private
    FValue: integer;
  public
    property Value: integer read FValue write FValue;
  end;

  TCloneableJSON = class
  strict private
    FData: TData;
    FIsBar: boolean;
    FName: string;
  public
    constructor Create; overload;
    destructor Destroy; override;
    function CloneJSON: TCloneableJSON;
    function FooBar: string;
    property Name: string read FName write FName;
    property Data: TData read FData;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.JSON,
  REST.Json;

constructor TCloneableJSON.Create;
begin
  inherited Create;
  FData := TData.Create;
end;

destructor TCloneableJSON.Destroy;
begin
  FreeAndNil(FData);
  inherited;
end;

function TCloneableJSON.CloneJSON: TCloneableJSON;
var
  json: TJSONObject;
  s: string;
begin
  json := TJson.ObjectToJsonObject(Self);
  Result := TJson.JsonToObject<TCloneableJSON>(json);
end;

function TCloneableJSON.FooBar: string;
begin
  Result := IfThen(FIsBar, 'Bar', 'Foo');
  FIsBar := not FIsBar;
end;

end.
