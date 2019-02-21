object frmObjectPool: TfrmObjectPool
  Left = 0
  Top = 0
  Caption = 'Object pool'
  ClientHeight = 289
  ClientWidth = 618
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
    618
    289)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 21
    Width = 38
    Height = 13
    Caption = 'Symbol:'
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 38
    Height = 13
    Caption = 'Symbol:'
  end
  object Label3: TLabel
    Left = 16
    Top = 83
    Width = 38
    Height = 13
    Caption = 'Symbol:'
  end
  object Label4: TLabel
    Left = 200
    Top = 255
    Width = 401
    Height = 26
    AutoSize = False
    Caption = 
      'Data provided for free by IEX (https://iextrading.com/developer)' +
      '. View IEX'#8217's Terms of Use (https://iextrading.com/api-exhibit-a/' +
      ').'
    WordWrap = True
  end
  object btnGetData1: TButton
    Left = 107
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Get data'
    TabOrder = 1
    OnClick = btnGetData1Click
  end
  object Memo1: TMemo
    Left = 200
    Top = 18
    Width = 401
    Height = 231
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object inpSymbol1: TEdit
    Left = 60
    Top = 18
    Width = 41
    Height = 21
    TabOrder = 0
    Text = 'AAPL'
  end
  object btnGetData2: TButton
    Left = 107
    Top = 47
    Width = 75
    Height = 25
    Caption = 'Get data'
    TabOrder = 3
    OnClick = btnGetData2Click
  end
  object inpSymbol2: TEdit
    Left = 60
    Top = 49
    Width = 41
    Height = 21
    TabOrder = 2
    Text = 'IBM'
  end
  object btnGetData3: TButton
    Left = 107
    Top = 78
    Width = 75
    Height = 25
    Caption = 'Get data'
    TabOrder = 5
    OnClick = btnGetData3Click
  end
  object inpSymbol3: TEdit
    Left = 60
    Top = 80
    Width = 41
    Height = 21
    TabOrder = 4
    Text = 'MSFT'
  end
  object btnGetAll: TButton
    Left = 107
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Get all 3'
    TabOrder = 7
    OnClick = btnGetAllClick
  end
end
