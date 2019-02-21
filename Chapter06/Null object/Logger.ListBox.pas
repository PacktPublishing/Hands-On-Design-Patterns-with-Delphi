unit Logger.ListBox;

interface

uses
  Vcl.StdCtrls,
  Logger.Intf;

type
  TListboxLogger = class(TInterfacedObject, ILogger)
  strict private
    FListBox: TListBox;
  public
    constructor Create(listBox: TListBox);
    function Initialize: boolean;
    procedure Log(const msg: string); overload;
    procedure Log(const msg: string; const params: array of const); overload;
    procedure Close;
  end;

implementation

uses
  System.SysUtils;

{ TListboxLogger }

procedure TListboxLogger.Close;
begin
end;

constructor TListboxLogger.Create(listBox: TListBox);
begin
  inherited Create;
  FListBox := listBox;
end;

function TListboxLogger.Initialize: boolean;
begin
  Result := assigned(FListBox);
end;

procedure TListboxLogger.Log(const msg: string);
begin
  FListBox.Items.Add(msg);
end;

procedure TListboxLogger.Log(const msg: string; const params: array of const);
begin
  Log(Format(msg, params));
end;

end.
