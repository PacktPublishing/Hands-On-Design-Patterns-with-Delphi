program LazyInitializationSpring4D;

uses
  Vcl.Forms,
  LazySpring4DMain in 'LazySpring4DMain.pas' {frmLazySpring4DMain},
  LazySpring4D.Lazy in 'LazySpring4D.Lazy.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLazySpring4DMain, frmLazySpring4DMain);
  Application.Run;
end.
