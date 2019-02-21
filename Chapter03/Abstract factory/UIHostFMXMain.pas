unit UIHostFMXMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmFMXHost = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFMXHost: TfrmFMXHost;

implementation

uses
  AbstractEBLForm,
  FormFactory.FMX;

{$R *.fmx}

procedure TfrmFMXHost.Button1Click(Sender: TObject);
var
  form: TAbstractEBLForm;
begin
  form := TAbstractEBLForm.Create(TFMXFormFactory.Create);
  try
    form.Make;
    form.Show;
  finally
    FreeAndNil(form);
  end;
end;

end.
