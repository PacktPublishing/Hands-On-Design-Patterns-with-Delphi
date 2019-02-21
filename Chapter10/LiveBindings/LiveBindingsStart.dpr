program LiveBindingsStart;

uses
  System.StartUpCopy,
  FMX.Forms,
  LiveBindingsStartMain in 'LiveBindingsStartMain.pas' {frmLiveBindings};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLiveBindings, frmLiveBindings);
  Application.Run;
end.
