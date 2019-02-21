unit AbstractEBLForm;

interface

uses
  FormFactory.Intf;

type
  TAbstractEBLForm = class
  strict private
    FFactory: IFormFactory;
    FForm: IForm;
    FButton: IButton;
    FEdit: IEdit;
    FListbox: IListBox;
  public
    constructor Create(const factory: IFormFactory);
    procedure Make;
    procedure Show;
  end;

implementation

{ TAbstractEBLForm }

constructor TAbstractEBLForm.Create(const factory: IFormFactory);
begin
  inherited Create;
  FFactory := factory;
end;

procedure TAbstractEBLForm.Make;
begin
  FForm := FFactory.CreateForm;

  FEdit := FFactory.CreateEdit(FForm);

  FButton := FFactory.CreateButton(FForm);
  FButton.Caption := 'Add';

  FListbox := FFactory.CreateListbox(FForm);

  FButton.OnClick :=
    procedure
    begin
      FListbox.Add(FEdit.GetText);
    end;
end;

procedure TAbstractEBLForm.Show;
begin
  FForm.Show;
end;

end.
