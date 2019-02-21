object frmState: TfrmState
  Left = 0
  Top = 0
  ActiveControl = inpString
  Caption = 'State pattern'
  ClientHeight = 297
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
    297)
  PixelsPerInch = 96
  TextHeight = 13
  object inpString: TEdit
    Left = 16
    Top = 16
    Width = 601
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object btnUnqClassical: TButton
    Left = 16
    Top = 51
    Width = 137
    Height = 46
    Caption = 'Unqote [classical]'
    TabOrder = 1
    OnClick = btnUnqClassicalClick
  end
  object btnUnqState: TButton
    Left = 16
    Top = 103
    Width = 137
    Height = 46
    Caption = 'Unqote [State]'
    TabOrder = 2
    OnClick = btnUnqStateClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 51
    Width = 449
    Height = 230
    AutoComplete = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
end
