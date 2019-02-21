unit ExceptionsMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TOpenFileError = (ofeOK, ofeCannotCreate, ofeCannotOpen);

  TfrmExceptions = class(TForm)
    btnHandled: TButton;
    btnUnhandled: TButton;
    btnFlowControl: TButton;
    btnSpeed: TButton;
    lbLog: TListBox;
    btnConstructor: TButton;
    btnFileStream: TButton;
    btnOpenFileNil: TButton;
    btnOpenFileStatus: TButton;
    btnAcquireEO: TButton;
    btnArrow: TButton;
    btnFlatTryFinally: TButton;
    btnOpenFileStatus2: TButton;
    btnSerializeException: TButton;
    procedure btnAcquireEOClick(Sender: TObject);
    procedure btnArrowClick(Sender: TObject);
    procedure btnConstructorClick(Sender: TObject);
    procedure btnFileStreamClick(Sender: TObject);
    procedure btnFlatTryFinallyClick(Sender: TObject);
    procedure btnFlowControlClick(Sender: TObject);
    procedure btnHandledClick(Sender: TObject);
    procedure btnOpenFileNilClick(Sender: TObject);
    procedure btnOpenFileStatus2Click(Sender: TObject);
    procedure btnOpenFileStatusClick(Sender: TObject);
    procedure btnSpeedClick(Sender: TObject);
    procedure btnUnhandledClick(Sender: TObject);
    procedure btnSerializeExceptionClick(Sender: TObject);
  private
    procedure Log(const msg: string);
    procedure LogException(excObj: Exception);
    procedure Measure(const name: string; testProc: TProc);
    procedure Method1;
    procedure Method2;
    procedure NoExceptions;
    procedure NoExceptionsTryExcept;
    procedure NoExceptionsTryFinally;
    function OpenFile(const fileName: string; mode: word): TFileStream;
    function OpenFileNil(const fileName: string; mode: word): TFileStream;
    function OpenFileStatus(const fileName: string; mode: word;
      var fs: TFileStream): boolean;
    function OpenFileStatus2(const fileName: string; mode: word;
      var fs: TFileStream): TOpenFileError;
    function Test(i: integer): boolean;
    procedure WithExceptions;
  public
  end;

var
  frmExceptions: TfrmExceptions;

implementation

uses
  System.Diagnostics;

{$R *.dfm}

type
  TExceptClass = class
  strict private
    FStream1: TStream;
    FStream2: TStream;
  public
    constructor Create;
    destructor Destroy; override;
  end;

procedure TfrmExceptions.btnAcquireEOClick(Sender: TObject);
var
  excObj: TObject;
begin
  excObj := nil;
  try
    Method1;
  except
    on E: Exception do
      excObj := AcquireExceptionObject;
  end;

  if excObj <> nil then
    LogException(excObj as Exception);
end;

procedure TfrmExceptions.btnArrowClick(Sender: TObject);
var
  sl1: TStringList;
  sl2: TStringList;
  sl3: TStringList;
begin
  sl1 := TStringList.Create;
  try
    sl2 := TStringList.Create;
    try
      sl3 := TStringList.Create;
      try
        //DoSomethingWith(sl1, sl2, sl3);
      finally FreeAndNil(sl3); end;
    finally FreeAndNil(sl2); end;
  finally FreeAndNil(sl1); end;
end;

procedure TfrmExceptions.btnConstructorClick(Sender: TObject);
var
  obj: TExceptClass;
begin
  obj := TExceptClass.Create;
  try
    // do something with obj
    // this will never execute as TExceptClass.Create raises an exception
  finally
    FreeAndNil(obj); // this will also never execute
  end;
end;

procedure TfrmExceptions.btnFileStreamClick(Sender: TObject);
var
  fs: TFileStream;
begin
  try
    fs := OpenFile('com1', fmOpenRead);
    try
      // process the file
    finally
      FreeAndNil(fs);
    end;
  except
    on E: Exception do
      Log('Failed! [' + E.ClassName + ']: ' + E.Message);
  end;

  try
    fs := OpenFile('com1', fmOpenRead);
    FreeAndNil(fs);
  except
    on E: EFOpenError do
      Log('Failed to open file!');
    on E: EFCreateError do
      Log('Failed to create file!');
  end;
end;

procedure TfrmExceptions.btnFlatTryFinallyClick(Sender: TObject);
var
  sl1: TStringList;
  sl2: TStringList;
  sl3: TStringList;
begin
  sl1 := nil;
  sl2 := nil;
  sl3 := nil;
  try
    sl1 := TStringList.Create;
    sl2 := TStringList.Create;
    sl3 := TStringList.Create;
    //DoSomethingWith(sl1, sl2, sl3);
  finally
    FreeAndNil(sl1);
    FreeAndNil(sl2);
    FreeAndNil(sl3);
  end;
end;

procedure TfrmExceptions.btnFlowControlClick(Sender: TObject);
var
  i: integer;
begin
  try
    for i := 1 to 10 do
      if not Test(i) then
        raise Exception.CreateFmt('Failed at %d', [i]);
    Log('All OK');
  except
    on E: Exception do
      Log('Test failed');
  end;
end;

procedure TfrmExceptions.btnHandledClick(Sender: TObject);
begin
  try
    Method1;
  except
    on E: Exception do
      Log('Exception caught: [' + E.ClassName + '] ' + E.Message);
  end;
