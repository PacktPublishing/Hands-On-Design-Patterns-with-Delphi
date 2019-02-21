unit Shapes.Abstraction;

interface

uses
  System.Types,
  Shapes.Implementor;

type
  TShape = class
  strict private
    FPainter: TPainter;
  public
    constructor Create(painter: TPainter);
    destructor Destroy; override;
    property Painter: TPainter read FPainter;
  end;

  TRectangle = class(TShape)
  strict protected
    FBounds: TRect;
  public
    procedure Draw;
    property Bounds: TRect read FBounds write FBounds;
  end;

  TTriangle = class(TShape)
  strict protected
    FBounds: TRect;
  public
    procedure Draw;
    property Bounds: TRect read FBounds write FBounds;
  end;

implementation

uses
  System.SysUtils;

{ TShape }

constructor TShape.Create(painter: TPainter);
begin
  inherited Create;
  FPainter := painter;
end;

destructor TShape.Destroy;
begin
  FreeAndNil(FPainter);
  inherited;
end;

{ TRectangle }

procedure TRectangle.Draw;
begin
  Painter.DrawRectangle(Bounds);
end;

{ TTriangle }

procedure TTriangle.Draw;
begin
  Painter.DrawTriangle(Bounds);
end;

end.
