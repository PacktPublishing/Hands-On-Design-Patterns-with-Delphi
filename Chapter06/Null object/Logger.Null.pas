unit Logger.Null;

interface

uses
  Logger.Intf;

type
  TNullLogger = class(TInterfacedObject, ILogger)
  public
    function Initialize: boolean;
    procedure Log(const msg: string); overload;
    procedure Log(const msg: string; const params: array of const); overload;
    procedure Close;
  end;

implementation

{ TNullLogger }

procedure TNullLogger.Close;
begin
end;

function TNullLogger.Initialize: boolean;
begin
  Result := true;
end;

procedure TNullLogger.Log(const msg: string);
begin
end;

procedure TNullLogger.Log(const msg: string; const params: array of const);
begin
end;

end.
