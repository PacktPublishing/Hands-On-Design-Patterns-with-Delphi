unit UIHostVCLMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmVCLHost = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVCLHost: TfrmVCLHost;

implementation

uses
  AbstractEBLForm,
  FormFactory.VCL;

{$R *.dfm}

procedure TfrmVCLHost.Button1Click(Sender: TObject);
var
  form: TAbstractEBLForm;
begin
  form := TAbstractEBLForm.Create(TVCLFormFactory.Create);
  try
    form.Make;
    form.Show;
  finally
    FreeAndNil(form);
  end;
end;

end.
