unit PipelineMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  WebSpider;

type
  TfrmPipeline = class(TForm)
    btnStart: TButton;
    inpUrl: TEdit;
    lbLog: TListBox;
    procedure btnStartClick(Sender: TObject);
  private
    FWebSpider: TWebSpider;
    procedure StopSpider;
  public
  end;

var
  frmPipeline: TfrmPipeline;

implementation

uses
  System.StrUtils;

{$R *.dfm}

procedure TfrmPipeline.btnStartClick(Sender: TObject);
begin
  if not assigned(FWebSpider) then begin
    FWebSpider := TWebSpider.Create;
    FWebSpider.OnPageProcessed :=
      procedure (url: string)
      begin
        lbLog.Items.Add(url);
      end;
    FWebSpider.OnFinished := StopSpider;
    FWebSpider.Start(inpUrl.Text);
    inpUrl.Enabled := false;
    btnStart.Caption := 'Stop';
  end
  else
    StopSpider;
end;

procedure TfrmPipeline.StopSpider;
begin
  FWebSpider.Stop;
  FreeAndNil(FWebSpider);
  inpUrl.Enabled := true;
  btnStart.Caption := 'Start';
end;


end.
