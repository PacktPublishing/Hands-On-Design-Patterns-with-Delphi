unit ThreadedFooBar.Polling;

interface

uses
  System.Generics.Collections,
  ThreadedFooBar;

type
  TPollingFooBarThread = class(TFooBarThread)
  strict private
    FQueue: TThreadedQueue<string>;
  strict protected
    procedure SendMessage(const msg: string); override;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    property MessageQueue: TThreadedQueue<string> read FQueue;
  end;

implementation

uses
  System.SysUtils;

procedure TPollingFooBarThread.AfterConstruction;
begin
  inherited;
  FQueue := TThreadedQueue<string>.Create(100);
end;

procedure TPollingFooBarThread.BeforeDestruction;
begin
  FreeAndNil(FQueue);
  inherited;
end;

procedure TPollingFooBarThread.SendMessage(const msg: string);
begin
  FQueue.PushItem(msg);
end;

end.
