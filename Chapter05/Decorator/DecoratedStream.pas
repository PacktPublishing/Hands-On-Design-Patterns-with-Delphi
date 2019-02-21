unit DecoratedStream;

interface

uses
  System.SysUtils,
  System.Classes;

type
  TDecoratedStream = class(TStream)
  strict private
    FWrapped: TStream;
  private
    function GetPosition: Int64;
    procedure SetPosition(const Pos: Int64);
    procedure SetSize64(const NewSize: Int64);
  protected
    function GetSize: Int64; override;
  public
    constructor Create(wrappedStream: TStream);
    destructor Destroy; override;

    // new functionality

    procedure Advance(delta: int64);
    procedure Append(source: TStream);
    function  AtEnd: boolean;
    function  BytesLeft: int64;
    procedure Clear;
    procedure GoToStart;
    procedure GoToEnd;
    procedure Truncate;

    // TStream

    function Read(var Buffer; Count: Longint): Longint; overload; override;
    function Write(const Buffer; Count: Longint): Longint; overload; override;
    function Read(Buffer: TBytes; Offset, Count: Longint): Longint; overload; override;
    function Write(const Buffer: TBytes; Offset, Count: Longint): Longint; overload; override;

    function Read(var Buffer: TBytes; Count: Longint): Longint; overload;
    function Write(const Buffer: TBytes; Count: Longint): Longint; overload;

    function Read64(Buffer: TBytes; Offset, Count: Int64): Int64; override;
    function Write64(const Buffer: TBytes; Offset, Count: Int64): Int64; override;

    function ReadData(      Buffer: Pointer; Count: NativeInt): NativeInt; overload;
    function ReadData(const Buffer: TBytes; Count: NativeInt): NativeInt; overload;

    function ReadData(var Buffer: Boolean): NativeInt; overload;
    function ReadData(var Buffer: Boolean; Count: NativeInt): NativeInt; overload;
{$IFDEF NEXTGEN}
    function ReadData(var Buffer: System.UTF8Char): NativeInt; overload;
    function ReadData(var Buffer: System.UTF8Char; Count: NativeInt): NativeInt; overload;
{$ELSE !NEXTGEN}
    function ReadData(var Buffer: AnsiChar): NativeInt; overload;
    function ReadData(var Buffer: AnsiChar; Count: NativeInt): NativeInt; overload;
{$ENDIF NEXTGEN}
    function ReadData(var Buffer: Char): NativeInt; overload;
    function ReadData(var Buffer: Char; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: Int8): NativeInt; overload;
    function ReadData(var Buffer: Int8; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: UInt8): NativeInt; overload;
    function ReadData(var Buffer: UInt8; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: Int16): NativeInt; overload;
    function ReadData(var Buffer: Int16; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: UInt16): NativeInt; overload;
    function ReadData(var Buffer: UInt16; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: Int32): NativeInt; overload;
    function ReadData(var Buffer: Int32; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: UInt32): NativeInt; overload;
    function ReadData(var Buffer: UInt32; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: Int64): NativeInt; overload;
    function ReadData(var Buffer: Int64; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: UInt64): NativeInt; overload;
    function ReadData(var Buffer: UInt64; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: Single): NativeInt; overload;
    function ReadData(var Buffer: Single; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: Double): NativeInt; overload;
    function ReadData(var Buffer: Double; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: Extended): NativeInt; overload;
    function ReadData(var Buffer: Extended; Count: NativeInt): NativeInt; overload;
    function ReadData(var Buffer: TExtended80Rec): NativeInt; overload;
    function ReadData(var Buffer: TExtended80Rec; Count: NativeInt): NativeInt; overload;

    function ReadData<T>(var Buffer: T): NativeInt; overload;
    function ReadData<T>(var Buffer: T; Count: NativeInt): NativeInt; overload;

    function WriteData(const Buffer: TBytes; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: Pointer; Count: NativeInt): NativeInt; overload;

    function WriteData(const Buffer: Boolean): NativeInt; overload;
    function WriteData(const Buffer: Boolean; Count: NativeInt): NativeInt; overload;
{$IFDEF NEXTGEN}
    function WriteData(const Buffer: UTF8Char): NativeInt; overload;
    function WriteData(const Buffer: UTF8Char; Count: NativeInt): NativeInt; overload;
{$ELSE !NEXTGEN}
    function WriteData(const Buffer: AnsiChar): NativeInt; overload;
    function WriteData(const Buffer: AnsiChar; Count: NativeInt): NativeInt; overload;
{$ENDIF NEXTGEN}
    function WriteData(const Buffer: Char): NativeInt; overload;
    function WriteData(const Buffer: Char; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: Int8): NativeInt; overload;
    function WriteData(const Buffer: Int8; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: UInt8): NativeInt; overload;
    function WriteData(const Buffer: UInt8; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: Int16): NativeInt; overload;
    function WriteData(const Buffer: Int16; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: UInt16): NativeInt; overload;
    function WriteData(const Buffer: UInt16; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: Int32): NativeInt; overload;
    function WriteData(const Buffer: Int32; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: UInt32): NativeInt; overload;
    function WriteData(const Buffer: UInt32; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: Int64): NativeInt; overload;
    function WriteData(const Buffer: Int64; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: UInt64): NativeInt; overload;
    function WriteData(const Buffer: UInt64; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: Single): NativeInt; overload;
    function WriteData(const Buffer: Single; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: Double): NativeInt; overload;
    function WriteData(const Buffer: Double; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: Extended): NativeInt; overload;
    function WriteData(const Buffer: Extended; Count: NativeInt): NativeInt; overload;
    function WriteData(const Buffer: TExtended80Rec): NativeInt; overload;
    function WriteData(const Buffer: TExtended80Rec; Count: NativeInt): NativeInt; overload;

    function WriteData<T>(const Buffer: T): NativeInt; overload;
    function WriteData<T>(const Buffer: T; Count: NativeInt): NativeInt; overload;

    function Seek32(const Offset: Integer; Origin: TSeekOrigin): Int64; overload; inline;
    function Seek(Offset: Longint; Origin: Word): Longint; overload; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; overload; override;
    function Seek(const Offset: Int64; Origin: Word): Int64; overload; deprecated; inline;

    procedure ReadBuffer(var Buffer; Count: NativeInt); overload;
    procedure ReadBuffer(var Buffer: TBytes; Count: NativeInt); overload;
    procedure ReadBuffer(var Buffer: TBytes; Offset, Count: NativeInt); overload;

    procedure ReadBufferData(var Buffer: Boolean); overload;
    procedure ReadBufferData(var Buffer: Boolean; Count: NativeInt); overload;
{$IFDEF NEXTGEN}
    procedure ReadBufferData(var Buffer: UTF8Char); overload;
    procedure ReadBufferData(var Buffer: UTF8Char; Count: NativeInt); overload;
{$ELSE !NEXTGEN}
    procedure ReadBufferData(var Buffer: AnsiChar); overload;
    procedure ReadBufferData(var Buffer: AnsiChar; Count: NativeInt); overload;
{$ENDIF NEXTGEN}
    procedure ReadBufferData(var Buffer: Char); overload;
    procedure ReadBufferData(var Buffer: Char; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: Int8); overload;
    procedure ReadBufferData(var Buffer: Int8; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: UInt8); overload;
    procedure ReadBufferData(var Buffer: UInt8; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: Int16); overload;
    procedure ReadBufferData(var Buffer: Int16; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: UInt16); overload;
    procedure ReadBufferData(var Buffer: UInt16; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: Int32); overload;
    procedure ReadBufferData(var Buffer: Int32; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: UInt32); overload;
    procedure ReadBufferData(var Buffer: UInt32; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: Int64); overload;
    procedure ReadBufferData(var Buffer: Int64; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: UInt64); overload;
    procedure ReadBufferData(var Buffer: UInt64; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: Single); overload;
    procedure ReadBufferData(var Buffer: Single; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: Double); overload;
    procedure ReadBufferData(var Buffer: Double; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: Extended); overload;
    procedure ReadBufferData(var Buffer: Extended; Count: NativeInt); overload;
    procedure ReadBufferData(var Buffer: TExtended80Rec); overload;
    procedure ReadBufferData(var Buffer: TExtended80Rec; Count: NativeInt); overload;

    procedure WriteBuffer(const Buffer; Count: NativeInt); overload;
    procedure WriteBuffer(const Buffer: TBytes; Count: NativeInt); overload;
    procedure WriteBuffer(const Buffer: TBytes; Offset, Count: NativeInt); overload;

    procedure WriteBufferData(var Buffer: Integer; Count: NativeInt); overload;

    function CopyFrom(const Source: TStream; Count: Int64): Int64; inline;
    function ReadComponent(const Instance: TComponent): TComponent;
    function ReadComponentRes(const Instance: TComponent): TComponent;
    procedure WriteComponent(const Instance: TComponent);
    procedure WriteComponentRes(const ResName: string; const Instance: TComponent);
    procedure WriteDescendent(const Instance, Ancestor: TComponent);
    procedure WriteDescendentRes(const ResName: string; const Instance, Ancestor: TComponent);
    procedure WriteResourceHeader(const ResName: string; out FixupInfo: Integer);
    procedure FixupResourceHeader(FixupInfo: Integer); inline;
    procedure ReadResHeader;
    property Position: Int64 read GetPosition write SetPosition;
    property Size: Int64 read GetSize write SetSize64;
    property Wrapped: TStream read FWrapped;
  end;

