unit UnquoteString.State;

interface

function Unquote(const s: string): string;

implementation

uses
  System.SysUtils,
  System.Classes;

type
  TState = (stStart, stNormal, stQuote, stEnd);

  TUnquoteState = class
  strict private
    FState: TState;
  protected
    procedure RaiseInvalidString;
  public
    constructor Create(const state: TState);
    procedure Update(const input: string; var output: string;
      var newState: TState); virtual;
    property State: TState read FState;
  end;

  TStartState = class(TUnquoteState)
  public
    procedure Update(const input: string; var output: string;
      var newState: TState); override;
  end;

  TNormalState = class(TUnquoteState)
  public
    procedure Update(const input: string; var output: string;
      var newState: TState); override;
  end;

  TQuoteState = class(TUnquoteState)
  public
    procedure Update(const input: string; var output: string;
      var newState: TState); override;
  end;

  TEndState = class(TUnquoteState)
  public
    procedure Update(const input: string; var output: string;
      var newState: TState); override;
  end;

  TUnquoter = class
  strict private
    FState: TUnquoteState;
  strict protected
    function GetState: TState;
    procedure SetState(const value: TState);
    property State: TState read GetState write SetState;
  public
    destructor Destroy; override;
    procedure Unquote(reader, writer: TStringStream);
  end;

function Unquote(const s: string): string;
var
  reader: TStringStream;
  unquoter: TUnquoter;
  writer: TStringStream;
begin
  reader := TStringStream.Create(s);
  try
    writer := TStringStream.Create('');
    try
      unquoter := TUnquoter.Create;
      try
        unquoter.Unquote(reader, writer);
        Result := writer.DataString;
      finally
        FreeAndNil(unquoter);
      end;
    finally
      FreeAndNil(writer);
    end;
  finally
    FreeAndNil(reader);
  end;
end;

{ TUnquoter }

destructor TUnquoter.Destroy;
begin
  FreeAndNil(FState);
  inherited;
end;

function TUnquoter.GetState: TState;
begin
  Result := FState.State;
end;

procedure TUnquoter.SetState(const value: TState);
begin
  if assigned(FState) and (FState.State = value) then
    Exit;

  FreeAndNil(FState);
  case value of
    stStart:  FState := TStartState.Create(value);
    stNormal: FState := TNormalState.Create(value);
    stQuote:  FState := TQuoteState.Create(value);
    stEnd:    FState := TEndState.Create(value);
  end;
end;

procedure TUnquoter.Unquote(reader, writer: TStringStream);
var
  emit: string;
  newState: TState;
begin
  State := stStart;
  while State <> stEnd do
  begin
    FState.Update(reader.ReadString(1), emit, newState);
    if emit <> '' then
      writer.WriteString(emit);
    State := newState;
  end;
end;

{ TUnquoteState }

constructor TUnquoteState.Create(const state: TState);
begin
  inherited Create;
  FState := state;
end;

procedure TUnquoteState.RaiseInvalidString;
begin
  raise Exception.Create('Invalid quoted string');
end;

procedure TUnquoteState.Update(const input: string; var output: string;
  var newState: TState);
begin
  output := '';
  newState := State;
end;

{ TStartState }

procedure TStartState.Update(const input: string; var output: string;
  var newState: TState);
begin
  inherited;
  if input = '"' then
    newState := stNormal
  else
    RaiseInvalidString;
end;

{ TNormalState }

procedure TNormalState.Update(const input: string; var output: string;
  var newState: TState);
begin
  inherited;
  if input = '"' then
    newState := stQuote
  else if input <> '' then
    output := input
  else
    RaiseInvalidString;
end;

{ TQuoteState }

procedure TQuoteState.Update(const input: string; var output: string;
  var newState: TState);
begin
  inherited;
  if input = '' then
    newState := stEnd
  else if input = '"' then begin
    output := '"';
    newState := stNormal;
  end
  else
    RaiseInvalidString;
end;

{ TEndState }

procedure TEndState.Update(const input: string; var output: string;
  var newState: TState);
begin
  raise Exception.Create('TEndState.Update: Internal error');
end;

end.

