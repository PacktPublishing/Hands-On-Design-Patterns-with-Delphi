unit ThreadedFooBar;

interface

uses
  System.Classes;

type
  TFooBarThread = class(TThread)
  strict protected
    procedure SendMessage(const msg: string); virtual; abstract;
  public
    procedure Execute; override;
  end;

implementation

uses
  System.SysUtils;

procedure TFooBarThread.Execute;
var
  number: Integer;
begin
  for number := 1 to 100 do begin
    case number mod 15 of
      0: SendMessage('FooBar');
      3,6,9,12: SendMessage('Foo');
      5,10: SendMessage('Bar');
      else SendMessage(number.ToString);
    end;
    Sleep(100);
  end;
  SendMessage(#13#10);
end;

end.
