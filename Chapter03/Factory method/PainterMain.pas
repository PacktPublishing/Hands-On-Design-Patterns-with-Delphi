unit PainterMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Painter.Tools;

type
  TfrmPainter = class(TForm)
    pnlToolbar: TPanel;
    PaintImage: TImage;
    btnSquare: TButton;
    btnCircles: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure btnCirclesClick(Sender: TObject);
    procedure btnSquareClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PaintImageMouseDown(Sender: TObject; Button: TMouseButton; Shift:
      TShiftState; X, Y: Integer);
    procedure PaintImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y:
      Integer);
    procedure PaintImageMouseUp(Sender: TObject; Button: TMouseButton; Shift:
      TShiftState; X, Y: Integer);
  private
    FMouseDown: boolean;
    FTool: TPaintTool;
  public
    { Public declarations }
  end;

var
  frmPainter: TfrmPainter;

implementation

{$R *.dfm}

procedure TfrmPainter.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FTool);
end;

procedure TfrmPainter.btnSquareClick(Sender: TObject);
begin
  FreeAndNil(FTool);
  FTool := TPaintSquare.Create(PaintImage.Canvas);
end;

procedure TfrmPainter.btnCirclesClick(Sender: TObject);
begin
  FreeAndNil(FTool);
  FTool := TPaintCircle.Create(PaintImage.Canvas);
end;

procedure TfrmPainter.FormResize(Sender: TObject);
begin
  PaintImage.Picture.Bitmap.Width := PaintImage.Width;
  PaintImage.Picture.Bitmap.Height := PaintImage.Height;
end;

procedure TfrmPainter.PaintImageMouseDown(Sender: TObject; Button:
  TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if assigned(FTool) then
    FTool.PaintStampAt(X, Y);
  FMouseDown := true;
end;

procedure TfrmPainter.PaintImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if assigned(FTool) and FMouseDown then
    FTool.PaintStampAt(X, Y);
end;

procedure TfrmPainter.PaintImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMouseDown := false;
end;

end.
