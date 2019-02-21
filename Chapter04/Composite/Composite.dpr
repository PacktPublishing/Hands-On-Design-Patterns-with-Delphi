program Composite;

uses
  Vcl.Forms,
  CompositeMain in 'CompositeMain.pas' {frmComposite},
  CompositeUniformity in 'CompositeUniformity.pas',
  CompositeSafety in 'CompositeSafety.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmComposite, frmComposite);
  Application.Run;
end.
