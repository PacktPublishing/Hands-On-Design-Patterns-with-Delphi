object frmMarker: TfrmMarker
  Left = 0
  Top = 0
  Caption = 'Marker pattern'
  ClientHeight = 344
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    634
    344)
  PixelsPerInch = 96
  TextHeight = 13
  object btnCustomerCheckIntf: TButton
    Left = 16
    Top = 16
    Width = 153
    Height = 41
    Caption = 'Customer check [Interfaces]'
    TabOrder = 0
    OnClick = btnCustomerCheckIntfClick
  end
  object lbLog: TListBox
    Left = 184
    Top = 16
    Width = 433
    Height = 312
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object btnCustomerCheckAttr: TButton
    Left = 16
    Top = 72
    Width = 153
    Height = 41
    Caption = 'Customer check [Attributes]'
    TabOrder = 2
    OnClick = btnCustomerCheckAttrClick
  end
end
