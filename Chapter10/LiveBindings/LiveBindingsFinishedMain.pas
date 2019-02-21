unit LiveBindingsFinishedMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.DB,
  Datasnap.DBClient,
  MidasLib,
  System.Rtti, FMX.Grid.Style, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.Grid, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Data.Bind.DBScope,
  Data.Bind.Controls, FMX.Layouts, Fmx.Bind.Navigator, FMX.ListBox, FMX.Edit, FMX.StdCtrls;

type
  TfrmLiveBindings = class(TForm)
    CDSChapters: TClientDataSet;
    CDSChaptersChapter: TIntegerField;
    CDSChaptersTitle: TStringField;
    CDSChaptersPatternGroup: TStringField;
    CDSChaptersPatterns: TStringField;
    BindSourcePatterns: TBindSourceDB;
    sgPatterns: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    navPatterns: TBindNavigator;
    lbPatterns: TListBox;
    outTitle: TEdit;
    LinkControlToField1: TLinkControlToField;
    outChapterTitle: TEdit;
    LinkControlToField2: TLinkControlToField;
    BindExpression1: TBindExpression;
    procedure BindExpression1AssigningValue(Sender: TObject; AssignValueRec:
      TBindingAssignValueRec; var Value: TValue; var Handled: Boolean);
    procedure BindSourceDB1SubDataSourceDataChange(Sender: TObject; Field: TField);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
  end;

var
  frmLiveBindings: TfrmLiveBindings;

implementation

{$R *.fmx}

procedure TfrmLiveBindings.BindExpression1AssigningValue(Sender: TObject; AssignValueRec:
  TBindingAssignValueRec; var Value: TValue; var Handled: Boolean);
begin
  Value := StringReplace(Value.AsString, ', ', ',', [rfReplaceAll]);
end;

procedure TfrmLiveBindings.BindSourceDB1SubDataSourceDataChange(Sender: TObject; Field:
  TField);
begin
  BindingsList1.Notify(CDSChaptersPatterns, '');
end;

procedure TfrmLiveBindings.Button1Click(Sender: TObject);
begin
  BindingsList1.Notify(CDSChaptersPatterns, '');
end;

procedure TfrmLiveBindings.FormCreate(Sender: TObject);
begin
  if FileExists('Chapters.xml') then
    CDSChapters.LoadFromFile('Chapters.xml');
  CDSChapters.Active := true;
  LBPatterns.Items.Delimiter := ',';
  LBPatterns.Items.StrictDelimiter := true;
end;

procedure TfrmLiveBindings.FormDestroy(Sender: TObject);
begin
  CDSChapters.SaveToFile('Chapters.xml', dfXMLUTF8);
end;

end.
