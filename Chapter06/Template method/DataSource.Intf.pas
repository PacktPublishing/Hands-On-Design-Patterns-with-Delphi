unit DataSource.Intf;

interface

type
  IDataSource = interface ['{63B8C863-E168-4204-9982-3E74D105FFF3}']
    procedure CloseDataSource;
    function GetNextValue(var value: integer): boolean;
    function OpenDataSource: boolean;
  end;

implementation

end.
