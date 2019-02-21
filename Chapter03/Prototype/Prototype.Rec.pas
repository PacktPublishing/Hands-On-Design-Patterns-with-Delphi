unit Prototype.Rec;

interface

type
  TNestedRecord = record
    ValueI: integer;
    ValueS: string;
  end;

  IInteger = interface ['{722BD9CC-BF41-4CDC-95C1-7EF17A28BF7B}']
    function  GetValue: integer;
    procedure SetValue(const value: integer);
    property Value: integer read GetValue write SetValue;
  end;

  TInteger = class(TInterfacedObject, IInteger)
  strict private
    FValue: integer;
  strict protected
    function  GetValue: integer;
    procedure SetValue(const value: integer);
  public
    property Value: integer read GetValue write SetValue;
  end;

  TStaticArray = array [1..10] of integer;

  TDynamicArray = TArray<integer>;

  TCharacter = class
  strict private
    FValue: char;
  public
    property Value: char read FValue write FValue;
  end;

  TCloneableRec = record
    Str: string;
    Int: integer;
    Intf: IInteger;
    ArrS: TStaticArray;
    ArrD: TDynamicArray;
    Rec: TNestedRecord;
    Obj: TCharacter;
  end;

implementation

function TInteger.GetValue: integer;
begin
  Result := FValue;
end;

procedure TInteger.SetValue(const value: integer);
begin
  FValue := value;
end;

end.
