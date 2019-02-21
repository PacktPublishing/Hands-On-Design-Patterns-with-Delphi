unit DataBuilder.Intf;

interface

type
  IDataBuilder = interface ['{1BA8B314-4968-4209-AF1E-2496C7BEC390}']
    procedure BeginData;
    procedure BeginNode(const name: string);
    procedure AddField(const name, value: string);
    procedure EndNode;
    procedure EndData;
    function Make: string;
  end;

implementation

end.
