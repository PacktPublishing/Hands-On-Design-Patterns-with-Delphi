program ThreadPool;

uses
  Vcl.Forms,
  ThreadPoolMain in 'ThreadPoolMain.pas' {frmThreadPool};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmThreadPool, frmThreadPool);
  Application.Run;
end.
