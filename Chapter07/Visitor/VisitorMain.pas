unit VisitorMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ComponentModel, Vcl.StdCtrls;

type
  TfrmVisitor = class(TForm)
    btnDiscount: TButton;
    btnRaise: TButton;
    lbLog: TListBox;
    procedure btnDiscountClick(Sender: TObject);
    procedure btnRaiseClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FComputer: TConfigurableComponent;
    procedure LogComponent(component: TComponent; indent: string);
    procedure LogConfiguration;
  public
  end;

var
  frmVisitor: TfrmVisitor;

implementation

{$R *.dfm}

type
  TDiscountVisitor = class(TInterfacedObject, IVisitor)
  strict private
    FDiscountBasic: integer;
    FDiscountConfig: integer;
  public
    constructor Create(discountBasic, discountConfigurable: integer);
    procedure Visit(component: TConfigurableComponent); overload;
    procedure Visit(component: TBasicComponent); overload;
  end;

  TRaiseVisitor = class(TInterfacedObject, IVisitor)
  strict private
    FRaiseBy: real;
  public
    constructor Create(raiseBy: real);
    procedure Visit(component: TConfigurableComponent); overload;
    procedure Visit(component: TBasicComponent); overload;
  end;

procedure TfrmVisitor.btnDiscountClick(Sender: TObject);
begin
  FComputer.Accept(TDiscountVisitor.Create(5, 10));

  lbLog.Items.Add('Applied 5% discount to basic and 10% to configurable components');
  LogConfiguration;
end;

procedure TfrmVisitor.btnRaiseClick(Sender: TObject);
begin
  FComputer.Accept(TRaiseVisitor.Create(10));

  lbLog.Items.Add('Raising prices of components by 10 units');
  LogConfiguration;
end;

procedure TfrmVisitor.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FComputer);
end;

procedure TfrmVisitor.FormCreate(Sender: TObject);
var
  motherboard: TConfigurableComponent;
begin
  FComputer := TConfigurableComponent.Create('chassis', 37.9);
  FComputer.Add(TBasicComponent.Create('PSU', 34.6));

  motherboard := TConfigurableComponent.Create('motherboard', 96.5);
  motherboard.Add(TBasicComponent.Create('CPU', 121.1));
  motherboard.Add(TBasicComponent.Create('memory', 88.2));
  motherboard.Add(TBasicComponent.Create('memory', 88.2));
  motherboard.Add(TBasicComponent.Create('graphics', 179));

  FComputer.Add(motherboard);

  LogConfiguration;
end;

procedure TfrmVisitor.LogComponent(component: TComponent; indent: string);
var
  comp: TComponent;
begin
  lbLog.Items.Add(Format('%s%s: %.1f', [indent, component.Name, component.Price]));
  indent := indent + '  ';
  for comp in component.Components do
    LogComponent(comp, indent);
end;

procedure TfrmVisitor.LogConfiguration;
begin
  LogComponent(FComputer, '');
  lbLog.Items.Add('');
end;

{ TDiscountVisitor }

constructor TDiscountVisitor.Create(discountBasic, discountConfigurable:
  integer);
begin
  inherited Create;
  FDiscountBasic := discountBasic;
  FDiscountConfig := discountConfigurable;
end;

procedure TDiscountVisitor.Visit(component: TBasicComponent);
begin
  component.Price := component.Price * (1 - FDiscountBasic/100);
end;

procedure TDiscountVisitor.Visit(component: TConfigurableComponent);
begin
  component.Price := component.Price * (1 - FDiscountConfig/100);
end;

{ TRaiseVisitor }

constructor TRaiseVisitor.Create(raiseBy: real);
begin
  inherited Create;
  FRaiseBy := raiseBy;
end;

procedure TRaiseVisitor.Visit(component: TConfigurableComponent);
begin
  component.Price := component.Price + FRaiseBy;
  component.Name := 'NEW ' + component.Name;
end;

procedure TRaiseVisitor.Visit(component: TBasicComponent);
begin
  component.Price := component.Price + FRaiseBy;
end;

end.
