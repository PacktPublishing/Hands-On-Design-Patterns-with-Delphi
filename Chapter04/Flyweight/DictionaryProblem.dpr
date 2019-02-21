program DictionaryProblem;

uses
  Vcl.Forms,
  DictionaryProblemMain in 'DictionaryProblemMain.pas' {frmDictProblem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDictProblem, frmDictProblem);
  Application.Run;
end.
