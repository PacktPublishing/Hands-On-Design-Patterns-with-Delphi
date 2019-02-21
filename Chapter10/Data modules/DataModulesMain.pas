unit DataModulesMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ActnList,
  DataModulePatterns;

type
  TfrmDataModulesMain = class(TForm)
    btnLoadDM: TButton;
    btnOpenData: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    lbLog: TListBox;
    ActionList1: TActionList;
    actLoadDM: TAction;
    actOpenData: TAction;
    actGetChapters: TAction;
    actGetPatterns: TAction;
    actCloseData: TAction;
    actUnloadDM: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure actCloseDataExecute(Sender: TObject);
    procedure actGetChaptersExecute(Sender: TObject);
    procedure actGetPatternsExecute(Sender: TObject);
    procedure actLoadDMUpdate(Sender: TObject);
    procedure actOpenDataExecute(Sender: TObject);
    procedure actOpenDataUpdate(Sender: TObject);
    procedure actUnloadDMExecute(Sender: TObject);
    procedure actUnloadDMUpdate(Sender: TObject);
    procedure btnLoadDMClick(Sender: TObject);
    procedure RequiresOpenDataSet(Sender: TObject);
  private
    FChapters: IChapters;
    FChaptersDM: TDataModule;
    procedure UnloadDataModule;
  public
  end;

var
  frmDataModulesMain: TfrmDataModulesMain;

implementation

{$R *.dfm}

procedure TfrmDataModulesMain.FormDestroy(Sender: TObject);
begin
  UnloadDataModule;
end;

procedure TfrmDataModulesMain.actCloseDataExecute(Sender: TObject);
begin
  FChapters.Close;
end;

procedure TfrmDataModulesMain.actGetChaptersExecute(Sender: TObject);
var
  chapter: integer;
begin
  for chapter in FChapters.Chapters do
    lbLog.Items.Add(Format('%d. %s', [chapter, FChapters.GetTitle(chapter)]));
end;

procedure TfrmDataModulesMain.actGetPatternsExecute(Sender: TObject);
var
  category: string;
  chapter: integer;
  patterns: TArray<string>;
begin
  for chapter in FChapters.Chapters do
  begin
    category := FChapters.GetCategory(chapter);
    patterns := FChapters.GetPatterns(chapter);
    if (category <> '') or (Length(patterns) > 0) then
      lbLog.Items.Add(Format('%d: [%s] %s', [chapter, category, string.Join('/', patterns)]));
  end;
end;

procedure TfrmDataModulesMain.actLoadDMUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not assigned(FChapters);
end;

procedure TfrmDataModulesMain.actOpenDataExecute(Sender: TObject);
var
  err: string;
begin
  err := FChapters.Open;
  if err <> '' then
    lbLog.Items.Add('Failed to open data source. ' + err);
end;

procedure TfrmDataModulesMain.actOpenDataUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := assigned(FChapters) and (not FChapters.IsOpen);
end;

procedure TfrmDataModulesMain.actUnloadDMExecute(Sender: TObject);
begin
  UnloadDataModule;
end;

procedure TfrmDataModulesMain.actUnloadDMUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := assigned(FChapters);
end;

procedure TfrmDataModulesMain.btnLoadDMClick(Sender: TObject);
begin
  FChaptersDM := TdmChapters.Create(nil);
  FChapters := FChaptersDM as IChapters;
end;

procedure TfrmDataModulesMain.RequiresOpenDataSet(Sender: TObject);
begin
  (Sender as TAction).Enabled := assigned(FChapters) and FChapters.IsOpen;
end;

procedure TfrmDataModulesMain.UnloadDataModule;
begin
  if assigned(FChapters) then begin
    FChapters.Close;
    FChapters := nil;
    FreeAndNil(FChaptersDM);
  end;
end;

end.
