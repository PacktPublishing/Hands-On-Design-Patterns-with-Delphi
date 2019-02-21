program OptimisticLockingSpeedTest;

uses
  Vcl.Forms,
  OptimisticLockingSpeedTestMain in 'OptimisticLockingSpeedTestMain.pas' {frmOptimistic};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmOptimistic, frmOptimistic);
  Application.Run;
end.
