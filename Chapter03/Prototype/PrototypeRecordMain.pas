unit PrototypeRecordMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Prototype.Rec;

type
  TfrmPrototypeRecord = class(TForm)
    btnCloneRecord: TButton;
    lbLog: TListBox;
    procedure btnCloneRecordClick(Sender: TObject);
  private
    FMasterCharacter: TCharacter;
    function CreateRecord: TCloneableRec;
    procedure LogRecord(const name: string; const rec: TCloneableRec);
  public
  end;

var
  frmPrototypeRecord: TfrmPrototypeRecord;

implementation

{$R *.dfm}

function GetRefCount(const intf: IInterface): integer;
begin
  Result := intf._AddRef - 1;
  intf._Release;
end;

{ TfrmPrototypeRecord }

procedure TfrmPrototypeRecord.btnCloneRecordClick(Sender: TObject);
var
  source: TCloneableRec;
  clone: TCloneableRec;
begin
  FMasterCharacter := TCharacter.Create;
  try
    FMasterCharacter.Value := '*';

    source := CreateRecord;
    LogRecord('Original', source);

    clone := source;
    LogRecord('Clone', clone);

    source.Str := 'Changed';
    source.Intf.Value := source.Intf.Value * 2;
    source.ArrS[Low(source.ArrS)] := 9999;
    source.ArrD[Low(source.ArrD)] := 9999;
    source.Obj.Value := '+';
    LogRecord('Clone', clone);
  finally
    FreeAndNil(FMasterCharacter);
  end;
end;

function TfrmPrototypeRecord.CreateRecord: TCloneableRec;
var
  i: integer;
begin
  Result.Str := 'Cloneable record';
  Result.Int := 21;
  Result.Intf := TInteger.Create;
  Result.Intf.Value := 1234;
  for i := Low(Result.ArrS) to High(Result.ArrS) do
    Result.ArrS[i] := i;
  SetLength(Result.ArrD, 5);
  for i := Low(Result.ArrD) to High(Result.ArrD) do
    Result.ArrD[i] := 10*i;
  Result.Rec.ValueI := 9999;
  Result.Rec.ValueS := '----';
  Result.Obj := FMasterCharacter;
end;

procedure TfrmPrototypeRecord.LogRecord(const name: string;
  const rec: TCloneableRec);

  function ToString(const intArr: array of integer): string;
  var
    strArr: TArray<string>;
    i: integer;
    j: integer;
  begin
    SetLength(strArr, Length(intArr));
    j := Low(strArr);
    for i := Low(intArr) to High(intArr) do begin
      strArr[j] := IntToStr(intArr[i]);
      Inc(j);
    end;
    Result := string.Join(', ', strArr);
  end;

begin
  lbLog.Items.Add(name);
  lbLog.Items.Add(Format('Str: %s', [rec.Str]));
  lbLog.Items.Add(Format('Int: %d', [rec.Int]));
  lbLog.Items.Add(Format('Intf: %d [%d]', [rec.Intf.Value, GetRefCount(rec.Intf)]));
  lbLog.Items.Add(Format('ArrS: %s', [ToString(rec.ArrS)]));
  lbLog.Items.Add(Format('ArrD: %s', [ToString(rec.ArrD)]));
  lbLog.Items.Add(Format('Rec: %d, %s', [rec.Rec.ValueI, rec.Rec.ValueS]));
  lbLog.Items.Add(Format('Obj: %s [%p]', [rec.Obj.Value, pointer(rec.Obj)]));
  lbLog.Items.Add('');
end;

end.
