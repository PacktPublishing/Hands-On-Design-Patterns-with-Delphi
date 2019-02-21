program Painter;

uses
  Vcl.Forms,
  PainterMain in 'PainterMain.pas' {frmPainter},
  Painter.Tools in 'Painter.Tools.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPainter, frmPainter);
  Application.Run;
end.
