object frmBuilderFluent: TfrmBuilderFluent
  Left = 0
  Top = 0
  Caption = 'Builder pattern'
  ClientHeight = 360
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    723
    360)
  PixelsPerInch = 96
  TextHeight = 13
  object btnMakeJSON: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 50
    Caption = 'Make JSON'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnMakeJSONClick
  end
  object btnMakeXML: TButton
    Left = 16
    Top = 80
    Width = 137
    Height = 50
    Caption = 'Make XML'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnMakeXMLClick
  end
  object outMemo: TMemo
    Left = 168
    Top = 16
    Width = 537
    Height = 329
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
end
