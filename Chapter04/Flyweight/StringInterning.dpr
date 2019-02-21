program StringInterning;

{$APPTYPE CONSOLE}

{$R *.res}

var
  a: string;

begin
  a := 'Name';
  Writeln(a);
  Writeln('Name');
  Readln;
end.
