unit DerivedFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.WebBrowser,
  BaseFrame;

type
  TfrDerivedFrame = class(TfrBaseFrame)
    procedure inpURLKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift:
      TShiftState);
  private
    FOnStartLoading: TNotifyEvent;
    function GetURL: string;
    procedure SetURL(const value: string);
  public
    procedure SetFocusToURL;
    property URL: string read GetURL write SetURL;
    property OnStartLoading: TNotifyEvent read FOnStartLoading write FOnStartLoading;
  end;

var
  frDerivedFrame: TfrDerivedFrame;

implementation

{$R *.fmx}

function TfrDerivedFrame.GetURL: string;
begin
  Result := inpURL.Text;
end;

procedure TfrDerivedFrame.inpURLKeyDown(Sender: TObject; var Key: Word; var KeyChar:
  Char; Shift: TShiftState);
begin
  if Key = vkReturn then begin
    WebBrowser.URL := inpURL.Text;
    if assigned(FOnStartLoading) then
      FOnStartLoading(Self);
  end;
end;

procedure TfrDerivedFrame.SetFocusToURL;
begin
  inpURL.SetFocus;
end;

procedure TfrDerivedFrame.SetURL(const value: string);
begin
  inpURL.Text := value;
end;

end.
