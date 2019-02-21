unit LockMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.SyncObjs,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmLock = class(TForm)
    btnUnsafe: TButton;
    btnCriticalSection: TButton;
    btnCustom: TButton;
    btnReentrant: TButton;
    lbLog: TListBox;
    btnMonitor: TButton;
    btnDeadlock: TButton;
    procedure btnCriticalSectionClick(Sender: TObject);
    procedure btnCustomClick(Sender: TObject);
    procedure btnDeadlockClick(Sender: TObject);
    procedure btnMonitorClick(Sender: TObject);
    procedure btnReentrantClick(Sender: TObject);
    procedure btnUnsafeClick(Sender: TObject);
  strict private
    FLock: TCriticalSection;
    FLock2: TCriticalSection;
    FCustomLock: integer;
  private
    FSharedData: integer;
    procedure ChangeValue(var value: integer; delta: integer);
    procedure CustomAcquire(var lock: integer);
    procedure CustomLockDecrementValue;
    procedure CustomLockIncrementValue;
    procedure CustomRelease(var lock: integer);
    procedure DecrementValue;
    procedure IncrementValue;
    procedure Lock12;
    procedure Lock21;
    procedure LockDecrementValue;
    procedure LockIncrementValue;
    procedure LockReenterDecrementValue;
    procedure LockReenterIncrementValue;
    procedure Log(const msg: string; const params: array of const);
    procedure MonitorDecrementValue;
    procedure MonitorIncrementValue;
  public
  end;

var
  frmLock: TfrmLock;

implementation

uses
  System.Diagnostics, System.Threading;

{$R *.dfm}

const
  CNumRepeats = 1000000;

procedure TfrmLock.btnCriticalSectionClick(Sender: TObject);
var
  decTask: ITask;
  incTask: ITask;
  timer: TStopwatch;
begin
  FLock := TCriticalSection.Create;
  try
    FSharedData := 0;
    timer := TStopwatch.StartNew;
    incTask := TTask.Run(LockIncrementValue);
    decTask := TTask.Run(LockDecrementValue);
    incTask.Wait;
    decTask.Wait;
    timer.Stop;
    Log('Lock value: %d; time: %d ms', [FSharedData, timer.ElapsedMilliseconds]);
  finally
    FreeAndNil(FLock);
  end;
end;

procedure TfrmLock.btnCustomClick(Sender: TObject);
var
  decTask: ITask;
  incTask: ITask;
  timer: TStopwatch;
begin
  FLock := TCriticalSection.Create;
  try
    FSharedData := 0;
    timer := TStopwatch.StartNew;
    incTask := TTask.Run(CustomLockIncrementValue);
    decTask := TTask.Run(CustomLockDecrementValue);
    incTask.Wait;
    decTask.Wait;
    timer.Stop;
    Log('Custom lock value: %d; time: %d ms', [FSharedData, timer.ElapsedMilliseconds]);
  finally
    FreeAndNil(FLock);
  end;
end;

procedure TfrmLock.btnDeadlockClick(Sender: TObject);
var
  task12: ITask;
  task21: ITask;
begin
  FLock := TCriticalSection.Create;
  try
    FLock2 := TCriticalSection.Create;
    try
      task12:= TTask.Run(Lock12);
      task21 := TTask.Run(Lock21);
      task12.Wait;
      task21.Wait;
      Log('Deadlock finished', []);
    finally
      FreeAndNil(FLock2);
    end;
  finally
    FreeAndNil(FLock);
  end;
end;

procedure TfrmLock.btnMonitorClick(Sender: TObject);
var
  decTask: ITask;
  incTask: ITask;
  timer: TStopwatch;
begin
  FLock := TCriticalSection.Create;
  try
    FSharedData := 0;
    timer := TStopwatch.StartNew;
    incTask := TTask.Run(MonitorIncrementValue);
    decTask := TTask.Run(MonitorDecrementValue);
    incTask.Wait;
    decTask.Wait;
    timer.Stop;
    Log('Monitor value: %d; time: %d ms', [FSharedData, timer.ElapsedMilliseconds]);
  finally
    FreeAndNil(FLock);
  end;
