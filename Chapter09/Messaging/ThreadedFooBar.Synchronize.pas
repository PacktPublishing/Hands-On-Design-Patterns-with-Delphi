unit ThreadedFooBar.Synchronize;

interface

uses
  System.SysUtils,
  ThreadedFooBar;

type
  TSynchronizeFooBarThread = class(TFooBarThread)
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

procedure TSynchronizeFooBarThread.Execute;
begin
  inherited;
  OnTerminated();
end;

procedure TSynchronizeFooBarThread.SendMessage(const msg: string);
begin
  TThread.Synchronize(nil,
    procedure
    begin
      OnNewValue(msg);
    end);
end;

end.
