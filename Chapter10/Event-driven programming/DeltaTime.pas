unit DeltaTime;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections;

type
  TMultiNotifyEvent = class
  strict private
    FList: TList<TNotifyEvent>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(event: TNotifyEvent);
    procedure Remove(event: TNotifyEvent);
    procedure Notify(sender: TObject);
  end;

  TDeltaTime = class
  strict private
    FOnDeltaChangedProc: TProc;
    FOnDeltaChanged: TNotifyEvent;
    FDelta_h: integer;
    FOnDeltaChangedMulti: TMultiNotifyEvent;
  strict protected
    procedure SetDelta_h(const value: integer);
  public
    constructor Create;
    destructor Destroy; override;
    function Now: TDateTime;
    property Delta_h: integer read FDelta_h write SetDelta_h;
    property OnDeltaChanged: TNotifyEvent read FOnDeltaChanged write FOnDeltaChanged;
    property OnDeltaChangedProc: TProc read FOnDeltaChangedProc write FOnDeltaChangedProc;
    property OnDeltaChangedMulti: TMultiNotifyEvent read FOnDeltaChangedMulti;
  end;

implementation

{ TMultiNotifyEvent }

constructor TMultiNotifyEvent.Create;
begin
  inherited Create;
  FList := TList<TNotifyEvent>.Create;
end;

destructor TMultiNotifyEvent.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

procedure TMultiNotifyEvent.Add(event: TNotifyEvent);
begin
  FList.Add(event);
end;

procedure TMultiNotifyEvent.Notify(sender: TObject);
var
  event: TNotifyEvent;
begin
  for event in FList do
    event(sender);
end;

procedure TMultiNotifyEvent.Remove(event: TNotifyEvent);
begin
  FList.Remove(event);
end;

{ TDeltaTime }

constructor TDeltaTime.Create;
begin
  inherited Create;
  FOnDeltaChangedMulti := TMultiNotifyEvent.Create;
end;

destructor TDeltaTime.Destroy;
begin
  FreeAndNil(FOnDeltaChangedMulti);
  inherited;
end;

function TDeltaTime.Now: TDateTime;
begin
  Result := System.SysUtils.Now + Delta_h/HoursPerDay;
end;

procedure TDeltaTime.SetDelta_h(const value: integer);
begin
  if value = FDelta_h then
    Exit;

  FDelta_h := Value;

  if assigned(OnDeltaChanged) then
    OnDeltaChanged(Self);
  if assigned(OnDeltaChangedProc) then
    OnDeltaChangedProc();
  OnDeltaChangedMulti.Notify(Self);
end;

end.
