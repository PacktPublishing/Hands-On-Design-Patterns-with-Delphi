object frmMocking: TfrmMocking
  Left = 0
  Top = 0
  Caption = 'Mocking'
  ClientHeight = 295
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    512
    295)
  PixelsPerInch = 96
  TextHeight = 19
  object btnMock: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Mock'
    TabOrder = 0
    OnClick = btnMockClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 329
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 19
    TabOrder = 1
  end
end
