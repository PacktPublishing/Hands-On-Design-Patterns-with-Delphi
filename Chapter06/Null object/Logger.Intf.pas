unit Logger.Intf;

interface

type
  ILogger = interface ['{738C066A-0777-4BA8-ACB6-2DE68A3968AD}']
    function Initialize: boolean;
    procedure Log(const msg: string); overload;
    procedure Log(const msg: string; const params: array of const); overload;
    procedure Close;
  end;

implementation

end.
