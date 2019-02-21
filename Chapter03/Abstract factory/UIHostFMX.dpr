program UIHostFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  UIHostFMXMain in 'UIHostFMXMain.pas' {frmFMXHost},
  FormFactory.FMX in 'FormFactory.FMX.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFMXHost, frmFMXHost);
  Application.Run;
end.
