program Observer;

uses
  Vcl.Forms,
  ObserverMain in 'ObserverMain.pas' {frmObserver},
  ObservedModel in 'ObservedModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmObserver, frmObserver);
  Application.Run;
end.
