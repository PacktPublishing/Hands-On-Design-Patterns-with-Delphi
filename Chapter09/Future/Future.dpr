program Future;

uses
  Vcl.Forms,
  FutureMain in 'FutureMain.pas' {frmFuture};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFuture, frmFuture);
  Application.Run;
end.
