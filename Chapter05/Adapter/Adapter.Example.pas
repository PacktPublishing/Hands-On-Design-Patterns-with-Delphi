unit Adapter.Example;

interface

uses
  RTTI;

type
  IProducer = interface ['{8E4001F9-11EC-4C9C-BAD9-97C9601699FF}']
    function NextData: TValue;
  end;

  TProblemSolver = class
  public
    function SolveProblem(const problem: string): string; virtual; abstract;
  end;

  TConsumer = class
  public
    function Process(const intf: IProducer): integer;
    function FindTheAnswer(const solver: TProblemSolver): string;
  end;

implementation

{ TConsumer }

function TConsumer.Process(const intf: IProducer): integer;
begin
  Result := intf.NextData.AsInteger * 2;
end;

function TConsumer.FindTheAnswer(const solver: TProblemSolver): string;
begin
  Result := solver.SolveProblem('What is the ultimate answer?');
end;

end.
