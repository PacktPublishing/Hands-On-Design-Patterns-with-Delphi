unit NullLoggerMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Logger.Intf;

type
  TfrmNullLogger = class(TForm)
    btnFileLogger: TButton;
    btnListBoxLogger: TButton;
    btnNullLogger: TButton;
    lbLog: TListBox;
    procedure btnFileLoggerClick(Sender: TObject);
    procedure btnListBoxLoggerClick(Sender: TObject);
    procedure btnNullLoggerClick(Sender: TObject);
  strict protected
    procedure Test(const logger: ILogger);
    procedure TestWithLogger(const logger: ILogger);
  end;

var
  frmNullLogger: TfrmNullLogger;

implementation

uses
  Logger.TextFile, Logger.ListBox, Logger.Null;

{$R *.dfm}

procedure TfrmNullLogger.btnFileLoggerClick(Sender: TObject);
begin
  TestWithLogger(TFileLogger.Create(ChangeFileExt(ParamStr(0), '.log')));
end;

procedure TfrmNullLogger.btnListBoxLoggerClick(Sender: TObject);
begin
  TestWithLogger(TListBoxLogger.Create(lbLog));
end;

procedure TfrmNullLogger.btnNullLoggerClick(Sender: TObject);
begin
  TestWithLogger(TNullLogger.Create);
end;

procedure TfrmNullLogger.Test(const logger: ILogger);
var
  i: Integer;
begin
  logger.Log('Starting test');
  for i := 1 to 10 do
    logger.Log('Step: %d', [i]);
  logger.Log('Test completed');
end;

procedure TfrmNullLogger.TestWithLogger(const logger: ILogger);
begin
  if not logger.Initialize then
    raise Exception.Create('Failed to initialize logger');

  Test(logger);
  logger.Close;
end;

end.
