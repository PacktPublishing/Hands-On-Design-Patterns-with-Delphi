object frmDecorator: TfrmDecorator
  Left = 0
  Top = 0
  Caption = 'Decorator pattern'
  ClientHeight = 296
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    645
    296)
  PixelsPerInch = 96
  TextHeight = 13
  object btnStream: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Decorated stream'
    TabOrder = 0
    OnClick = btnStreamClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 459
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
end
