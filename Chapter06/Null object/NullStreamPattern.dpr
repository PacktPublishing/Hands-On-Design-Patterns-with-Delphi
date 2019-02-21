program NullStreamPattern;

uses
  Vcl.Forms,
  NullStreamMain in 'NullStreamMain.pas' {frmNullObject},
  NullStream in 'NullStream.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmNullObject, frmNullObject);
  Application.Run;
end.
