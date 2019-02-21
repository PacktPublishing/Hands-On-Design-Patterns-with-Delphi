object frmFunctional: TfrmFunctional
  Left = 0
  Top = 0
  Caption = 'Functional programming'
  ClientHeight = 344
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    643
    344)
  PixelsPerInch = 96
  TextHeight = 13
  object btnFilterMap: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Filter && Map'
    TabOrder = 0
    OnClick = btnFilterMapClick
  end
  object lbLog: TListBox
    Left = 176
    Top = 16
    Width = 451
    Height = 312
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object btnFilterMap2: TButton
    Left = 16
    Top = 79
    Width = 137
    Height = 49
    Caption = 'Filter && Map  2'
    TabOrder = 2
    OnClick = btnFilterMap2Click
  end
end
