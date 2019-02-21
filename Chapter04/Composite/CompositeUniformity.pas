unit CompositeUniformity;

interface

uses
  System.Generics.Collections;

type
  TComponentU = class
  strict private
    FName: string;
    FPrice: real;
  public
    constructor Create(const AName: string; const APrice: real);
    procedure Add(component: TComponentU); virtual;
    function Components: TArray<TComponentU>; virtual;
    function TotalPrice: real; virtual;
    property Name: string read FName;
    property Price: real read FPrice;
  end;

  TConfigurableComponentU = class(TComponentU)
  strict private
    FComponents: TObjectList<TComponentU>;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure Add(component: TComponentU); override;
    function Components: TArray<TComponentU>; override;
    function TotalPrice: real; override;
  end;

  TBasicComponentU = class(TComponentU)
  public
  end;

implementation

uses
  System.SysUtils;

{ TComponentU }

constructor TComponentU.Create(const AName: string; const APrice: real);
begin
  inherited Create;
  FName := AName;
  FPrice := APrice;
end;

function TComponentU.Components: TArray<TComponentU>;
begin
  Result := [];
end;

procedure TComponentU.Add(component: TComponentU);
begin
  raise Exception.Create('Components cannot be added to ' + ClassName);
end;

function TComponentU.TotalPrice: real;
begin
  Result := Price;
end;

{ TConfigurableComponentU }

procedure TConfigurableComponentU.Add(component: TComponentU);
begin
  FComponents.Add(component);
end;

procedure TConfigurableComponentU.AfterConstruction;
begin
  inherited;
  FComponents := TObjectList<TComponentU>.Create;
end;

procedure TConfigurableComponentU.BeforeDestruction;
begin
  FreeAndNil(FComponents);
  inherited;
end;

function TConfigurableComponentU.Components: TArray<TComponentU>;
begin
  Result := FComponents.ToArray;
end;

function TConfigurableComponentU.TotalPrice: real;
var
  comp: TComponentU;
begin
  Result := Price;
  for comp in FComponents do
    Result := Result + comp.TotalPrice;
end;

end.
