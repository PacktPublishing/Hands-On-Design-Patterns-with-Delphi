unit CustomIteratorsMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmIterator = class(TForm)
    btnFileInterface: TButton;
    lbLog: TListBox;
    btnFileObject: TButton;
    btnArray: TButton;
    btnFilterFile: TButton;
    btnFilterArray: TButton;
    btnGeneric: TButton;
    procedure btnArrayClick(Sender: TObject);
    procedure btnFileInterfaceClick(Sender: TObject);
    procedure btnFileObjectClick(Sender: TObject);
    procedure btnFilterArrayClick(Sender: TObject);
    procedure btnFilterFileClick(Sender: TObject);
    procedure btnGenericClick(Sender: TObject);
  private
    procedure GenericEnum(enumerator: TEnumerator<string>);
    procedure Log(const msg: string);
  public
    { Public declarations }
  end;

var
  frmIterator: TfrmIterator;

implementation

uses
  CustomIterators.TextFile.IEnumerable,
  CustomIterators.TextFile.TEnumerable,
  CustomIterators.DynArray,
  CustomIterators.Filter;

{$R *.dfm}

procedure TfrmIterator.btnArrayClick(Sender: TObject);
var
  dynArray: TArray<integer>;
  el: Integer;
begin
  dynArray := [1, 1, 2, 3, 5, 8, 13];

  Log('Content of a dynamic array:');
  for el in ArrayEnum.Enum<integer>(dynArray) do
    Log(el.ToString);
end;

procedure TfrmIterator.btnFileInterfaceClick(Sender: TObject);
var
  line: string;
begin
  Log('Content of "CustomIterators.dpr":');
  for line in TextFileContentI('..\..\CustomIterators.dpr') do
    Log(line);
end;

procedure TfrmIterator.btnFileObjectClick(Sender: TObject);
var
  line: string;
begin
  Log('Content of "CustomIterators.dpr":');
  for line in TextFileContentO('..\..\CustomIterators.dpr') do
    Log(line);
end;

procedure TfrmIterator.btnFilterArrayClick(Sender: TObject);
var
  dynArray: TArray<integer>;
  el: Integer;
  enumerator: TEnumerator<integer>;
  oddFilter: TFilterFunc<integer>;
begin
  dynArray := [1, 1, 2, 3, 5, 8, 13];

  // allow even-indexed elements; first element has index = 0
  oddFilter :=
    function (index: integer; const item: integer): boolean
    begin
      Result := not Odd(index);
    end;

  enumerator := ArrayEnum.Enum<integer>(dynArray).GetEnumerator;
  try
    Log('Filtered content of a dynamic array:');
    for el in Filter.Process<integer>(enumerator, oddFilter) do
      Log(el.ToString);
  finally
    FreeAndNil(enumerator);
  end;
end;

procedure TfrmIterator.btnFilterFileClick(Sender: TObject);
var
  line: string;
  enumerator: TEnumerator<string>;
  oddFilter: TFilterFunc<string>;
begin
  // allow even-indexed elements; first element has index = 0
  oddFilter :=
    function (index: integer; const item: string): boolean
    begin
      Result := not Odd(index);
    end;

  enumerator := TextFileContentO('..\..\CustomIterators.dpr').GetEnumerator;
  try
    Log('Filtered content of a file:');
    for line in Filter.Process<string>(enumerator, oddFilter) do
      Log(line);
  finally
    FreeAndNil(enumerator);
  end;
end;

procedure TfrmIterator.btnGenericClick(Sender: TObject);
var
  dynArray: TArray<string>;
  enumerator: TEnumerator<string>;
begin
  enumerator := TextFileContentO('..\..\CustomIterators.dpr').GetEnumerator;
  try
    GenericEnum(enumerator);
  finally
    FreeAndNil(enumerator);
  end;

  dynArray := ['D', 'e', 'l', 'p', 'h', 'i', '!'];
  enumerator := ArrayEnum.Enum<string>(dynArray).GetEnumerator;
  try
    GenericEnum(enumerator);
  finally
    FreeAndNil(enumerator);
  end;
end;

procedure TfrmIterator.GenericEnum(enumerator: TEnumerator<string>);
begin
  while enumerator.MoveNext do
  begin
    Log(enumerator.Current);

    // skip every second line
    if not enumerator.MoveNext then
      break; //while
  end;
end;

procedure TfrmIterator.Log(const msg: string);
begin
  lbLog.ItemIndex := lbLog.Items.Add(msg);
end;

end.
