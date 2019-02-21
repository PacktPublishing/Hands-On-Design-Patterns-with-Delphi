object frmOptimistic: TfrmOptimistic
  Left = 0
  Top = 0
  Caption = 'Optimistic locking pattern'
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
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 449
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 2
  end
  object btnDoubleChecked: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Double-checked locking'
    TabOrder = 0
    OnClick = btnDoubleCheckedClick
  end
  object btnOptimistic: TButton
    Left = 16
    Top = 71
    Width = 137
    Height = 49
    Caption = 'Optimistic locking'
    TabOrder = 1
    OnClick = btnOptimisticClick
  end
end
