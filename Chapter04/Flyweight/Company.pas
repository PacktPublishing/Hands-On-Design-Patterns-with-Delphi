unit Company;

interface

type
  TCompanyInfo = record
  private
    class var LastID: integer;
  public
    ID: integer;
    Name: string;
    Address: string;
    constructor Create(const AName, AAddress: string);
  end;

  ICompany = interface ['{36C754FD-2C32-49CA-920E-2FED39121E79}']
    function GetInfo: TCompanyInfo;
  //
    property Info: TCompanyInfo read GetInfo;
  end;

  TCompanyFactory = reference to function (const companyInfo: TCompanyInfo): ICompany;

function CreateCompany(const companyInfo: TCompanyInfo): ICompany;

implementation

uses
  System.SysUtils, System.SyncObjs, System.Hash,
  System.Generics.Defaults, System.Generics.Collections;

type
  TCompany = class(TInterfacedObject, ICompany)
  strict private
    FInfo: TCompanyInfo;
  strict protected
    function GetInfo: TCompanyInfo;
  public
    constructor Create(AData: TCompanyInfo);
    property Info: TCompanyInfo read GetInfo;
  end;

  TCompanyStorage = class // singleton
  strict private
  class var
    FCompanyHash: TDictionary<TCompanyInfo, ICompany>;
    FCompanyComparer: IEqualityComparer<TCompanyInfo>;
  strict protected
    class function CompareInfoNoID(const left, right: TCompanyInfo): boolean;
    class function HashInfo(const value: TCompanyInfo): integer;
  public
    class constructor Create;
    class destructor Destroy;
    class function CreateCompany(const companyInfo: TCompanyInfo): ICompany;
  end;

{ externals }

function CreateCompany(const companyInfo: TCompanyInfo): ICompany;
begin
  Result := TCompanyStorage.CreateCompany(companyInfo);
end;

{ TCompanyInfo }

constructor TCompanyInfo.Create(const AName, AAddress: string);
begin
  ID := TInterlocked.Increment(LastID);
  Name := AName;
  Address := AAddress;
end;

{ TCompany }

constructor TCompany.Create(AData: TCompanyInfo);
begin
  inherited Create;
  FInfo := AData;
end;

function TCompany.GetInfo: TCompanyInfo;
begin
  Result := FInfo;
end;

{ TCompanyStorage }

class constructor TCompanyStorage.Create;
begin
  FCompanyComparer := TEqualityComparer<TCompanyInfo>.Construct(CompareInfoNoID, HashInfo);
  FCompanyHash := TDictionary<TCompanyInfo, ICompany>.Create(FCompanyComparer);
end;

class destructor TCompanyStorage.Destroy;
begin
  FreeAndNil(FCompanyHash);
end;

class function TCompanyStorage.CompareInfoNoID(const left, right: TCompanyInfo): boolean;
begin
  Result := SameText(left.Name, right.Name)
            and SameText(left.Address, right.Address);
end;

class function TCompanyStorage.CreateCompany(const companyInfo: TCompanyInfo): ICompany;
begin
  if FCompanyHash.TryGetValue(companyInfo, Result) then
    Exit;

  Result := TCompany.Create(companyInfo);
  FCompanyHash.Add(companyInfo, Result);
end;

class function TCompanyStorage.HashInfo(const value: TCompanyInfo): integer;
var
  hasher: THashBobJenkins;
begin
  hasher := THashBobJenkins.Create;
  hasher.Update(value.Name.ToUpperInvariant);
  hasher.Update(value.Address.ToUpperInvariant);
  Result := hasher.HashAsInteger;
end;

end.
