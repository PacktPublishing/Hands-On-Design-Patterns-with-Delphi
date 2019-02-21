program Events;

uses
  Vcl.Forms,
  EventsMain in 'EventsMain.pas' {frmEvents},
  DeltaTime in 'DeltaTime.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEvents, frmEvents);
  Application.Run;
end.
