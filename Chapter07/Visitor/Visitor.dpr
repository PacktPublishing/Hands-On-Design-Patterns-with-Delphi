program Visitor;

uses
  Vcl.Forms,
  VisitorMain in 'VisitorMain.pas' {frmVisitor},
  ComponentModel in 'ComponentModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVisitor, frmVisitor);
  Application.Run;
end.
