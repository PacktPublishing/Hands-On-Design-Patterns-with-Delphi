program SingletonPattern;

uses
  Vcl.Forms,
  SingletonPatternMain in 'SingletonPatternMain.pas' {frmSingleton},
  Singleton_HiddenCreate in 'Singleton_HiddenCreate.pas',
  Singleton_ClassVar in 'Singleton_ClassVar.pas',
  Singleton_GlobalVar in 'Singleton_GlobalVar.pas',
  Singleton_Class in 'Singleton_Class.pas',
  Singleton_NewInstance in 'Singleton_NewInstance.pas',
  Singleton_NewInstanceCounted in 'Singleton_NewInstanceCounted.pas',
  Singleton_Factory in 'Singleton_Factory.pas',
  SingletonPatternSecondary in 'SingletonPatternSecondary.pas' {frmSecondary};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSingleton, frmSingleton);
  Application.Run;
end.
