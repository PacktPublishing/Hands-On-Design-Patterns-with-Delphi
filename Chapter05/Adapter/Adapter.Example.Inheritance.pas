unit Adapter.Example.Inheritance;

interface

uses
  RTTI,
  Adapter.Example;

type
  TDeepThought = class
  public
    function FindTheAnswer: string;
  end;

  TProblemAdapter = class(TProblemSolver)
  public
    function SolveProblem(const problem: string): string; override;
  end;

implementation

uses
  System.SysUtils;

{ TDeepThough }

function TDeepThought.FindTheAnswer: string;
begin
  Result := '42';
end;

{ TProblemAdapter }

function TProblemAdapter.SolveProblem(const problem: string): string;
var
  dt: TDeepThought;
begin
  dt := TDeepThought.Create;
  try
    Result := dt.FindTheAnswer;
  finally
    FreeAndNil(dt);
  end;
end;

end.
