program HandMadeIterators;

uses
  Vcl.Forms,
  HandMadeMain in 'HandMadeMain.pas' {frmHandMade};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHandMade, frmHandMade);
  Application.Run;
end.
