program Example;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TSomething = class
  public
    function Value: integer; virtual; abstract;
  end;

  TBaseClass = class
  strict protected
    FSomething: TSomething;
  protected
    function MakeSomething: TSomething; virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
    function Value: integer;
  end;

  T21Something = class(TSomething)
  public
    function Value: integer; override;
  end;

  T42Class = class(TBaseClass)
  protected
    function MakeSomething: TSomething; override;
  end;

{ TBaseClass }

constructor TBaseClass.Create;
begin
  inherited;
  FSomething := MakeSomething;
end;

destructor TBaseClass.Destroy;
begin
  FreeAndNil(FSomething);
  inherited;
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

function T42Class.MakeSomething: TSomething;
begin
  Result := T21Something.Create;
end;

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
