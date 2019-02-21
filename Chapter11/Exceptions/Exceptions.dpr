program Exceptions;

uses
  Vcl.Forms,
  ExceptionsMain in 'ExceptionsMain.pas' {frmExceptions};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmExceptions, frmExceptions);
  Application.Run;
end.
