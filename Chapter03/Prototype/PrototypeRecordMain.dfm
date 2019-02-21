object frmPrototypeRecord: TfrmPrototypeRecord
  Left = 0
  Top = 0
  Caption = 'Prototype pattern'
  ClientHeight = 295
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    650
    295)
  PixelsPerInch = 96
  TextHeight = 13
  object btnCloneRecord: TButton
    Left = 14
    Top = 16
    Width = 121
    Height = 41
    Caption = 'Clone record'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnCloneRecordClick
  end
  object lbLog: TListBox
    Left = 149
    Top = 16
    Width = 486
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    TabOrder = 1
  end
end
