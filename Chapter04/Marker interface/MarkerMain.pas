unit MarkerMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Customer.Interfaces, Customer.Attributes;

type
  TfrmMarker = class(TForm)
    btnCustomerCheckIntf: TButton;
    lbLog: TListBox;
    btnCustomerCheckAttr: TButton;
    procedure btnCustomerCheckAttrClick(Sender: TObject);
    procedure btnCustomerCheckIntfClick(Sender: TObject);
  private
    procedure LogCustomerIntf(customer: ICustomer);
    procedure LogCustomerAttr(customer: TNormalCustomer);
  public
  end;

var
  frmMarker: TfrmMarker;

implementation

uses
  System.StrUtils;

{$R *.dfm}

procedure TfrmMarker.btnCustomerCheckAttrClick(Sender: TObject);
var
  cust1: TNormalCustomer;
  cust2: TNormalCustomer;
  cust3: TNormalCustomer;
begin
  cust1 := TNormalCustomer.Create;
  cust1.Name := 'Joe Schmoe';

  cust2 := TVIPCustomer.Create;
  cust2.Name := 'Mr. Big';

  cust3 := TStarCustomer.Create;
  cust3.Name := 'Mars ambassador';

  LogCustomerAttr(cust1);
  LogCustomerAttr(cust2);
  LogCustomerAttr(cust3);

  FreeAndNil(cust1);
  FreeAndNil(cust2);
  FreeAndNil(cust3);
end;

procedure TfrmMarker.btnCustomerCheckIntfClick(Sender: TObject);
var
  cust1: ICustomer;
  cust2: ICustomer;
begin
  cust1 := TCustomer.Create;
  cust1.Name := 'Joe Schmoe';

  cust2 := TImportantCustomer.Create;
  cust2.Name := 'Mr. Big';

  LogCustomerIntf(cust1);
  LogCustomerIntf(cust2);
end;

procedure TfrmMarker.LogCustomerAttr(customer: TNormalCustomer);
var
  descr: string;
  stars: string;
begin
  if IsImportantCustomer(customer, stars) then
    descr := 'very important client with rating ' + stars
  else
    descr := 'just a regular guy';
  lbLog.Items.Add(customer.Name + ' is ' + descr);
end;

procedure TfrmMarker.LogCustomerIntf(customer: ICustomer);
begin
  lbLog.Items.Add(customer.Name + ' is ' +
    IfThen(Supports(customer, IImportantCustomer),
      'very important client!',
      'just a regular guy'));
end;

end.
