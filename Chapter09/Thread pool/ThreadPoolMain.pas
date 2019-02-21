unit ThreadPoolMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Threading,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TfrmThreadPool = class(TForm)
    btnThreads: TButton;
    Label1: TLabel;
    inpWorkers: TSpinEdit;
    lbLog: TListBox;
    btnTasks: TButton;
    btnTasksCustom: TButton;
    lblMinThreads: TLabel;
    inpMinThreads: TSpinEdit;
    lblMaxThreads: TLabel;
    inpMaxThreads: TSpinEdit;
    procedure FormDestroy(Sender: TObject);
    procedure btnTasksClick(Sender: TObject);
    procedure btnTasksCustomClick(Sender: TObject);
    procedure btnThreadsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCustomPool: TThreadPool;
  public
  end;

var
  frmThreadPool: TfrmThreadPool;

implementation

uses
  System.SyncObjs,
  System.Diagnostics;

{$R *.dfm}

type
  TWorkerThread = class(TThread)
  strict private
    FIsStarted: boolean;
  public
    procedure Execute; override;
    property IsStarted: boolean read FIsStarted;
  end;

procedure WorkFor2Sec;
var
  a: real;
  sw: TStopwatch;
begin
  sw := TStopwatch.StartNew;
  a := 1;
  repeat
    a := Cos(a);
  until sw.ElapsedMilliseconds >= 2000;
end;

procedure TWorkerThread.Execute;
begin
  FIsStarted := true;
//  WorkFor2Sec;
  Sleep(2000);
end;

{ TfrmThreadPool }

procedure TfrmThreadPool.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FCustomPool);
end;

procedure TfrmThreadPool.btnTasksClick(Sender: TObject);
var
  i: Integer;
  sw: TStopwatch;
  tasks: TArray<ITask>;
  taskID: TArray<TThreadID>;
  taskStarted: TArray<boolean>;

  function MakeTask(num: integer): TProc;
  begin
    Result :=
      procedure
      begin
        taskStarted[num] := true;
        taskID[num] := TThread.Current.ThreadID;
//        WorkFor2Sec;
        Sleep(2000);
      end;
  end;

begin
  SetLength(tasks, inpWorkers.Value);
  SetLength(taskID, Length(tasks));
  SetLength(taskStarted, Length(tasks));

  TThreadPool.Default.SetMaxWorkerThreads(inpMaxThreads.Value);
  TThreadPool.Default.SetMinWorkerThreads(inpMinThreads.Value);

  sw := TStopwatch.StartNew;
  for i := Low(tasks) to High(tasks) do
    tasks[i] := TTask.Run(MakeTask(i));
  for i := Low(tasks) to High(tasks) do
    while not taskStarted[i] do
      ;
  sw.Stop;

  TTask.WaitForAll(tasks);
  for i := Low(tasks) to High(tasks) do
    lbLog.Items.Add('Thread ID: ' + taskID[i].ToString);

  lbLog.ItemIndex := lbLog.Items.Add('Tasks were created in ' +
    sw.ElapsedMilliseconds.ToString + ' ms');
end;

procedure TfrmThreadPool.btnTasksCustomClick(Sender: TObject);
var
  i: Integer;
  sw: TStopwatch;
  tasks: TArray<ITask>;
  taskID: TArray<TThreadID>;
  taskStarted: TArray<boolean>;

  function MakeTask(num: integer): TProc;
  begin
    Result :=
      procedure
      begin
        taskStarted[num] := true;
        taskID[num] := TThread.Current.ThreadID;
//        WorkFor2Sec;
        Sleep(2000);
      end;
  end;

begin
  SetLength(tasks, inpWorkers.Value);
  SetLength(taskID, Length(tasks));
  SetLength(taskStarted, Length(tasks));

  TThreadPool.Default.SetMaxWorkerThreads(inpMaxThreads.Value);
  if (not assigned(FCustomPool)) or (FCustomPool.MinWorkerThreads <> inpMinThreads.Value) then begin
    FreeAndNil(FCustomPool);
    FCustomPool := TThreadPool.Create;
    FCustomPool.SetMinWorkerThreads(inpMinThreads.Value);
  end;

  sw := TStopwatch.StartNew;
  for i := Low(tasks) to High(tasks) do
    tasks[i] := TTask.Run(MakeTask(i), FCustomPool);
  for i := Low(tasks) to High(tasks) do
    while not taskStarted[i] do
      ;
  sw.Stop;

  TTask.WaitForAll(tasks);
  for i := Low(tasks) to High(tasks) do
    lbLog.Items.Add('Thread ID: ' + taskID[i].ToString);

  lbLog.ItemIndex := lbLog.Items.Add('Tasks were created in ' +
    sw.ElapsedMilliseconds.ToString + ' ms');
end;

procedure TfrmThreadPool.btnThreadsClick(Sender: TObject);
var
  i: Integer;
  sw: TStopwatch;
  threads: TArray<TWorkerThread>;
begin
  SetLength(threads, inpWorkers.Value);

  sw := TStopwatch.StartNew;
  for i := Low(threads) to High(threads) do
    threads[i] := TWorkerThread.Create;
  for i := Low(threads) to High(threads) do
    while not threads[i].IsStarted do
      ;
  sw.Stop;

  for i := Low(threads) to High(threads) do 
  begin
    threads[i].WaitFor;
    lbLog.Items.Add('Thread ID: ' + threads[i].ThreadID.ToString);
    threads[i].Free;
  end;

  lbLog.ItemIndex := lbLog.Items.Add('Threads were created in ' +
    sw.ElapsedMilliseconds.ToString + ' ms');
end;

procedure TfrmThreadPool.FormCreate(Sender: TObject);
begin
  inpWorkers.Value := TThread.ProcessorCount;
  inpMinThreads.Value := inpWorkers.Value;
  inpMaxThreads.Value := inpWorkers.Value + 1;
end;

end.
