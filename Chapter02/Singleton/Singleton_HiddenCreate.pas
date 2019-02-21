unit Singleton_HiddenCreate;

interface

uses
  Vcl.StdCtrls;

type
  TSingletonHC = class
  strict protected
    constructor Create;
  public
    class function Instance: TSingletonHC;
    procedure Log(logTarget: TListBox; const msg: string);
  end;

implementation

uses
  SysUtils;

var
  GSingleton: TSingletonHC;

constructor TSingletonHC.Create;
begin
  inherited Create;
end;

class function TSingletonHC.Instance: TSingletonHC;
begin
  if not assigned(GSingleton) then
    GSingleton := TSingletonHC.Create;
  Result := GSingleton;
end;

procedure TSingletonHC.Log(logTarget: TListBox; const msg: string);
begin
  logTarget.ItemIndex := logTarget.Items.Add(
    Format('[%p] %s %s', [pointer(Self), FormatDateTime('hh:mm:ss', Now), msg]));
end;

initialization
finalization
  FreeAndNil(GSingleton);
end.
