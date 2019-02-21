unit DataBuilder.Indented;

interface

uses
  System.Classes;

type
  TIndentedBuilder = class
  strict private
    FData: TStringList;
    FIndent: integer;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure Indent;
    procedure IndentLine(const line: string);
    function ToString: string; override;
    procedure Unindent;
    property Data: TStringList read FData;
  end;

implementation

uses
  System.SysUtils;

procedure TIndentedBuilder.AfterConstruction;
begin
  inherited;
  FData := TStringList.Create;
end;

procedure TIndentedBuilder.BeforeDestruction;
begin
  FreeAndNil(FData);
  inherited;
end;

procedure TIndentedBuilder.Indent;
begin
  Inc(FIndent, 2);
end;

procedure TIndentedBuilder.IndentLine(const line: string);
begin
  FData.Add(StringOfChar(' ', FIndent) + line);
end;

function TIndentedBuilder.ToString: string;
begin
  Result := FData.Text;
end;

procedure TIndentedBuilder.Unindent;
begin
  Dec(FIndent, 2);
end;

end.
