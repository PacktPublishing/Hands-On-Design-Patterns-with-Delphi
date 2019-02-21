unit ObservedModel;

interface

uses
  System.Generics.Collections;

type
  IObserver = interface ['{966246BE-5DE8-431E-BB95-BEB5A1A9C1B8}']
    procedure Update(Subject: TObject);
  end;

  ISubject = interface ['{C9D55859-6009-4AA4-8E8F-B94DE5009D56}']
    procedure Attach(Observer: IObserver);
    procedure Detach(Observer: IObserver);
  end;

  TObservable = class(TInterfacedObject, ISubject)
  strict private
    FObservers: TList<IObserver>;
  strict protected
    procedure Notify;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Attach(Observer: IObserver);
    procedure Detach(Observer: IObserver);
  end;

  TObservableModel = class(TObservable, ISubject)
  strict private
    FBasePrice: real;
    FDiscount: integer;
    FUpdateCount: integer;
    FModified: boolean;
  strict protected
    function GetEndPrice: real;
    procedure Notify;
    procedure SetBasePrice(const value: real);
    procedure SetDiscount(const value: integer);
  public
    procedure BeginUpdate;
    procedure EndUpdate;
    property BasePrice: real read FBasePrice write SetBasePrice;
    property Discount: integer read FDiscount write SetDiscount;
    property EndPrice: real read GetEndPrice;
  end;

implementation

uses
  System.SysUtils;

{ TObservable }

constructor TObservable.Create;
begin
  inherited Create;
  FObservers := TList<IObserver>.Create;
end;

destructor TObservable.Destroy;
begin
  FreeAndNil(FObservers);
  inherited;
end;

procedure TObservable.Attach(Observer: IObserver);
begin
  FObservers.Add(Observer);
end;

procedure TObservable.Detach(Observer: IObserver);
begin
  FObservers.Remove(Observer);
end;

procedure TObservable.Notify;
var
  observer: IObserver;
begin
  for observer in FObservers do
    observer.Update(Self);
end;

{ TObservableModel }

procedure TObservableModel.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TObservableModel.EndUpdate;
begin
  Assert(FUpdateCount > 0);
  Dec(FUpdateCount);
  if (FUpdateCount = 0) and FModified then
  begin
    Notify;
    FModified := false;
  end;
end;

function TObservableModel.GetEndPrice: real;
begin
  Result := BasePrice * (100 - Discount) / 100;
end;

procedure TObservableModel.Notify;
begin
  if FUpdateCount = 0 then
    inherited Notify
  else
    FModified := true;
end;

procedure TObservableModel.SetBasePrice(const value: real);
begin
  FBasePrice := value;
  Notify;
end;

procedure TObservableModel.SetDiscount(const value: integer);
begin
  Assert((value >= 0) and (value <= 100), 'Discount must be between 0 and 100 percent.');
  FDiscount := value;
  Notify;
end;

end.