implementation

{ TDecoratedStream }

constructor TDecoratedStream.Create(wrappedStream: TStream);
begin
  inherited Create;
  FWrapped := wrappedStream;
end;

destructor TDecoratedStream.Destroy;
begin
  FreeAndNil(FWrapped);
  inherited;
end;

// new functionality

procedure TDecoratedStream.Advance(delta: int64);
begin
  Position := Position + delta;
end;

procedure TDecoratedStream.Append(source: TStream);
begin
  Position := Size;
  FWrapped.CopyFrom(source, 0);
end;

function TDecoratedStream.AtEnd: boolean;
begin
  Result := (BytesLeft = 0);
end;

function TDecoratedStream.BytesLeft: int64;
begin
  Result := (Size - Position);
end;

procedure TDecoratedStream.Clear;
begin
  Size := 0;
end;

procedure TDecoratedStream.GoToEnd;
begin
  Position := Size;
end;

procedure TDecoratedStream.GoToStart;
begin
  Position := 0;
end;

procedure TDecoratedStream.Truncate;
begin
  Size := Position;
end;

// TStream

function TDecoratedStream.CopyFrom(const Source: TStream; Count: Int64): Int64;
begin
  Result := FWrapped.CopyFrom(Source, Count);
end;

procedure TDecoratedStream.FixupResourceHeader(FixupInfo: Integer);
begin
  FWrapped.FixupResourceHeader(FixupInfo);
