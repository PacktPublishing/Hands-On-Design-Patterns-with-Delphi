program NullLogger;

uses
  Vcl.Forms,
  NullLoggerMain in 'NullLoggerMain.pas' {frmNullLogger},
  Logger.Intf in 'Logger.Intf.pas',
  Logger.ListBox in 'Logger.ListBox.pas',
  Logger.Null in 'Logger.Null.pas',
  Logger.TextFile in 'Logger.TextFile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmNullLogger, frmNullLogger);
  Application.Run;
end.
