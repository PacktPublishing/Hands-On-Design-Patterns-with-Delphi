unit FormFactory.VCL;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.StdCtrls, Vcl.Controls, Vcl.Forms,
  FormFactory.Intf;

type
  IVCLForm = interface ['{8EC67205-31FD-4A40-B076-F572EF76CF0A}']
    function AsForm: TForm;
  end;

  TVCLForm = class(TInterfacedObject, IForm, IVCLForm)
  strict private
    FForm: TForm;
  public
    constructor Create;
    destructor Destroy; override;
    function AsForm: TForm;
    procedure Show;
  end;

  TVCLButton = class(TInterfacedObject, IButton)
  strict private
    FButton: TButton;
    FOnClick: TProc;
  strict protected
    function GetCaption: string;
    function GetOnClick: TProc;
    procedure HandleClick(Sender: TObject);
    procedure SetCaption(const value: string);
    procedure SetOnClick(const value: TProc);
  public
    constructor Create(owner: IVCLForm);
    property Caption: string read GetCaption write SetCaption;
    property OnClick: TProc read GetOnClick write SetOnClick;
  end;

  TVCLEdit = class(TInterfacedObject, IEdit)
  strict private
    FEdit: TEdit;
  public
    constructor Create(owner: IVCLForm);
    function GetText: string;
  end;

  TVCLListbox = class(TInterfacedObject, IListbox)
  strict private
    FListbox: TListBox;
  public
    constructor Create(owner: IVCLForm);
    procedure Add(const msg: string);
  end;

  TVCLFormFactory = class(TInterfacedObject, IFormFactory)
  public
    function CreateForm: IForm;
    function CreateEdit(const form: IForm): IEdit;
    function CreateButton(const form: IForm): IButton;
    function CreateListbox(const form: IForm): IListbox;
  end;

implementation

{ TFormFactory }

function TVCLFormFactory.CreateForm: IForm;
begin
  Result := TVCLForm.Create;
end;

function TVCLFormFactory.CreateButton(const form: IForm): IButton;
begin
  Result := TVCLButton.Create(form as IVCLForm);
end;

function TVCLFormFactory.CreateEdit(const form: IForm): IEdit;
begin
  Result := TVCLEdit.Create(form as IVCLForm);
end;

function TVCLFormFactory.CreateListbox(const form: IForm): IListbox;
begin
  Result := TVCLListbox.Create(form as IVCLForm);
end;

{ TVCLForm }

constructor TVCLForm.Create;
begin
  inherited Create;
  FForm := TForm.CreateNew(nil);
  FForm.Position := poScreenCenter;
  FForm.Caption := 'Form created with FormFactory.VCL';
  FForm.Width := 400;
  FForm.Height := 300;
end;

destructor TVCLForm.Destroy;
begin
  FreeAndNil(FForm);
  inherited;
end;

function TVCLForm.AsForm: TForm;
begin
  Result := FForm;
end;

procedure TVCLForm.Show;
begin
  FForm.ShowModal;
end;

{ TVCLButton }

constructor TVCLButton.Create(owner: IVCLForm);
begin
  inherited Create;
  FButton := TButton.Create(owner.AsForm);
  FButton.Parent := owner.AsForm;
  FButton.Align := alTop;
  FButton.OnClick := HandleClick;
end;

function TVCLButton.GetCaption: string;
begin
  Result := FButton.Caption;
end;

function TVCLButton.GetOnClick: TProc;
begin
  Result := FOnClick;
end;

procedure TVCLButton.HandleClick(Sender: TObject);
begin
  if assigned(FOnClick) then
    FOnClick();
end;

procedure TVCLButton.SetCaption(const value: string);
begin
  FButton.Caption := value;
end;

procedure TVCLButton.SetOnClick(const value: TProc);
begin
  FOnClick := value;
end;

{ TVCLEdit }

constructor TVCLEdit.Create(owner: IVCLForm);
begin
  inherited Create;
  FEdit := TEdit.Create(owner.AsForm);
  FEdit.Parent := owner.AsForm;
  FEdit.Align := alTop;
end;

function TVCLEdit.GetText: string;
begin
  Result := FEdit.Text;
end;

{ TVCLListbox }

constructor TVCLListbox.Create(owner: IVCLForm);
begin
  inherited Create;
  FListbox := TListBox.Create(owner.AsForm);
  FListbox.Parent := owner.AsForm;
  FListbox.Align := alClient;
end;

procedure TVCLListbox.Add(const msg: string);
begin
  FListbox.Items.Add(msg);
end;

end.
