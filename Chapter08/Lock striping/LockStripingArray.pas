unit LockStripingArray;

interface

type
  TLockStripingArray = record
  private const
    CMaskBit = 31;
    CBitMask = 1 SHL CMaskBit;
  var
    FData: TArray<integer>;
    function GetItem(idx: integer): integer; inline;
    procedure SetItem(idx: integer; const value: integer); inline;
  public
    procedure Acquire(idx: integer); inline;
    procedure Release(idx: integer); inline;
    property Data: TArray<integer> read FData write FData;
    property Items[idx: integer]: integer read GetItem write SetItem; default;
  end;

implementation

uses
  System.SyncObjs;

procedure TLockStripingArray.Acquire(idx: integer);
var
  el: Integer;
begin
  while TInterlocked.BitTestAndSet(FData[idx], 31) do
    ;
end;

function TLockStripingArray.GetItem(idx: integer): integer;
begin
  Result := FData[idx] AND NOT CBitMask;
end;

procedure TLockStripingArray.Release(idx: integer);
begin
  FData[idx] := FData[idx] AND NOT CBitMask;
end;

procedure TLockStripingArray.SetItem(idx: integer; const value: integer);
begin
  FData[idx] := (value AND NOT CBitMask) OR (FData[idx] AND CBitMask);
end;

end.
