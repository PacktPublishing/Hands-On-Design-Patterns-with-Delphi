program PrototypeRecord;

uses
  Vcl.Forms,
  PrototypeRecordMain in 'PrototypeRecordMain.pas' {frmPrototypeRecord},
  Prototype.Rec in 'Prototype.Rec.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrototypeRecord, frmPrototypeRecord);
  Application.Run;
end.
