unit SingletonPatternSecondary;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmSecondary = class(TForm)
    btnGlobalVar: TButton;
    btnHiddenCreate: TButton;
    btnClassVar: TButton;
    btnNewInstance: TButton;
    btnNewInstanceCount: TButton;
    btnFactory: TButton;
    btnClass: TButton;
    btnDI: TButton;
    procedure btnClassClick(Sender: TObject);
    procedure btnClassVarClick(Sender: TObject);
    procedure btnDIClick(Sender: TObject);
    procedure btnFactoryClick(Sender: TObject);
    procedure btnGlobalVarClick(Sender: TObject);
    procedure btnHiddenCreateClick(Sender: TObject);
    procedure btnNewInstanceClick(Sender: TObject);
    procedure btnNewInstanceCountClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FInjectedLogger: TProc<string>;
  public
    property InjectedLogger: TProc<string> read FInjectedLogger write FInjectedLogger;
  end;

var
  frmSecondary: TfrmSecondary;

implementation

uses
  Singleton_GlobalVar,
  Singleton_HiddenCreate,
  Singleton_ClassVar,
  Singleton_NewInstance,
  Singleton_NewInstanceCounted,
  Singleton_Factory,
  Singleton_Class,
  SingletonPatternMain;

{$R *.dfm}

procedure TfrmSecondary.btnClassClick(Sender: TObject);
begin
  SingletonCl.Log(frmSingleton.ListBox1, 'SingletonCl');
end;

procedure TfrmSecondary.btnClassVarClick(Sender: TObject);
begin
  TSingletonCV.Instance.Log(frmSingleton.ListBox1, 'TSingletonCV');
end;

procedure TfrmSecondary.btnDIClick(Sender: TObject);
begin
  InjectedLogger('Dependency Injection');
end;

procedure TfrmSecondary.btnFactoryClick(Sender: TObject);
begin
  SingletonF.Log(frmSingleton.ListBox1, 'SingletonF');
end;

procedure TfrmSecondary.btnGlobalVarClick(Sender: TObject);
begin
  SingletonGV.Log(frmSingleton.ListBox1, 'SingletonGV');
end;

procedure TfrmSecondary.btnHiddenCreateClick(Sender: TObject);
begin
  TSingletonHC.Instance.Log(frmSingleton.ListBox1, 'TSingletonHC');
end;

procedure TfrmSecondary.btnNewInstanceClick(Sender: TObject);
begin
  TSingletonNI.Instance.Log(frmSingleton.ListBox1, 'TSingletonNI');
end;

procedure TfrmSecondary.btnNewInstanceCountClick(Sender: TObject);
var
  logger: TSingletonNIC;
begin
  logger := TSingletonNIC.Create;
  logger.Log(frmSingleton.ListBox1, 'TSingletonNIC');
  logger.Free;
end;

procedure TfrmSecondary.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
