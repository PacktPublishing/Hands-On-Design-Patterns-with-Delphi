unit SlimReaderWriter;

interface

uses
  Winapi.Windows,
  System.SysUtils;

type
  IReadWriteSyncEx = interface ['{21BDDB51-29B4-44A4-B80A-1E5D72FB43DA}']
    function TryBeginRead: Boolean;
    function TryBeginWrite: Boolean;
  end;

  TSlimReaderWriter = class(TInterfacedObject, IReadWriteSync, IReadWriteSyncEx)
  strict private
    FSRWLock: TRTLSRWLock;
  public
    constructor Create;
    procedure BeginRead;
    function BeginWrite: Boolean;
    procedure EndRead;
    procedure EndWrite;
    function TryBeginRead: Boolean;
    function TryBeginWrite: Boolean;
  end;

implementation

{ TSlimReaderWriter }

constructor TSlimReaderWriter.Create;
begin
  inherited Create;
  InitializeSRWLock(FSRWLock);
end;

procedure TSlimReaderWriter.BeginRead;
begin
  AcquireSRWLockShared(FSRWLock);
end;

function TSlimReaderWriter.BeginWrite: Boolean;
begin
  AcquireSRWLockExclusive(FSRWLock);
  Result := True;
end;

procedure TSlimReaderWriter.EndRead;
begin
  ReleaseSRWLockShared(FSRWLock);
end;

procedure TSlimReaderWriter.EndWrite;
begin
  ReleaseSRWLockExclusive(FSRWLock);
end;

function TSlimReaderWriter.TryBeginRead: Boolean;
begin
  Result := TryAcquireSRWLockShared(FSRWLock);
end;

function TSlimReaderWriter.TryBeginWrite: Boolean;
begin
  Result := TryAcquireSRWLockExclusive(FSRWLock);
end;

end.
