unit FunctionalMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmFunctional = class(TForm)
    btnFilterMap: TButton;
    lbLog: TListBox;
    btnFilterMap2: TButton;
    procedure btnFilterMapClick(Sender: TObject);
    procedure btnFilterMap2Click(Sender: TObject);
  private
    function DivisibleBy17(value: integer): boolean;
    function GenerateData(count: integer): TArray<integer>;
    procedure WriteOut(const data: TArray<string>);
  public
  end;

var
  frmFunctional: TfrmFunctional;

implementation

uses
  FunctionalDelphi;

{$R *.dfm}

procedure TfrmFunctional.btnFilterMapClick(Sender: TObject);
var
  data1: TArray<integer>;
  data2: TArray<integer>;
  data3: TArray<integer>;
  isEven: TFunc<integer,boolean>;
begin
  data1 := GenerateData(500);
  isEven :=
    function(value: integer): boolean
    begin
      Result := not Odd(value);
    end;
  data2 := Functional.Filter<integer>(data1, isEven);
  data3 := Functional.Filter<integer>(data2, DivisibleBy17);
  WriteOut(Functional.Map<integer,string>(data3, IntToStr));
end;

procedure TfrmFunctional.btnFilterMap2Click(Sender: TObject);
var
  data1: TArray<integer>;
  data2: TArray<integer>;
  data3: TArray<integer>;
  isEven: TFunc<integer,boolean>;
begin
  data1 := GenerateData(500);
  data1 := GenerateData(500);
  isEven :=
    function(value: integer): boolean
    begin
      Result := not Odd(value);
    end;
  isEven :=
    function(value: integer): boolean
    begin
      Result := not Odd(value);
    end;
  data2 := Functional.Filter<integer>(data1, isEven);
  data2 := Functional.Filter<integer>(data1, isEven);
  data3 := Functional.Filter<integer>(data2, DivisibleBy17);
  data3 := Functional.Filter<integer>(data2, DivisibleBy17);
  WriteOut(Functional.Map<integer,string>(data3, IntToStr));
  WriteOut(Functional.Map<integer,string>(data3, IntToStr));
end;

function TfrmFunctional.DivisibleBy17(value: integer): boolean;
begin
  Result := (value mod 17) = 0;
end;

function TfrmFunctional.GenerateData(count: integer): TArray<integer>;
var
  i: integer;
begin
  SetLength(Result, count);
  for i := 1 to count do
    Result[i-1] := i;
end;

procedure TfrmFunctional.WriteOut(const data: TArray<string>);
var
  s: string;
begin
  lbLog.Items.BeginUpdate;
  try
    lbLog.Items.Clear;
    for s in data do
      lbLog.Items.Add(s);
  finally
    lbLog.Items.EndUpdate;
  end;
end;

end.
