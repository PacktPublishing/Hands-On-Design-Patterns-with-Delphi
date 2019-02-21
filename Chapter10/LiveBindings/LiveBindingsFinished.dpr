program LiveBindingsFinished;

uses
  System.StartUpCopy,
  FMX.Forms,
  LiveBindingsFinishedMain in 'LiveBindingsFinishedMain.pas' {frmLiveBindings};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLiveBindings, frmLiveBindings);
  Application.Run;
end.