end;

function TDecoratedStream.GetPosition: Int64;
begin
  Result := FWrapped.Position;
end;

function TDecoratedStream.GetSize: Int64;
begin
  Result := FWrapped.Size;
end;

function TDecoratedStream.Read(var Buffer; Count: Longint): Longint;
begin
  Result := FWrapped.Read(Buffer, Count);
end;

function TDecoratedStream.Read(Buffer: TBytes; Offset, Count: Longint): Longint;
begin
  Result := FWrapped.Read(Buffer, Offset, Count);
end;

function TDecoratedStream.Read(var Buffer: TBytes; Count: Longint): Longint;
begin
  Result := FWrapped.Read(Buffer, Count);
end;

function TDecoratedStream.Read64(Buffer: TBytes; Offset, Count: Int64): Int64;
begin
  Result := FWrapped.Read64(Buffer, Offset, Count);
end;

procedure TDecoratedStream.ReadBuffer(var Buffer; Count: NativeInt);
begin
  FWrapped.ReadBuffer(Buffer, Count);
end;

procedure TDecoratedStream.ReadBuffer(var Buffer: TBytes; Count: NativeInt);
begin
  FWrapped.ReadBuffer(Buffer, Count);
end;

procedure TDecoratedStream.ReadBuffer(var Buffer: TBytes; Offset,
  Count: NativeInt);
begin
  FWrapped.ReadBuffer(Buffer, Offset, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Int32);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: UInt16);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: UInt16; Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Int64; Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: UInt64);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: UInt64; Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Int64);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Int32; Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: UInt32);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: UInt32; Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: AnsiChar;
  Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Char);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Char; Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Boolean);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Boolean;
  Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: AnsiChar);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: UInt8; Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Int16);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Int16; Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Int8);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Int8; Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: UInt8);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Single);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Extended;
  Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: TExtended80Rec);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: TExtended80Rec;
  Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Extended);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Single; Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Double);
begin
  FWrapped.ReadBufferData(Buffer);
end;

procedure TDecoratedStream.ReadBufferData(var Buffer: Double; Count: NativeInt);
begin
  FWrapped.ReadBufferData(Buffer, Count);
end;

function TDecoratedStream.ReadComponent(const Instance: TComponent): TComponent;
begin
  Result := FWrapped.ReadComponent(Instance);
end;

function TDecoratedStream.ReadComponentRes(
  const Instance: TComponent): TComponent;
begin
  Result := FWrapped.ReadComponentRes(Instance);
end;

function TDecoratedStream.ReadData(var Buffer: UInt16;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: UInt16): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: Int16;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(Buffer: Pointer;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: Int32): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: Int64;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: Int64): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: UInt32;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: UInt32): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: Int32;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(const Buffer: TBytes;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: Int8): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: Int8;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: UInt8): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: UInt8;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: Int16): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: Char;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: Boolean): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: Boolean;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: AnsiChar): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: AnsiChar;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: Char): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: UInt64): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: Extended): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: Extended;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: TExtended80Rec): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: TExtended80Rec;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: Double;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: UInt64;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData(var Buffer: Single): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: Double): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer);
end;

