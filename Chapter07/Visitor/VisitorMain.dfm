object frmVisitor: TfrmVisitor
  Left = 0
  Top = 0
  Caption = 'Visitor pattern'
  ClientHeight = 305
  ClientWidth = 617
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
    617
    305)
  PixelsPerInch = 96
  TextHeight = 13
  object btnDiscount: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Apply discount'
    TabOrder = 0
    OnClick = btnDiscountClick
  end
  object btnRaise: TButton
    Left = 16
    Top = 71
    Width = 137
    Height = 49
    Caption = 'Raise prices'
    TabOrder = 1
    OnClick = btnRaiseClick
  end
  object lbLog: TListBox
    Left = 176
    Top = 16
    Width = 425
    Height = 275
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 2
  end
end
