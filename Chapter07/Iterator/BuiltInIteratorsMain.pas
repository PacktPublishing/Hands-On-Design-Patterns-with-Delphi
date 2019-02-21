unit BuiltInIteratorsMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmIterator = class(TForm)
    btnArray: TButton;
    lbLog: TListBox;
    btnString: TButton;
    btnSet: TButton;
    btnList: TButton;
    procedure btnArrayClick(Sender: TObject);
    procedure btnListClick(Sender: TObject);
    procedure btnSetClick(Sender: TObject);
    procedure btnStringClick(Sender: TObject);
  private
    function AlignName(align: TAlign): string;
    procedure Log(const msg: string);
  public
    { Public declarations }
  end;

var
  frmIterator: TfrmIterator;

implementation

uses
  System.TypInfo,
  System.Generics.Collections;

{$R *.dfm}

function TfrmIterator.AlignName(align: TAlign): string;
begin
  Result := GetEnumName(TypeInfo(TAlign), Ord(align));
end;

procedure TfrmIterator.btnArrayClick(Sender: TObject);
var
  el: Integer;
  fib: TArray<Integer>;
  i: Integer;
begin
  fib := TArray<integer>.Create(1, 1, 2, 3, 5, 8, 13);

  Log('"Standard" array access');
  for i := Low(fib) to High(fib) do
    Log(fib[i].ToString);

  Log('Iterating over an array');
  for el in fib do
    Log(el.ToString);
end;

procedure TfrmIterator.btnListClick(Sender: TObject);
var
  el: Integer;
  list: TList<integer>;
  i: Integer;
begin
  list := TList<integer>.Create;
  try
    list.AddRange([1, 1, 2, 3, 5, 8]);

    Log('"Standard" list access');
    for i := 0 to list.Count - 1 do
      Log(list[i].ToString);

    Log('Iteration over a list');
    for el in list do
      Log(el.ToString);
  finally
    FreeAndNil(list);
  end;
end;

procedure TfrmIterator.btnSetClick(Sender: TObject);
var
  align: TAlign;
  alignSet: TAlignSet;
begin
  alignSet := [alLeft, alRight, alTop, alBottom];

  Log('"Standard" set access');
  for align := Low(TAlign) to High(TAlign) do
    if align in alignSet then
      Log(AlignName(align));

  Log('Iteration over a set');
  for align in alignSet do
    Log(AlignName(align));
end;

procedure TfrmIterator.btnStringClick(Sender: TObject);
var
  ch: Char;
  s: string;
  i: Integer;
begin
  s := 'Delphi!';

  Log('"Standard" string access');
  for i := 1 to Length(s) do
    Log(s[i]);

  Log('Iterating over a string');
  for ch in s do
    Log(ch);
end;

procedure TfrmIterator.Log(const msg: string);
begin
  lbLog.ItemIndex := lbLog.Items.Add(msg);
end;

end.
