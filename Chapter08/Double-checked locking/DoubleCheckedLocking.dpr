program DoubleCheckedLocking;

uses
  Vcl.Forms,
  DoubleCheckedMain in 'DoubleCheckedMain.pas' {frmDoubleChecked};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDoubleChecked, frmDoubleChecked);
  Application.Run;
end.
