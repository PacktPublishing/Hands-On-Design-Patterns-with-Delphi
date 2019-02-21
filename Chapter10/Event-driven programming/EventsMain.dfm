object frmEvents: TfrmEvents
  Left = 0
  Top = 0
  Caption = 'Events'
  ClientHeight = 336
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblTimeOffset: TLabel
    Left = 8
    Top = 19
    Width = 58
    Height = 13
    Caption = 'Time offset:'
  end
  object lblTimeOffset_h: TLabel
    Left = 136
    Top = 19
    Width = 6
    Height = 13
    Caption = 'h'
  end
  object lbLog: TListBox
    Left = 160
    Top = 0
    Width = 475
    Height = 336
    Align = alRight
    ItemHeight = 13
    TabOrder = 0
  end
  object inpTimeOffset: TSpinEdit
    Left = 72
    Top = 16
    Width = 58
    Height = 22
    MaxValue = 23
    MinValue = -23
    TabOrder = 1
    Value = 0
    OnChange = inpTimeOffsetChange
  end
  object pnlTimeNow: TPanel
    Left = 24
    Top = 56
    Width = 118
    Height = 33
    TabOrder = 2
  end
  object Button1: TButton
    Tag = 1
    Left = 8
    Top = 120
    Width = 146
    Height = 33
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
    OnMouseEnter = Button1MouseEnter
    OnMouseLeave = Button1MouseLeave
  end
  object Button2: TButton
    Tag = 2
    Left = 8
    Top = 159
    Width = 146
    Height = 33
    Caption = 'Button2'
    TabOrder = 4
    OnClick = Button1Click
    OnMouseEnter = Button1MouseEnter
    OnMouseLeave = Button1MouseLeave
  end
end
