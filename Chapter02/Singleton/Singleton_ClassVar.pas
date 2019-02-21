unit Singleton_ClassVar;

interface

uses
  Vcl.StdCtrls;

type
  TSingletonCV = class
  strict private
    class var FSingleton: TSingletonCV;
  public
    class destructor DestroyClass;
    class function Instance: TSingletonCV;
    procedure Log(logTarget: TListBox; const msg: string);
  end;

implementation

uses
  System.SysUtils;

{ TSingletonCV }

class destructor TSingletonCV.DestroyClass;
begin
  FreeAndNil(FSingleton);
end;

class function TSingletonCV.Instance: TSingletonCV;
begin
  if not assigned(FSingleton) then
    FSingleton := TSingletonCV.Create;
  Result := FSingleton;
end;

procedure TSingletonCV.Log(logTarget: TListBox; const msg: string);
begin
  logTarget.ItemIndex := logTarget.Items.Add(
    Format('[%p] %s %s', [pointer(Self), FormatDateTime('hh:mm:ss', Now), msg]));
end;

end.
