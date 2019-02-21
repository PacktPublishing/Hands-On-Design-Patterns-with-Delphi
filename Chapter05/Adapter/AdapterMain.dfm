object frmAdapter: TfrmAdapter
  Left = 0
  Top = 0
  Caption = 'Adapter pattern'
  ClientHeight = 297
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    609
    297)
  PixelsPerInch = 96
  TextHeight = 13
  object btnRotateLeft: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Rotate left'
    TabOrder = 0
    OnClick = btnRotateLeftClick
  end
  object lbLog: TListBox
    Left = 167
    Top = 16
    Width = 425
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object btnRotateRight: TButton
    Left = 16
    Top = 79
    Width = 137
    Height = 49
    Caption = 'Rotate right'
    TabOrder = 2
    OnClick = btnRotateRightClick
  end
  object btnInterfaceAdapter: TButton
    Left = 16
    Top = 168
    Width = 137
    Height = 49
    Anchors = [akLeft, akBottom]
    Caption = 'Interface adapter'
    TabOrder = 3
    OnClick = btnInterfaceAdapterClick
  end
  object btnObjectAdapter: TButton
    Left = 16
    Top = 232
    Width = 137
    Height = 49
    Anchors = [akLeft, akBottom]
    Caption = 'Object adapter'
    TabOrder = 4
    OnClick = btnObjectAdapterClick
  end
end
