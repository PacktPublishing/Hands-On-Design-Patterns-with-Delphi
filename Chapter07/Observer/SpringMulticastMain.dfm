object frmSpringMulticast: TfrmSpringMulticast
  Left = 0
  Top = 0
  Caption = 'Observer pattern with Spring multicast events'
  ClientHeight = 306
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    552
    306)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Price:'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 45
    Height = 13
    Caption = 'Discount:'
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 48
    Height = 13
    Caption = 'End price:'
  end
  object inpPrice: TSpinEdit
    Left = 75
    Top = 13
    Width = 62
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 100
    OnChange = inpPriceChange
  end
  object inpDiscount: TSpinEdit
    Left = 75
    Top = 45
    Width = 62
    Height = 22
    MaxValue = 100
    MinValue = 0
    TabOrder = 1
    Value = 0
    OnChange = inpDiscountChange
  end
  object lbLog: TListBox
    Left = 152
    Top = 13
    Width = 385
    Height = 278
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 2
  end
  object inpEndPrice: TEdit
    Left = 75
    Top = 77
    Width = 62
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
end
