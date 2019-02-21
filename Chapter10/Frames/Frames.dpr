program Frames;

uses
  System.StartUpCopy,
  FMX.Forms,
  FramesMain in 'FramesMain.pas' {frmFrames},
  BaseFrame in 'BaseFrame.pas' {frBaseFrame: TFrame},
  DerivedFrame in 'DerivedFrame.pas' {frDerivedFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFrames, frmFrames);
  Application.Run;
end.
