program PrototypePersistent;

uses
  Vcl.Forms,
  PrototypePersistentMain in 'PrototypePersistentMain.pas' {frmPrototype},
  Prototype.CloneablePersistent in 'Prototype.CloneablePersistent.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrototype, frmPrototype);
  Application.Run;
end.
