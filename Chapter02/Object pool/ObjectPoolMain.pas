unit ObjectPoolMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  ObjectPool.StockQuotePool;

type
  TfrmObjectPool = class(TForm)
    btnGetData1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    inpSymbol1: TEdit;
    btnGetData2: TButton;
    Label2: TLabel;
    inpSymbol2: TEdit;
    btnGetData3: TButton;
    Label3: TLabel;
    inpSymbol3: TEdit;
    btnGetAll: TButton;
    Label4: TLabel;
    procedure btnGetAllClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGetData1Click(Sender: TObject);
    procedure btnGetData2Click(Sender: TObject);
    procedure btnGetData3Click(Sender: TObject);
  private
    FStockQuotePool: TStockQuotePool;
    procedure QuerySymbol(const symbol: string);
    procedure Log(const msg: string);
  public
  end;

var
  frmObjectPool: TfrmObjectPool;

implementation

{$R *.dfm}

procedure TfrmObjectPool.btnGetAllClick(Sender: TObject);
begin
  btnGetData1.Click;
  btnGetData2.Click;
  btnGetData3.Click;
end;

procedure TfrmObjectPool.FormCreate(Sender: TObject);
begin
  FStockQuotePool := TStockQuotePool.Create(2);
end;

procedure TfrmObjectPool.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FStockQuotePool);
end;

procedure TfrmObjectPool.btnGetData1Click(Sender: TObject);
begin
  QuerySymbol(inpSymbol1.Text);
end;

procedure TfrmObjectPool.btnGetData2Click(Sender: TObject);
begin
  QuerySymbol(inpSymbol2.Text);
end;

procedure TfrmObjectPool.btnGetData3Click(Sender: TObject);
begin
  QuerySymbol(inpSymbol3.Text);
end;

procedure TfrmObjectPool.Log(const msg: string);
begin
  Memo1.Text := Memo1.Text + msg + #13#10;
  Memo1.SelStart:=Length(Memo1.Text);
  Memo1.SelLength:=0;
  SendMessage(Memo1.Handle, EM_SCROLLCARET, 0, 0);
end;

procedure TfrmObjectPool.QuerySymbol(const symbol: string);
var
  connection: TStockQuoteConnection;
begin
  connection := FStockQuotePool.GetConnection;
  if not assigned(connection) then
    Log(symbol + ': All connections are busy!'#13#10)
  else
    connection.Query(symbol,
      procedure (const symbol, response: string)
      begin
        Log(Format('%s [%p]', [symbol, pointer(connection)]) + #13#10 + response + #13#10);
        FStockQuotePool.ReleaseConnection(connection);
      end);
end;

end.
