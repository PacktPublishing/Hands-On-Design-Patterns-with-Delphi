program StreamDecorator;

uses
  Vcl.Forms,
  StreamDecoratorMain in 'StreamDecoratorMain.pas' {frmDecorator},
  DecoratedStream in 'DecoratedStream.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDecorator, frmDecorator);
  Application.Run;
end.
