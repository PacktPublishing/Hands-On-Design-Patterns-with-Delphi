unit PrototypePersistentMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Prototype.CloneablePersistent;

type
  TfrmPrototype = class(TForm)
    btnMasterFooBar: TButton;
    lblMaster: TLabel;
    lbLog: TListBox;
    btnMasterNextNumber: TButton;
    lblClone: TLabel;
    btnAssign: TButton;
    btnCloneFooBar: TButton;
    btnCloneNextNumber: TButton;
    btnSetValue: TButton;
    btnAssignTo: TButton;
    procedure btnAssignClick(Sender: TObject);
    procedure btnAssignToClick(Sender: TObject);
    procedure btnCloneFooBarClick(Sender: TObject);
    procedure btnMasterFooBarClick(Sender: TObject);
    procedure btnMasterNextNumberClick(Sender: TObject);
    procedure btnCloneNextNumberClick(Sender: TObject);
    procedure btnSetValueClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FClone: TNewCloneable;
    FMaster: TNewCloneable;
    procedure Log(const msg: string);
    function NextNumber(data: TStream): integer;
  public
  end;

var
  frmPrototype: TfrmPrototype;

implementation

{$R *.dfm}

procedure TfrmPrototype.btnAssignClick(Sender: TObject);
begin
  FreeAndNil(FClone);
  FClone := FMaster.Clone;
//  FClone.Assign(FMaster);
end;

procedure TfrmPrototype.btnAssignToClick(Sender: TObject);
begin
  lbLog.Items.Assign(FClone);
end;

procedure TfrmPrototype.btnCloneFooBarClick(Sender: TObject);
begin
  Log('Clone: ' + FClone.FooBar);
end;

procedure TfrmPrototype.btnMasterFooBarClick(Sender: TObject);
begin
  Log('Master: ' + FMaster.FooBar);
end;

procedure TfrmPrototype.btnCloneNextNumberClick(Sender: TObject);
begin
  Log('Clone: ' + NextNumber(FClone.Data).ToString);
end;

procedure TfrmPrototype.btnMasterNextNumberClick(Sender: TObject);
begin
  Log('Master: ' + NextNumber(FMaster.Data).ToString);
end;

procedure TfrmPrototype.btnSetValueClick(Sender: TObject);
begin
  FMaster.Value := Random(100);
  Log('Master.Value set to ' + FMaster.Value.ToString);
end;

procedure TfrmPrototype.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FMaster);
  FreeAndNil(FClone);
end;

procedure TfrmPrototype.FormCreate(Sender: TObject);
var
  i: integer;
begin
  FMaster := TNewCloneable.Create;
  for i := 1 to 4 do
    FMaster.Data.WriteBuffer(i, SizeOf(integer));
end;

procedure TfrmPrototype.Log(const msg: string);
begin
  lbLog.Items.Add(msg);
end;

function TfrmPrototype.NextNumber(data: TStream): integer;
begin
  if data.Read(Result, SizeOf(integer)) <> SizeOf(integer) then
  begin
    data.Position := 0;
    data.ReadBuffer(Result, SizeOf(integer));
  end;
end;

end.
