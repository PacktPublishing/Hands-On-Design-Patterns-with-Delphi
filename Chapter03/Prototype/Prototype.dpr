program Prototype;

uses
  Vcl.Forms,
  PrototypeMain in 'PrototypeMain.pas' {frmPrototype},
  Prototype.Cloneable in 'Prototype.Cloneable.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrototype, frmPrototype);
  Application.Run;
end.
