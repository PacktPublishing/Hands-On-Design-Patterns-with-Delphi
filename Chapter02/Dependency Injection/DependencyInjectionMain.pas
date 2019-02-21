unit DependencyInjectionMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmDI = class(TForm)
    btnNoDI: TButton;
    btnInjectedParams: TButton;
    btnInjectedProps: TButton;
    btnInjectedFactory: TButton;
    procedure btnInjectedFactoryClick(Sender: TObject);
    procedure btnInjectedParamsClick(Sender: TObject);
    procedure btnInjectedPropsClick(Sender: TObject);
    procedure btnNoDIClick(Sender: TObject);
  private
  public
  end;

var
  frmDI: TfrmDI;

implementation

uses
  DataProcessing.Reader,
  DataProcessing.Writer,
  DataProcessing.NoDI,
  DataProcessing.InjectedParam,
  DataProcessing.InjectedProperties,
  DataProcessing.Factory;

{$R *.dfm}

procedure TfrmDI.btnNoDIClick(Sender: TObject);
var
  processor: DataProcessing.NoDI.TDataProcessor;
begin
  processor := DataProcessing.NoDI.TDataProcessor.Create;
  try
    processor.ProcessData;
  finally
    FreeAndNil(processor);
  end;
end;

procedure TfrmDI.btnInjectedParamsClick(Sender: TObject);
var
  processor: DataProcessing.InjectedParam.TDataProcessor;
  reader   : TReader;
  writer   : TWriter;
begin
  reader := TReader.Create('..\..\data.txt');
  try
    writer := TWriter.Create('..\..\data.csv');
    try
      processor := DataProcessing.InjectedParam.TDataProcessor.Create;
      try
        processor.ProcessData(reader, writer);
      finally
        FreeAndNil(processor);
      end;
    finally
      FreeAndNil(writer);
    end;
  finally
    FreeAndNil(reader);
  end;
end;

procedure TfrmDI.btnInjectedPropsClick(Sender: TObject);
var
  processor: DataProcessing.InjectedProperties.TDataProcessor;
  reader   : IReader;
  writer   : IWriter;
begin
  reader := TReader.Create('..\..\data.txt');
  writer := TWriter.Create('..\..\data.csv');

  processor := DataProcessing.InjectedProperties.TDataProcessor.Create;
  try
    processor.Reader := reader;
    processor.Writer := writer;
    processor.ProcessData;
  finally
    FreeAndNil(processor);
  end;
end;

procedure TfrmDI.btnInjectedFactoryClick(Sender: TObject);
var
  processor: DataProcessing.Factory.TDataProcessor;
begin
  processor := DataProcessing.Factory.TDataProcessor.Create;
  try
    processor.Reader := TReader.Create('..\..\data.txt');
    processor.WriterFactory :=
      function: IWriter
      begin
        Result := TWriter.Create('..\..\data.csv');
      end;
    processor.ProcessData;
  finally
    FreeAndNil(processor);
  end;
end;

end.
