object frmLock: TfrmLock
  Left = 0
  Top = 0
  Caption = 'Lock pattern'
  ClientHeight = 354
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    642
    354)
  PixelsPerInch = 96
  TextHeight = 13
  object btnUnsafe: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Unsafe data access'
    TabOrder = 0
    OnClick = btnUnsafeClick
  end
  object btnCriticalSection: TButton
    Left = 16
    Top = 71
    Width = 137
    Height = 49
    Caption = 'Lock (critical section)'
    TabOrder = 1
    OnClick = btnCriticalSectionClick
  end
  object btnCustom: TButton
    Left = 16
    Top = 126
    Width = 137
    Height = 49
    Caption = 'Lock (custom)'
    TabOrder = 2
    OnClick = btnCustomClick
  end
  object btnReentrant: TButton
    Left = 16
    Top = 181
    Width = 137
    Height = 49
    Caption = 'Reenterant lock'
    TabOrder = 3
    OnClick = btnReentrantClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 459
    Height = 324
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 6
  end
  object btnMonitor: TButton
    Left = 16
    Top = 236
    Width = 137
    Height = 49
    Caption = 'Lock (monitor)'
    TabOrder = 4
    OnClick = btnMonitorClick
  end
  object btnDeadlock: TButton
    Left = 16
    Top = 291
    Width = 137
    Height = 49
    Caption = 'Deadlock'
    TabOrder = 5
    OnClick = btnDeadlockClick
  end
end
