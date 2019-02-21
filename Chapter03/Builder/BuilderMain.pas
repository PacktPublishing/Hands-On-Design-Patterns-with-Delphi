unit BuilderMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Samples.Spin,
  DataBuilder.Intf;

type
  TfrmBuilder = class(TForm)
    btnMakeJSON: TButton;
    btnMakeXML: TButton;
    outMemo: TMemo;
    procedure btnMakeJSONClick(Sender: TObject);
    procedure btnMakeXMLClick(Sender: TObject);
  private
    function MakeData(const builder: IDataBuilder): string;
  end;

var
  frmBuilder: TfrmBuilder;

implementation

uses
  DataBuilder.JSON, DataBuilder.XML;

{$R *.dfm}

procedure TfrmBuilder.btnMakeJSONClick(Sender: TObject);
begin
  outMemo.Text := outMemo.Text
                  + 'JSON'#13#10#13#10
                  + MakeData(CreateJSONBuilder)
                  + #13#10;
end;

procedure TfrmBuilder.btnMakeXMLClick(Sender: TObject);
begin
  outMemo.Text := outMemo.Text
                  + 'XML'#13#10#13#10
                  + MakeData(CreateXMLBuilder)
                  + #13#10;
end;

function TfrmBuilder.MakeData(const builder: IDataBuilder): string;
begin
  builder.BeginData;
  builder.BeginNode('Book');
  builder.AddField('Title', 'Hands-on Design Patterns');
  builder.AddField('Topic', 'design patterns, Delphi');
  builder.BeginNode('Author');
  builder.AddField('Name', 'Primož Gabrijelèiè');
  builder.AddField('Blog', 'thedelphigeek.com');
  builder.EndNode;
  builder.EndNode;
  builder.EndData;

  Result := builder.Make;
end;

end.
