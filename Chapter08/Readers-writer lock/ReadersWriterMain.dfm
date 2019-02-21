object frmReadersWriter: TfrmReadersWriter
  Left = 0
  Top = 0
  Caption = 'Readers-writer lock pattern'
  ClientHeight = 262
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    688
    262)
  PixelsPerInch = 96
  TextHeight = 13
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 505
    Height = 231
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 4
  end
  object btnMREW: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'TMREWSync'
    TabOrder = 0
    OnClick = btnMREWClick
  end
  object btnSimpleRW: TButton
    Left = 16
    Top = 71
    Width = 137
    Height = 49
    Caption = 'TSimpleRWSync'
    TabOrder = 1
    OnClick = btnSimpleRWClick
  end
  object btnSRW: TButton
    Left = 16
    Top = 126
    Width = 137
    Height = 49
    Caption = 'Slim Reader/Writer'
    TabOrder = 2
    OnClick = btnSRWClick
  end
  object btnSpeedTest: TButton
    Left = 16
    Top = 198
    Width = 137
    Height = 49
    Caption = 'Speed test'
    TabOrder = 3
    OnClick = btnSpeedTestClick
  end
end
