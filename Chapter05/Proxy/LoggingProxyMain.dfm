object frmProxy: TfrmProxy
  Left = 0
  Top = 0
  Caption = 'Proxy pattern'
  ClientHeight = 298
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    642
    298)
  PixelsPerInch = 96
  TextHeight = 13
  object btnLoggingProxy: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Logging proxy'
    TabOrder = 0
    OnClick = btnLoggingProxyClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 459
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
end
