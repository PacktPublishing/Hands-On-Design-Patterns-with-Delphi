program LazyInitializationPattern;

uses
  Vcl.Forms,
  LazyPatternMain in 'LazyPatternMain.pas' {frmLazyInitialization},
  Lazy.Lazy in 'Lazy.Lazy.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLazyInitialization, frmLazyInitialization);
  Application.Run;
end.
