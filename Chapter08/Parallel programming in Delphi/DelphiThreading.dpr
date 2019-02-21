program DelphiThreading;

uses
  Vcl.Forms,
  DelphiThreadingMain in 'DelphiThreadingMain.pas' {frmDelphiThreading};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDelphiThreading, frmDelphiThreading);
  Application.Run;
end.
