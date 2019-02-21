unit LazyPatternMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmLazyInitialization = class(TForm)
    btnMakeOwner: TButton;
    btnLazyObject: TButton;
    btnLazyInternalField: TButton;
    lbLog: TListBox;
    btnLazyInternalFieldSafe: TButton;
    procedure btnLazyInternalFieldClick(Sender: TObject);
    procedure btnLazyObjectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMakeOwnerClick(Sender: TObject);
    procedure btnLazyInternalFieldSafeClick(Sender: TObject);
  private
    procedure Log(const msg: string);
  public
  end;

var
  frmLazyInitialization: TfrmLazyInitialization;

implementation

uses
  Lazy.Lazy;

{$R *.dfm}

procedure TfrmLazyInitialization.FormCreate(Sender: TObject);
begin
  Lazy.Lazy.GLogger :=
    procedure (msg: string)
    begin
      Log(msg);
    end;
end;

procedure TfrmLazyInitialization.Log(const msg: string);
begin
  lbLog.Items.Add(msg);
end;

procedure TfrmLazyInitialization.btnMakeOwnerClick(Sender: TObject);
var
  obj: TLazyOwner;
begin
  obj := TLazyOwner.Create;
  FreeAndNil(obj);
  Log('---');
end;

procedure TfrmLazyInitialization.btnLazyObjectClick(Sender: TObject);
var
  lazyObj: TLazyObject;
  obj    : TLazyOwner;
begin
  obj := TLazyOwner.Create;
  try
    Log('Accessing Lazy object');
    lazyObj := obj.LazyObject;
    Log('Accessing Lazy object again');
    obj.LazyObject.DoSomething;
  finally FreeAndNil(obj); end;
  Log('---');
end;

procedure TfrmLazyInitialization.btnLazyInternalFieldClick(Sender: TObject);
var
  obj: TLazyOwner;
begin
  obj := TLazyOwner.Create;
  try
    Log('Accessing Lazy internal object');
    obj.ProcessUsingLazy;
    Log('Accessing Lazy internal object again');
    obj.ProcessUsingLazy;
  finally FreeAndNil(obj); end;
  Log('---');
end;

procedure TfrmLazyInitialization.btnLazyInternalFieldSafeClick(Sender: TObject);
var
  obj: TLazyOwner;
begin
  obj := TLazyOwner.Create;
  try
    Log('Accessing Lazy internal object (safe)');
    obj.ProcessUsingLazySafe;
    Log('Accessing Lazy internal object (safe) again');
    obj.ProcessUsingLazySafe;
  finally FreeAndNil(obj); end;
  Log('---');
end;

end.
