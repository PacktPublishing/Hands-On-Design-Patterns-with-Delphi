unit UnquoteString.Classical;

interface

function Unquote(const s: string): string;

implementation

uses
  System.SysUtils,
  System.Classes;

procedure InvalidString;
begin
  raise Exception.Create('Invalid quoted string');
end;

procedure UnquoteStr(reader, writer: TStringStream);
type
  TState = (stStart, stNormal, stQuote, stEnd);
var
  next : string;
  state: TState;
begin
  state := stStart;
  while state <> stEnd do begin
    next := reader.ReadString(1);
    case state of
      stStart:
        begin
          if next = '"' then
            state := stNormal
          else
            InvalidString;
        end;
      stNormal:
        begin
          if next = '"' then
            state := stQuote
          else if next <> '' then
            writer.WriteString(next)
          else
            InvalidString;
        end;
      stQuote:
        begin
          if next = '' then
            state := stEnd
          else if next = '"' then begin
            writer.WriteString('"');
            state := stNormal;
          end
          else
            InvalidString;
        end;
      stEnd:
        begin
          raise Exception.Create('UnqouteStr: Internal error');
        end;
    end; //case state
  end; // while
end;

function Unquote(const s: string): string;
var
  reader: TStringStream;
  writer: TStringStream;
begin
  reader := TStringStream.Create(s);
  try
    writer := TStringStream.Create('');
    try
      UnquoteStr(reader, writer);
      Result := writer.DataString;
    finally
      FreeAndNil(writer);
    end;
  finally
    FreeAndNil(reader);
  end;
end;

end.
