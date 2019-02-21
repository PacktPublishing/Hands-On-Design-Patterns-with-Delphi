unit SpringObservedModel;

interface

uses
  Spring.DesignPatterns;

type
  IObserver = interface ['{966246BE-5DE8-431E-BB95-BEB5A1A9C1B8}']
    procedure Update(Subject: TObject);
  end;

  TObservableModel = class(TObservable<IObserver>)
  strict private
    FBasePrice: real;
    FDiscount: integer;
  strict protected
    procedure DoNotify(const observer: IObserver); override;
    function GetEndPrice: real;
    procedure SetBasePrice(const value: real);
    procedure SetDiscount(const value: integer);
  public
    property BasePrice: real read FBasePrice write SetBasePrice;
    property Discount: integer read FDiscount write SetDiscount;
    property EndPrice: real read GetEndPrice;
  end;

implementation

{ TObservableModel }

procedure TObservableModel.DoNotify(const observer: IObserver);
begin
  observer.Update(Self);
end;

function TObservableModel.GetEndPrice: real;
begin
  Result := BasePrice * (100 - Discount) / 100;
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