end;

procedure TfrmExceptions.btnOpenFileNilClick(Sender: TObject);
var
  fs: TFileStream;
begin
  fs := OpenFileNil('com1', fmOpenRead);
  if not assigned(fs) then
    Log('Failed to open file!')
  else
  try
    // process the file
  finally
    FreeAndNil(fs);
  end;
end;

procedure TfrmExceptions.btnOpenFileStatusClick(Sender: TObject);
var
  fs: TFileStream;
begin
  if not OpenFileStatus('com1', fmOpenRead, fs) then
    Log('Failed to open file')
  else
  try
    // process the file
  finally
    FreeAndNil(fs);
  end;
end;

procedure TfrmExceptions.btnOpenFileStatus2Click(Sender: TObject);
var
  fs: TFileStream;
begin
  case OpenFileStatus2('com1', fmOpenRead, fs) of
    ofeOK:
      try
        // process the file
      finally
        FreeAndNil(fs);
      end;
    ofeCannotCreate: Log('Failed to create file!');
    ofeCannotOpen: Log('Failed to open file!');
  end;
end;

procedure TfrmExceptions.btnSpeedClick(Sender: TObject);
begin
  Measure('No exceptions', NoExceptions);
  Measure('No exceptions, try..except', NoExceptionsTryExcept);
  Measure('No exceptions, try..finally', NoExceptionsTryFinally);
  Measure('With exceptions', WithExceptions);
end;

procedure TfrmExceptions.btnUnhandledClick(Sender: TObject);
begin
  Method1;
end;

procedure TfrmExceptions.btnSerializeExceptionClick(Sender: TObject);
var
  s: string;
begin
  try
    Method1;
  except
    on E: Exception do
      s := '[' + E.ClassName + ']: ' + E.Message;
  end;

  if s <> '' then
    Log('Exception was caught: ' + s);
end;

procedure TfrmExceptions.Log(const msg: string);
begin
  lbLog.ItemIndex := lbLog.Items.Add(msg);
end;

procedure TfrmExceptions.LogException(excObj: Exception);
begin
  Log('Exception was caught: [' + excObj.ClassName + ']: ' + excObj.Message);

  ReleaseExceptionObject;
end;

procedure TfrmExceptions.Measure(const name: string; testProc: TProc);
var
  sw: TStopwatch;
begin
  sw := TStopwatch.StartNew;
  testProc();
  sw.Stop;
  Log(name + ': ' + sw.ElapsedMilliseconds.ToString + ' ms');
end;

procedure TfrmExceptions.Method1;
begin
  Log('Method1 start');
  Method2;
  Log('Method1 end');
end;

procedure TfrmExceptions.Method2;
var
  a: real;
begin
  Log('Method2 start');
  a := 0;
  a := 1 / a;
  Log('Method2 end');
end;

procedure TfrmExceptions.NoExceptions;
var
  i: integer;
begin
  for i := 1 to 100000 do
    ;
end;

procedure TfrmExceptions.NoExceptionsTryExcept;
var
  i: integer;
begin
  for i := 1 to 100000 do
    try
    except
    end;
end;

procedure TfrmExceptions.NoExceptionsTryFinally;
var
  i: integer;
begin
  for i := 1 to 100000 do
    try
    finally
    end;
end;

function TfrmExceptions.OpenFile(const fileName: string;
  mode: word): TFileStream;
begin
  Result := TFileStream.Create(fileName, mode);
end;

function TfrmExceptions.OpenFileNil(const fileName: string;
  mode: word): TFileStream;
begin
  // bad idea:
//  Result := nil;
//  try
//    Result := TFileStream.Create(fileName, mode);
//  except
//  end;

  Result := nil;
  try
    Result := TFileStream.Create(fileName, mode);
  except
    on E: EFOpenError do
      ;
    on E: EFCreateError do
      ;
  end;
end;

function TfrmExceptions.OpenFileStatus(const fileName: string; mode: word;
  var fs: TFileStream): boolean;
begin
  fs := nil;
  try
    fs := TFileStream.Create(fileName, mode);
    Result := true;
  except
    Result := false;
  end;
end;

function TfrmExceptions.OpenFileStatus2(const fileName: string; mode: word;
  var fs: TFileStream): TOpenFileError;
begin
  fs := nil;
  try
    fs := TFileStream.Create(fileName, mode);
    Result := ofeOK;
  except
    on E: EFOpenError do
      Result := ofeCannotOpen;
    on E: EFCreateError do
      Result := ofeCannotCreate;
  end;
end;

function TfrmExceptions.Test(i: integer): boolean;
begin
  Result := i in [1..6];
end;

procedure TfrmExceptions.WithExceptions;
var
  i: integer;
begin
  for i := 1 to 100000 do
    try
       raise Exception.Create('Test');
    except
    end;
end;

{ TExceptClass }

constructor TExceptClass.Create;
begin
  inherited Create;
  FStream1 := TMemoryStream.Create;
  FStream2.Position := 0;
  FStream2 := TMemoryStream.Create;
end;

destructor TExceptClass.Destroy;
begin
  FreeAndNil(FStream1);
  // constructor failed, so FStream2 is not initialized at that point!
  if assigned(FStream2) then begin
    FStream2.Size := 0;
    FreeAndNil(FStream2);
  end;
  inherited Destroy;
end;

end.
