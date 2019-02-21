unit DataModulePatterns;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  IChapters = interface ['{0C8601E7-C15E-45FB-BA24-705838D3F036}']
    function GetChapters: TArray<integer>;
  //
    procedure Close;
    function GetCategory(chapter: integer): string;
    function GetPatterns(chapter: integer): TArray<string>;
    function GetTitle(chapter: integer): string;
    function Open: string;
    function IsOpen: boolean;
    property Chapters: TArray<integer> read GetChapters;
  end;

  TdmChapters = class(TDataModule, IChapters)
    CDSChapters: TClientDataSet;
    CDSChaptersChapter: TIntegerField;
    CDSChaptersTitle: TStringField;
    CDSChaptersPatternGroup: TStringField;
    CDSChaptersPatterns: TStringField;
  strict protected
    function GetChapters: TArray<integer>;
  public
    destructor Destroy; override;
    procedure Close;
    function GetCategory(chapter: integer): string;
    function GetPatterns(chapter: integer): TArray<string>;
    function GetTitle(chapter: integer): string;
    function Open: string;
    function IsOpen: boolean;
    property Chapters: TArray<integer> read GetChapters;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  System.Generics.Collections;

{$R *.dfm}

{ TdmChapters }

destructor TdmChapters.Destroy;
begin
  Close;
  inherited;
end;

function TdmChapters.IsOpen: boolean;
begin
  Result := CDSChapters.Active;
end;

procedure TdmChapters.Close;
begin
  CDSChapters.Close;
end;

function TdmChapters.GetCategory(chapter: integer): string;
begin
  Result := '';
  if CDSChapters.FindKey([chapter]) then
    Result := CDSChaptersPatternGroup.AsString;
end;

function TdmChapters.GetChapters: TArray<integer>;
var
  chap: TList<integer>;
begin
  chap := TList<integer>.Create;
  try
    CDSChapters.First;
    while not CDSChapters.Eof do begin
      chap.Add(CDSChaptersChapter.AsInteger);
      CDSChapters.Next;
    end;
    Result := chap.ToArray;
  finally
    FreeAndNil(chap);
  end;
end;

function TdmChapters.GetPatterns(chapter: integer): TArray<string>;
begin
  if CDSChapters.FindKey([chapter]) then
    Result := CDSChaptersPatterns.AsString.Split([',', ', ']);
end;

function TdmChapters.GetTitle(chapter: integer): string;
begin
  Result := '';
  if CDSChapters.FindKey([chapter]) then
    Result := CDSChaptersTitle.AsString;
end;

function TdmChapters.Open: string;
begin
  Result := '';
  try
    CDSChapters.LoadFromFile('Chapters.xml');
  except
    on E: Exception do
      Result := E.Message;
  end;
end;

end.
