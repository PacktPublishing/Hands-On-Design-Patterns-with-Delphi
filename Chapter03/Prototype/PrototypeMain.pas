unit PrototypeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Prototype.Cloneable;

type
  TfrmPrototype = class(TForm)
    btnMasterFooBar: TButton;
    lblMaster: TLabel;
    lbLog: TListBox;
    btnMasterNextNumber: TButton;
    btnClone: TButton;
    lblClone: TLabel;
    btnCreate: TButton;
    btnAssign: TButton;
    btnCloneFooBar: TButton;
    btnCloneNextNumber: TButton;
    procedure btnAssignClick(Sender: TObject);
    procedure btnCloneFooBarClick(Sender: TObject);
    procedure btnMasterFooBarClick(Sender: TObject);
    procedure btnMasterNextNumberClick(Sender: TObject);
    procedure btnCloneNextNumberClick(Sender: TObject);
    procedure btnCloneClick(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FClone: TCloneable;
    FMaster: TCloneable;
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
  FClone := TCloneable.Create;
  FClone.Assign(FMaster);
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

procedure TfrmPrototype.btnCloneClick(Sender: TObject);
begin
  FreeAndNil(FClone);
  FClone := FMaster.Clone;
  Log('Cloned with Clone');
end;

procedure TfrmPrototype.btnCreateClick(Sender: TObject);
begin
  FreeAndNil(FClone);
  FClone := TCloneable.CreateFrom(FMaster);
  Log('Cloned with Create');
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
  FMaster := TCloneable.Create;
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
