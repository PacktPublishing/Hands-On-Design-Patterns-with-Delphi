unit LazySpring4DMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  LazySpring4D.Lazy;

type
  TfrmLazySpring4DMain = class(TForm)
    btnLazyObject: TButton;
    lbLog: TListBox;
    btnLazyInterface: TButton;
    btnMakeOwner: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnLazyInterfaceClick(Sender: TObject);
    procedure btnLazyObjectClick(Sender: TObject);
    procedure btnMakeOwnerClick(Sender: TObject);
  private
    procedure Log(msg: string);
  public
  end;

var
  frmLazySpring4DMain: TfrmLazySpring4DMain;

implementation

{$R *.dfm}

procedure TfrmLazySpring4DMain.FormCreate(Sender: TObject);
begin
  GLogger :=
    procedure (msg: string)
    begin
      Log(msg);
    end;
end;

procedure TfrmLazySpring4DMain.Log(msg: string);
begin
  lbLog.Items.Add(msg);
end;

procedure TfrmLazySpring4DMain.btnMakeOwnerClick(Sender: TObject);
var
  obj: TLazyOwner;
begin
  obj := TLazyOwner.Create;
  FreeAndNil(obj);
  Log('---');
end;

procedure TfrmLazySpring4DMain.btnLazyObjectClick(Sender: TObject);
var
  lazyObj: TLazyObj;
  obj    : TLazyOwner;
begin
  obj := TLazyOwner.Create;
  try
    Log('Accessing Lazy object');
    lazyObj := obj.Lazy;
    Log('Accessing Lazy object again');
    obj.Lazy.DoSomething;
  finally FreeAndNil(obj); end;
  Log('---');
end;

procedure TfrmLazySpring4DMain.btnLazyInterfaceClick(Sender: TObject);
var
  lazyInt: ILazyInt;
  obj    : TLazyOwner;
begin
  obj := TLazyOwner.Create;
  try
    Log('Accesing LazyInt');
    lazyInt := obj.LazyInt;
    Log('Accesing LazyInt again');
    obj.LazyInt.DoSomething;
  finally FreeAndNil(obj); end;
  Log('---');
end;

end.
