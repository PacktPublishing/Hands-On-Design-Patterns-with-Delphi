program CustomIterators;

uses
  Vcl.Forms,
  CustomIteratorsMain in 'CustomIteratorsMain.pas' {frmIterator},
  CustomIterators.TextFile.IEnumerable in 'CustomIterators.TextFile.IEnumerable.pas',
  CustomIterators.TextFile.TEnumerable in 'CustomIterators.TextFile.TEnumerable.pas',
  CustomIterators.DynArray in 'CustomIterators.DynArray.pas',
  CustomIterators.Filter in 'CustomIterators.Filter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmIterator, frmIterator);
  Application.Run;
end.
