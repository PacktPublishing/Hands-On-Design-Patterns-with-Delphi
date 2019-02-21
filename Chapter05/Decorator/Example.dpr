program Example;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TLegacy = class
  public
    function Operation: string; virtual;
  end;

  TSubLegacy = class(TLegacy)
  public
    procedure DoSomething(const s: string); virtual;
  end;

  TUCDecorator = class(TLegacy)
  private
    FWrapped: TLegacy;
  public
    constructor Create(wrapped: TLegacy);
    destructor Destroy; override;
    function Operation: string; override;
    function OperationUC: string; virtual;
    property Wrapped: TLegacy read FWrapped;
  end;

  TUCDecorator<T: TLegacy> = class(TLegacy)
  private
    FWrapped: T;
  public
    constructor Create(wrapped: T);
    destructor Destroy; override;
    function Operation: string; override;
    function OperationUC: string; virtual;
    property Wrapped: T read FWrapped;
  end;

  TLegacyHelper = class helper for TLegacy
  public
    function UCOperation: string;
  end;

{ TLegacy }

function TLegacy.Operation: string;
begin
  Result := 'Delphi!';
end;

{ TSubLegacy }

procedure TSubLegacy.DoSomething(const s: string);
begin
  Writeln(s);
end;

{ TUCDecorator }

constructor TUCDecorator.Create(wrapped: TLegacy);
begin
  inherited Create;
  FWrapped := wrapped;
end;

function TUCDecorator.Operation: string;
begin
  Result := FWrapped.Operation;
end;

function TUCDecorator.OperationUC: string;
begin
  Result := Operation.ToUpper;
end;

destructor TUCDecorator.Destroy;
begin
  FreeAndNil(FWrapped);
  inherited;
end;

{ TUCDecorator<T> }

constructor TUCDecorator<T>.Create(wrapped: T);
begin
  inherited Create;
  FWrapped := wrapped;
end;

destructor TUCDecorator<T>.Destroy;
begin
  FreeAndNil(FWrapped);
  inherited;
end;

function TUCDecorator<T>.Operation: string;
begin
  Result := FWrapped.Operation;
end;

function TUCDecorator<T>.OperationUC: string;
begin
  Result := Operation.ToUpper;
end;

{ TLegacyHelper }

function TLegacyHelper.UCOperation: string;
begin
  Result := Operation.ToUpper;
end;

var
  decorator: TUCDecorator;
  decoratorT: TUCDecorator<TSubLegacy>;
  subLegacy: TSubLegacy;

begin
  try
    decorator := TUCDecorator.Create(TSubLegacy.Create);
    TSubLegacy(decorator.Wrapped).DoSomething(decorator.OperationUC);
    decorator.Free;

    subLegacy := TSubLegacy.Create;
    decorator := TUCDecorator.Create(subLegacy);
    subLegacy.DoSomething(decorator.OperationUC);
    decorator.Free;
    // at this point, subLegacy points to already released memory block
    subLegacy := nil;

    decoratorT := TUCDecorator<TSubLegacy>.Create(TSubLegacy.Create);
    decoratorT.Wrapped.DoSomething(decoratorT.OperationUC);
    decoratorT.Free;

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
