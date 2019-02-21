object btnAveraging: TbtnAveraging
  Left = 0
  Top = 0
  Caption = 'Averaging'
  ClientHeight = 299
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
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object btnArrayAggregator: TButton
    Left = 16
    Top = 16
    Width = 145
    Height = 49
    Caption = 'Array aggregator'
    TabOrder = 0
    OnClick = btnArrayAggregatorClick
  end
  object lbLog: TListBox
    Left = 176
    Top = 16
    Width = 441
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object btnFileAggregator: TButton
    Left = 16
    Top = 80
    Width = 145
    Height = 49
    Caption = 'File aggregator'
    TabOrder = 2
    OnClick = btnFileAggregatorClick
  end
end
