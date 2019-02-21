program MockingProxy;

uses
  Vcl.Forms,
  MockingProxyMain in 'MockingProxyMain.pas' {frmMocking};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMocking, frmMocking);
  Application.Run;
end.
