object frmHelpers: TfrmHelpers
  Left = 0
  Top = 0
  Caption = 'Helpers'
  ClientHeight = 298
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    635
    298)
  PixelsPerInch = 96
  TextHeight = 13
  object btnStream: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Stream helper'
    TabOrder = 0
    OnClick = btnStreamClick
  end
  object btnString: TButton
    Left = 16
    Top = 80
    Width = 137
    Height = 49
    Caption = 'String helper'
    TabOrder = 1
    OnClick = btnStringClick
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
