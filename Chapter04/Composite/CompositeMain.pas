unit CompositeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  CompositeUniformity, CompositeSafety;

type
  TfrmComposite = class(TForm)
    btnCompUniform: TButton;
    lbLog: TListBox;
    btnCompSafe: TButton;
    procedure btnCompSafeClick(Sender: TObject);
    procedure btnCompUniformClick(Sender: TObject);
  private
    procedure LogComponentsS(component: TComponentS; indent: string);
    procedure LogComponentsU(component: TComponentU; indent: string);
  public
  end;

var
  frmComposite: TfrmComposite;

implementation

{$R *.dfm}

procedure TfrmComposite.btnCompSafeClick(Sender: TObject);
var
  computer: TConfigurableComponentS;
  motherboard: TConfigurableComponentS;
begin
  computer := TConfigurableComponentS.Create('chassis', 37.9);
  computer.Add(TBasicComponentS.Create('PSU', 34.6));
  motherboard := TConfigurableComponentS.Create('motherboard', 96.5);
  motherboard.Add(TBasicComponentS.Create('CPU', 121.1));
  motherboard.Add(TBasicComponentS.Create('memory', 88.2));
  motherboard.Add(TBasicComponentS.Create('memory', 88.2));
  motherboard.Add(TBasicComponentS.Create('graphics', 179));
  computer.Add(motherboard);

  LogComponentsS(computer, '');
  lbLog.Items.Add('Total cost: ' + Format('%.1f', [computer.TotalPrice]));
  lbLog.Items.Add('');

  FreeAndNil(computer);

  // Following two lines will not compile.
//  cpu := TBasicComponentS.Create('CPU', 121.1);
//  cpu.Add(TBasicComponentS.Create('memory', 88.2));
end;

procedure TfrmComposite.btnCompUniformClick(Sender: TObject);
var
  computer: TComponentU;
  motherboard: TComponentU;
begin
  computer := TConfigurableComponentU.Create('chassis', 37.9);
  computer.Add(TBasicComponentU.Create('PSU', 34.6));
  motherboard := TConfigurableComponentU.Create('motherboard', 96.5);
  motherboard.Add(TBasicComponentU.Create('CPU', 121.1));
  motherboard.Add(TBasicComponentU.Create('memory', 88.2));
  motherboard.Add(TBasicComponentU.Create('memory', 88.2));
  motherboard.Add(TBasicComponentU.Create('graphics', 179));
  computer.Add(motherboard);

  LogComponentsU(computer, '');
  lbLog.Items.Add('Total cost: ' + Format('%.1f', [computer.TotalPrice]));
  lbLog.Items.Add('');

  FreeAndNil(computer);

  // Following two lines will compile, but .Add will raise exception
  // "Components cannot be added to TBasicComponentU." when executed.
//  cpu := TBasicComponentU.Create('CPU', 121.1);
//  cpu.Add(TBasicComponentU.Create('memory', 88.2));
end;

procedure TfrmComposite.LogComponentsS(component: TComponentS; indent: string);
var
  comp: TComponentS;
begin
  lbLog.Items.Add(Format('%s%s: %.1f', [indent, component.Name, component.Price]));
  indent := indent + '  ';
  for comp in component.Components do
    LogComponentsS(comp, indent);
end;

procedure TfrmComposite.LogComponentsU(component: TComponentU; indent: string);
var
  comp: TComponentU;
begin
  lbLog.Items.Add(Format('%s%s: %.1f', [indent, component.Name, component.Price]));
  indent := indent + '  ';
  for comp in component.Components do
    LogComponentsU(comp, indent);
end;

end.
