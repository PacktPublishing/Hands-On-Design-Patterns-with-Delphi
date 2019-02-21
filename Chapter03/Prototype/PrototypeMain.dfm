object frmPrototype: TfrmPrototype
  Left = 0
  Top = 0
  ActiveControl = btnMasterFooBar
  Caption = 'Prototype pattern'
  ClientHeight = 491
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblMaster: TLabel
    Left = 16
    Top = 16
    Width = 94
    Height = 19
    Caption = 'Master object'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblClone: TLabel
    Left = 16
    Top = 168
    Width = 97
    Height = 19
    Caption = 'Cloned object'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnMasterFooBar: TButton
    Left = 16
    Top = 41
    Width = 161
    Height = 46
    Caption = 'FooBar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnMasterFooBarClick
  end
  object lbLog: TListBox
    Left = 196
    Top = 0
    Width = 460
    Height = 491
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    TabOrder = 1
  end
  object btnMasterNextNumber: TButton
    Left = 16
    Top = 93
    Width = 161
    Height = 46
    Caption = 'Next number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnMasterNextNumberClick
  end
  object btnClone: TButton
    Left = 16
    Top = 193
    Width = 161
    Height = 46
    Caption = 'clone with Clone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnCloneClick
  end
  object btnCreate: TButton
    Left = 16
    Top = 245
    Width = 161
    Height = 46
    Caption = 'clone with Create'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnCreateClick
  end
  object btnAssign: TButton
    Left = 16
    Top = 297
    Width = 161
    Height = 46
    Caption = 'clone with Assign'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnAssignClick
  end
  object btnCloneFooBar: TButton
    Left = 16
    Top = 377
    Width = 161
    Height = 46
    Caption = 'FooBar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnCloneFooBarClick
  end
  object btnCloneNextNumber: TButton
    Left = 16
    Top = 429
    Width = 161
    Height = 46
    Caption = 'Next number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnCloneNextNumberClick
  end
end
