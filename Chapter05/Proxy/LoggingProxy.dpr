program LoggingProxy;

uses
  Vcl.Forms,
  LoggingProxyMain in 'LoggingProxyMain.pas' {frmProxy};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmProxy, frmProxy);
  Application.Run;
end.
