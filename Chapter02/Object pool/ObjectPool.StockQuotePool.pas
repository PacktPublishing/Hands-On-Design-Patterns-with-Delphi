unit ObjectPool.StockQuotePool;

interface

uses
  System.SysUtils, System.Generics.Collections,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent;

type
  TStockQuoteResponse = reference to procedure (const symbol, content: string);

  TStockQuoteConnection = class
  strict private
    FHttpClient: TNetHTTPClient;
    FResponseProc: TStockQuoteResponse;
    FSymbol: string;
  strict protected
    procedure HandleHttpRequestCompleted(const Sender: TObject; const AResponse:
      IHTTPResponse);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Query(const symbol: string; const responseProc: TStockQuoteResponse);
  end;

  TStockQuotePool = class(TInterfacedObject)
  strict private
    FMaxConnections: integer;
    FNumConnections: integer;
    FConnections   : TStack<TStockQuoteConnection>;
  public
    constructor Create(AMaxConnections: integer);
    destructor Destroy; override;
    function GetConnection: TStockQuoteConnection;
    procedure ReleaseConnection(connection: TStockQuoteConnection);
  end;

implementation

{ TStockQuotePool }

constructor TStockQuotePool.Create(AMaxConnections: integer);
begin
  inherited Create;
  FMaxConnections := AMaxConnections;
  FConnections := TStack<TStockQuoteConnection>.Create;
end;

destructor TStockQuotePool.Destroy;
begin
  while FConnections.Count > 0 do
    FConnections.Pop.Free;

  FreeAndNil(FConnections);
  inherited;
end;

function TStockQuotePool.GetConnection: TStockQuoteConnection;
begin
  if FConnections.Count > 0 then
    Exit(FConnections.Pop);

  if (FMaxConnections > 0) and (FNumConnections >= FMaxConnections) then
    Exit(nil);

  Result := TStockQuoteConnection.Create;
  Inc(FNumConnections);
end;

procedure TStockQuotePool.ReleaseConnection(connection: TStockQuoteConnection);
begin
  FConnections.Push(connection);
end;

{ TStockQuoteConnection }

constructor TStockQuoteConnection.Create;
begin
  inherited Create;
  FHttpClient := TNetHTTPClient.Create(nil);
  FHttpClient.Asynchronous := true;
  FHttpClient.OnRequestCompleted := HandleHttpRequestCompleted;
end;

destructor TStockQuoteConnection.Destroy;
begin
  FreeAndNil(FHttpClient);
  inherited;
end;

procedure TStockQuoteConnection.HandleHttpRequestCompleted(const Sender: TObject;
  const AResponse: IHTTPResponse);
begin
  if assigned(AResponse) then
    FResponseProc(FSymbol, AResponse.ContentAsString)
  else
    FResponseProc(FSymbol, '');
end;

procedure TStockQuoteConnection.Query(const symbol: string;
  const responseProc: TStockQuoteResponse);
begin
  FSymbol := symbol;
  FResponseProc := responseProc;
  FHttpClient.Get('https://api.iextrading.com/1.0/stock/' + symbol + '/quote');
end;

end.
