unit DoubleCheckedMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.SyncObjs,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TLazyObject = class
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TLazyOwner = class
  strict private
    FLazy: TLazyObject;
    FLock: TCriticalSection;
  public
    function DoubleChecked: TLazyObject;
    function LazySingleThreaded: TLazyObject;
    function LockAndCheck: TLazyObject;
    function TestAndLock: TLazyObject;
    constructor Create;
    destructor Destroy; override;
  end;

  TfrmDoubleChecked = class(TForm)
    btnLazyInit: TButton;
    lbLog: TListBox;
    btnLockAndCheck: TButton;
    btnTestAndLock: TButton;
    btnDoubleChecked: TButton;
    procedure btnDoubleCheckedClick(Sender: TObject);
    procedure btnLazyInitClick(Sender: TObject);
    procedure btnLockAndCheckClick(Sender: TObject);
    procedure btnTestAndLockClick(Sender: TObject);
  private
    procedure DoubleChecked(owner: TLazyOwner);
    procedure LockAndCheck(owner: TLazyOwner);
    procedure Log(const msg: string);
    procedure TestAndLock(owner: TLazyOwner);
    function RunTwoWorkers(const worker: TProc<TLazyOwner>): int64;
  public
    procedure LogFromThread(const msg: string);
  end;

var
  frmDoubleChecked: TfrmDoubleChecked;

implementation

uses
  System.Diagnostics, System.Threading;

{$R *.dfm}

const
  CNumRepeats = 1000000;

procedure TfrmDoubleChecked.btnDoubleCheckedClick(Sender: TObject);
begin
  Log('');
  Log(Format('Double-checked: %d ms',
    [RunTwoWorkers(DoubleChecked)]));
end;

procedure TfrmDoubleChecked.btnLazyInitClick(Sender: TObject);
var
  lazy: TLazyObject;
  owner: TLazyOwner;
begin
  owner := TLazyOwner.Create;
  try
    Log('Execute some code ...');
    Log('Access lazy object...');
    lazy := owner.LazySingleThreaded;
    Log('Use lazy object ...');
    Log('Destroy lazy object ...');
  finally FreeAndNil(owner); end;
end;

procedure TfrmDoubleChecked.btnLockAndCheckClick(Sender: TObject);
begin
  Log(Format('Lock-and-check: %d ms',
    [RunTwoWorkers(LockAndCheck)]));
end;

procedure TfrmDoubleChecked.btnTestAndLockClick(Sender: TObject);
begin
  Log('');
  Log(Format('Test-and-lock: %d ms',
    [RunTwoWorkers(TestAndLock)]));
end;

procedure TfrmDoubleChecked.DoubleChecked(owner: TLazyOwner);
var
  i: Integer;
  lazy: TLazyObject;
begin
  for i := 1 to CNumRepeats do
    lazy := owner.DoubleChecked;
end;

procedure TfrmDoubleChecked.LockAndCheck(owner: TLazyOwner);
var
  i: Integer;
  lazy: TLazyObject;
begin
  for i := 1 to CNumRepeats do
    lazy := owner.LockAndCheck;
end;

procedure TfrmDoubleChecked.Log(const msg: string);
begin
  LogFromThread(msg);
end;

procedure TfrmDoubleChecked.LogFromThread(const msg: string);
begin
  TThread.ForceQueue(nil,
    procedure
    begin
      lbLog.ItemIndex := lbLog.Items.Add(msg);
    end);
end;

function TfrmDoubleChecked.RunTwoWorkers(const worker: TProc<TLazyOwner>):
  int64;
var
  owner  : TLazyOwner;
  tasks  : array [1..2] of ITask;
  timer  : TStopwatch;
begin
  owner := TLazyOwner.Create;
  try
    timer := TStopwatch.StartNew;
    tasks[1] := TTask.Run(procedure begin worker(owner) end);
    tasks[2] := TTask.Run(procedure begin worker(owner) end);
    TTask.WaitForAll(tasks);
    timer.Stop;
  finally
    FreeAndNil(owner);
  end;
  Result := timer.ElapsedMilliseconds;
end;

procedure TfrmDoubleChecked.TestAndLock(owner: TLazyOwner);
var
  i: Integer;
  lazy: TLazyObject;
begin
  for i := 1 to CNumRepeats do
    lazy := owner.TestAndLock;
end;

{ TLazyObject }

constructor TLazyObject.Create;
begin
  inherited Create;
  frmDoubleChecked.LogFromThread(Format(
    'Created TLazyObject @ %p', [pointer(Self)]));
end;

destructor TLazyObject.Destroy;
begin
  frmDoubleChecked.LogFromThread(Format(
    'Destroyed TLazyObject @ %p', [pointer(Self)]));
  inherited Destroy;
end;

{ TLazyOwner }

constructor TLazyOwner.Create;
begin
  inherited;
  FLock := TCriticalSection.Create;
end;

destructor TLazyOwner.Destroy;
begin
  FreeAndNil(FLazy);
  FreeAndNil(FLock);
  inherited;
end;

function TLazyOwner.DoubleChecked: TLazyObject;
begin
  if not assigned(FLazy) then
  begin
    FLock.Acquire;
    try
      if not assigned(FLazy) then
        FLazy := TLazyObject.Create;
    finally
      FLock.Release;
    end;
  end;
  Result := FLazy;
end;

function TLazyOwner.LazySingleThreaded: TLazyObject;
begin
  if not assigned(FLazy) then
    FLazy := TLazyObject.Create;
  Result := FLazy;
end;

function TLazyOwner.LockAndCheck: TLazyObject;
begin
  FLock.Acquire;
  try
    if not assigned(FLazy) then
      FLazy := TLazyObject.Create;
  finally
    FLock.Release;
  end;
  Result := FLazy;
end;

function TLazyOwner.TestAndLock: TLazyObject;
begin
  // Bad implementation, do not use!
  if not assigned(FLazy) then
  begin
//    Sleep(500); // uncomment to show the problem
    FLock.Acquire;
    try
      FLazy := TLazyObject.Create;
    finally
      FLock.Release;
    end;
  end;
  Result := FLazy;
end;

end.
