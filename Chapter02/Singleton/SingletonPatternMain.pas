unit SingletonPatternMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmSingleton = class(TForm)
    GridPanel1: TGridPanel;
    ListBox1: TListBox;
    GridPanel3: TGridPanel;
    Label2: TLabel;
    btnTestFactory: TButton;
    GridPanel7: TGridPanel;
    Label6: TLabel;
    btnTestNewInstanceCount: TButton;
    GridPanel8: TGridPanel;
    Label7: TLabel;
    btnTestNewInstance: TButton;
    GridPanel6: TGridPanel;
    Label5: TLabel;
    btnTestClassVar: TButton;
    GridPanel4: TGridPanel;
    Label3: TLabel;
    btnTestHiddenCreate: TButton;
    btnNewForm: TButton;
    procedure btnNewFormClick(Sender: TObject);
    procedure btnTestClassVarClick(Sender: TObject);
    procedure btnTestFactoryClick(Sender: TObject);
    procedure btnTestHiddenCreateClick(Sender: TObject);
    procedure btnTestNewInstanceClick(Sender: TObject);
    procedure btnTestNewInstanceCountClick(Sender: TObject);
  end;

var
  frmSingleton: TfrmSingleton;

implementation

uses
  Singleton_GlobalVar,
  Singleton_HiddenCreate,
  Singleton_ClassVar,
  Singleton_NewInstance,
  Singleton_NewInstanceCounted,
  Singleton_Factory,
  Singleton_Class,
  SingletonPatternSecondary;

{$R *.dfm}

procedure TfrmSingleton.btnNewFormClick(Sender: TObject);
var
  frm2: TfrmSecondary;
begin
  frm2 := TfrmSecondary.Create(Self);
  frm2.InjectedLogger :=
    procedure (msg: string)
    begin
      ListBox1.ItemIndex := ListBox1.Items.Add(
        Format('[%p] %s %s', [pointer(Self), FormatDateTime('hh:mm:ss', Now), msg]));
    end;
  frm2.Show;
end;

procedure TfrmSingleton.btnTestHiddenCreateClick(Sender: TObject);
var
  Singleton1: TSingletonHC;
  Singleton2: TSingletonHC;
  Singleton3: TSingletonHC;
begin
  Singleton1 := TSingletonHC.Instance;
  Singleton2 := TSingletonHC.Instance;
  // It is still possible to create a new instance of this "singleton"
  Singleton3 := TSingletonHC.Create;

  Singleton1.Log(ListBox1, 'TSingletonHC[1]');
  Singleton2.Log(ListBox1, 'TSingletonHC[2]');
  Singleton3.Log(ListBox1, 'TSingletonHC[3]');
  if Singleton1 <> Singleton2 then
    Singleton2.Log(ListBox1, 'TSingletonHC: Singleton1 <> Singleton2');
  if Singleton2 <> Singleton3 then
    Singleton3.Log(ListBox1, 'TSingletonHC: Singleton2 <> Singleton3');

  Singleton3.Free; // no problem, this is a separate instance
// Uncommenting the next line will actually free Singleton1, too, as they are the same object
// Singleton1.Log call below may still work, but program may raise access violations on exit
//  Singleton2.Free;

  Singleton1.Log(ListBox1, 'TSingletonHC alive');
end;

procedure TfrmSingleton.btnTestClassVarClick(Sender: TObject);
var
  Singleton1: TSingletonCV;
  Singleton2: TSingletonCV;
  Singleton3: TSingletonCV;
