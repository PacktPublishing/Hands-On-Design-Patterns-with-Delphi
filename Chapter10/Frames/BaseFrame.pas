unit BaseFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.WebBrowser, FMX.Controls.Presentation, FMX.Edit;

type
  TfrBaseFrame = class(TFrame)
    WebBrowser: TWebBrowser;
    inpURL: TEdit;
  private
  public
  end;

implementation

{$R *.fmx}

end.
