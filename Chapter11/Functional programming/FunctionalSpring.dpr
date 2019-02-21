program FunctionalSpring;

uses
  Vcl.Forms,
  FunctionalSpringMain in 'FunctionalSpringMain.pas' {frmFunctionalSpring};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFunctionalSpring, frmFunctionalSpring);
  Application.Run;
end.
