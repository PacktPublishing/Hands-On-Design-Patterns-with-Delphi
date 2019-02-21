unit HelpersMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmHelpers = class(TForm)
    btnStream: TButton;
    btnString: TButton;
    lbLog: TListBox;
    procedure btnStreamClick(Sender: TObject);
    procedure btnStringClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHelpers: TfrmHelpers;

implementation

uses
  StringHelper,
  StreamHelper;

{$R *.dfm}

procedure TfrmHelpers.btnStreamClick(Sender: TObject);
var
  stream: TStringStream;
begin
  stream := TStringStream.Create('Hands-On Design Patterns with Delphi');
  try
    stream.GoToStart;
    while stream.BytesLeft > 12 do
      stream.Advance(1);
    stream.Truncate;

    lbLog.Items.Add(stream.DataString);
  finally
    FreeAndNil(stream);
  end;
end;

procedure TfrmHelpers.btnStringClick(Sender: TObject);
begin
  lbLog.Items.Add('Hands-On Design Patterns with Delphi'.MixedCase);
  // Will not work as StringHelper.TStringHelper overrides SysUtils.TStringHelper
  // lbLog.Items.Add('Hands-On Design Patterns with Delphi'.ToUpper);
end;

end.
