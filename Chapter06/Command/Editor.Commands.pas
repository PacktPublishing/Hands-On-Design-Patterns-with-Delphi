unit Editor.Commands;

interface

uses
  System.Generics.Collections,
  Vcl.StdCtrls;

type
  // Command
  TCommand = class
  strict private
    FReceiver: TMemo;
  public
    constructor Create(receiver: TMemo);
    function Clone: TCommand; virtual;
    procedure Execute; virtual;
    procedure Undo; virtual;
    property Receiver: TMemo read FReceiver write FReceiver;
  end;

  TUndoableCommand = class(TCommand)
  strict private
    FText: string;
    FPosition: Integer;
  strict protected
    procedure StoreState;
  public
    function Clone: TCommand; override;
    procedure Execute; override;
    procedure Undo; override;
  end;

  TKeyPressCommand = class(TUndoableCommand)
  strict private
    FKey: char;
  public
    constructor Create(receiver: TMemo; key: char);
    function Clone: TCommand; override;
    procedure Execute; override;
  end;

  TDeleteLeftCommand = class(TUndoableCommand)
  public
    function Clone: TCommand; override;
    procedure Execute; override;
  end;

  TMacroCommand = class(TUndoableCommand)
  strict private
    FCommands: TObjectList<TCommand>;
  public
    procedure Add(command: TCommand);
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    function Clone: TCommand; override;
    procedure Execute; override;
  end;

implementation

uses
  System.SysUtils;

{ TCommand }

constructor TCommand.Create(receiver: TMemo);
begin
  inherited Create;
  FReceiver := receiver;
end;

function TCommand.Clone: TCommand;
begin
  Result := TCommand.Create(Receiver);
end;

procedure TCommand.Execute;
begin
end;

procedure TCommand.Undo;
begin
end;

{ TUndoableCommand }

function TUndoableCommand.Clone: TCommand;
begin
  Result := TUndoableCommand.Create(Receiver);
end;

procedure TUndoableCommand.Execute;
begin
  StoreState;
end;

procedure TUndoableCommand.StoreState;
begin
  FText := Receiver.Text;
  FPosition := Receiver.SelStart;
end;

procedure TUndoableCommand.Undo;
begin
  Receiver.Text := FText;
  Receiver.SelStart := FPosition;
end;

{ TKeyPressCommmand }

constructor TKeyPressCommand.Create(receiver: TMemo; key: char);
begin
  inherited Create(receiver);
  FKey := key;
end;

function TKeyPressCommand.Clone: TCommand;
begin
  Result := TKeyPressCommand.Create(Receiver, FKey);
end;

procedure TKeyPressCommand.Execute;
var
  pos: Integer;
  s: string;
begin
  inherited;
  s := Receiver.Text;
  pos := Receiver.SelStart;
  Insert(FKey, s, pos+1);
  Receiver.Text := s;
  Receiver.SelStart := pos + 1;
end;

{ TDeleteLeftCommand }

function TDeleteLeftCommand.Clone: TCommand;
begin
  Result := TDeleteLeftCommand.Create(Receiver);
end;

procedure TDeleteLeftCommand.Execute;
var
  pos: Integer;
  s: string;
begin
  pos := Receiver.SelStart;
  if pos = 0 then
    Exit;

  inherited;
  s := Receiver.Text;
  Delete(s, pos, 1);
  Receiver.Text := s;
  Receiver.SelStart := pos - 1;
end;

{ TMacroCommand }

procedure TMacroCommand.Add(command: TCommand);
begin
  FCommands.Add(command);
end;

procedure TMacroCommand.AfterConstruction;
begin
  inherited;
  FCommands := TObjectList<TCommand>.Create;
end;

procedure TMacroCommand.BeforeDestruction;
begin
  FreeAndNil(FCommands);
  inherited;
end;

function TMacroCommand.Clone: TCommand;
var
  cmd: TCommand;
begin
  Result := TMacroCommand.Create(Receiver);
  for cmd in FCommands do
    TMacroCommand(Result).Add(cmd.Clone);
end;

procedure TMacroCommand.Execute;
var
  cmd: TCommand;
begin
  inherited;
  for cmd in FCommands do begin
    cmd.Receiver := Receiver;
    cmd.Execute;
  end;
end;

end.
