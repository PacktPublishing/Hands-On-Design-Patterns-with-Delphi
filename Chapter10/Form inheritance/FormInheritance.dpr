program FormInheritance;

uses
  Vcl.Forms,
  FormInheritanceMain in 'FormInheritanceMain.pas' {frmMain},
  BaseDialogForm in 'BaseDialogForm.pas' {frmBaseDialog},
  DialogForm1 in 'DialogForm1.pas' {frmBaseDialog1},
  DialogForm2 in 'DialogForm2.pas' {frmBaseDialog2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmBaseDialog, frmBaseDialog);
  Application.CreateForm(TfrmDialog1, frmDialog1);
  Application.CreateForm(TfrmDialog2, frmDialog2);
  Application.Run;
end.
