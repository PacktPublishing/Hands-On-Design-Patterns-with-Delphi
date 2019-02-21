object frmComposite: TfrmComposite
  Left = 0
  Top = 0
  Caption = 'Composite pattern'
  ClientHeight = 336
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
    336)
  PixelsPerInch = 96
  TextHeight = 13
  object btnCompUniform: TButton
    Left = 16
    Top = 16
    Width = 153
    Height = 41
    Caption = 'Composite [Uniformity]'
    TabOrder = 0
    OnClick = btnCompUniformClick
  end
  object lbLog: TListBox
    Left = 184
    Top = 16
    Width = 433
    Height = 305
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object btnCompSafe: TButton
    Left = 16
    Top = 72
    Width = 153
    Height = 41
    Caption = 'Composite [Safety]'
    TabOrder = 2
    OnClick = btnCompSafeClick
  end
end