begin
  Singleton1 := TSingletonCV.Instance;
  Singleton2 := TSingletonCV.Instance;
  // It is still possible to create a new instance of this "singleton"
  Singleton3 := TSingletonCV.Create;

  Singleton1.Log(ListBox1, 'TSingletonCV[1]');
  Singleton2.Log(ListBox1, 'TSingletonCV[2]');
  Singleton3.Log(ListBox1, 'TSingletonCV[3]');
  if Singleton1 <> Singleton2 then
    Singleton2.Log(ListBox1, 'TSingletonCV: Singleton1 <> Singleton2');
  if Singleton2 <> Singleton3 then
    Singleton3.Log(ListBox1, 'TSingletonCV: Singleton2 <> Singleton3');

  Singleton3.Free; // no problem, this is a separate instance
// Uncommenting the next line will actually free Singleton1, too, as they are the same object
// Singleton1.Log call below may still work, but program may raise access violations on exit
//  Singleton2.Free;

  Singleton1.Log(ListBox1, 'TSingletonCV alive');
end;

procedure TfrmSingleton.btnTestNewInstanceClick(Sender: TObject);
var
  Singleton1: TSingletonNI;
  Singleton2: TSingletonNI;
  Singleton3: TSingletonNI;
begin
  Singleton1 := TSingletonNI.Instance;
  Singleton2 := TSingletonNI.Instance;
  Singleton3 := TSingletonNI.Create;

  Singleton1.Log(ListBox1, 'TSingletonNI[1]');
  Singleton2.Log(ListBox1, 'TSingletonNI[2]');
  Singleton3.Log(ListBox1, 'TSingletonNI[3]');
  if Singleton1 <> Singleton2 then
    Singleton2.Log(ListBox1, 'TSingletonNI: Singleton1 <> Singleton2');
  if Singleton2 <> Singleton3 then
    Singleton3.Log(ListBox1, 'TSingletonNI: Singleton2 <> Singleton3');

  // No problem here, Free is a no-operation on TSingletonNI
  Singleton3.Free;

  Singleton1.Log(ListBox1, 'TSingletonNI alive');
end;

procedure TfrmSingleton.btnTestNewInstanceCountClick(Sender: TObject);
var
  Singleton1: TSingletonNIC;
  Singleton2: TSingletonNIC;
  Singleton3: TSingletonNIC;
begin
  Singleton1 := TSingletonNIC.Create;
  Singleton2 := TSingletonNIC.Create;
  Singleton3 := TSingletonNIC.Create;

  Singleton1.Log(ListBox1, 'TSingletonNIC[1]');
  Singleton2.Log(ListBox1, 'TSingletonNIC[2]');
  Singleton3.Log(ListBox1, 'TSingletonNIC[3]');
  if Singleton1 <> Singleton2 then
    Singleton2.Log(ListBox1, 'TSingletonNIC: Singleton1 <> Singleton2');
  if Singleton2 <> Singleton3 then
    Singleton3.Log(ListBox1, 'TSingletonNIC: Singleton2 <> Singleton3');

  // No problems here, everything is fine
  Singleton3.Free;
  Singleton2.Free;
  Singleton1.Log(ListBox1, 'TSingletonNIC alive');
  Singleton1.Free;
end;

procedure TfrmSingleton.btnTestFactoryClick(Sender: TObject);
var
  Singleton1: ISingletonF;
  Singleton2: ISingletonF;
  Singleton3: ISingletonF;
begin
  Singleton1 := SingletonF();
  Singleton2 := SingletonF();
  Singleton3 := SingletonF; // function is implicitly called

  Singleton1.Log(ListBox1, 'ISingletonF[1]');
  Singleton2.Log(ListBox1, 'ISingletonF[2]');
  Singleton3.Log(ListBox1, 'ISingletonF[3]');
  if Singleton1 <> Singleton2 then
    Singleton2.Log(ListBox1, 'ISingletonF: Singleton1 <> Singleton2');
  if Singleton2 <> Singleton3 then
    Singleton3.Log(ListBox1, 'ISingletonF: Singleton2 <> Singleton3');

  Singleton3 := nil;
  Singleton2 := nil;
  Singleton1.Log(ListBox1, 'TSingletonF alive');
  Singleton1 := nil;
end;

end.
