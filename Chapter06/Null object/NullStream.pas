unit NullStream;

interface

uses
  System.Classes;

type
  TNullStream = class(TStream)
  public
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; overload; override;
  end;

implementation

uses
  System.SysUtils;

function TNullStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  if Offset <> 0 then
    raise Exception.Create('Cannot seek in null stream');

  Result := 0;
end;

end.
