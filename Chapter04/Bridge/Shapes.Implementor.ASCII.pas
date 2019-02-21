unit Shapes.Implementor.ASCII;

interface

uses
  System.Types, System.Classes,
  Shapes.Implementor;

type
  TPainterASCII = class(TPainter)
  strict private
    FCanvas: TStrings;
  strict protected
    procedure GenerateLines(bounds: TRect; var topLine, midLine: string);
    procedure InternalDrawRectangle(bounds: TRect);
    procedure InternalDrawTriangle(bounds: TRect);
  public
    constructor Create(canvas: TStrings);
    procedure DrawRectangle(bounds: TRect); override;
    procedure DrawTriangle(bounds: TRect); override;
  end;

implementation

uses
  System.SysUtils;

{ TPainterASCII }

constructor TPainterASCII.Create(canvas: TStrings);
begin
  inherited Create;
  FCanvas := canvas;
end;

procedure TPainterASCII.DrawRectangle(bounds: TRect);
begin
  FCanvas.BeginUpdate;
  try
    FCanvas.Clear;
    InternalDrawRectangle(bounds);
  finally
    FCanvas.EndUpdate;
  end;
end;

procedure TPainterASCII.DrawTriangle(bounds: TRect);
begin
  FCanvas.BeginUpdate;
  try
    FCanvas.Clear;
    InternalDrawTriangle(bounds);
  finally
    FCanvas.EndUpdate;
  end;
end;

procedure TPainterASCII.GenerateLines(bounds: TRect; var topLine, midLine: string);
var
  padding: string;
begin
  padding := StringOfChar(' ', bounds.Left - 1);
  topLine := padding + '+' + StringOfChar('-', bounds.Width - 2) + '+';
  midLine := padding + '|' + StringOfChar(' ', bounds.Width - 2) + '|';
end;

procedure TPainterASCII.InternalDrawRectangle(bounds: TRect);
var
  midLine: string;
  topLine: string;
  y: integer;
begin
  GenerateLines(bounds, topLine, midLine);
  for y := 1 to bounds.Top - 1 do
    FCanvas.Add('');

  FCanvas.Add(topLine);
  for y := bounds.Top + 1 to bounds.Bottom - 1 do
    FCanvas.Add(midLine);
  FCanvas.Add(topLine);
end;

procedure TPainterASCII.InternalDrawTriangle(bounds: TRect);
var
  leftX: integer;
  midX: integer;
  s: string;
  step: real;
  y: integer;
begin
  for y := 1 to bounds.Top - 1 do
    FCanvas.Add('');

  midX := (bounds.Left + bounds.Right) div 2;
  step := bounds.Width / bounds.Height / 2;

  for y := bounds.Top + 1 to bounds.Bottom - 1 do
  begin
    s := StringOfChar(' ', bounds.Right);
    s[Round(midX - (y - bounds.Top) * step)] := '/';
    s[Round(midX + (y - bounds.Top) * step)] := '\';
    FCanvas.Add(s);
  end;

  FCanvas.Add(StringOfChar(' ', bounds.Left - 1) + '/' +
    StringOfChar('-', bounds.Width - 2) + '\');
end;

end.
