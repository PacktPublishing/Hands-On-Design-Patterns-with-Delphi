program Adapter;

uses
  Vcl.Forms,
  AdapterMain in 'AdapterMain.pas' {frmAdapter},
  Adapter.Example.Inheritance in 'Adapter.Example.Inheritance.pas',
  Adapter.Example.Composition in 'Adapter.Example.Composition.pas',
  Adapter.Example in 'Adapter.Example.pas',
  Deque.Intf in 'Deque.Intf.pas',
  Deque.Adapter in 'Deque.Adapter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAdapter, frmAdapter);
  Application.Run;
end.
