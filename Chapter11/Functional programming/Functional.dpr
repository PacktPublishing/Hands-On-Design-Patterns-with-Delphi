program Functional;

uses
  Vcl.Forms,
  FunctionalMain in 'FunctionalMain.pas' {frmFunctional};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFunctional, frmFunctional);
  Application.Run;
end.
