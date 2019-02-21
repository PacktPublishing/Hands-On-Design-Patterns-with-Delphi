unit ThreadedFooBar.Queue;

interface

uses
  System.SysUtils,
  ThreadedFooBar;

type
  TQueueFooBarThread = class(TFooBarThread)
  strict private
    FOnNewValue: TProc<string>;
    FOnTerminated: TProc;
  strict protected
    procedure SendMessage(const msg: string); override;
  public
    procedure Execute; override;
    property OnNewValue: TProc<string> read FOnNewValue write FOnNewValue;
    property OnTerminated: TProc read FOnTerminated write FOnTerminated;
  end;

implementation

uses
  System.Classes;

procedure TQueueFooBarThread.Execute;
begin
  inherited;
  OnTerminated();
end;

procedure TQueueFooBarThread.SendMessage(const msg: string);
begin
  TThread.Queue(nil,
    procedure
    begin
      OnNewValue(msg);
    end);
end;

end.
