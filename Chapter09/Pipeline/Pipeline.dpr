program Pipeline;

uses
  Vcl.Forms,
  PipelineMain in 'PipelineMain.pas' {frmPipeline},
  WebSpider in 'WebSpider.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPipeline, frmPipeline);
  Application.Run;
end.
