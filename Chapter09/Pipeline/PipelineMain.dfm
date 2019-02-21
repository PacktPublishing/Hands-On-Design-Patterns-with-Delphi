object frmPipeline: TfrmPipeline
  Left = 0
  Top = 0
  Caption = 'Pipeline pattern'
  ClientHeight = 336
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    641
    336)
  PixelsPerInch = 96
  TextHeight = 13
  object btnStart: TButton
    Left = 16
    Top = 48
    Width = 137
    Height = 49
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object inpUrl: TEdit
    Left = 16
    Top = 16
    Width = 611
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Text = 'http://www.thedelphigeek.com'
    TextHint = 'enter URL'
  end
  object lbLog: TListBox
    Left = 168
    Top = 48
    Width = 459
    Height = 273
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 2
  end
end
