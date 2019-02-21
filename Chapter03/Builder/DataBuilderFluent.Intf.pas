unit DataBuilderFluent.Intf;

interface

type
  IDataBuilderFluent = interface ['{1BA8B314-4968-4209-AF1E-2496C7BEC390}']
    function BeginData: IDataBuilderFluent;
    function BeginNode(const name: string): IDataBuilderFluent;
    function AddField(const name, value: string): IDataBuilderFluent;
    function EndNode: IDataBuilderFluent;
    function EndData: IDataBuilderFluent;
    function Make: string;
  end;

implementation

end.
