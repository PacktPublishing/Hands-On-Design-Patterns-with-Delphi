unit MockingProxyMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Spring.Mocking, Spring.Mocking.Matching;

type
  {$TYPEINFO ON}
  ICalculation = interface ['{E0040339-325F-4CA8-96D9-12524F58CBAE}']
    function GetTheAnswer: integer;
    function AddTwo(value: integer): integer;
  end;
  {$TYPEINFO OFF}
  //or: ICalculation = interface(IInvokable)

  TfrmMocking = class(TForm)
    btnMock: TButton;
    lbLog: TListBox;
    procedure btnMockClick(Sender: TObject);
  private
    procedure DoSomething(const calc: ICalculation);
  public
  end;

var
  frmMocking: TfrmMocking;

implementation

{$R *.dfm}

procedure TfrmMocking.btnMockClick(Sender: TObject);
var
  mockCalc: Mock<ICalculation>;
begin
  mockCalc := Mock<ICalculation>.Create(TMockBehavior.Strict);

  mockCalc.Setup.Returns(42).When.GetTheAnswer;

  mockCalc.Setup.Executes(
    function(const callInfo: TCallInfo): TValue
    begin
      lbLog.Items.Add(Format('%s(%d) is not supported',
        [callInfo.Method.Name, callInfo.Args[0].AsInteger]));
    end).When.AddTwo(TArg.IsAny<integer>);

  mockCalc.Setup.Returns(4).When.AddTwo(2);

  DoSomething(mockCalc);
end;

procedure TfrmMocking.DoSomething(const calc: ICalculation);
begin
  lbLog.Items.Add(Format('ICalculation.GetTheAnswer = %d',
    [calc.GetTheAnswer]));
  lbLog.Items.Add(Format('AddTwo(2) = %d', [calc.AddTwo(2)]));
  lbLog.Items.Add(Format('AddTwo(3) = %d', [calc.AddTwo(3)]));
end;

end.
