object frmSecondary: TfrmSecondary
  Left = 0
  Top = 0
  Caption = 'Secondary form'
  ClientHeight = 289
  ClientWidth = 211
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    211
    289)
  PixelsPerInch = 96
  TextHeight = 13
  object btnGlobalVar: TButton
    Left = 16
    Top = 16
    Width = 177
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Singleton_GlobalVar'
    TabOrder = 0
    OnClick = btnGlobalVarClick
  end
  object btnHiddenCreate: TButton
    Left = 16
    Top = 47
    Width = 177
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Singleton_HiddenCreate'
    TabOrder = 1
    OnClick = btnHiddenCreateClick
  end
  object btnClassVar: TButton
    Left = 16
    Top = 78
    Width = 177
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Singleton_ClassVar'
    TabOrder = 2
    OnClick = btnClassVarClick
  end
  object btnNewInstance: TButton
    Left = 16
    Top = 109
    Width = 177
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Singleton_NewInstance'
    TabOrder = 3
    OnClick = btnNewInstanceClick
  end
  object btnNewInstanceCount: TButton
    Left = 16
    Top = 140
    Width = 177
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Singleton_NewInstanceCount'
    TabOrder = 4
    OnClick = btnNewInstanceCountClick
  end
  object btnFactory: TButton
    Left = 16
    Top = 171
    Width = 177
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Singleton_Factory'
    TabOrder = 5
    OnClick = btnFactoryClick
  end
  object btnClass: TButton
    Left = 16
    Top = 202
    Width = 177
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Singleton_Class'
    TabOrder = 6
    OnClick = btnClassClick
  end
  object btnDI: TButton
    Left = 16
    Top = 250
    Width = 177
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Dependency Injection'
    TabOrder = 7
    OnClick = btnDIClick
  end
end
