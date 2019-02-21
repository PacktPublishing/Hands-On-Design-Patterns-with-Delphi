unit Singleton_Class;

interface

uses
  Vcl.StdCtrls;

type
  SingletonCl = class
  public
    class procedure Log(logTarget: TListBox; const msg: string);
  end;

implementation

uses
  System.SysUtils;

class procedure SingletonCl.Log(logTarget: TListBox; const msg: string);
begin
  logTarget.ItemIndex := logTarget.Items.Add(
    Format('[%p] %s %s', [pointer(Self), FormatDateTime('hh:mm:ss', Now), msg]));
end;

end.
