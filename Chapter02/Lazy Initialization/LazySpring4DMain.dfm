object frmLazySpring4DMain: TfrmLazySpring4DMain
  Left = 0
  Top = 0
  Caption = 'Lazy initialization with Spring4D'
  ClientHeight = 297
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
    297)
  PixelsPerInch = 96
  TextHeight = 13
  object btnLazyObject: TButton
    Left = 16
    Top = 56
    Width = 137
    Height = 25
    Caption = 'Access Lazy object'
    TabOrder = 1
    OnClick = btnLazyObjectClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 449
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
  object btnLazyInterface: TButton
    Left = 16
    Top = 96
    Width = 137
    Height = 25
    Caption = 'Access Lazy interface'
    TabOrder = 2
    OnClick = btnLazyInterfaceClick
  end
  object btnMakeOwner: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 25
    Caption = 'Create/destroy owner'
    TabOrder = 0
    OnClick = btnMakeOwnerClick
  end
end
