unit Singleton_NewInstance;

interface

uses
  Vcl.StdCtrls;

type
  TSingletonNI = class
  strict private
  class var
    FSingleton   : TSingletonNI;
    FShuttingDown: boolean;
  strict protected
    class function GetInstance: TSingletonNI; static;
  public
    class destructor Destroy;
    class function NewInstance: TObject; override;
    class property Instance: TSingletonNI read GetInstance;
    procedure FreeInstance; override;
    procedure Log(logTarget: TListBox; const msg: string);
  end;

implementation

uses
  System.SysUtils;

{ TSingletonNI }

class destructor TSingletonNI.Destroy;
begin
  FShuttingDown := true;
  FreeAndNil(FSingleton);
  inherited;
end;

procedure TSingletonNI.FreeInstance;
begin
  if FShuttingDown then
    inherited;
end;

class function TSingletonNI.GetInstance: TSingletonNI;
begin
  Result := TSingletonNI.Create;
end;

procedure TSingletonNI.Log(logTarget: TListBox; const msg: string);
begin
  logTarget.ItemIndex := logTarget.Items.Add(
    Format('[%p] %s %s', [pointer(Self), FormatDateTime('hh:mm:ss', Now), msg]));
end;

class function TSingletonNI.NewInstance: TObject;
begin
  if not assigned(FSingleton) then
    FSingleton := TSingletonNI(inherited NewInstance);
  Result := FSingleton;
end;

end.
