object frmIterator: TfrmIterator
  Left = 0
  Top = 0
  Caption = 'Iterator pattern'
  ClientHeight = 354
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    633
    354)
  PixelsPerInch = 96
  TextHeight = 13
  object btnFileInterface: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'File IEnumerable'
    TabOrder = 0
    OnClick = btnFileInterfaceClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 449
    Height = 324
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 6
    ExplicitHeight = 270
  end
  object btnFileObject: TButton
    Left = 16
    Top = 72
    Width = 137
    Height = 49
    Caption = 'File TEnumerable'
    TabOrder = 1
    OnClick = btnFileObjectClick
  end
  object btnArray: TButton
    Left = 16
    Top = 127
    Width = 137
    Height = 49
    Caption = 'Array TEnumerable'
    TabOrder = 2
    OnClick = btnArrayClick
  end
  object btnFilterFile: TButton
    Left = 16
    Top = 238
    Width = 137
    Height = 49
    Caption = 'Filtered file'
    TabOrder = 4
    OnClick = btnFilterFileClick
  end
  object btnFilterArray: TButton
    Left = 16
    Top = 293
    Width = 137
    Height = 49
    Caption = 'Filtered array'
    TabOrder = 5
    OnClick = btnFilterArrayClick
  end
  object btnGeneric: TButton
    Left = 16
    Top = 183
    Width = 137
    Height = 49
    Caption = 'Generic TEnumerable'
    TabOrder = 3
    OnClick = btnGenericClick
  end
end
