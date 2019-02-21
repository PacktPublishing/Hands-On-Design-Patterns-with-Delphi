unit ObserverMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  ObservedModel;

type
  TfrmObserver = class(TForm)
    inpPrice: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    inpDiscount: TSpinEdit;
    lbLog: TListBox;
    Label3: TLabel;
    inpEndPrice: TEdit;
    btnBeginUpdate: TButton;
    btnEndUpdate: TButton;
    procedure btnBeginUpdateClick(Sender: TObject);
    procedure btnEndUpdateClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure inpDiscountChange(Sender: TObject);
    procedure inpPriceChange(Sender: TObject);
  private
    FModel: TObservableModel;
    FEditObserver: IObserver;
    FListBoxObserver: IObserver;
  public
  end;

var
  frmObserver: TfrmObserver;

implementation

{$R *.dfm}

type
  TModelObserver = class(TInterfacedObject, IObserver)
  strict private
    FNotifier: TProc<TObservableModel>;
  public
    constructor Create(notifier: TProc<TObservableModel>);
    procedure Update(Subject: TObject);
  end;

{ TModelObserver }

constructor TModelObserver.Create(notifier: TProc<TObservableModel>);
begin
  inherited Create;
  FNotifier := notifier;
end;

procedure TModelObserver.Update(Subject: TObject);
begin
  FNotifier(Subject as TObservableModel);
end;

{ TfrmObserver }

procedure TfrmObserver.btnBeginUpdateClick(Sender: TObject);
begin
  FModel.BeginUpdate;
end;

procedure TfrmObserver.btnEndUpdateClick(Sender: TObject);
begin
  FModel.EndUpdate;
end;

procedure TfrmObserver.FormCreate(Sender: TObject);
begin
  FModel := TObservableModel.Create;
  FModel.BasePrice := inpPrice.Value;
  FModel.Discount := inpDiscount.Value;

  FEditObserver := TModelObserver.Create(
    procedure (model: TObservableModel)
    begin
      inpEndPrice.Text := Format('%.1f', [model.EndPrice]);
    end);
  FModel.Attach(FEditObserver);

  FListBoxObserver := TModelObserver.Create(
    procedure (model: TObservableModel)
    begin
      lbLog.ItemIndex := lbLog.Items.Add(Format('New price: %.1f (%.1f * %d%%)',
        [model.EndPrice, model.BasePrice, 100 - model.Discount]));
    end);
  FModel.Attach(FListBoxObserver);
end;

procedure TfrmObserver.FormDestroy(Sender: TObject);
begin
  FModel.Detach(FEditObserver);
  FModel.Detach(FListBoxObserver);
  FreeAndNil(FModel);
end;

procedure TfrmObserver.inpDiscountChange(Sender: TObject);
begin
  FModel.Discount := inpDiscount.Value;
end;

procedure TfrmObserver.inpPriceChange(Sender: TObject);
begin
  FModel.BasePrice := inpPrice.Value;
end;

end.
