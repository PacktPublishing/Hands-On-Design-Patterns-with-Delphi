unit DataBuilderFluent.XML;

interface

uses
  DataBuilderFluent.Intf;

function CreateXMLBuilder: IDataBuilderFluent;

implementation

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  IndentedBuilder;

type
  TXMLBuilder = class(TInterfacedObject, IDataBuilderFluent)
  strict private
    FBuilder: TIndentedBuilder;
    FNodes: TStack<string>;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    function AddField(const name, value: string): IDataBuilderFluent;
    function BeginNode(const name: string): IDataBuilderFluent;
    function BeginData: IDataBuilderFluent;
    function EndData: IDataBuilderFluent;
    function EndNode: IDataBuilderFluent;
    function Make: string;
  end;

{ exports }

function CreateXMLBuilder: IDataBuilderFluent;
begin
  Result := TXMLBuilder.Create;
end;

{ TXMLBuilder }

function TXMLBuilder.AddField(const name, value: string): IDataBuilderFluent;
begin
  FBuilder.IndentLine('<' + name + '>' + value + '</' + name + '>');
  Result := Self;
end;

procedure TXMLBuilder.AfterConstruction;
begin
  inherited;
  FBuilder := TIndentedBuilder.Create;
  FNodes := TStack<string>.Create;
end;

procedure TXMLBuilder.BeforeDestruction;
begin
  FreeAndNil(FNodes);
  FreeAndNil(FBuilder);
  inherited;
end;

function TXMLBuilder.BeginData: IDataBuilderFluent;
begin
  Result := Self;
end;

function TXMLBuilder.BeginNode(const name: string): IDataBuilderFluent;
begin
  FBuilder.IndentLine('<' + name + '>');
  FBuilder.Indent;
  FNodes.Push(name);
  Result := Self;
end;

function TXMLBuilder.EndData: IDataBuilderFluent;
begin
  Result := Self;
end;

function TXMLBuilder.EndNode: IDataBuilderFluent;
begin
  FBuilder.Unindent;
  FBuilder.IndentLine('</' + FNodes.Pop + '>');
  Result := Self;
end;

function TXMLBuilder.Make: string;
begin
  Result := FBuilder.ToString;
end;

end.
