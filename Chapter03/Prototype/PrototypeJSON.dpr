program PrototypeJSON;

uses
  Vcl.Forms,
  PrototypeJSONMain in 'PrototypeJSONMain.pas' {frmPrototype},
  Prototype.CloneableJSON in 'Prototype.CloneableJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrototype, frmPrototype);
  Application.Run;
end.
