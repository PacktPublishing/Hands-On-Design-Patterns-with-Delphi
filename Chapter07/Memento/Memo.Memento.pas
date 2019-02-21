unit Memo.Memento;

interface

uses
  System.Types,
  Vcl.StdCtrls;

type
  TMemoMemento = record
  private
    FCaretPos: TPoint;
    FSelLength: Integer;
    FSelStart: Integer;
    FText: string;
  end;

  TMemoHelper = class helper for TMemo
  public
    function CreateMemento: TMemoMemento;
    procedure RestoreMemento(const memento: TMemoMemento);
  end;

implementation

{ TMemoHelper }

function TMemoHelper.CreateMemento: TMemoMemento;
begin
  Result.FCaretPos := CaretPos;
  Result.FSelStart := SelStart;
  Result.FSelLength := SelLength;
  Result.FText := Text;
end;

procedure TMemoHelper.RestoreMemento(const memento: TMemoMemento);
begin
  CaretPos := memento.FCaretPos;
  SelStart := memento.FSelStart;
  SelLength := memento.FSelLength;
  Text := memento.FText;
end;

end.
