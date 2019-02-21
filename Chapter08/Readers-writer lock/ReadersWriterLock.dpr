program ReadersWriterLock;

uses
  Vcl.Forms,
  ReadersWriterMain in 'ReadersWriterMain.pas' {frmReadersWriter},
  SlimReaderWriter in 'SlimReaderWriter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmReadersWriter, frmReadersWriter);
  Application.Run;
end.
