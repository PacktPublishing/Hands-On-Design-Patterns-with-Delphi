program OptimisticLocking;

uses
  Vcl.Forms,
  OptimisticLockingMain in 'OptimisticLockingMain.pas' {frmOptimistic};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmOptimistic, frmOptimistic);
  Application.Run;
end.
