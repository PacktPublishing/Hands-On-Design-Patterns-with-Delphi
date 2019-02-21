program ObjectLifecycle;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  obj1, obj2: TObject;

begin
  // Variant A

  obj1 := TObject.Create;
  try
    // some code
  finally
    FreeAndNil(obj1);
  end;

  // Variant A2, managing multiple objects - gets a bit messy
  obj1 := TObject.Create;
  try
    obj2 := TObject.Create;
    try
      // some code
    finally
      FreeAndNil(obj2);
    end;
  finally
    FreeAndNil(obj1);
  end;


  // Variant B, works better with multiple objects

  obj1 := nil;
  try
    obj1 := TObject.Create;
    // some code
  finally
    FreeAndNil(obj1);
  end;

  // Variant B2, managing multiple objects - nicer than A2

  obj1 := nil;
  obj2 := nil;
  try
    obj1 := TObject.Create;
    obj2 := TObject.Create;
    // some code
  finally
    // this works, because FreeAndNil calls Free and TObject.Free is defined as:
    // if Self <> nil then
    //   Destroy;
    FreeAndNil(obj1);
    FreeAndNil(obj2);
  end;

  // Variant Z, wrong!

  try
    obj1 := TObject.Create;
    obj2 := TObject.Create;
    // some code
  finally
    // if TObject.Create raises exception, this will execute Free on
    // an random address ('object')
    FreeAndNil(obj1);
    FreeAndNil(obj2);
  end;

end.
