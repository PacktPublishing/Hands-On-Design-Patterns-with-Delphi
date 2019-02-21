program SpringMulticast;

uses
  Vcl.Forms,
  SpringMulticastMain in 'SpringMulticastMain.pas' {frmSpringMulticast},
  SpringMulticastModel in 'SpringMulticastModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSpringMulticast, frmSpringMulticast);
  Application.Run;
end.
