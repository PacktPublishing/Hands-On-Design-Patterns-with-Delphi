program BuilderFluent;

uses
  Vcl.Forms,
  BuilderFluentMain in 'BuilderFluentMain.pas' {frmBuilderFluent},
  DataBuilderFluent.Intf in 'DataBuilderFluent.Intf.pas',
  DataBuilderFluent.JSON in 'DataBuilderFluent.JSON.pas',
  DataBuilderFluent.XML in 'DataBuilderFluent.XML.pas',
  IndentedBuilder in 'IndentedBuilder.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBuilderFluent, frmBuilderFluent);
  Application.Run;
end.
