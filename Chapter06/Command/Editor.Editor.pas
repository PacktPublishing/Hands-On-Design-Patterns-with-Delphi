unit Editor.Editor;

interface

uses
  System.Generics.Collections,
  Editor.Commands;

type
  // Invoker
  TEditor = class
  strict private
    FUndo: TStack<TCommand>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Execute(command: TCommand);
    procedure Undo(command: TCommand);
    function IsUndoEmpty: boolean;
    function PopLastCommand: TCommand;
  end;

implementation

uses
  System.SysUtils;

{ TEditor }

constructor TEditor.Create;
begin
  inherited Create;
  FUndo := TStack<TCommand>.Create;
end;

destructor TEditor.Destroy;
begin
  while FUndo.Count > 0 do
    FUndo.Pop.Free;
  FreeAndNil(FUndo);
  inherited;
end;

procedure TEditor.Execute(command: TCommand);
begin
  command.Execute;
  FUndo.Push(command);
end;

function TEditor.IsUndoEmpty: boolean;
begin
  Result := FUndo.Count = 0;
end;

function TEditor.PopLastCommand: TCommand;
begin
  Result := FUndo.Pop;
end;

procedure TEditor.Undo(command: TCommand);
begin
  command.Undo;
  command.Free;
end;

end.
