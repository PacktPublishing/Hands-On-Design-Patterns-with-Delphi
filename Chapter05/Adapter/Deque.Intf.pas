unit Deque.Intf;

interface

type
  IDeque<T> = interface
    function IsEmpty: boolean;
    procedure PushBack(const element: T);
    procedure PushFront(const element: T);
    function PopBack: T;
    function PopFront: T;
  end;

implementation

end.
