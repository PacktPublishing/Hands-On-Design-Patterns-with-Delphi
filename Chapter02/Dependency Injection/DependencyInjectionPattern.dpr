program DependencyInjectionPattern;

uses
  Vcl.Forms,
  DependencyInjectionMain in 'DependencyInjectionMain.pas' {frmDI},
  DataProcessing.NoDI in 'DataProcessing.NoDI.pas',
  DataProcessing.Reader in 'DataProcessing.Reader.pas',
  DataProcessing.Writer in 'DataProcessing.Writer.pas',
  DataProcessing.InjectedParam in 'DataProcessing.InjectedParam.pas',
  DataProcessing.InjectedProperties in 'DataProcessing.InjectedProperties.pas',
  DataProcessing.Factory in 'DataProcessing.Factory.pas',
  DataProcessing.ClassParams in 'DataProcessing.ClassParams.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDI, frmDI);
  Application.Run;
end.
