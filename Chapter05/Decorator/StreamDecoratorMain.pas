unit StreamDecoratorMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmDecorator = class(TForm)
    btnStream: TButton;
    lbLog: TListBox;
    procedure btnStreamClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDecorator: TfrmDecorator;

implementation

uses
  DecoratedStream;

{$R *.dfm}

procedure TfrmDecorator.btnStreamClick(Sender: TObject);
var
  stream: TDecoratedStream;
begin
  stream := TDecoratedStream.Create(TStringStream.Create(
              'Hands-On Design Patterns with Delphi'));
  try
    stream.GoToStart;
    while stream.BytesLeft > 12 do
      stream.Advance(1);
    stream.Truncate;

    lbLog.Items.Add(TStringStream(stream.Wrapped).DataString);
  finally
    FreeAndNil(stream);
  end;
end;

end.
