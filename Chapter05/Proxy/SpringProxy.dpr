program SpringProxy;

uses
  Vcl.Forms,
  SpringProxyMain in 'SpringProxyMain.pas' {frmProxy};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmProxy, frmProxy);
  Application.Run;
end.
