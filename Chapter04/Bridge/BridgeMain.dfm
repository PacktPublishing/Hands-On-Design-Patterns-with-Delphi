object frmBridge: TfrmBridge
  Left = 0
  Top = 0
  Caption = 'Bridge pattern'
  ClientHeight = 337
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object outGUI: TImage
    Left = 16
    Top = 72
    Width = 273
    Height = 249
  end
  object btnRectGUI: TButton
    Left = 16
    Top = 16
    Width = 129
    Height = 41
    Caption = 'GUI rectangle'
    TabOrder = 0
    OnClick = btnRectGUIClick
  end
  object btnRectASCII: TButton
    Left = 304
    Top = 16
    Width = 129
    Height = 41
    Caption = 'ASCII rectangle'
    TabOrder = 1
    OnClick = btnRectASCIIClick
  end
  object outASCII: TMemo
    Left = 304
    Top = 72
    Width = 273
    Height = 249
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btnTriangleGUI: TButton
    Left = 160
    Top = 16
    Width = 129
    Height = 41
    Caption = 'GUI triangle'
    TabOrder = 3
    OnClick = btnTriangleGUIClick
  end
  object btnTriangleASCII: TButton
    Left = 448
    Top = 16
    Width = 129
    Height = 41
    Caption = 'ASCII triangle'
    TabOrder = 4
    OnClick = btnTriangleASCIIClick
  end
end
