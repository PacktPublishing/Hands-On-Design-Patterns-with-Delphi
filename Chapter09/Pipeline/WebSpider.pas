unit WebSpider;

interface

uses
  System.SysUtils, System.Classes, System.SyncObjs, System.Threading,
  System.Generics.Collections, System.Net.HttpClient, System.RegularExpressions;

type
  TWebSpider = class
  public type
    THttpPage = TPair<string,IHTTPResponse>;
  strict private
    FHtmlParseInput : TThreadedQueue<THttpPage>;
    FHttpGetInput   : TThreadedQueue<string>;
    FOnFinished     : TProc;
    FOnPageProcessed: TProc<string>;
    FPageCount      : integer;
    FPipelineInput  : TThreadedQueue<string>;
    FTasks          : TList<ITask>;
    FThreadPool     : TThreadPool;
  strict protected
    procedure Asy_UniqueFilter(baseUrl: string;
      inQueue, outQueue: TThreadedQueue<string>);
    procedure Asy_HttpGet(inQueue: TThreadedQueue<string>;
      outQueue: TThreadedQueue<THttpPage>);
    procedure Asy_HtmlParse(inQueue: TThreadedQueue<THttpPage>;
      outQueue: TThreadedQueue<string>);
    procedure NotifyFinished;
    procedure NotifyPageProcessed(const url: string);
  public
    procedure Start(const baseUrl: string);
    procedure Stop;
    property OnPageProcessed: TProc<string> read FOnPageProcessed write FOnPageProcessed;
    property OnFinished: TProc read FOnFinished write FOnFinished;
  end;

implementation

uses
  Windows;

{ TWebSpider }

procedure TWebSpider.Asy_HttpGet(
  inQueue: TThreadedQueue<string>;
  outQueue: TThreadedQueue<THttpPage>);
var
  httpClient: THTTPClient;
  response: IHTTPResponse;
  url: string;
begin
  TThread.NameThreadForDebugging('Http get');

  httpClient := THTTPClient.Create;
  try
    while inQueue.PopItem(url) = wrSignaled do
    begin
      if inQueue.ShutDown then
        break; //while

      try
        response := httpClient.Get(url);
      except
        if TInterlocked.Decrement(FPageCount) = 0 then
          NotifyFinished;
      end;

      if (response.StatusCode div 100) = 2 then
        outQueue.PushItem(THttpPage.Create(url, response))
      else if TInterlocked.Decrement(FPageCount) = 0 then
        NotifyFinished;
    end;
    outQueue.DoShutDown;
  finally
    FreeAndNil(httpClient);
  end;
end;

procedure TWebSpider.Asy_HtmlParse(inQueue: TThreadedQueue<THttpPage>;
  outQueue: TThreadedQueue<string>);
var
  hrefMatch: TRegEx;
  match: TMatch;
  page: THttpPage;
begin
  TThread.NameThreadForDebugging('Html parse');

  hrefMatch := TRegEx.Create('<a href="(.*?)"\s.*?>', [roIgnoreCase, roMultiLine]);
  while inQueue.PopItem(page) = wrSignaled do
  begin
    if inQueue.ShutDown then
      break; //while

    try
      match := hrefMatch.Match(page.Value.ContentAsString);
      while match.Success do
      begin
        if outQueue.ShutDown then
          break; //while;
        TInterlocked.Increment(FPageCount);
        outQueue.PushItem(match.Groups[1].Value);
        match := match.NextMatch;
      end;
    except
    end;

    NotifyPageProcessed(page.Key);
    if TInterlocked.Decrement(FPageCount) = 0 then
      NotifyFinished;
  end;
end;

procedure TWebSpider.Asy_UniqueFilter(baseUrl: string;
  inQueue, outQueue: TThreadedQueue<string>);
var
  baseUrl2: string;
  url: string;
  visitedPages: TStringList;
begin
  TThread.NameThreadForDebugging('Unique filter');

  visitedPages := TStringList.Create;
  try
    visitedPages.Sorted := true;
    if not (baseUrl.StartsWith('https://') or baseUrl.StartsWith('http://')) then
      baseUrl := 'http://' + baseUrl;
    if baseUrl.StartsWith('http://') then
      baseUrl2 := baseUrl.Replace('http://', 'https://')
    else
      baseUrl2 := baseUrl.Replace('https://', 'http://');

    while inQueue.PopItem(url) = wrSignaled do
    begin
      if inQueue.ShutDown then
        break; //while

      if url.IndexOf(':') < 0 then
        url := baseUrl + url;
      if (url.StartsWith(baseUrl) or url.StartsWith(baseUrl2))
         and (visitedPages.IndexOf(url) < 0) then
      begin
        visitedPages.Add(url);
        outQueue.PushItem(url);
      end
      else if TInterlocked.Decrement(FPageCount) = 0 then
        NotifyFinished;
    end;
    outQueue.DoShutDown;
  finally
    FreeAndNil(visitedPages);
  end;
end;

procedure TWebSpider.NotifyFinished;
begin
  TThread.Queue(nil,
    procedure
    begin
      if assigned(OnFinished) then
        OnFinished();
    end);
end;

procedure TWebSpider.NotifyPageProcessed(const url: string);
begin
  if assigned(OnPageProcessed) then
    TThread.Queue(nil,
      procedure
      begin
        if assigned(OnPageProcessed) then
          OnPageProcessed(url);
      end);
end;

procedure TWebSpider.Start(const baseUrl: string);
var
  i: integer;
begin
  FPipelineInput := TThreadedQueue<string>.Create(100);
  FHttpGetInput := TThreadedQueue<string>.Create;
  FHtmlParseInput := TThreadedQueue<THttpPage>.Create;

  FPageCount := 1;
  FPipelineInput.PushItem('');

  FThreadPool := TThreadPool.Create;
  FThreadPool.SetMaxWorkerThreads(TThread.ProcessorCount + 3);
  FThreadPool.SetMinWorkerThreads(TThread.ProcessorCount + 2);

  FTasks := TList<ITask>.Create;
  FTasks.Add(TTask.Run(
    procedure
    begin
      Asy_UniqueFilter(baseUrl, FPipelineInput, FHttpGetInput);
    end,
    FThreadPool));

  for i := 1 to TThread.ProcessorCount do
    FTasks.Add(TTask.Run(
      procedure
      begin
        Asy_HttpGet(FHttpGetInput, FHtmlParseInput);
      end,
    FThreadPool));

  FTasks.Add(TTask.Run(
    procedure
    begin
      Asy_HtmlParse(FHtmlParseInput, FPipelineInput);
    end,
    FThreadPool));
end;

procedure TWebSpider.Stop;
begin
  FPipelineInput.DoShutDown;
  TTask.WaitForAll(FTasks.ToArray);
  FreeAndNil(FTasks);
  FreeAndNil(FThreadPool);
end;

end.
