unit EventsMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Samples.Spin,
  DeltaTime;

type
  TfrmEvents = class(TForm)
    lbLog: TListBox;
    inpTimeOffset: TSpinEdit;
    lblTimeOffset: TLabel;
    lblTimeOffset_h: TLabel;
    pnlTimeNow: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button1MouseEnter(Sender: TObject);
    procedure Button1MouseLeave(Sender: TObject);
    procedure inpTimeOffsetChange(Sender: TObject);
  private
    FDeltaTime: TDeltaTime;
  strict protected
    procedure Log(const msg: string);
    procedure ReportDeltaChanged(Sender: TObject);
    procedure ReportDeltaChangedProc(const deltaTime: TDeltaTime);
    procedure ShowTimeInListBox(Sender: TObject);
    procedure ShowTimeInPanel(Sender: TObject);
  public
  end;

var
  frmEvents: TfrmEvents;

implementation

{$R *.dfm}

procedure TfrmEvents.FormCreate(Sender: TObject);
begin
  FDeltaTime := TDeltaTime.Create;
  FDeltaTime.OnDeltaChanged := ReportDeltaChanged;
  FDeltaTime.OnDeltaChangedProc :=
    procedure
    begin
      ReportDeltaChangedProc(FDeltaTime);
    end;
  FDeltaTime.OnDeltaChangedMulti.Add(ShowTimeInPanel);
  FDeltaTime.OnDeltaChangedMulti.Add(ShowTimeInListBox);
end;

procedure TfrmEvents.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDeltaTime);
end;

procedure TfrmEvents.Button1Click(Sender: TObject);
begin
  ShowMessage('You clicked button ' + (Sender as TButton).Tag.ToString);
end;

procedure TfrmEvents.Button1MouseEnter(Sender: TObject);
begin
  (Sender as TButton).Caption := 'Mouse is over the button!';
end;

procedure TfrmEvents.Button1MouseLeave(Sender: TObject);
begin
  (Sender as TButton).Caption := 'Button' + (Sender as TButton).Tag.ToString;
end;

procedure TfrmEvents.inpTimeOffsetChange(Sender: TObject);
begin
  FDeltaTime.Delta_h := inpTimeOffset.Value;
end;

procedure TfrmEvents.Log(const msg: string);
begin
  lbLog.ItemIndex := lbLog.Items.Add(msg);
end;

procedure TfrmEvents.ReportDeltaChanged(Sender: TObject);
begin
  Log('New delta (via object method): ' +
    (Sender as TDeltaTime).Delta_h.ToString);
end;

procedure TfrmEvents.ReportDeltaChangedProc(const deltaTime: TDeltaTime);
begin
  Log('New delta (via anonymous procedure): ' +
    deltaTime.Delta_h.ToString);
end;

procedure TfrmEvents.ShowTimeInListBox(Sender: TObject);
begin
  Log('Time is ' + FormatDateTime('dd hh:nn:ss', (Sender as TDeltaTime).Now));
end;

procedure TfrmEvents.ShowTimeInPanel(Sender: TObject);
begin
  pnlTimeNow.Caption := FormatDateTime('yyyy-mm-dd hh:nn:ss', (Sender as TDeltaTime).Now);
end;

end.
