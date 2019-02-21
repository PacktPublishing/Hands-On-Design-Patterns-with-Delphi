object frmNullLogger: TfrmNullLogger
  Left = 0
  Top = 0
  Caption = 'Null logger'
  ClientHeight = 297
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
    297)
  PixelsPerInch = 96
  TextHeight = 13
  object btnListBoxLogger: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Run with listbox logger'
    TabOrder = 0
    OnClick = btnListBoxLoggerClick
  end
  object btnNullLogger: TButton
    Left = 16
    Top = 144
    Width = 137
    Height = 49
    Caption = 'Run with null logger'
    TabOrder = 2
    OnClick = btnNullLoggerClick
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
  object btnFileLogger: TButton
    Left = 16
    Top = 79
    Width = 137
    Height = 49
    Caption = 'Run with file logger'
    TabOrder = 1
    OnClick = btnFileLoggerClick
  end
end
