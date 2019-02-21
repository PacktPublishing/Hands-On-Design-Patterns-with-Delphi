unit Adapter.Example.Composition;

interface

uses
  RTTI,
  Adapter.Example;

type
  IIncompatible = interface ['{4422CF75-2CBE-4F7D-9C14-89DC160CD3C7}']
    function NextElement: integer;
  end;

  TIncompatible = class(TInterfacedObject, IIncompatible)
    function NextElement: integer;
  end;

  TProducerAdapter = class(TInterfacedObject, IProducer)
  strict private
    FWrapped: IIncompatible;
  public
    constructor Create(const wrapped: IIncompatible);
    function NextData: TValue;
  end;

implementation

{ TIncompatible }

function TIncompatible.NextElement: integer;
begin
  Result := 21;
end;

{ TProducerAdapter }

constructor TProducerAdapter.Create(const wrapped: IIncompatible);
begin
  inherited Create;
  FWrapped := wrapped;
end;

function TProducerAdapter.NextData: TValue;
begin
  Result := FWrapped.NextElement;
end;

end.