end;

procedure TfrmLock.btnReentrantClick(Sender: TObject);
var
  decTask: ITask;
  incTask: ITask;
  timer: TStopwatch;
begin
  FLock := TCriticalSection.Create;
  try
    FSharedData := 0;
    timer := TStopwatch.StartNew;
    incTask := TTask.Run(LockReenterIncrementValue);
    decTask := TTask.Run(LockReenterDecrementValue);
    incTask.Wait;
    decTask.Wait;
    timer.Stop;
    Log('Reentered lock value: %d; time: %d ms', [FSharedData, timer.ElapsedMilliseconds]);
  finally
    FreeAndNil(FLock);
  end;
end;

procedure TfrmLock.btnUnsafeClick(Sender: TObject);
var
  decTask: ITask;
  incTask: ITask;
  timer: TStopwatch;
begin
  FSharedData := 0;
  timer := TStopwatch.StartNew;
  incTask := TTask.Run(IncrementValue);
  decTask := TTask.Run(DecrementValue);
  incTask.Wait;
  decTask.Wait;
  timer.Stop;
  Log('Unsafe value: %d; time: %d ms', [FSharedData, timer.ElapsedMilliseconds]);
end;

procedure TfrmLock.ChangeValue(var value: integer; delta: integer);
begin
  FLock.Acquire;
  try
    value := value + delta;
  finally
    FLock.Release;
  end;
end;

procedure TfrmLock.CustomAcquire(var lock: integer);
begin
  while TInterlocked.CompareExchange(lock, 1, 0) <> 0 do
    ;
end;

procedure TfrmLock.CustomLockDecrementValue;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
  begin
    CustomAcquire(FCustomLock);
    try
      Dec(FSharedData);
    finally
      CustomRelease(FCustomLock);
    end;
  end;
end;

procedure TfrmLock.CustomLockIncrementValue;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
  begin
    CustomAcquire(FCustomLock);
    try
      Inc(FSharedData);
    finally
      CustomRelease(FCustomLock);
    end;
  end;
end;

procedure TfrmLock.CustomRelease(var lock: integer);
begin
  lock := 0;
end;

procedure TfrmLock.DecrementValue;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
    Dec(FSharedData);
end;

procedure TfrmLock.IncrementValue;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
    Inc(FSharedData);
end;

procedure TfrmLock.Lock12;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
  begin
    FLock.Acquire;
    FLock2.Acquire;

    FLock2.Release;
    FLock.Release;
  end;
end;

procedure TfrmLock.Lock21;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
  begin
    FLock2.Acquire;
    FLock.Acquire;

    FLock.Release;
    FLock2.Release;
  end;
end;

procedure TfrmLock.LockDecrementValue;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
  begin
    FLock.Acquire;
    try
      Dec(FSharedData);
    finally
      FLock.Release;
    end;
  end;
end;

procedure TfrmLock.LockIncrementValue;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
  begin
    FLock.Acquire;
    try
      Inc(FSharedData);
    finally
      FLock.Release;
    end;
  end;
end;

procedure TfrmLock.LockReenterDecrementValue;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
  begin
    FLock.Acquire;
    try
      ChangeValue(FSharedData, -1);
    finally
      FLock.Release;
    end;
  end;
end;

procedure TfrmLock.LockReenterIncrementValue;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
  begin
    FLock.Acquire;
    try
      ChangeValue(FSharedData, +1);
    finally
      FLock.Release;
    end;
  end;
end;

procedure TfrmLock.Log(const msg: string; const params: array of const);
begin
  lbLog.ItemIndex := lbLog.Items.Add(Format(msg, params));
end;

procedure TfrmLock.MonitorDecrementValue;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
  begin
    MonitorEnter(Self);
    try
      Dec(FSharedData);
    finally
      MonitorExit(Self);
    end;
  end;
end;

procedure TfrmLock.MonitorIncrementValue;
var
  i: integer;
begin
  for i := 1 to CNumRepeats do
  begin
    System.TMonitor.Enter(Self);
    try
      Inc(FSharedData);
    finally
      System.TMonitor.Exit(Self);
    end;
  end;
end;

end.
