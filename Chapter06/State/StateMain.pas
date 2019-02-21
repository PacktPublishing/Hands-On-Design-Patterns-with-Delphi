unit StateMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmState = class(TForm)
    inpString: TEdit;
    btnUnqClassical: TButton;
    btnUnqState: TButton;
    lbLog: TListBox;
    procedure btnUnqClassicalClick(Sender: TObject);
    procedure btnUnqStateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmState: TfrmState;

implementation

uses
  UnquoteString.Classical,
  UnquoteString.State;

{$R *.dfm}

procedure TfrmState.btnUnqClassicalClick(Sender: TObject);
begin
  lbLog.Items.Add(UnquoteString.Classical.Unquote(inpString.Text));
end;

procedure TfrmState.btnUnqStateClick(Sender: TObject);
begin
  lbLog.Items.Add(UnquoteString.State.Unquote(inpString.Text));
end;

end.
