program Bridge;

uses
  Vcl.Forms,
  BridgeMain in 'BridgeMain.pas' {frmBridge},
  Shapes.Abstraction in 'Shapes.Abstraction.pas',
  Shapes.Implementor.GUI in 'Shapes.Implementor.GUI.pas',
  Shapes.Implementor.ASCII in 'Shapes.Implementor.ASCII.pas',
  Shapes.Implementor in 'Shapes.Implementor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBridge, frmBridge);
  Application.Run;
end.
