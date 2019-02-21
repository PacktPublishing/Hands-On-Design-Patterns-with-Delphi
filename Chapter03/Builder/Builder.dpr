program Builder;

uses
  Vcl.Forms,
  DataBuilder.Intf in 'DataBuilder.Intf.pas',
  DataBuilder.JSON in 'DataBuilder.JSON.pas',
  DataBuilder.XML in 'DataBuilder.XML.pas',
  DataBuilder.Indented in 'DataBuilder.Indented.pas',
  BuilderMain in 'BuilderMain.pas' {frmBuilder};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBuilder, frmBuilder);
  Application.CreateForm(TfrmBuilder, frmBuilder);
  Application.Run;
end.
