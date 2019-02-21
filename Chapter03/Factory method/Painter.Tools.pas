unit Painter.Tools;

interface

uses
  Vcl.Graphics;

type
  TPaintStamp = class abstract
  public
    procedure Apply(canvas: TCanvas; x, y: integer); virtual; abstract;
  end;

  TSquareStamp = class(TPaintStamp)
  public
    procedure Apply(canvas: TCanvas; x, y: integer); override;
  end;

  TCircleStamp = class(TPaintStamp)
  public
    procedure Apply(canvas: TCanvas; x, y: integer); override;
  end;

  TPaintTool = class abstract
  strict private
    FCanvas: TCanvas;
    FStamp: TPaintStamp;
  protected
    function MakeStamp: TPaintStamp; virtual; abstract;
  public
    constructor Create(canvas: TCanvas);
    procedure PaintStampAt(x, y: integer);
  end;

  TPaintSquare = class(TPaintTool)
  protected
    function MakeStamp: TPaintStamp; override;
  end;

  TPaintCircle = class(TPaintTool)
  protected
    function MakeStamp: TPaintStamp; override;
  end;

implementation

{ TPaintTool }

constructor TPaintTool.Create(canvas: TCanvas);
begin
  inherited Create;
  FCanvas := canvas;
  FStamp := MakeStamp;
end;

procedure TPaintTool.PaintStampAt(x, y: integer);
begin
  FStamp.Apply(FCanvas, x, y);
end;

{ TSquareStamp }

procedure TSquareStamp.Apply(canvas: TCanvas; x, y: integer);
begin
  canvas.Pen.Width := 3;
  canvas.Rectangle(X-10, Y-10, X+10, Y+10);
end;

{ TCircleStamp }

procedure TCircleStamp.Apply(canvas: TCanvas; x, y: integer);
begin
  canvas.Pen.Width := 3;
  canvas.Ellipse(X-10, Y-10, X+10, Y+10);
end;

{ TPaintSquare }

function TPaintSquare.MakeStamp: TPaintStamp;
begin
  Result := TSquareStamp.Create;
end;

{ TPaintCircle }

function TPaintCircle.MakeStamp: TPaintStamp;
begin
  Result := TCircleStamp.Create;
end;

end.
