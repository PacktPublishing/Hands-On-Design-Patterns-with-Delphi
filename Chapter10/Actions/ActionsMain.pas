unit ActionsMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList, Vcl.Buttons,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.StdActns, Vcl.ExtActns,
  Vcl.Menus;

type
  TfrmActions = class(TForm)
    ImageList1: TImageList;
    ActionList1: TActionList;
    actClear: TAction;
    Button1: TButton;
    Button2: TButton;
    FormatRichEditBold1: TRichEditBold;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    SpeedButton2: TSpeedButton;
    FormatRichEditBold2: TRichEditBold;
    SpeedButton3: TSpeedButton;
    FormatRichEditItalic1: TRichEditItalic;
    SpeedButton4: TSpeedButton;
    FormatRichEditUnderline1: TRichEditUnderline;
    MainMenu1: TMainMenu;
    mniFile: TMenuItem;
    Action11: TMenuItem;
    Bold1: TMenuItem;
    FileExit1: TFileExit;
    Exit1: TMenuItem;
    mniEdit: TMenuItem;
    SpeedButton1: TSpeedButton;
    EditCopy1: TEditCopy;
    SpeedButton5: TSpeedButton;
    EditPaste1: TEditPaste;
    procedure actClearExecute(Sender: TObject);
    procedure actClearUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActions: TfrmActions;

implementation

{$R *.dfm}

procedure TfrmActions.actClearExecute(Sender: TObject);
begin
  RichEdit1.Clear;
  RichEdit2.Clear;
end;

procedure TfrmActions.actClearUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    (RichEdit1.Text <> '') or (RichEdit2.Text <> '');
end;

end.
