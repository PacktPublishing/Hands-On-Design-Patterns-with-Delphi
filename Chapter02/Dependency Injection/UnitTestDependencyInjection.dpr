program UnitTestDependencyInjection;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  DataProcessing.DUnit in 'DataProcessing.DUnit.pas',
  DataProcessing.Factory in 'DataProcessing.Factory.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

