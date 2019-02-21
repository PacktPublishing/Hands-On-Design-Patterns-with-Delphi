unit SpringMulticastMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  SpringMulticastModel;

type
  TfrmSpringMulticast = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    inpPrice: TSpinEdit;
    inpDiscount: TSpinEdit;
    lbLog: TListBox;
    inpEndPrice: TEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure inpDiscountChange(Sender: TObject);
    procedure inpPriceChange(Sender: TObject);
  private
    FModel: TObservableModel;
    procedure PriceChangedEdit(Sender: TObject);
    procedure PriceChangedListBox(Sender: TObject);
  public
  end;

var
  frmSpringMulticast: TfrmSpringMulticast;

implementation

{$R *.dfm}

{ TfrmSpringObserver }

procedure TfrmSpringMulticast.FormCreate(Sender: TObject);
begin
  FModel := TObservableModel.Create;
  FModel.BasePrice := inpPrice.Value;
  FModel.Discount := inpDiscount.Value;

  FModel.EndPriceChanged.Add(PriceChangedEdit);
  FModel.EndPriceChanged.Add(PriceChangedListBox);
end;

procedure TfrmSpringMulticast.FormDestroy(Sender: TObject);
begin
  FModel.EndPriceChanged.Remove(PriceChangedEdit);
  FModel.EndPriceChanged.Remove(PriceChangedListBox);
  FreeAndNil(FModel);
end;

procedure TfrmSpringMulticast.inpDiscountChange(Sender: TObject);
begin
  FModel.Discount := inpDiscount.Value;
end;

procedure TfrmSpringMulticast.inpPriceChange(Sender: TObject);
begin
  FModel.BasePrice := inpPrice.Value;
end;

procedure TfrmSpringMulticast.PriceChangedEdit(Sender: TObject);
begin
  inpEndPrice.Text := Format('%.1f', [(Sender as TObservableModel).EndPrice]);
end;

procedure TfrmSpringMulticast.PriceChangedListBox(Sender: TObject);
var
  model: TObservableModel;
begin
  model := Sender as TObservableModel;
  lbLog.ItemIndex := lbLog.Items.Add(Format('New price: %.1f (%.1f * %d%%)',
    [model.EndPrice, model.BasePrice, 100 - model.Discount]));
end;

end.
