program Messaging;

uses
  Vcl.Forms,
  MessagingMain in 'MessagingMain.pas' {frmMessaging},
  ThreadedFooBar in 'ThreadedFooBar.pas',
  ThreadedFooBar.WindowsMsg in 'ThreadedFooBar.WindowsMsg.pas',
  ThreadedFooBar.Queue in 'ThreadedFooBar.Queue.pas',
  ThreadedFooBar.Synchronize in 'ThreadedFooBar.Synchronize.pas',
  ThreadedFooBar.Polling in 'ThreadedFooBar.Polling.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMessaging, frmMessaging);
  Application.Run;
end.
