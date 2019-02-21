object frmHandMade: TfrmHandMade
  Left = 0
  Top = 0
  Caption = 'HandMade iterators'
  ClientHeight = 295
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    634
    295)
  PixelsPerInch = 96
  TextHeight = 13
  object btnIterate: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Iterate'
    TabOrder = 0
    OnClick = btnIterateClick
  end
  object btnGetFirst: TButton
    Left = 16
    Top = 71
    Width = 137
    Height = 49
    Caption = 'GetFirst/GetNext'
    TabOrder = 1
    OnClick = btnGetFirstClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 449
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 2
  end
end
