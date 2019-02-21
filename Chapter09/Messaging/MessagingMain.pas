unit MessagingMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  ThreadedFooBar.WindowsMsg,
  ThreadedFooBar.Polling;

const
  WM_FOOBAR_MSG = WM_USER;

type
  TfrmMessaging = class(TForm)
    btnWindowsMsg: TButton;
    btnQueue: TButton;
    btnSynchronize: TButton;
    btnPolling: TButton;
    memoLog: TMemo;
    tmrPollThread: TTimer;
    procedure btnPollingClick(Sender: TObject);
    procedure btnQueueClick(Sender: TObject);
    procedure btnSynchronizeClick(Sender: TObject);
    procedure btnWindowsMsgClick(Sender: TObject);
    procedure tmrPollThreadTimer(Sender: TObject);
  private
    FPollingFooBar: TPollingFooBarThread;
    procedure MsgFooBar(var msg: TMessage); message WM_FOOBAR_MSG;
    procedure PollingFooBarTerminated(Sender: TObject);
  public
  end;

var
  frmMessaging: TfrmMessaging;

implementation

uses
  ThreadedFooBar.Queue,
  ThreadedFooBar.Synchronize;

{$R *.dfm}

procedure TfrmMessaging.btnPollingClick(Sender: TObject);
begin
  FPollingFooBar := TPollingFooBarThread.Create(true);
  FPollingFooBar.OnTerminate := PollingFooBarTerminated;
  FPollingFooBar.Start;
  btnPolling.Enabled := false;
  tmrPollThread.Enabled := true;
end;

procedure TfrmMessaging.btnQueueClick(Sender: TObject);
var
  fooBar: TQueueFooBarThread;
begin
  fooBar := TQueueFooBarThread.Create(true);
  fooBar.OnNewValue :=
    procedure (value: string)
    begin
      memoLog.Text := memoLog.Text + value + ' ';
    end;
  fooBar.OnTerminated :=
    procedure
    begin
      fooBar.Free;
    end;
  fooBar.Start;
end;

procedure TfrmMessaging.btnSynchronizeClick(Sender: TObject);
var
  fooBar: TSynchronizeFooBarThread;
begin
  fooBar := TSynchronizeFooBarThread.Create(true);
  fooBar.OnNewValue :=
    procedure (value: string)
    begin
      memoLog.Text := memoLog.Text + value + ' ';
    end;
  fooBar.OnTerminated :=
    procedure
    begin
      fooBar.Free;
    end;
  fooBar.Start;
end;

procedure TfrmMessaging.btnWindowsMsgClick(Sender: TObject);
var
  fooBar: TWindowsMsgFooBarThread;
begin
  fooBar := TWindowsMsgFooBarThread.Create(Handle, WM_FOOBAR_MSG, true);
  fooBar.FreeOnTerminate := true;
  fooBar.Start;
end;

procedure TfrmMessaging.MsgFooBar(var msg: TMessage);
var
  oMsg: TFooBarMessage;
begin
  oMsg := TFooBarMessage(msg.WParam);
  memoLog.Text := memoLog.Text + oMsg.Value + ' ';
  oMsg.Free;
end;

procedure TfrmMessaging.PollingFooBarTerminated(Sender: TObject);
begin
  tmrPollThread.Enabled := false;
  tmrPollThreadTimer(nil);
  FPollingFooBar.Terminate;
  FPollingFooBar := nil;
  btnPolling.Enabled := true;
end;

procedure TfrmMessaging.tmrPollThreadTimer(Sender: TObject);
begin
  while FPollingFooBar.MessageQueue.QueueSize > 0 do
    memoLog.Text := memoLog.Text + FPollingFooBar.MessageQueue.PopItem + ' ';
end;

end.
