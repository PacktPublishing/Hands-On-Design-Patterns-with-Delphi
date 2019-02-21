unit PrototypeJSONMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Prototype.CloneableJSON;

type
  TfrmPrototype = class(TForm)
    btnMasterFooBar: TButton;
    lblMaster: TLabel;
    lbLog: TListBox;
    btnSetValue: TButton;
    lblClone: TLabel;
    btnJSON: TButton;
    btnCloneFooBar: TButton;
    btnCloneValue: TButton;
    procedure btnJSONClick(Sender: TObject);
    procedure btnCloneFooBarClick(Sender: TObject);
    procedure btnMasterFooBarClick(Sender: TObject);
    procedure btnSetValueClick(Sender: TObject);
    procedure btnCloneValueClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FClone: TCloneableJSON;
    FMaster: TCloneableJSON;
    procedure Log(const msg: string);
    function NextNumber(data: TStream): integer;
  public
  end;

var
  frmPrototype: TfrmPrototype;

implementation

{$R *.dfm}

procedure TfrmPrototype.btnJSONClick(Sender: TObject);
begin
  FreeAndNil(FClone);
  FClone := FMaster.CloneJSON;
end;

procedure TfrmPrototype.btnCloneFooBarClick(Sender: TObject);
begin
  Log('Clone: ' + FClone.FooBar);
end;

procedure TfrmPrototype.btnMasterFooBarClick(Sender: TObject);
begin
  Log('Master: ' + FMaster.FooBar);
end;

procedure TfrmPrototype.btnCloneValueClick(Sender: TObject);
begin
  Log('Clone: Value = ' + FClone.Data.Value.ToString);
end;

procedure TfrmPrototype.btnSetValueClick(Sender: TObject);
begin
  FMaster.Data.Value := Random(100);
  Log('Master: Value set to ' + FMaster.Data.Value.ToString);
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
  FMaster := TCloneableJSON.Create;
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
