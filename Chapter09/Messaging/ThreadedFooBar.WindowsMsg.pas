unit ThreadedFooBar.WindowsMsg;

interface

uses
  Winapi.Messages,
  Winapi.Windows,
  ThreadedFooBar;

type
  TFooBarMessage = class
  strict protected
    FValue: string;
  public
    constructor Create(const AValue: string);
    property Value: string read FValue write FValue;
  end;

  TWindowsMsgFooBarThread = class(TFooBarThread)
  strict private
    FMessage: cardinal;
    FReceiver: THandle;
  strict protected
    procedure SendMessage(const msg: string); override;
  public
    constructor Create(receiver: THandle; message: cardinal; createSuspended: boolean);
  end;

implementation

{ TFooBarMessage }

constructor TFooBarMessage.Create(const AValue: string);
begin
  inherited Create;
  FValue := AValue;
end;

{ TWindowsMsgFooBarThread }

constructor TWindowsMsgFooBarThread.Create(receiver: THandle; message: cardinal;
  createSuspended: boolean);
begin
  inherited Create(createSuspended);
  FReceiver := receiver;
  FMessage := message;
end;

procedure TWindowsMsgFooBarThread.SendMessage(const msg: string);
begin
  PostMessage(FReceiver, FMessage, WParam(TFooBarMessage.Create(msg)), 0);
end;

end.
