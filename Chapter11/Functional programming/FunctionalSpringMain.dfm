object frmFunctionalSpring: TfrmFunctionalSpring
  Left = 0
  Top = 0
  Caption = 'Functional programming with Spring4D'
  ClientHeight = 344
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
    344)
  PixelsPerInch = 96
  TextHeight = 13
  object btnIEnum: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'IEnumerable'
    TabOrder = 0
    OnClick = btnIEnumClick
  end
  object lbLog: TListBox
    Left = 176
    Top = 16
    Width = 441
    Height = 312
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object btnIEnumFluent: TButton
    Left = 16
    Top = 79
    Width = 137
    Height = 49
    Caption = 'IEnumerable fluent'
    TabOrder = 2
    OnClick = btnIEnumFluentClick
  end
end
