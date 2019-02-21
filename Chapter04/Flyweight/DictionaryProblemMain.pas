unit DictionaryProblemMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmDictProblem = class(TForm)
    btnDefault: TButton;
    btnCustom: TButton;
    procedure btnCustomClick(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDictProblem: TfrmDictProblem;

implementation

uses
  System.Hash,
  System.Generics.Defaults, System.Generics.Collections;

{$R *.dfm}

type
  TKey = record
    Key: string;
    constructor Create(AKey: string);
  end;

procedure TfrmDictProblem.btnDefaultClick(Sender: TObject);
var
  dict: TDictionary<TKey,integer>;
  k1: TKey;
  k2: TKey;
  val: integer;
begin
  dict := TDictionary<TKey,integer>.Create;
  try
    k1 := TKey.Create('42');
    k2 := TKey.Create('4' +'2');

    // Both k1 and k2 contain the same value in the Key field ('42'),
    // but each has its own copy of that value so in reality the Key field,
    // which is just a pointer into memory, is not equal.
    // In other words, k1.Key = k2.Key, but pointer(k1.Key) <> pointer(k2.Key).
    // That is why the following code fails to find the record in the dictionary.

    dict.Add(k1, 42);
    if dict.TryGetValue(k2, val) then
      ShowMessage('Stored: ' + val.ToString)
    else
      ShowMessage('Not found');
  finally
    FreeAndNil(dict);
  end;
end;

procedure TfrmDictProblem.btnCustomClick(Sender: TObject);
var
  comparer: IEqualityComparer<TKey>;
  dict: TDictionary<TKey,integer>;
  k1: TKey;
  k2: TKey;
  val: integer;
begin
  comparer := TEqualityComparer<TKey>.Construct(
    function (const left, right: TKey): boolean
    begin
      Result := left.Key = right.Key;
    end,
    function (const value: TKey): integer
    var
      hasher: THashBobJenkins;
    begin
      hasher := THashBobJenkins.Create;
      hasher.Update(value.Key);
      Result := hasher.HashAsInteger;
    end
  );

  dict := TDictionary<TKey,integer>.Create(comparer);
  try
    k1 := TKey.Create('42');
    k2 := TKey.Create('4' +'2');

    dict.Add(k1, 42);
    if dict.TryGetValue(k2, val) then
      ShowMessage('Stored: ' + val.ToString)
    else
      ShowMessage('Not found');
  finally
    FreeAndNil(dict);
  end;
end;

{ TKey }

constructor TKey.Create(AKey: string);
begin
  Key := AKey;
end;

end.
