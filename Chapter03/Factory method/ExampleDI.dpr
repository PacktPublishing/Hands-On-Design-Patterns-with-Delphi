program ExampleDI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  ISomething = interface
    function Value: integer;
  end;

  TBaseClass = class
  strict protected
    FSomething: ISomething;
  public
    constructor Create(const something: ISomething);
    function Value: integer;
  end;

  T21Something = class(TInterfacedObject, ISomething)
  public
    function Value: integer;
  end;

  T42Class = class(TBaseClass)
  public
    constructor Create;
  end;

{ TBaseClass }

constructor TBaseClass.Create(const something: ISomething);
begin
  inherited Create;
  FSomething := something
end;

function TBaseClass.Value: integer;
begin
  Result := FSomething.Value * 2;
end;

{ T21Something }

function T21Something.Value: integer;
begin
  Result := 21;
end;

{ T42Class }

constructor T42Class.Create;
begin
  inherited Create(T21Something.Create);
end;

{ T42Class }

var
  data: TBaseClass;

begin
  data := T42Class.Create;
  try
    Writeln(data.Value);
  finally
    FreeAndNil(data);
  end;
  Readln;
end.
