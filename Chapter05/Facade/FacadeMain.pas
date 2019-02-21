unit FacadeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  RSSParser, RSSReader;

type
  TfrmFacade = class(TForm)
    btnReadRSSWeb: TButton;
    lbTitles: TListBox;
    inpLink: TEdit;
    btnOpenLink: TButton;
    inpDescription: TMemo;
    btnReadRSSFile: TButton;
    FileSaveDialog1: TFileSaveDialog;
    FileOpenDialog1: TFileOpenDialog;
    procedure btnOpenLinkClick(Sender: TObject);
    procedure btnReadRSSFileClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnReadRSSWebClick(Sender: TObject);
    procedure lbTitlesClick(Sender: TObject);
  private
    FItems: TList<TRSSItem>;
    procedure LoadItems;
    function ShowResult(rssResult: TRSSError; reader: TRSSReader): boolean;
  strict protected
    procedure SaveToFile(const fileName, sRSS: string);
  public
  end;

var
  frmFacade: TfrmFacade;

implementation

{$R *.dfm}

const
  CBeginEndURL = 'https://www.beginend.net/api/recent.rss.dws';

procedure TfrmFacade.btnOpenLinkClick(Sender: TObject);
begin
  if inpLink.Text <> '' then
    ShellExecute(0, 'open', PChar(inpLink.text), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmFacade.btnReadRSSFileClick(Sender: TObject);
var
  reader: TRSSReader;
begin
  if not FileOpenDialog1.Execute then
    Exit;

  reader := TRSSReader.Create;
  try
    ShowResult(reader.ReadFromFile(FileOpenDialog1.FileName), reader);
  finally
    FreeAndNil(reader);
  end;
end;

procedure TfrmFacade.btnReadRSSWebClick(Sender: TObject);
var
  reader: TRSSReader;
begin
  reader := TRSSReader.Create;
  try
    if ShowResult(reader.ReadFromURL(CBeginEndURL), reader) then
      if FileSaveDialog1.Execute then
        SaveToFile(FileSaveDialog1.FileName, reader.RSS);
  finally
    FreeAndNil(reader);
  end;
end;

procedure TfrmFacade.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FItems);
end;

procedure TfrmFacade.FormCreate(Sender: TObject);
begin
  FItems := TList<TRSSItem>.Create;
end;

procedure TfrmFacade.lbTitlesClick(Sender: TObject);
begin
  inpLink.Text := FItems[lbTitles.ItemIndex].Link;
  inpDescription.Text := FItems[lbTitles.ItemIndex].Description;
end;

procedure TfrmFacade.LoadItems;
var
  i: integer;
begin
  lbTitles.Items.BeginUpdate;
  try
    for i := 0 to FItems.Count - 1 do
      lbTitles.Items.Add(FItems[i].Title);
  finally
    lbTitles.Items.EndUpdate;
  end;
end;

procedure TfrmFacade.SaveToFile(const fileName, sRSS: string);
var
  writer: TStreamWriter;
begin
  writer := TStreamWriter.Create(fileName);
  try
    writer.Write(sRSS);
  finally
    FreeAndNil(writer);
  end;
end;

function TfrmFacade.ShowResult(rssResult: TRSSError; reader: TRSSReader): boolean;
begin
  Result := false;
  lbTitles.Items.Clear;
  inpLink.Clear;
  inpDescription.Clear;
  FItems.Clear;

  case rssResult of
    TRSSerror.OK:
      begin
        FItems.Clear;
        FItems.AddRange(reader.Items);
        LoadItems;
        Result := true;
      end;
    TRSSerror.GetFailed:     ShowMessage('GET failed');
    TRSSerror.CantReadFile:  ShowMessage('Failed to read from file');
    TRSSerror.InvalidFormat: ShowMessage('Invalid RSS format');
    else raise Exception.Create('Unexpected result!');
  end;
end;

end.
