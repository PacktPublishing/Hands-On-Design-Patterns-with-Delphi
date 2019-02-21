unit DataBuilderFluent.JSON;

interface

uses
  DataBuilderFluent.Intf;

function CreateJSONBuilder: IDataBuilderFluent;

implementation

uses
  System.SysUtils, System.Classes,
  IndentedBuilder;

type
  TJSONBuilder = class(TInterfacedObject, IDataBuilderFluent)
  strict private
    FBuilder: TIndentedBuilder;
  strict protected
    procedure AppendComma;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    function AddField(const name, value: string): IDataBuilderFluent;
    function BeginData: IDataBuilderFluent;
    function BeginNode(const name: string): IDataBuilderFluent;
    function EndData: IDataBuilderFluent;
    function EndNode: IDataBuilderFluent;
    function Make: string;
  end;

{ exports }

function CreateJSONBuilder: IDataBuilderFluent;
begin
  Result := TJSONBuilder.Create;
end;

{ TJSONBuilder }

function TJSONBuilder.AddField(const name, value: string): IDataBuilderFluent;
begin
  AppendComma;
  FBuilder.IndentLine('"' + name + '": "' + value + '"');
  Result := Self;
end;

procedure TJSONBuilder.AfterConstruction;
begin
  inherited;
  FBuilder := TIndentedBuilder.Create;
end;

procedure TJSONBuilder.AppendComma;
var
  lastLine: string;
begin
  if FBuilder.Data.Count = 0 then
    Exit;
  lastLine := FBuilder.Data[FBuilder.Data.Count - 1];
  if not lastLine.EndsWith('{') then
    FBuilder.Data[FBuilder.Data.Count - 1] := lastLine + ',';
end;

procedure TJSONBuilder.BeforeDestruction;
begin
  FreeAndNil(FBuilder);
  inherited;
end;

function TJSONBuilder.BeginData: IDataBuilderFluent;
begin
  inherited;
  FBuilder.IndentLine('{');
  FBuilder.Indent;
  Result := Self;
end;

function TJSONBuilder.BeginNode(const name: string): IDataBuilderFluent;
begin
  AppendComma;
  FBuilder.IndentLine('"' + name + '": {');
  FBuilder.Indent;
  Result := Self;
end;

function TJSONBuilder.EndData: IDataBuilderFluent;
begin
  FBuilder.Unindent;
  FBuilder.IndentLine('}');
  Result := Self;
end;

function TJSONBuilder.EndNode: IDataBuilderFluent;
begin
  FBuilder.Unindent;
  FBuilder.IndentLine('}');
  Result := Self;
end;

function TJSONBuilder.Make: string;
begin
  Result := FBuilder.ToString;
end;

end.

