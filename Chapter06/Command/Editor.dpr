program Editor;

uses
  Vcl.Forms,
  EditorMain in 'EditorMain.pas' {frmCommand},
  Editor.Commands in 'Editor.Commands.pas',
  Editor.Editor in 'Editor.Editor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCommand, frmCommand);
  Application.Run;
end.
