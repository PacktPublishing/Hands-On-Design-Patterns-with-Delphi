unit Customer.Interfaces;

interface

type
  ICustomer = interface ['{A736226E-B177-4E3A-9CCD-39AE71FB4E1B}']
    function GetAddress: string;
    function GetEmail: string;
    function GetName: string;
    procedure SetAddress(const value: string);
    procedure SetEmail(const value: string);
    procedure SetName(const value: string);
    property Address: string read GetAddress write SetAddress;
    property Email: string read GetEmail write SetEmail;
    property Name: string read GetName write SetName;
  end;

  TCustomer = class(TInterfacedObject, ICustomer)
  strict protected
    FAddress: string;
    FEmail: string;
    FName: string;
    function GetAddress: string;
    function GetEmail: string;
    function GetName: string;
    procedure SetAddress(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetName(const Value: string);
  public
    property Address: string read GetAddress write SetAddress;
    property Email: string read GetEmail write SetEmail;
    property Name: string read GetName write SetName;
  end;

  IImportantCustomer = interface ['{E32D6AE5-FB60-4414-B7BF-3E5BDFECDE64}']
  end;

  TImportantCustomer = class(TCustomer, IImportantCustomer)
  end;

implementation

function TCustomer.GetAddress: string;
begin
  Result := FAddress;
end;

function TCustomer.GetEmail: string;
begin
  Result := FEmail;
end;

function TCustomer.GetName: string;
begin
  Result := FName;
end;

procedure TCustomer.SetAddress(const Value: string);
begin
  FAddress := Value;
end;

procedure TCustomer.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TCustomer.SetName(const Value: string);
begin
  FName := Value;
end;

end.
