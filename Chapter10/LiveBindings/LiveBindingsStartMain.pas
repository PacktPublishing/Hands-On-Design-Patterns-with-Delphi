unit LiveBindingsStartMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.DB,
  Datasnap.DBClient, 
  MidasLib;

type
  TfrmLiveBindings = class(TForm)
    CDSChapters: TClientDataSet;
    CDSChaptersChapter: TIntegerField;
    CDSChaptersTitle: TStringField;
    CDSChaptersPatternGroup: TStringField;
    CDSChaptersPatterns: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
  end;

var
  frmLiveBindings: TfrmLiveBindings;

implementation

{$R *.fmx}

procedure TfrmLiveBindings.FormCreate(Sender: TObject);
begin
  if FileExists('Chapters.xml') then
    CDSChapters.LoadFromFile('Chapters.xml');
  CDSChapters.Active := true;
end;

procedure TfrmLiveBindings.FormDestroy(Sender: TObject);
begin
  CDSChapters.SaveToFile('Chapters.xml', dfXMLUTF8);
end;

end.
