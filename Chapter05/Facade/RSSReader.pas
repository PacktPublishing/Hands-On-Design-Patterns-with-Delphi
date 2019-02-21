unit RSSReader;

interface

uses
  System.Generics.Collections,
  RSSParser;

type
  {$SCOPEDENUMS ON}
  TRSSerror = (OK, GetFailed, CantReadFile, InvalidFormat);
  {$SCOPEDENUMS OFF}

  TRSSReader = class
  strict private
    FItems: TList<TRSSItem>;
    FRSS: string;
  strict protected
    function Parse(const sRss: string): TRSSError;
  public
    constructor Create;
    destructor Destroy; override;
    function ReadFromURL(const url: string): TRSSError;
    function ReadFromFile(const fileName: string): TRSSError;
    property Items: TList<TRSSItem> read FItems;
    property RSS: string read FRSS;
  end;

implementation

uses
  System.SysUtils, System.Classes,
  System.Net.HttpClient;

{ TRSSReader }

constructor TRSSReader.Create;
begin
  inherited;
  FItems := TList<TRSSItem>.Create;
end;

destructor TRSSReader.Destroy;
begin
  FreeAndNil(FItems);
  inherited;
end;

function TRSSReader.Parse(const sRss: string): TRSSError;
var
  parser: TRSSParser;
begin
  Result := TRSSError.OK;
  FRSS := sRss;
  parser := TRSSParser.Create;
  try
    if not parser.ParseRSS(FRSS, FItems) then
      Result := TRSSError.InvalidFormat;
  finally
    FreeAndNil(parser);
  end;
end;

function TRSSReader.ReadFromFile(const fileName: string): TRSSError;
var
  reader: TStreamReader;
begin
  Result := TRSSError.OK;
  FItems.Clear;

  try
    reader := TStreamReader.Create(fileName, true);
  except
    on EFOpenError do begin
      Result := TRSSError.CantReadFile;
      Exit;
    end;
  end;

  try
    Result := Parse(reader.ReadToEnd);
  finally
    FreeAndNil(reader);
  end;
end;

function TRSSReader.ReadFromURL(const url: string): TRSSError;
var
  httpClient: THttpClient;
  response: IHTTPResponse;
begin
  Result := TRSSError.OK;
  FItems.Clear;

  httpClient := THttpClient.Create;
  try
    response := httpClient.Get('https://www.beginend.net/api/recent.rss.dws');
    if response.StatusCode <> 200 then
      Exit(TRSSError.GetFailed);

    Result := Parse(response.ContentAsString);
  finally
    FreeAndNil(httpClient);
  end;
end;

end.
