unit Customer.Attributes;

interface

type
  TNormalCustomer = class
  strict protected
    FAddress: string;
    FEmail: string;
    FName: string;
  public
    property Address: string read FAddress write FAddress;
    property Email: string read FEmail write FEmail;
    property Name: string read FName write FName;
  end;

  ImportantCustomerAttribute = class(TCustomAttribute)
  strict private
    FStarred: string;
  public
    constructor Create(const AStarred: string);
    property Starred: string read FStarred;
  end;

  [I1mportantCustomer('***')]
  TVIPCustomer = class(TNormalCustomer)
  end;

  [ImportantCustomer('*****')]
  TStarCustomer = class(TNormalCustomer)
  end;

function IsImportantCustomer(customer: TNormalCustomer; var starred: string): boolean;

implementation

uses
  System.RTTI;

{ exports }

function IsImportantCustomer(customer: TNormalCustomer; var starred: string): boolean;
var
  a: TCustomAttribute;
  ctx: TRttiContext;
  t: TRttiType;
begin
  Result := false;
  starred := '';

  ctx := TRttiContext.Create;
  try
    t := ctx.GetType(customer.ClassType);
    for a in t.GetAttributes do
      if a is ImportantCustomerAttribute then
      begin
        starred := ImportantCustomerAttribute(a).Starred;
        Exit(true);
      end;
  finally
    ctx.Free;
  end;
end;

{ ImportantCustomerAttribute }

constructor ImportantCustomerAttribute.Create(const AStarred: string);
begin
  inherited Create;
  FStarred := AStarred;
end;

end.

