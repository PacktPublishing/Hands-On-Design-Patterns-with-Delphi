program SpringObserver;

uses
  Vcl.Forms,
  SpringObserverMain in 'SpringObserverMain.pas' {frmSpringObserver},
  SpringObservedModel in 'SpringObservedModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSpringObserver, frmSpringObserver);
  Application.Run;
end.
