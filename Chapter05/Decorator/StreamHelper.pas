unit StreamHelper;

interface

uses
  System.Classes;

type
  TStreamHelper = class helper for TStream
  public
    procedure Advance(delta: int64);
    procedure Append(source: TStream);
    function  AtEnd: boolean;
    function  BytesLeft: int64;
    procedure Clear;
    procedure GoToStart;
    procedure GoToEnd;
    procedure Truncate;
  end;

implementation

{ TStreamHelper }

procedure TStreamHelper.Advance(delta: int64);
begin
  Position := Position + delta;
end;

procedure TStreamHelper.Append(source: TStream);
begin
  Position := Size;
  CopyFrom(source, 0);
end;

function TStreamHelper.AtEnd: boolean;
begin
  Result := (BytesLeft = 0);
end;

function TStreamHelper.BytesLeft: int64;
begin
  Result := (Size - Position);
end;

procedure TStreamHelper.Clear;
begin
  Size := 0;
end;

procedure TStreamHelper.GoToEnd;
begin
  Position := Size;
end;

procedure TStreamHelper.GoToStart;
begin
  Position := 0;
end;

procedure TStreamHelper.Truncate;
begin
  Size := Position;
end;

end.
