object frmDoubleChecked: TfrmDoubleChecked
  Left = 0
  Top = 0
  ActiveControl = btnLazyInit
  Caption = 'Double-checked locking pattern'
  ClientHeight = 368
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
    368)
  PixelsPerInch = 96
  TextHeight = 13
  object btnLazyInit: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Lazy initialization'
    TabOrder = 0
    OnClick = btnLazyInitClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 449
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 4
  end
  object btnLockAndCheck: TButton
    Left = 16
    Top = 71
    Width = 137
    Height = 49
    Caption = 'Lock-and-check'
    TabOrder = 1
    OnClick = btnLockAndCheckClick
  end
  object btnTestAndLock: TButton
    Left = 16
    Top = 126
    Width = 137
    Height = 49
    Caption = 'Test-and-lock'
    TabOrder = 2
    OnClick = btnTestAndLockClick
  end
  object btnDoubleChecked: TButton
    Left = 16
    Top = 181
    Width = 137
    Height = 49
    Caption = 'Double-checked locking'
    TabOrder = 3
    OnClick = btnDoubleCheckedClick
  end
end
