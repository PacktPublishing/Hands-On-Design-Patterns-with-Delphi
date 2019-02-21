program BuiltInIterators;

uses
  Vcl.Forms,
  BuiltInIteratorsMain in 'BuiltInIteratorsMain.pas' {frmIterator};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmIterator, frmIterator);
  Application.Run;
end.
