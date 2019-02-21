unit HandMadeMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmHandMade = class(TForm)
    btnIterate: TButton;
    btnGetFirst: TButton;
    lbLog: TListBox;
    procedure btnIterateClick(Sender: TObject);
    procedure btnGetFirstClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHandMade: TfrmHandMade;

implementation

{$R *.dfm}

type
  TDataContainer = class
  public type
    TIterateAction = reference to procedure (value: integer);
  strict private
    FData: TArray<integer>;
    FIndex: integer;
  public
    constructor Create(const data: TArray<integer>);
    procedure Iterate(action: TIterateAction);
    function GetFirst(var value: integer): boolean;
    function GetNext(var value: integer): boolean;
  end;

{ TDataContainer }

constructor TDataContainer.Create(const data: TArray<integer>);
begin
  inherited Create;
  FData := data;
end;

function TDataContainer.GetFirst(var value: integer): boolean;
begin
  FIndex := 0;
  Result := GetNext(value);
end;

function TDataContainer.GetNext(var value: integer): boolean;
begin
  Result := FIndex <= High(FData);
  if Result then begin
    value := FData[FIndex];
    Inc(FIndex);
  end;
end;

procedure TDataContainer.Iterate(action: TIterateAction);
var
  i: integer;
begin
  for i := Low(FData) to High(FData) do
    action(FData[i]);
end;

{ TfrmHandMade }

procedure TfrmHandMade.btnIterateClick(Sender: TObject);
var
  data: TDataContainer;
begin
  data := TDataContainer.Create([1, 2, 3, 4, 5]);
  try
    data.Iterate(
      procedure (value: integer)
      begin
        lbLog.Items.Add(value.ToString);
      end);
  finally
    FreeAndNil(data);
  end;
end;

procedure TfrmHandMade.btnGetFirstClick(Sender: TObject);
var
  data: TDataContainer;
  element: Integer;
begin
  data := TDataContainer.Create([6, 7, 8, 9, 10]);
  try
    if data.GetFirst(element) then
      repeat
        lbLog.Items.Add(element.ToString)
      until not data.GetNext(element);
  finally
    FreeAndNil(data);
  end;
end;

end.
