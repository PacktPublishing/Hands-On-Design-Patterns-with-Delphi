object frmDI: TfrmDI
  Left = 0
  Top = 0
  Caption = 'Dependency Injection'
  ClientHeight = 178
  ClientWidth = 209
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnNoDI: TButton
    Left = 16
    Top = 16
    Width = 177
    Height = 25
    Caption = 'No Dependency Injection'
    TabOrder = 0
    OnClick = btnNoDIClick
  end
  object btnInjectedParams: TButton
    Left = 16
    Top = 56
    Width = 177
    Height = 25
    Caption = 'Injected parameters'
    TabOrder = 1
    OnClick = btnInjectedParamsClick
  end
  object btnInjectedProps: TButton
    Left = 16
    Top = 96
    Width = 177
    Height = 25
    Caption = 'Injected properties'
    TabOrder = 2
    OnClick = btnInjectedPropsClick
  end
  object btnInjectedFactory: TButton
    Left = 16
    Top = 136
    Width = 177
    Height = 25
    Caption = 'Injected factory'
    TabOrder = 3
    OnClick = btnInjectedFactoryClick
  end
end
