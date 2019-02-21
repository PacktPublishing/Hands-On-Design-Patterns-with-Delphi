program TemplateMethod;

uses
  Vcl.Forms,
  TemplateMethodMain in 'TemplateMethodMain.pas' {frmTemplateMethod},
  DataAggregator.Template in 'DataAggregator.Template.pas',
  DataAggregator.DynArray in 'DataAggregator.DynArray.pas',
  DataAggregator.TextFile in 'DataAggregator.TextFile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTemplateMethod, frmTemplateMethod);
  Application.Run;
end.
