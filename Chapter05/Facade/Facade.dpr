program Facade;

uses
  Vcl.Forms,
  FacadeMain in 'FacadeMain.pas' {frmFacade},
  RSSReader in 'RSSReader.pas',
  RSSParser in 'RSSParser.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFacade, frmFacade);
  Application.Run;
end.
