program Marker;

uses
  Vcl.Forms,
  MarkerMain in 'MarkerMain.pas' {frmMarker},
  Customer.Interfaces in 'Customer.Interfaces.pas',
  Customer.Attributes in 'Customer.Attributes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMarker, frmMarker);
  Application.Run;
end.
