program State;

uses
  Vcl.Forms,
  StateMain in 'StateMain.pas' {frmState},
  UnquoteString.Classical in 'UnquoteString.Classical.pas',
  UnquoteString.State in 'UnquoteString.State.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmState, frmState);
  Application.Run;
end.
