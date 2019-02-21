unit DataProcessing.Writer.DUnit;

interface

uses
  DataProcessing.Writer;

type
  ITestWriter = interface ['{F4B5C10B-3994-432B-8223-55E5CF3F41B4}']
    function GetAverage: real;
    function GetCount: integer;
    function GetSum: integer;
    function GetWasCalled: boolean;
  //
    property Count: integer read GetCount;
    property Sum: integer read GetSum;
    property Average: real read GetAverage;
    property WasCalled: boolean read GetWasCalled;
  end;

  TTestWriter = class(TInterfacedObject, IWriter, ITestWriter)
  strict private
    FAverage: real;
    FCount: integer;
    FSum: integer;
    FWasCalled: boolean;
  strict protected
    function GetAverage: real;
    function GetCount: integer;
    function GetSum: integer;
    function GetWasCalled: boolean;
  public
    procedure WriteOut(count: integer; sum: int64; average: real);
    property Count: integer read GetCount;
    property Sum: integer read GetSum;
    property Average: real read GetAverage;
    property WasCalled: boolean read GetWasCalled;
  end;

implementation

function TTestWriter.GetAverage: real;
begin
  Result := FAverage;
end;

function TTestWriter.GetCount: integer;
begin
  Result := FCount;
end;

function TTestWriter.GetSum: integer;
begin
  Result := FSum;
end;

function TTestWriter.GetWasCalled: boolean;
begin
  Result := FWasCalled;
end;

procedure TTestWriter.WriteOut(count: integer; sum: int64; average: real);
begin
  FCount := count;
  FSum := sum;
  FAverage := average;
  FWasCalled := true;
end;

end.
