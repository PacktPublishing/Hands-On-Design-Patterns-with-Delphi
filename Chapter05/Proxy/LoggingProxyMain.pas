unit LoggingProxyMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TButton = class(Vcl.StdCtrls.TButton)
  public
    procedure Click; override;
  end;

  TfrmProxy = class(TForm)
    btnLoggingProxy: TButton;
    lbLog: TListBox;
    procedure btnLoggingProxyClick(Sender: TObject);
  private
  public
    procedure Log(const msg: string);
  end;

var
  frmProxy: TfrmProxy;

implementation

{$R *.dfm}

{ TButton }

procedure TButton.Click;
begin
  frmProxy.Log('Button ' + Self.Name + ' will be clicked!');
  inherited;
  frmProxy.Log('Button ' + Self.Name + ' was clicked!');
end;

{ TfrmProxy }

procedure TfrmProxy.btnLoggingProxyClick(Sender: TObject);
begin
  Log('Click!');
end;

procedure TfrmProxy.Log(const msg: string);
begin
  lbLog.Items.Add(msg);
end;

end.
