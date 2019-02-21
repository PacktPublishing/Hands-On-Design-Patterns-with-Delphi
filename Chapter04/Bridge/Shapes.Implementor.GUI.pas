unit Shapes.Implementor.GUI;

interface

uses
  System.Types,
  Vcl.Graphics,
  Shapes.Implementor;

type
  TPainterGUI = class(TPainter)
  strict private
    FCanvas: TCanvas;
  public
    constructor Create(canvas: TCanvas);
    procedure DrawRectangle(bounds: TRect); override;
    procedure DrawTriangle(bounds: TRect); override;
  end;

implementation

{ TPainterGUI }

constructor TPainterGUI.Create(canvas: TCanvas);
begin
  inherited Create;
  FCanvas := canvas;
end;

procedure TPainterGUI.DrawRectangle(bounds: TRect);
begin
  FCanvas.Rectangle(bounds);
end;

procedure TPainterGUI.DrawTriangle(bounds: TRect);
var
  corners: TArray<TPoint>;
begin
  SetLength(corners, 3);
  corners[0] := Point(bounds.Left, bounds.Bottom);
  corners[1] := Point(bounds.Right, bounds.Bottom);
  corners[2] := Point((bounds.Left + bounds.Right) div 2, bounds.Top);
  FCanvas.Polygon(corners);
end;

end.
