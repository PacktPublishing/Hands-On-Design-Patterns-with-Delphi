unit AveragingIoCMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TbtnAveraging = class(TForm)
    btnArrayAggregator: TButton;
    lbLog: TListBox;
    btnFileAggregator: TButton;
    procedure btnArrayAggregatorClick(Sender: TObject);
    procedure btnFileAggregatorClick(Sender: TObject);
  private
    procedure Log(const msg: string; const params: array of const);
  public
    { Public declarations }
  end;

var
  btnAveraging: TbtnAveraging;

implementation

uses
  DataAggregatorIoC,
  DataSource.TextFile, DataSource.DynArray;

{$R *.dfm}

procedure TbtnAveraging.btnArrayAggregatorClick(Sender: TObject);
begin
  Log('Average value: %.4f, Expected value: %.4f',
    [CalculateAverage(TArrayDataSource.Create([1, 1, 2, 3, 5, 8, 13])),
     (1+1+2+3+5+8+13)/7]);
end;

procedure TbtnAveraging.btnFileAggregatorClick(Sender: TObject);
begin
  Log('Average value: %.4f',
    [CalculateAverage(TFileDataSource.Create('..\..\data.txt'))] );
end;

procedure TbtnAveraging.Log(const msg: string; const params: array of const);
begin
  lbLog.Items.Add(Format(msg, params));
end;

end.
