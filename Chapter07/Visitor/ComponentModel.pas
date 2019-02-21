unit ComponentModel;

interface

uses
  System.Generics.Collections;

type
  IVisitor = interface;

  TComponent = class
  strict private
    FName: string;
    FPrice: real;
  public
    constructor Create(const AName: string; const APrice: real);
    procedure Accept(const visitor: IVisitor); virtual; abstract;
    function Components: TArray<TComponent>; virtual;
    function TotalPrice: real; virtual;
    property Name: string read FName write FName;
    property Price: real read FPrice write FPrice;
  end;

  TConfigurableComponent = class(TComponent)
  strict private
    FComponents: TObjectList<TComponent>;
  public
    procedure Accept(const visitor: IVisitor); override;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure Add(component: TComponent);
    function Components: TArray<TComponent>; override;
    function TotalPrice: real; override;
  end;

  TBasicComponent = class(TComponent)
  public
    procedure Accept(const visitor: IVisitor); override;
  end;

  IVisitor = interface ['{147411D4-2555-4174-9923-5AD6B0D91F5D}']
    procedure Visit(component: TConfigurableComponent); overload;
    procedure Visit(component: TBasicComponent); overload;
  end;

implementation

uses
  System.SysUtils;

{ TComponent }

constructor TComponent.Create(const AName: string; const APrice: real);
begin
  inherited Create;
  FName := AName;
  FPrice := APrice;
end;

function TComponent.Components: TArray<TComponent>;
begin
  Result := [];
end;

function TComponent.TotalPrice: real;
begin
  Result := Price;
end;

{ TConfigurableComponent }

procedure TConfigurableComponent.Accept(const visitor: IVisitor);
var
  component: TComponent;
begin
  visitor.Visit(Self);
  for component in Components do
    component.Accept(visitor);
end;

procedure TConfigurableComponent.Add(component: TComponent);
begin
  FComponents.Add(component);
end;

procedure TConfigurableComponent.AfterConstruction;
begin
  inherited;
  FComponents := TObjectList<TComponent>.Create;
end;

procedure TConfigurableComponent.BeforeDestruction;
begin
  FreeAndNil(FComponents);
  inherited;
end;

function TConfigurableComponent.Components: TArray<TComponent>;
begin
  Result := FComponents.ToArray;
end;

function TConfigurableComponent.TotalPrice: real;
var
  comp: TComponent;
begin
  Result := Price;
  for comp in FComponents do
    Result := Result + comp.TotalPrice;
end;

{ TBasicComponent }

procedure TBasicComponent.Accept(const visitor: IVisitor);
begin
  visitor.Visit(Self);
end;

end.
