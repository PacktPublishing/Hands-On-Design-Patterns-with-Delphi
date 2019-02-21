object frmIterator: TfrmIterator
  Left = 0
  Top = 0
  Caption = 'Iterator pattern'
  ClientHeight = 295
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
    295)
  PixelsPerInch = 96
  TextHeight = 13
  object btnArray: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Array iteration'
    TabOrder = 0
    OnClick = btnArrayClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 449
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object btnString: TButton
    Left = 16
    Top = 71
    Width = 137
    Height = 49
    Caption = 'String iteration'
    TabOrder = 2
    OnClick = btnStringClick
  end
  object btnSet: TButton
    Left = 16
    Top = 126
    Width = 137
    Height = 49
    Caption = 'Set iteration'
    TabOrder = 3
    OnClick = btnSetClick
  end
  object btnList: TButton
    Left = 16
    Top = 181
    Width = 137
    Height = 49
    Caption = 'List iteration'
    TabOrder = 4
    OnClick = btnListClick
  end
end
