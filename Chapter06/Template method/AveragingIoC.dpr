program AveragingIoC;

uses
  Vcl.Forms,
  AveragingIoCMain in 'AveragingIoCMain.pas' {btnAveraging},
  DataAggregatorIoC in 'DataAggregatorIoC.pas',
  DataSource.Intf in 'DataSource.Intf.pas',
  DataSource.TextFile in 'DataSource.TextFile.pas',
  DataSource.DynArray in 'DataSource.DynArray.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TbtnAveraging, btnAveraging);
  Application.Run;
end.
