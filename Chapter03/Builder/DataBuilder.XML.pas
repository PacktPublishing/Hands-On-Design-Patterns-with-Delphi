unit DataBuilder.XML;

interface

uses
  DataBuilder.Intf;

function CreateXMLBuilder: IDataBuilder;

implementation

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  DataBuilder.Indented;

type
  TXMLBuilder = class(TInterfacedObject, IDataBuilder)
  strict private
    FBuilder: TIndentedBuilder;
    FNodes: TStack<string>;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure AddField(const name, value: string);
    procedure BeginNode(const name: string);
    procedure BeginData;
    procedure EndData;
    procedure EndNode;
    function Make: string;
  end;

{ exports }

function CreateXMLBuilder: IDataBuilder;
begin
  Result := TXMLBuilder.Create;
end;

{ TXMLBuilder }

procedure TXMLBuilder.AddField(const name, value: string);
begin
  FBuilder.IndentLine('<' + name + '>' + value + '</' + name + '>');
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

procedure TXMLBuilder.BeginData;
begin
end;

procedure TXMLBuilder.BeginNode(const name: string);
begin
  FBuilder.IndentLine('<' + name + '>');
  FBuilder.Indent;
  FNodes.Push(name);
end;

procedure TXMLBuilder.EndData;
begin
end;

procedure TXMLBuilder.EndNode;
begin
  FBuilder.Unindent;
  FBuilder.IndentLine('</' + FNodes.Pop + '>');
end;

function TXMLBuilder.Make: string;
begin
  Result := FBuilder.ToString;
end;

end.
