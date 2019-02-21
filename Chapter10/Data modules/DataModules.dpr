program DataModules;

uses
  Vcl.Forms,
  DataModulesMain in 'DataModulesMain.pas' {frmDataModulesMain},
  DataModulePatterns in 'DataModulePatterns.pas' {dmChapters: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDataModulesMain, frmDataModulesMain);
  Application.Run;
end.
