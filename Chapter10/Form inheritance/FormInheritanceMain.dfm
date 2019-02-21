object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Form inheritance'
  ClientHeight = 81
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnDialog1: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Dialog 1'
    TabOrder = 0
    OnClick = btnDialog1Click
  end
  object btnDialog2: TButton
    Left = 168
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Dialog 2'
    TabOrder = 1
    OnClick = btnDialog2Click
  end
end
