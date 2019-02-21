unit Singleton_GlobalVar;

interface

uses
  Vcl.StdCtrls;

type
  TSingletonGV = class
  public
    procedure Log(logTarget: TListBox; const msg: string);
  end;

var
  SingletonGV: TSingletonGV;

implementation

uses
  SysUtils;

procedure TSingletonGV.Log(logTarget: TListBox; const msg: string);
begin
  logTarget.ItemIndex := logTarget.Items.Add(
    Format('[%p] %s %s', [pointer(Self), FormatDateTime('hh:mm:ss', Now), msg]));
end;

initialization
  SingletonGV := TSingletonGV.Create;
finalization
  FreeAndNil(SingletonGV);
end.
