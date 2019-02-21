unit FunctionalSpringMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Spring.Collections;

type
  TfrmFunctionalSpring = class(TForm)
    btnIEnum: TButton;
    lbLog: TListBox;
    btnIEnumFluent: TButton;
    procedure btnIEnumClick(Sender: TObject);
    procedure btnIEnumFluentClick(Sender: TObject);
  private
    function GenerateData(count: integer): TArray<integer>;
    procedure WriteOut(const source: IEnumerable<string>);
  public
  end;

var
  frmFunctionalSpring: TfrmFunctionalSpring;

implementation

{$R *.dfm}

procedure TfrmFunctionalSpring.btnIEnumClick(Sender: TObject);
var
  data1: IList<integer>;
  data2: IEnumerable<integer>;
  data3: IEnumerable<integer>;
  data4: IEnumerable<integer>;
  data5: IEnumerable<string>;
begin
  data1 := TCollections.CreateList<integer>(GenerateData(1000));
  data2 := data1.Where(
    function (const value: integer): boolean
    begin
      Result := (not Odd(value)) and ((value mod 17) = 0);
    end);
  data3 := data2.Take(10);
  data4 := data3.Reversed;
  data5 := TEnumerable.Select<integer, string>(data4, IntToStr);
  WriteOut(data5);
end;

procedure TfrmFunctionalSpring.btnIEnumFluentClick(Sender: TObject);
var
  data: IEnumerable<integer>;
begin
  data := TCollections.CreateList<integer>(GenerateData(1000))
    .Where(
      function (const value: integer): boolean
      begin
        Result := (not Odd(value)) and ((value mod 17) = 0);
      end)
    .Take(10)
    .Reversed;
  WriteOut(TEnumerable.Select<integer, string>(data, IntToStr));
end;

function TfrmFunctionalSpring.GenerateData(count: integer): TArray<integer>;
var
  i: integer;
begin
  SetLength(Result, count);
  for i := 1 to count do
    Result[i-1] := i;
end;

procedure TfrmFunctionalSpring.WriteOut(const source: IEnumerable<string>);
var
  s: string;
begin
  lbLog.Items.BeginUpdate;
  try
    lbLog.Items.Clear;
    for s in source do
      lbLog.Items.Add(s);
  finally
    lbLog.Items.EndUpdate;
  end;
end;

end.
