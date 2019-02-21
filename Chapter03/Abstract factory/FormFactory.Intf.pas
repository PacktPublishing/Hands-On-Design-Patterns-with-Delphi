unit FormFactory.Intf;

interface

uses
  System.SysUtils;

type
  IForm = interface ['{EB4D0921-F0FD-4044-80E8-80156C71D0E0}']
    procedure Show;
  end;

  IEdit = interface ['{39D02BD4-582A-4EBD-8119-2D6013E31287}']
    function GetText: string;
  end;

  IListbox = interface ['{6D2B7A99-FBA6-4E53-AAB9-64D071A52F23}']
    procedure Add(const msg: string);
  end;

  IButton = interface ['{790F6D14-E2F8-4639-8BAA-5DA0AEB4E17F}']
    function GetCaption: string;
    function GetOnClick: TProc;
    procedure SetCaption(const value: string);
    procedure SetOnClick(const value: TProc);
    property Caption: string read GetCaption write SetCaption;
    property OnClick: TProc read GetOnClick write SetOnClick;
  end;

  IFormFactory = interface ['{776122CF-C014-4630-ACBF-8C639BEAE975}']
    function CreateForm: IForm;
    function CreateEdit(const form: IForm): IEdit;
    function CreateButton(const form: IForm): IButton;
    function CreateListbox(const form: IForm): IListbox;
  end;

implementation

end.
