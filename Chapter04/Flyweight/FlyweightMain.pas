unit FlyweightMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Customer, Company;

type
  TfrmFlyweight = class(TForm)
    lbCustomers: TListBox;
    lblCustomers: TLabel;
    grpPersonal: TGroupBox;
    grpCompanyData: TGroupBox;
    bnAddCustomer: TButton;
    lblSelected: TLabel;
    inpPersName: TEdit;
    inpPersAddr: TEdit;
    inpCompAddr: TEdit;
    inpCompName: TEdit;
    lbSelected: TListBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bnAddCustomerClick(Sender: TObject);
    procedure lbCustomersClick(Sender: TObject);
  private
    FCustomers: TList<ICustomer>;
  public
  end;

var
  frmFlyweight: TfrmFlyweight;

implementation

{$R *.dfm}

procedure TfrmFlyweight.FormCreate(Sender: TObject);
begin
  FCustomers := TList<ICustomer>.Create;
end;

procedure TfrmFlyweight.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FCustomers);
end;

procedure TfrmFlyweight.bnAddCustomerClick(Sender: TObject);
var
  customer: ICustomer;
begin
  customer := CreateCustomer(
    TPersonalInfo.Create(inpPersName.Text, inpPersAddr.Text),
    TCompanyInfo.Create(inpCompName.Text, inpCompAddr.Text),
    Company.CreateCompany);

  // FCustomers and lbCustomers are always in sync
  // a better way would be to implement a TVirtualStringTree
  FCustomers.Add(customer);
  lbCustomers.Items.Add(customer.PersonalInfo.Name);
end;

procedure TfrmFlyweight.lbCustomersClick(Sender: TObject);
var
  customer: ICustomer;
begin
  if lbCustomers.ItemIndex >= 0 then begin
    customer := FCustomers[lbCustomers.ItemIndex];
    lbSelected.Items.Add(Format('[%d] %s, %s', [
      customer.PersonalInfo.ID,
      customer.PersonalInfo.Name,
      customer.PersonalInfo.Address]));
    lbSelected.Items.Add(Format('    [%d] %s, %s', [
      customer.CompanyInfo.ID,
      customer.CompanyInfo.Name,
      customer.CompanyInfo.Address]));
    lbSelected.Items.Add('');
  end;
end;

end.
