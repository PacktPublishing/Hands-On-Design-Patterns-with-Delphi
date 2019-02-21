unit NullStreamMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmNullObject = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNullObject: TfrmNullObject;

implementation

uses
  NullStream;

{$R *.dfm}

procedure TfrmNullObject.Button1Click(Sender: TObject);
var
  str: TStream;
begin
  str := TNullStream.Create;
  try
    ShowMessage(str.Write(str, 4).ToString);
    ShowMessage(str.Read(str, 4).ToString);
    ShowMessage(str.Position.ToString);
    ShowMessage(str.Size.ToString);
  finally
    FreeAndNil(str);
  end;
end;

end.
