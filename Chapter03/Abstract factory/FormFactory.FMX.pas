unit FormFactory.FMX;

interface

uses
  System.SysUtils,
  FMX.StdCtrls, FMX.Edit, FMX.ListBox, FMX.Forms,
  FormFactory.Intf;

type
  IFMXForm = interface ['{8EC67205-31FD-4A40-B076-F572EF76CF0A}']
    function AsForm: TForm;
  end;

  TFMXForm = class(TInterfacedObject, IForm, IFMXForm)
  strict private
    FForm: TForm;
  public
    constructor Create;
    destructor Destroy; override;
    function AsForm: TForm;
    procedure Show;
  end;

  TFMXButton = class(TInterfacedObject, IButton)
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
    constructor Create(owner: IFMXForm);
    property Caption: string read GetCaption write SetCaption;
    property OnClick: TProc read GetOnClick write SetOnClick;
  end;

  TFMXEdit = class(TInterfacedObject, IEdit)
  strict private
    FEdit: TEdit;
  public
    constructor Create(owner: IFMXForm);
    function GetText: string;
  end;

  TFMXListbox = class(TInterfacedObject, IListbox)
  strict private
    FListbox: TListBox;
  public
    constructor Create(owner: IFMXForm);
    procedure Add(const msg: string);
  end;

  TFMXFormFactory = class(TInterfacedObject, IFormFactory)
  public
    function CreateForm: IForm;
    function CreateEdit(const form: IForm): IEdit;
    function CreateButton(const form: IForm): IButton;
    function CreateListbox(const form: IForm): IListbox;
  end;

implementation

uses
  FMX.Types;

{ TFMXFormFactory }

function TFMXFormFactory.CreateForm: IForm;
begin
  Result := TFMXForm.Create;
end;

function TFMXFormFactory.CreateButton(const form: IForm): IButton;
begin
  Result := TFMXButton.Create(form as IFMXForm);
end;

function TFMXFormFactory.CreateEdit(const form: IForm): IEdit;
begin
  Result := TFMXEdit.Create(form as IFMXForm);
end;

function TFMXFormFactory.CreateListbox(const form: IForm): IListbox;
begin
  Result := TFMXListbox.Create(form as IFMXForm);
end;

{ TFMXForm }

constructor TFMXForm.Create;
begin
  inherited Create;
  FForm := TForm.CreateNew(nil);
  FForm.Position := TFormPosition.ScreenCenter;
  FForm.Caption := 'Form created with FormFactory.FMX';
  FForm.Width := 400;
  FForm.Height := 300;
end;

destructor TFMXForm.Destroy;
begin
  FreeAndNil(FForm);
  inherited;
end;

function TFMXForm.AsForm: TForm;
begin
  Result := FForm;
end;

procedure TFMXForm.Show;
begin
  FForm.ShowModal;
end;

{ TFMXButton }

constructor TFMXButton.Create(owner: IFMXForm);
begin
  inherited Create;
  FButton := TButton.Create(owner.AsForm);
  FButton.Parent := owner.AsForm;
  FButton.Align := TAlignLayout.Top;
  FButton.OnClick := HandleClick;
end;

function TFMXButton.GetCaption: string;
begin
  Result := FButton.Text;
end;

function TFMXButton.GetOnClick: TProc;
begin
  Result := FOnClick;
end;

procedure TFMXButton.HandleClick(Sender: TObject);
begin
  if assigned(FOnClick) then
    FOnClick();
end;

procedure TFMXButton.SetCaption(const value: string);
begin
  FButton.Text := value;
end;

procedure TFMXButton.SetOnClick(const value: TProc);
begin
  FOnClick := value;
end;

{ TFMXEdit }

constructor TFMXEdit.Create(owner: IFMXForm);
begin
  inherited Create;
  FEdit := TEdit.Create(owner.AsForm);
  FEdit.Parent := owner.AsForm;
  FEdit.Align := TAlignLayout.Top;
end;

function TFMXEdit.GetText: string;
begin
  Result := FEdit.Text;
end;

{ TFMXListbox }

constructor TFMXListbox.Create(owner: IFMXForm);
begin
  inherited Create;
  FListbox := TListBox.Create(owner.AsForm);
  FListbox.Parent := owner.AsForm;
  FListbox.Align := TAlignLayout.Client;
end;

procedure TFMXListbox.Add(const msg: string);
begin
  FListbox.Items.Add(msg);
end;

end.
