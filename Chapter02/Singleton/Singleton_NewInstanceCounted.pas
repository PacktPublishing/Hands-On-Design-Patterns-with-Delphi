unit Singleton_NewInstanceCounted;

interface

uses
  Vcl.StdCtrls;

type
  TSingletonNIC = class
  strict private
  class var
    FInstanceCount: integer;
    FSingleton    : TSingletonNIC;
  public
    class destructor Destroy;
    procedure FreeInstance; override;
    class function NewInstance: TObject; override;
    procedure Log(logTarget: TListBox; const msg: string);
  end;

implementation

uses
  System.SysUtils;

{ TSingletonNIC }

class destructor TSingletonNIC.Destroy;
begin
  FreeAndNil(FSingleton);
  inherited;
end;

procedure TSingletonNIC.FreeInstance;
begin
  Dec(FInstanceCount);
  if FInstanceCount = 0 then begin
    inherited;
    FSingleton := nil;
  end;
end;

procedure TSingletonNIC.Log(logTarget: TListBox; const msg: string);
begin
  logTarget.ItemIndex := logTarget.Items.Add(
    Format('[%p] %s %s', [pointer(Self), FormatDateTime('hh:mm:ss', Now), msg]));
end;

class function TSingletonNIC.NewInstance: TObject;
begin
  if not assigned(FSingleton) then
    FSingleton := TSingletonNIC(inherited NewInstance);
  Result := FSingleton;
  Inc(FInstanceCount);
end;

end.

