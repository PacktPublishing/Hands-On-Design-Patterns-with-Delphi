object frmDictProblem: TfrmDictProblem
  Left = 0
  Top = 0
  Caption = 'Dictionary problem'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnDefault: TButton
    Left = 16
    Top = 16
    Width = 193
    Height = 41
    Caption = 'Test default hasher/comparer'
    TabOrder = 0
    OnClick = btnDefaultClick
  end
  object btnCustom: TButton
    Left = 16
    Top = 72
    Width = 193
    Height = 41
    Caption = 'Test custom hasher/comparer'
    TabOrder = 1
    OnClick = btnCustomClick
  end
end
