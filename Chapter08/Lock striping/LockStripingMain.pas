unit LockStripingMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.SyncObjs,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  LockStripingArray;

type
  TfrmLockStriping = class(TForm)
    btnMasterLock: TButton;
    btnSeparateLocks: TButton;
    btnCustomLocks: TButton;
    lbLog: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCustomLocksClick(Sender: TObject);
    procedure btnMasterLockClick(Sender: TObject);
    procedure btnSeparateLocksClick(Sender: TObject);
  private
    procedure ExchangeTwoCustom(const data: TLockStripingArray);
    procedure ExchangeTwoMaster(lock: TCriticalSection;
      const data: TArray<integer>);
    procedure ExchangeTwoSeparate(const locks: TArray<TCriticalSection>;
      const data: TArray<integer>);
    function GenerateData: TArray<integer>;
    procedure LogData(const name: string; time_ms: int64;
      const data: TArray<integer>);
    procedure PickTwo(dataLen: integer; var idx1, idx2: integer);
    function RunTasks(const worker: TProc): int64;
    procedure VerifyData(const data: TArray<integer>);
  public
  end;

var
  frmLockStriping: TfrmLockStriping;

implementation

uses
  System.Generics.Collections,
  System.Diagnostics, System.Math, System.Threading;

{$R *.dfm}

const
  CNumTasks    = 4;
  CNumShuffles = 100000;

procedure TfrmLockStriping.FormCreate(Sender: TObject);
begin
  Randomize;
end;

procedure TfrmLockStriping.btnCustomLocksClick(Sender: TObject);
var
  data: TLockStripingArray;
  time_ms: int64;
begin
  data.Data := GenerateData;
  time_ms := RunTasks(
    procedure
    var
      iShuffle: integer;
    begin
      for iShuffle := 1 to CNumShuffles do
        ExchangeTwoCustom(data);
    end);
  LogData('Custom bit lock', time_ms, data.Data);
  VerifyData(data.Data);
end;

procedure TfrmLockStriping.btnMasterLockClick(Sender: TObject);
var
  data: TArray<integer>;
  lock: TCriticalSection;
  time_ms: int64;
begin
  data := GenerateData;
  lock := TCriticalSection.Create;
  try
    time_ms := RunTasks(
      procedure
      var
        iShuffle: integer;
      begin
        for iShuffle := 1 to CNumShuffles do
          ExchangeTwoMaster(lock, data);
      end);
    LogData('Master lock', time_ms, data);
    VerifyData(data);
  finally
    FreeAndNil(lock);
  end;
end;

procedure TfrmLockStriping.btnSeparateLocksClick(Sender: TObject);
var
  data: TArray<integer>;
  locks: TArray<TCriticalSection>;
  time_ms: int64;
  i: Integer;
begin
  data := GenerateData;
  SetLength(locks, Length(data));
  for i := Low(locks) to High(locks) do
    locks[i] := TCriticalSection.Create;
  try
    time_ms := RunTasks(
      procedure
      var
        iShuffle: integer;
      begin
        for iShuffle := 1 to CNumShuffles do
          ExchangeTwoSeparate(locks, data);
      end);
    LogData('Separate locks', time_ms, data);
    VerifyData(data);
  finally
    for i := Low(locks) to High(locks) do
      locks[i].Free;
  end;
end;

procedure TfrmLockStriping.ExchangeTwoCustom(const data: TLockStripingArray);
var
  idx1: Integer;
  idx2: Integer;
  temp: Integer;
begin
  PickTwo(Length(data.Data), idx1, idx2);
  if idx1 = idx2 then
    Exit;

  data.Acquire(idx1);
  try
    data.Acquire(idx2);
    try
      temp := data.Data[idx1];
      data.Data[idx1] := data.Data[idx2];
      data.Data[idx2] := temp;
    finally
      data.Release(idx2);
    end;
  finally
    data.Release(idx1);
  end;
end;

procedure TfrmLockStriping.ExchangeTwoMaster(lock: TCriticalSection;
  const data: TArray<integer>);
var
  idx1: Integer;
  idx2: Integer;
  temp: Integer;
begin
  PickTwo(Length(data), idx1, idx2);
  if idx1 = idx2 then
    Exit;

  lock.Acquire;
  try
    temp := data[idx1];
    data[idx1] := data[idx2];
    data[idx2] := temp;
  finally
    lock.Release;
  end;
end;

procedure TfrmLockStriping.ExchangeTwoSeparate(
  const locks: TArray<TCriticalSection>; const data: TArray<integer>);
var
  idx1: Integer;
  idx2: Integer;
  temp: Integer;
begin
  PickTwo(Length(data), idx1, idx2);
  if idx1 = idx2 then
    Exit;

  locks[idx1].Acquire;
  try
    locks[idx2].Acquire;
    try
      temp := data[idx1];
      data[idx1] := data[idx2];
      data[idx2] := temp;
    finally
      locks[idx2].Release;
    end;
  finally
    locks[idx1].Release;
  end;
end;

function TfrmLockStriping.GenerateData: TArray<integer>;
var
  i: integer;
begin
  SetLength(Result, 52);
  for i := 0 to 51 do
    Result[i] := i + 1;
end;

procedure TfrmLockStriping.LogData(const name: string; time_ms: int64;
  const data: TArray<integer>);
var
  card: Integer;
  s: string;
begin
  s := '';
  for card in data do
    s := s + card.ToString + ' ';
  lbLog.Items.Add(name + '[' + time_ms.ToString + ' ms]: ' + s);
end;

procedure TfrmLockStriping.PickTwo(dataLen: integer; var idx1, idx2: integer);
var
  temp: integer;
begin
  idx1 := Random(dataLen);
  idx2 := Random(dataLen);
  if idx1 > idx2 then
  begin
    temp := idx1;
    idx1 := idx2;
    idx2 := temp;
  end;
end;

function TfrmLockStriping.RunTasks(const worker: TProc): int64;
var
  i: Integer;
  tasks: TArray<ITask>;
  timer: TStopwatch;
begin
  SetLength(tasks, CNumTasks);
  timer := TStopwatch.StartNew;
  for i := Low(tasks) to High(tasks) do
    tasks[i] := TTask.Run(worker);
  TTask.WaitForAll(tasks);
  Result := timer.ElapsedMilliseconds;
end;

procedure TfrmLockStriping.VerifyData(const data: TArray<integer>);
var
  i: Integer;
  testData: TArray<integer>;
begin
  testData := data;
  SetLength(testData, Length(testData)); // make unique
  TArray.Sort<integer>(testData);
  for i := 0 to 51 do
    if testData[i] <> (i + 1) then
    begin
      LogData('Error in data', 0, testData);
      Exit;
    end;
end;

end.
