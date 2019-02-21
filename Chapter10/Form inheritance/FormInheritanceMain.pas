unit FormInheritanceMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    btnDialog1: TButton;
    btnDialog2: TButton;
    procedure btnDialog1Click(Sender: TObject);
    procedure btnDialog2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  DialogForm1, DialogForm2;

{$R *.dfm}

procedure TfrmMain.btnDialog1Click(Sender: TObject);
begin
  frmDialog1.ShowModal;
end;

procedure TfrmMain.btnDialog2Click(Sender: TObject);
begin
  frmDialog2.ShowModal;
end;

end.
