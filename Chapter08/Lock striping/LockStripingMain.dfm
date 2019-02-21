object frmLockStriping: TfrmLockStriping
  Left = 0
  Top = 0
  Caption = 'Lock striping pattern'
  ClientHeight = 306
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    634
    306)
  PixelsPerInch = 96
  TextHeight = 13
  object btnMasterLock: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Master lock'
    TabOrder = 0
    OnClick = btnMasterLockClick
  end
  object btnSeparateLocks: TButton
    Left = 16
    Top = 71
    Width = 137
    Height = 49
    Caption = 'Separate locks'
    TabOrder = 1
    OnClick = btnSeparateLocksClick
  end
  object btnCustomLocks: TButton
    Left = 16
    Top = 126
    Width = 137
    Height = 49
    Caption = 'Custom bit locks'
    TabOrder = 2
    OnClick = btnCustomLocksClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 449
    Height = 275
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
end
