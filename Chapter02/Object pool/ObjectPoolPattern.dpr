program ObjectPoolPattern;

uses
  Vcl.Forms,
  ObjectPoolMain in 'ObjectPoolMain.pas' {frmObjectPool},
  ObjectPool.StockQuotePool in 'ObjectPool.StockQuotePool.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmObjectPool, frmObjectPool);
  Application.Run;
end.