function TDecoratedStream.ReadData(var Buffer: Single;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData(Buffer, Count);
end;

function TDecoratedStream.ReadData<T>(var Buffer: T;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.ReadData<T>(Buffer, Count);
end;

function TDecoratedStream.ReadData<T>(var Buffer: T): NativeInt;
begin
  Result := FWrapped.ReadData<T>(Buffer);
end;

procedure TDecoratedStream.ReadResHeader;
begin
  FWrapped.ReadResHeader;
end;

function TDecoratedStream.Seek(const Offset: Int64; Origin: Word): Int64;
begin
  Result := FWrapped.Seek(Offset, Origin);
end;

function TDecoratedStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  Result := FWrapped.Seek(Offset, Origin);
end;

function TDecoratedStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result := FWrapped.Seek(Offset, Origin);
end;

function TDecoratedStream.Seek32(const Offset: Integer;
  Origin: TSeekOrigin): Int64;
begin
  Result := FWrapped.Seek32(Offset, Origin);
end;

procedure TDecoratedStream.SetPosition(const Pos: Int64);
begin
  FWrapped.Position := Pos;
end;

procedure TDecoratedStream.SetSize64(const NewSize: Int64);
begin
  FWrapped.Size := NewSize;
end;

function TDecoratedStream.Write(const Buffer; Count: Longint): Longint;
begin
  Result := FWrapped.Write(Buffer, Count);
end;

function TDecoratedStream.Write(const Buffer: TBytes; Offset,
  Count: Longint): Longint;
begin
  Result := FWrapped.Write(Buffer, Offset, Count);
end;

function TDecoratedStream.Write(const Buffer: TBytes; Count: Longint): Longint;
begin
  Result := FWrapped.Write(Buffer, Count);
end;

function TDecoratedStream.Write64(const Buffer: TBytes; Offset,
  Count: Int64): Int64;
begin
  Result := FWrapped.Write64(Buffer, Offset, Count);
end;

procedure TDecoratedStream.WriteBuffer(const Buffer; Count: NativeInt);
begin
  FWrapped.WriteBuffer(Buffer, Count);
end;

procedure TDecoratedStream.WriteBuffer(const Buffer: TBytes; Count: NativeInt);
begin
  FWrapped.WriteBuffer(Buffer, Count);
end;

procedure TDecoratedStream.WriteBuffer(const Buffer: TBytes; Offset,
  Count: NativeInt);
begin
  FWrapped.WriteBuffer(Buffer, Offset, Count);
end;

procedure TDecoratedStream.WriteBufferData(var Buffer: Integer;
  Count: NativeInt);
begin
  FWrapped.WriteBufferData(Buffer, Count);
end;

procedure TDecoratedStream.WriteComponent(const Instance: TComponent);
begin
  FWrapped.WriteComponent(Instance);
end;

procedure TDecoratedStream.WriteComponentRes(const ResName: string;
  const Instance: TComponent);
begin
  FWrapped.WriteComponentRes(ResName, Instance);
end;

function TDecoratedStream.WriteData(const Buffer: Int16): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: UInt8;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: Int8;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: UInt8): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: UInt16): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: UInt16;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: Int32): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: Int16;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: Int8): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: Boolean;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: TBytes;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: Pointer;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: Boolean): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: Char;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: Char): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: AnsiChar;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: AnsiChar): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: Int32;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: Double;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: Double): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: Single;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: Extended): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: TExtended80Rec;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: TExtended80Rec): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: Extended;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: Int64): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: UInt32;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: UInt32): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: Int64;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: Single): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData(const Buffer: UInt64;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer, Count);
end;

function TDecoratedStream.WriteData(const Buffer: UInt64): NativeInt;
begin
  Result := FWrapped.WriteData(Buffer);
end;

function TDecoratedStream.WriteData<T>(const Buffer: T): NativeInt;
begin
  Result := FWrapped.WriteData<T>(Buffer);
end;

function TDecoratedStream.WriteData<T>(const Buffer: T;
  Count: NativeInt): NativeInt;
begin
  Result := FWrapped.WriteData<T>(Buffer, Count);
end;

procedure TDecoratedStream.WriteDescendent(const Instance,
  Ancestor: TComponent);
begin
  FWrapped.WriteDescendent(Instance, Ancestor);
end;

procedure TDecoratedStream.WriteDescendentRes(const ResName: string;
  const Instance, Ancestor: TComponent);
begin
  FWrapped.WriteDescendentRes(ResName, Instance, Ancestor);
end;

procedure TDecoratedStream.WriteResourceHeader(const ResName: string;
  out FixupInfo: Integer);
begin
//  FWrapped.WriteResourceHeader(ResName, FixupInfo);
end;

end.
