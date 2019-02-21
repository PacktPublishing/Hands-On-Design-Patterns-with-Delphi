unit FramesMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, BaseFrame, DerivedFrame,
  FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmFrames = class(TForm)
    btnNewTab: TButton;
    TabControl: TTabControl;
    procedure btnNewTabClick(Sender: TObject);
  private
    procedure FrameStartLoading(Sender: TObject);
  public
  end;

var
  frmFrames: TfrmFrames;

implementation

{$R *.fmx}

procedure TfrmFrames.btnNewTabClick(Sender: TObject);
var
  tabItem: TTabItem;
  webBrowser: TfrDerivedFrame;
begin
  tabItem := TabControl.Add;
  tabItem.Text := '<blank page>';

  webBrowser := TfrDerivedFrame.Create(tabItem);
  webBrowser.Parent := tabItem;
  webBrowser.Align := TAlignLayout.Client;
  webBrowser.OnStartLoading := FrameStartLoading;

  webBrowser.SetFocusToURL;
  TabControl.ActiveTab := tabItem;
end;

procedure TfrmFrames.FrameStartLoading(Sender: TObject);
var
  webBrowser: TfrDerivedFrame;
begin
  webBrowser := Sender as TfrDerivedFrame;
  (webBrowser.Parent.Parent as TTabItem).Text := webBrowser.URL;
end;

end.
