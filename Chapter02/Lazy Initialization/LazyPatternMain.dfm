object frmLazyInitialization: TfrmLazyInitialization
  Left = 0
  Top = 0
  Caption = 'Lazy initialization pattern'
  ClientHeight = 289
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    633
    289)
  PixelsPerInch = 96
  TextHeight = 13
  object btnMakeOwner: TButton
    Left = 16
    Top = 16
    Width = 162
    Height = 25
    Caption = 'Create/destroy owner'
    TabOrder = 0
    OnClick = btnMakeOwnerClick
  end
  object btnLazyObject: TButton
    Left = 16
    Top = 56
    Width = 162
    Height = 25
    Caption = 'Access lazy object'
    TabOrder = 1
    OnClick = btnLazyObjectClick
  end
  object btnLazyInternalField: TButton
    Left = 16
    Top = 96
    Width = 162
    Height = 25
    Caption = 'Access lazy internal field'
    TabOrder = 2
    OnClick = btnLazyInternalFieldClick
  end
  object lbLog: TListBox
    Left = 192
    Top = 16
    Width = 425
    Height = 257
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
  object btnLazyInternalFieldSafe: TButton
    Left = 16
    Top = 135
    Width = 162
    Height = 25
    Caption = 'Access lazy internal field (safe)'
    TabOrder = 4
    OnClick = btnLazyInternalFieldSafeClick
  end
end
