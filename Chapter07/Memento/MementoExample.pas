unit MementoExample;

interface

type
  TMemento = record
  private
    FValue: integer;
  end;

  TComplexObject = class
  private
    FValue: integer;
  public
    procedure Increment;
    function CreateMemento: TMemento;
    procedure RestoreMemento(const memento: TMemento);
    property Value: integer read FValue;
  end;

implementation

function TComplexObject.CreateMemento: TMemento;
begin
  Result.FValue := FValue;
end;

procedure TComplexObject.Increment;
begin
  Inc(FValue);
end;

procedure TComplexObject.RestoreMemento(const memento: TMemento);
begin
  FValue := memento.FValue;
end;

end.
