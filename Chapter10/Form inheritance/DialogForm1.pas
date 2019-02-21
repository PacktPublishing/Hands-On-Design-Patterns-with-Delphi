unit DialogForm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDialogForm, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmDialog1 = class(TfrmBaseDialog)
    procedure btnHelpClick(Sender: TObject);
  private
  public
  end;

var
  frmDialog1: TfrmDialog1;

implementation

{$R *.dfm}

procedure TfrmDialog1.btnHelpClick(Sender: TObject);
begin
  ShowMessage('No help available for this dialog');
end;

end.
