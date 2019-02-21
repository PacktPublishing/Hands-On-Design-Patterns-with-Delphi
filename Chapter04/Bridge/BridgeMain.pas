unit BridgeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmBridge = class(TForm)
    btnRectGUI: TButton;
    btnRectASCII: TButton;
    outGUI: TImage;
    outASCII: TMemo;
    btnTriangleGUI: TButton;
    btnTriangleASCII: TButton;
    procedure btnRectASCIIClick(Sender: TObject);
    procedure btnRectGUIClick(Sender: TObject);
    procedure btnTriangleASCIIClick(Sender: TObject);
    procedure btnTriangleGUIClick(Sender: TObject);
  private
  public
  end;

var
  frmBridge: TfrmBridge;

implementation

uses
  Shapes.Abstraction,
  Shapes.Implementor.GUI, Shapes.Implementor.ASCII;

{$R *.dfm}

procedure TfrmBridge.btnRectASCIIClick(Sender: TObject);
var
  rect: TRectangle;
begin
  rect := TRectangle.Create(TPainterASCII.Create(outASCII.Lines));
  rect.Bounds := TRect.Create(5, 5, 35, 15);
  rect.Draw;
  rect.Free;
end;

procedure TfrmBridge.btnRectGUIClick(Sender: TObject);
var
  rect: TRectangle;
begin
  rect := TRectangle.Create(TPainterGUI.Create(outGUI.Canvas));
  rect.Bounds := TRect.Create(20, 60, 220, 200);
  rect.Draw;
  rect.Free;
end;

procedure TfrmBridge.btnTriangleASCIIClick(Sender: TObject);
var
  trig: TTriangle;
begin
  trig := TTriangle.Create(TPainterASCII.Create(outASCII.Lines));
  trig.Bounds := TRect.Create(5, 5, 34, 15);
  trig.Draw;
  trig.Free;
end;

procedure TfrmBridge.btnTriangleGUIClick(Sender: TObject);
var
  trig: TTriangle;
begin
  trig := TTriangle.Create(TPainterGUI.Create(outGUI.Canvas));
  trig.Bounds := TRect.Create(20, 60, 220, 200);
  trig.Draw;
  trig.Free;
end;

end.
