unit OptimisticLockingMain;

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
    function Optimistic: TLazyObject;
    constructor Create;
    destructor Destroy; override;
  end;

  TfrmOptimistic = class(TForm)
    lbLog: TListBox;
    btnDoubleChecked: TButton;
    btnOptimistic: TButton;
    procedure btnDoubleCheckedClick(Sender: TObject);
    procedure btnOptimisticClick(Sender: TObject);
  private
    procedure DoubleChecked(owner: TLazyOwner);
    procedure Log(const msg: string);
    procedure Optimistic(owner: TLazyOwner);
    function RunTwoWorkers(const worker: TProc<TLazyOwner>): int64;
  public
    procedure LogFromThread(const msg: string);
  end;

var
  frmOptimistic: TfrmOptimistic;

implementation

uses
  System.Diagnostics, System.Threading;

{$R *.dfm}

const
  CNumRepeats = 1000000;

procedure TfrmOptimistic.btnDoubleCheckedClick(Sender: TObject);
begin
  Log(Format('Double-checked: %d ms',
    [RunTwoWorkers(DoubleChecked)]));
end;

procedure TfrmOptimistic.btnOptimisticClick(Sender: TObject);
begin
  Log('');
  Log(Format('Optimistic: %d ms',
    [RunTwoWorkers(Optimistic)]));
end;

procedure TfrmOptimistic.DoubleChecked(owner: TLazyOwner);
var
  i: Integer;
  lazy: TLazyObject;
begin
  for i := 1 to CNumRepeats do
    lazy := owner.DoubleChecked;
end;

procedure TfrmOptimistic.Log(const msg: string);
begin
  LogFromThread(msg);
end;

procedure TfrmOptimistic.LogFromThread(const msg: string);
begin
  TThread.ForceQueue(nil,
    procedure
    begin
      lbLog.ItemIndex := lbLog.Items.Add(msg);
    end);
end;

procedure TfrmOptimistic.Optimistic(owner: TLazyOwner);
var
  i: Integer;
  lazy: TLazyObject;
begin
  for i := 1 to CNumRepeats do
    lazy := owner.Optimistic;
end;

function TfrmOptimistic.RunTwoWorkers(const worker: TProc<TLazyOwner>):
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

{ TLazyObject }

constructor TLazyObject.Create;
begin
  inherited Create;
  frmOptimistic.LogFromThread(Format(
    'Created TLazyObject @ %p', [pointer(Self)]));
end;

destructor TLazyObject.Destroy;
begin
  frmOptimistic.LogFromThread(Format(
    'Destroyed TLazyObject @ %p', [pointer(Self)]));
  inherited Destroy;
end;

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

function TLazyOwner.Optimistic: TLazyObject;
var
  tempLazy: TLazyObject;
begin
  if not assigned(FLazy) then
  begin
    tempLazy := TLazyObject.Create;
    //Sleep(500);  // uncomment to force creation of two lazy objects
    if TInterlocked.CompareExchange(pointer(FLazy), tempLazy, nil) <> nil then
      FreeAndNil(tempLazy);
  end;
  Result := FLazy;
end;

end.
