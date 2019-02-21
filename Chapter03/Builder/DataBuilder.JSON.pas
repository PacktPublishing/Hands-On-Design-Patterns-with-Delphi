unit DataBuilder.JSON;

interface

uses
  DataBuilder.Intf;

function CreateJSONBuilder: IDataBuilder;

implementation

uses
  System.SysUtils, System.Classes,
  DataBuilder.Indented;

type
  TJSONBuilder = class(TInterfacedObject, IDataBuilder)
  strict private
    FBuilder: TIndentedBuilder;
  strict protected
    procedure AppendComma;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure AddField(const name, value: string);
    procedure BeginData;
    procedure BeginNode(const name: string);
    procedure EndData;
    procedure EndNode;
    function Make: string;
  end;

{ exports }

function CreateJSONBuilder: IDataBuilder;
begin
  Result := TJSONBuilder.Create;
end;

{ TJSONBuilder }

procedure TJSONBuilder.AddField(const name, value: string);
begin
  AppendComma;
  FBuilder.IndentLine('"' + name + '": "' + value + '"');
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

procedure TJSONBuilder.BeginData;
begin
  inherited;
  FBuilder.IndentLine('{');
  FBuilder.Indent;
end;

procedure TJSONBuilder.BeginNode(const name: string);
begin
  AppendComma;
  FBuilder.IndentLine('"' + name + '": {');
  FBuilder.Indent;
end;

procedure TJSONBuilder.EndData;
begin
  FBuilder.Unindent;
  FBuilder.IndentLine('}');
end;

procedure TJSONBuilder.EndNode;
begin
  FBuilder.Unindent;
  FBuilder.IndentLine('}');
end;

function TJSONBuilder.Make: string;
begin
  Result := FBuilder.ToString;
end;

end.

