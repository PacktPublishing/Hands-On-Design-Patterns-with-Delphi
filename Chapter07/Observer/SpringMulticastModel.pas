unit SpringMulticastModel;

interface

uses
  System.Classes,
  Spring;

type
  TObservableModel = class
  strict private
    FBasePrice: real;
    FDiscount: integer;
    FEndPriceChanged: Event<TNotifyEvent>;
  strict protected
    function GetEndPrice: real;
    procedure SetBasePrice(const value: real);
    procedure SetDiscount(const value: integer);
  public
    property BasePrice: real read FBasePrice write SetBasePrice;
    property Discount: integer read FDiscount write SetDiscount;
    property EndPrice: real read GetEndPrice;
    property EndPriceChanged: Event<TNotifyEvent> read FEndPriceChanged;
  end;

implementation

{ TObservableModel }

function TObservableModel.GetEndPrice: real;
begin
  Result := BasePrice * (100 - Discount) / 100;
end;

procedure TObservableModel.SetBasePrice(const value: real);
begin
  FBasePrice := value;
  EndPriceChanged.Invoke(Self);
end;

procedure TObservableModel.SetDiscount(const value: integer);
begin
  Assert((value >= 0) and (value <= 100), 'Discount must be between 0 and 100 percent.');
  FDiscount := value;
  EndPriceChanged.Invoke(Self);
end;

end.
