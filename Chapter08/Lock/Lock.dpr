program Lock;

uses
  Vcl.Forms,
  LockMain in 'LockMain.pas' {frmLock};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLock, frmLock);
  Application.Run;
end.
