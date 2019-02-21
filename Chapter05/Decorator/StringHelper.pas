unit StringHelper;

interface

type
  TStringHelper = record helper for string
    function MixedCase: string;
  end;

implementation

uses
  System.SysUtils;

{ TStringHelper }

function TStringHelper.MixedCase: string;
var
  i: Integer;
begin
  Result := Self;
  for i := 1 to Length(Result) do
    if Odd(i) then
      Result[i] := UpCase(Result[i])
    else if CharInSet(Result[i], ['A'..'Z']) then
      Result[i] := char(Ord(Result[i]) + (Ord('a') - Ord('A')));
end;

end.
