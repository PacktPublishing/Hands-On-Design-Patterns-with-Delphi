unit Logger.TextFile;

interface

uses
  Logger.Intf;

type
  TFileLogger = class(TInterfacedObject, ILogger)
  strict private
    FFileName: string;
    FFile: textfile;
  public
    constructor Create(const fileName: string);
    function Initialize: boolean;
    procedure Log(const msg: string); overload;
    procedure Log(const msg: string; const params: array of const); overload;
    procedure Close;
  end;

implementation

uses
  System.SysUtils;

{ TFileLogger }

constructor TFileLogger.Create(const fileName: string);
begin
  inherited Create;
  FFileName := fileName;
end;

procedure TFileLogger.Close;
begin
  CloseFile(FFile);
end;

function TFileLogger.Initialize: boolean;
begin
  Assign(FFile, FFileName);
  if FileExists(FFileName) then
    {$I-} Append(FFile) {$I+}
  else
    {$I-} Rewrite(FFile); {$I+}
  Result := (IOResult = 0);
end;

procedure TFileLogger.Log(const msg: string);
begin
  Writeln(FFile, msg);
end;

procedure TFileLogger.Log(const msg: string; const params: array of const);
begin
  Log(Format(msg, params));
end;

end.
