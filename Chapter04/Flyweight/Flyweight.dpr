program Flyweight;

uses
  Vcl.Forms,
  FlyweightMain in 'FlyweightMain.pas' {frmFlyweight},
  Customer in 'Customer.pas',
  Company in 'Company.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFlyweight, frmFlyweight);
  Application.Run;
end.
