program MementoEditor;

uses
  Vcl.Forms,
  EditorMain in 'EditorMain.pas' {frmMemento},
  Editor.Commands in 'Editor.Commands.pas',
  Editor.Editor in 'Editor.Editor.pas',
  Memo.Memento in 'Memo.Memento.pas',
  MementoExample in 'MementoExample.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMemento, frmMemento);
  Application.Run;
end.
