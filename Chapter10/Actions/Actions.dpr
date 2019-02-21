program Actions;

uses
  Vcl.Forms,
  ActionsMain in 'ActionsMain.pas' {frmActions};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmActions, frmActions);
  Application.Run;
end.
