object frmFlyweight: TfrmFlyweight
  Left = 0
  Top = 0
  Caption = 'Flyweight pattern'
  ClientHeight = 316
  ClientWidth = 752
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
    752
    316)
  PixelsPerInch = 96
  TextHeight = 13
  object lblCustomers: TLabel
    Left = 264
    Top = 8
    Width = 51
    Height = 13
    Caption = 'Customers'
  end
  object lblSelected: TLabel
    Left = 464
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Selected customer'
  end
  object lbCustomers: TListBox
    Left = 264
    Top = 27
    Width = 185
    Height = 270
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    TabOrder = 3
    OnClick = lbCustomersClick
  end
  object grpPersonal: TGroupBox
    Left = 16
    Top = 21
    Width = 233
    Height = 105
    Caption = 'Personal data '
    TabOrder = 0
    object inpPersName: TEdit
      Left = 16
      Top = 32
      Width = 201
      Height = 21
      TabOrder = 0
      TextHint = 'name'
    end
    object inpPersAddr: TEdit
      Left = 16
      Top = 64
      Width = 201
      Height = 21
      TabOrder = 1
      TextHint = 'address'
    end
  end
  object grpCompanyData: TGroupBox
    Left = 16
    Top = 132
    Width = 233
    Height = 105
    Caption = 'Company data'
    TabOrder = 1
    object inpCompAddr: TEdit
      Left = 16
      Top = 64
      Width = 201
      Height = 21
      TabOrder = 1
      TextHint = 'address'
    end
    object inpCompName: TEdit
      Left = 16
      Top = 32
      Width = 201
      Height = 21
      TabOrder = 0
      TextHint = 'name'
    end
  end
  object bnAddCustomer: TButton
    Left = 16
    Top = 243
    Width = 233
    Height = 54
    Caption = 'Add customer'
    TabOrder = 2
    OnClick = bnAddCustomerClick
  end
  object lbSelected: TListBox
    Left = 464
    Top = 27
    Width = 268
    Height = 270
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 4
  end
end
