unit BuilderFluentMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Samples.Spin,
  DataBuilderFluent.Intf;

type
  TfrmBuilderFluent = class(TForm)
    btnMakeJSON: TButton;
    btnMakeXML: TButton;
    outMemo: TMemo;
    procedure btnMakeJSONClick(Sender: TObject);
    procedure btnMakeXMLClick(Sender: TObject);
  private
    function MakeData(const builder: IDataBuilderFluent): string;
  end;

var
  frmBuilderFluent: TfrmBuilderFluent;

implementation

uses
  DataBuilderFluent.JSON, DataBuilderFluent.XML;

{$R *.dfm}

procedure TfrmBuilderFluent.btnMakeJSONClick(Sender: TObject);
begin
  outMemo.Text := outMemo.Text
                  + 'JSON'#13#10#13#10
                  + MakeData(CreateJSONBuilder)
                  + #13#10;
end;

procedure TfrmBuilderFluent.btnMakeXMLClick(Sender: TObject);
begin
  outMemo.Text := outMemo.Text
                  + 'XML'#13#10#13#10
                  + MakeData(CreateXMLBuilder)
                  + #13#10;
end;

function TfrmBuilderFluent.MakeData(const builder: IDataBuilderFluent): string;
begin
  builder
    .BeginData
      .BeginNode('Book')
        .AddField('Title', 'Hands-on Design Patterns')
        .AddField('Topic', 'design patterns, Delphi')
        .BeginNode('Author')
          .AddField('Name', 'Primož Gabrijelèiè')
          .AddField('Blog', 'thedelphigeek.com')
        .EndNode
      .EndNode
    .EndData;

  Result := builder.Make;
end;

end.
