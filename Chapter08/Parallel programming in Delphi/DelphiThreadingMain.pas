unit DelphiThreadingMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Threading,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
  WM_LOG = WM_USER;

type
  TfrmDelphiThreading = class(TForm)
    btnThread: TButton;
    btnFreeOnTerm: TButton;
    btnAnonymous: TButton;
    lbLog: TListBox;
    btnITask: TButton;
    btnJoin: TButton;
    btnFuture: TButton;
    btnParallelFor: TButton;
    procedure btnAnonymousClick(Sender: TObject);
    procedure btnFreeOnTermClick(Sender: TObject);
    procedure btnFutureClick(Sender: TObject);
    procedure btnThreadClick(Sender: TObject);
    procedure btnITaskClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btnParallelForClick(Sender: TObject);
  private
    FFuture: IFuture<integer>;
    FTask: ITask;
    FThread: TThread;
    FThreadFoT: TThread;
    procedure Asy_TaskWorker;
    procedure btnStopThreadClick(Sender: TObject);
    procedure MsgLog(var msg: TMessage); message WM_LOG;
    procedure ReportFuture;
    procedure ReportThreadTerminated(Sender: TObject);
  public
  end;

var
  frmDelphiThreading: TfrmDelphiThreading;

implementation

{$R *.dfm}

type
  TStandardThread = class(TThread)
  protected
    procedure Execute; override;
  end;

  TFreeOnTerminateThread = class(TThread)
  protected
    procedure Execute; override;
  end;

procedure TfrmDelphiThreading.Asy_TaskWorker;
var
  i: Integer;
  threadID: TThreadID;
begin
  threadID := GetCurrentThreadID;
  for i := 1 to 5 do
  begin
    TThread.Queue(nil,
      procedure
      begin
        lbLog.Items.Add('Task in thread ' + threadID.ToString + ' is working ...');
      end);
    Sleep(1000);
  end;
  TThread.Queue(nil,
    procedure
    begin
      lbLog.Items.Add('Task in thread ' + threadID.ToString + ' has stopped');
      FTask := nil;
    end);
end;

procedure TfrmDelphiThreading.btnAnonymousClick(Sender: TObject);
var
  thread: TThread;
begin
  thread := TThread.CreateAnonymousThread(
    procedure
    var
      i: Integer;
    begin
      for i := 1 to 5 do
      begin
        PostMessage(Handle, WM_LOG, TThread.Current.ThreadID, 0);
        Sleep(1000);
      end;
    end);
  thread.OnTerminate := ReportThreadTerminated;
  thread.Start;
end;

procedure TfrmDelphiThreading.btnFreeOnTermClick(Sender: TObject);
begin
  FThreadFoT := TFreeOnTerminateThread.Create(True);
  FThreadFoT.FreeOnTerminate := true;
  FThreadFoT.OnTerminate := ReportThreadTerminated;
  FThreadFoT.Start;
end;

procedure TfrmDelphiThreading.btnFutureClick(Sender: TObject);
begin
  FFuture := TTask.Future<integer>(
    function: Integer
    begin
      Sleep(2000);
      Result := 42;
      TThread.Queue(nil, ReportFuture);
    end);
end;

procedure TfrmDelphiThreading.btnStopThreadClick(Sender: TObject);
begin
  FThread.Terminate;
  FThread.WaitFor;
  FreeAndNil(FThread);
  btnThread.OnClick := btnThreadClick;
  btnThread.Caption := 'TThread';
end;

procedure TfrmDelphiThreading.btnThreadClick(Sender: TObject);
begin
  FThread := TStandardThread.Create;
  FThread.OnTerminate := ReportThreadTerminated;
  btnThread.OnClick := btnStopThreadClick;
  btnThread.Caption := 'Stop';
end;

procedure TfrmDelphiThreading.btnITaskClick(Sender: TObject);
begin
  FTask := TTask.Create(Asy_TaskWorker);
  FTask.Start;
end;

procedure TfrmDelphiThreading.btnJoinClick(Sender: TObject);
begin
  TParallel.Join(Asy_TaskWorker, Asy_TaskWorker);
//  TParallel.Join([procedure begin end, Asy_TaskWorker, Asy_TaskWorker]);
end;

procedure TfrmDelphiThreading.btnParallelForClick(Sender: TObject);
begin
  TParallel.For(1, 16,
    procedure (i: integer)
    begin
      PostMessage(frmDelphiThreading.Handle, WM_LOG, TThread.Current.ThreadID, i);
      Sleep(100);
    end);
end;

procedure TfrmDelphiThreading.MsgLog(var msg: TMessage);
begin
  if msg.WParam = 0 then
    lbLog.Items.Add('Thread ' + msg.WParam.ToString + ' is working ...')
  else
    lbLog.Items.Add('Item ' + msg.LParam.ToString + ' processed in thread ' + msg.WParam.ToString);
end;

procedure TfrmDelphiThreading.ReportFuture;
begin
  lbLog.Items.Add('Result = ' + FFuture.Value.ToString);
  FFuture := nil;
end;

procedure TfrmDelphiThreading.ReportThreadTerminated(Sender: TObject);
begin
  lbLog.Items.Add('Thread terminated: ' +
    (Sender as TThread).ThreadID.ToString);
end;

procedure TStandardThread.Execute;
begin
  while not Terminated do
  begin
    PostMessage(frmDelphiThreading.Handle, WM_LOG, ThreadID, 0);
    Sleep(1000);
  end;
end;

procedure TFreeOnTerminateThread.Execute;
var
  i: Integer;
begin
  for i := 1 to 3 do
  begin
    PostMessage(frmDelphiThreading.Handle, WM_LOG, ThreadID, 0);
    Sleep(1000);
  end;
end;

end.
