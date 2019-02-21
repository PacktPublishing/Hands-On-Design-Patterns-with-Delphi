unit AdapterMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst,
  Deque.Intf;

type
  TfrmAdapter = class(TForm)
    btnRotateLeft: TButton;
    lbLog: TListBox;
    btnRotateRight: TButton;
    btnInterfaceAdapter: TButton;
    btnObjectAdapter: TButton;
    procedure btnInterfaceAdapterClick(Sender: TObject);
    procedure btnObjectAdapterClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRotateLeftClick(Sender: TObject);
    procedure btnRotateRightClick(Sender: TObject);
  private
    FData: TList<integer>;
    procedure RotateLeft(const deque: IDeque<integer>);
    procedure RotateRight(const deque: IDeque<integer>);
  public
    procedure Log(data: TList<integer>);
  end;

var
  frmAdapter: TfrmAdapter;

implementation

uses
  Deque.Adapter,
  Adapter.Example, Adapter.Example.Composition, Adapter.Example.Inheritance;

{$R *.dfm}

procedure TfrmAdapter.btnInterfaceAdapterClick(Sender: TObject);
var
  consumer: TConsumer;
  oldProducer: IIncompatible;
  producerAdapter: IProducer;
  value: integer;
begin
  consumer := TConsumer.Create;
  try
    oldProducer := TIncompatible.Create;
    producerAdapter := TProducerAdapter.Create(oldProducer);
    value := consumer.Process(producerAdapter);
    lbLog.Items.Add('Result: ' + value.ToString);
  finally
    FreeAndNil(consumer);
  end;
end;

procedure TfrmAdapter.btnObjectAdapterClick(Sender: TObject);
var
  answer: string;
  consumer: TConsumer;
  problemAdapter: TProblemAdapter;
begin
  consumer := TConsumer.Create;
  try
    problemAdapter := TProblemAdapter.Create;
    try
      answer := consumer.FindTheAnswer(problemAdapter);
    finally
      FreeAndNil(problemAdapter);
    end;
    lbLog.Items.Add('The answer is: ' + answer);
  finally
    FreeAndNil(consumer);
  end;
end;

procedure TfrmAdapter.FormCreate(Sender: TObject);
var
  i: integer;
begin
  FData := TList<integer>.Create;
  for i := 0 to 9 do
    FData.Add(i);
end;

procedure TfrmAdapter.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FData);
end;

procedure TfrmAdapter.btnRotateLeftClick(Sender: TObject);
begin
  RotateLeft(TDequeList<integer>.Create(FData));
  Log(FData);
end;

procedure TfrmAdapter.btnRotateRightClick(Sender: TObject);
begin
  RotateRight(TDequeList<integer>.Create(FData));
  Log(FData);
end;

procedure TfrmAdapter.Log(data: TList<integer>);
var
  el: integer;
  s: string;
begin
  s := '';
  for el in data do
    s := s + el.ToString + ' ';
  lbLog.Items.Add(s);
end;

procedure TfrmAdapter.RotateLeft(const deque: IDeque<integer>);
begin
  deque.PushBack(deque.PopFront);
end;

procedure TfrmAdapter.RotateRight(const deque: IDeque<integer>);
begin
  deque.PushFront(deque.PopBack);
end;

end.
