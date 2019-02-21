unit SpringProxyMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Spring;

type
  TButton = class(Vcl.StdCtrls.TButton)
  public
    procedure Click; override;
  end;

  TListBox = class(Vcl.StdCtrls.TListBox)
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
  end;

  TLogInfo = class
  strict private
    FClassName: string;
    FComponentName: string;
    FMethodName: string;
  public
    constructor Create(AComponent: TComponent; const AMethod: string);
    destructor Destroy; override;
    property ClassName: string read FClassName write FClassName;
    property ComponentName: string read FComponentName write FComponentName;
    property MethodName: string read FMethodName write FMethodName;
  end;

  TfrmProxy = class(TForm)
    btnLoggingProxy: TButton;
    lbLog: TListBox;
  private
  public
    procedure Log(const logInfo: IShared<TLogInfo>);
  end;

var
  frmProxy: TfrmProxy;

implementation

{$R *.dfm}

{ TfrmProxy }

procedure TfrmProxy.Log(const logInfo: IShared<TLogInfo>);
begin
  lbLog.Items.Add(Format( 'Executed %s.%s on %s',
    [logInfo.ClassName, logInfo.MethodName, logInfo.ComponentName]));
end;

{ TLogInfo }

constructor TLogInfo.Create(AComponent: TComponent; const AMethod: string);
begin
  inherited Create;
  ComponentName := AComponent.Name;
  ClassName := AComponent.ClassName;
  MethodName := AMethod;
end;

destructor TLogInfo.Destroy;
begin
  inherited;
end;

{ TButton }

procedure TButton.Click;
var
  info: TLogInfo;
begin
  inherited;
  info := TLogInfo.Create(Self, 'Click');
  frmProxy.Log(Shared.New<TLogInfo>(info));
end;

{ TListBox }

procedure TListBox.DoEnter;
begin
  inherited;
  frmProxy.Log(Shared.New(
    TLogInfo.Create(Self, 'DoEnter')));
end;

procedure TListBox.DoExit;
begin
  inherited;
  frmProxy.Log(Shared.New(
    TLogInfo.Create(Self, 'DoExit')));
end;

end.
