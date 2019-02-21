program UIHostVCL;

uses
  Vcl.Forms,
  UIHostVCLMain in 'UIHostVCLMain.pas' {frmVCLHost},
  AbstractEBLForm in 'AbstractEBLForm.pas',
  FormFactory.Intf in 'FormFactory.Intf.pas',
  FormFactory.VCL in 'FormFactory.VCL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVCLHost, frmVCLHost);
  Application.Run;
end.
