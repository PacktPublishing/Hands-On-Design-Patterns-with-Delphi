program LockStriping;

uses
  Vcl.Forms,
  LockStripingMain in 'LockStripingMain.pas' {frmLockStriping},
  LockStripingArray in 'LockStripingArray.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLockStriping, frmLockStriping);
  Application.Run;
end.
