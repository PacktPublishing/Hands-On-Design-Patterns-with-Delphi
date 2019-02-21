unit Singleton_Factory;

interface

uses
  Vcl.StdCtrls;

type
  ISingletonF = interface ['{5182E010-121F-4CD9-85EB-4F31D34354F2}']
    procedure Log(logTarget: TListBox; const msg: string);
  end;

function SingletonF: ISingletonF;

implementation

uses
  System.SysUtils;

type
  TSingletonF = class(TInterfacedObject, ISingletonF)
  public
    destructor Destroy; override;
    procedure Log(logTarget: TListBox; const msg: string);
  end;

var
  GSingletonF: ISingletonF; // Change this to `TSingletonF` and singleton will be destroyed when no-one is using it

function SingletonF: ISingletonF;
begin
  if not assigned(GSingletonF) then
    GSingletonF := TSingletonF.Create;
  Result := GSingletonF;
end;

destructor TSingletonF.Destroy;
begin
  GSingletonF := nil;
  inherited;
end;

procedure TSingletonF.Log(logTarget: TListBox; const msg: string);
begin
  logTarget.ItemIndex := logTarget.Items.Add(
    Format('[%p] %s %s', [pointer(Self), FormatDateTime('hh:mm:ss', Now), msg]));
end;

end.
