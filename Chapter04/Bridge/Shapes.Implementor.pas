unit Shapes.Implementor;

interface

uses
  System.Types;

type
  TPainter = class
  public
    procedure DrawRectangle(bounds: TRect); virtual; abstract;
    procedure DrawTriangle(bounds: TRect); virtual; abstract;
  end;

implementation

end.
