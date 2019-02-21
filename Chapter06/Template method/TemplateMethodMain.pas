unit TemplateMethodMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmTemplateMethod = class(TForm)
    btnArrayAggregator: TButton;
    lbLog: TListBox;
    btnFileAggregator: TButton;
    procedure btnFileAggregatorClick(Sender: TObject);
    procedure btnArrayAggregatorClick(Sender: TObject);
  private
    procedure Log(const msg: string; const params: array of const);
  public
  end;

var
  frmTemplateMethod: TfrmTemplateMethod;

implementation

uses
  DataAggregator.DynArray, DataAggregator.TextFile;

{$R *.dfm}

procedure TfrmTemplateMethod.btnArrayAggregatorClick(Sender: TObject);
var
  aggregator: TArrayDataAggregator;
begin
  aggregator := TArrayDataAggregator.Create([1, 1, 2, 3, 5, 8, 13]);
  Log('Average value: %.4f, Expected value: %.4f',
    [aggregator.CalculateAverage, (1+1+2+3+5+8+13)/7]);
  aggregator.Free;
end;

procedure TfrmTemplateMethod.btnFileAggregatorClick(Sender: TObject);
var
  aggregator: TFileDataAggregator;
begin
  aggregator := TFileDataAggregator.Create('..\..\data.txt');
  Log('Average value: %.4f', [aggregator.CalculateAverage]);
  aggregator.Free;
end;

procedure TfrmTemplateMethod.Log(const msg: string;
  const params: array of const);
begin
  lbLog.Items.Add(Format(msg, params));
end;

end.
