unit Customer;

interface

uses
  Company;

type
  TPersonalInfo = record
  private
    class var LastID: integer;
  public
    ID: integer;
    Name: string;
    Address : string;
    constructor Create(const AName, AAddress: string);
  end;

  ICustomer = interface ['{1AE32361-788E-4974-9366-94E62D980234}']
    function GetCompanyInfo: TCompanyInfo;
    function GetPersonalInfo: TPersonalInfo;
  //
    property CompanyInfo: TCompanyInfo read GetCompanyInfo;
    property PersonalInfo: TPersonalInfo read GetPersonalInfo;
  end;

function CreateCustomer(const personalInfo: TPersonalInfo;
  const companyInfo: TCompanyInfo; companyFactory: TCompanyFactory): ICustomer;

implementation

uses
  System.SyncObjs;

type
  TCustomer = class(TInterfacedObject, ICustomer)
  strict private
    FCompanyData: ICompany;
    FPersonalInfo: TPersonalInfo;
  strict protected
    function GetCompanyInfo: TCompanyInfo;
    function GetPersonalInfo: TPersonalInfo;
  public
    constructor Create(const personalInfo: TPersonalInfo; const companyInfo: TCompanyInfo;
      companyFactory: TCompanyFactory);
    property CompanyInfo: TCompanyInfo read GetCompanyInfo;
    property PersonalInfo: TPersonalInfo read GetPersonalInfo;
  end;

{ externals }

function CreateCustomer(const personalInfo: TPersonalInfo;
  const companyInfo: TCompanyInfo; companyFactory: TCompanyFactory): ICustomer;
begin
  Result := TCustomer.Create(personalInfo, companyInfo, companyFactory);
end;

{ TPersonalInfo }

constructor TPersonalInfo.Create(const AName, AAddress: string);
begin
  ID := TInterlocked.Increment(LastID);
  Name := AName;
  Address := AAddress;
end;

{ TCustomer }

constructor TCustomer.Create(const personalInfo: TPersonalInfo; const companyInfo:
  TCompanyInfo; companyFactory: TCompanyFactory); // constructor injection
begin
  inherited Create;
  FPersonalInfo := personalInfo;
  FCompanyData := companyFactory(companyInfo);
end;

function TCustomer.GetCompanyInfo: TCompanyInfo;
begin
  Result := FCompanyData.Info;
end;

function TCustomer.GetPersonalInfo: TPersonalInfo;
begin
  Result := FPersonalInfo;
end;

end.
