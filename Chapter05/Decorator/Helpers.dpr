program Helpers;

uses
  Vcl.Forms,
  HelpersMain in 'HelpersMain.pas' {frmHelpers},
  StreamHelper in 'StreamHelper.pas',
  StringHelper in 'StringHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHelpers, frmHelpers);
  Application.Run;
end.
