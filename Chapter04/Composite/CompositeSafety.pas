unit CompositeSafety;

interface

uses
  System.Generics.Collections;

type
  TComponentS = class
  strict private
    FName: string;
    FPrice: real;
  public
    constructor Create(const AName: string; const APrice: real);
    function Components: TArray<TComponentS>; virtual;
    function TotalPrice: real; virtual;
    property Name: string read FName;
    property Price: real read FPrice;
  end;

  TConfigurableComponentS = class(TComponentS)
  strict private
    FComponents: TObjectList<TComponentS>;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure Add(component: TComponentS);
    function Components: TArray<TComponentS>; override;
    function TotalPrice: real; override;
  end;

  TBasicComponentS = class(TComponentS)
  public
  end;

implementation

uses
  System.SysUtils;

{ TComponentS }

constructor TComponentS.Create(const AName: string; const APrice: real);
begin
  inherited Create;
  FName := AName;
  FPrice := APrice;
end;

function TComponentS.Components: TArray<TComponentS>;
begin
  Result := [];
end;

function TComponentS.TotalPrice: real;
begin
  Result := Price;
end;

{ TConfigurableComponentS }

procedure TConfigurableComponentS.Add(component: TComponentS);
begin
  FComponents.Add(component);
end;

procedure TConfigurableComponentS.AfterConstruction;
begin
  inherited;
  FComponents := TObjectList<TComponentS>.Create;
end;

procedure TConfigurableComponentS.BeforeDestruction;
begin
  FreeAndNil(FComponents);
  inherited;
end;

function TConfigurableComponentS.Components: TArray<TComponentS>;
begin
  Result := FComponents.ToArray;
end;

function TConfigurableComponentS.TotalPrice: real;
var
  comp: TComponentS;
begin
  Result := Price;
  for comp in FComponents do
    Result := Result + comp.TotalPrice;
end;

end.
