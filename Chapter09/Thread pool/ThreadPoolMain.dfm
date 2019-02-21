object frmThreadPool: TfrmThreadPool
  Left = 0
  Top = 0
  ActiveControl = inpMaxThreads
  Caption = 'Thread pool pattern'
  ClientHeight = 341
  ClientWidth = 642
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
    642
    341)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 95
    Height = 13
    Caption = 'Number of workers:'
  end
  object lblMinThreads: TLabel
    Left = 16
    Top = 139
    Width = 94
    Height = 13
    Caption = 'Min threads in pool:'
  end
  object lblMaxThreads: TLabel
    Left = 16
    Top = 167
    Width = 98
    Height = 13
    Caption = 'Max threads in pool:'
  end
  object btnThreads: TButton
    Left = 16
    Top = 56
    Width = 161
    Height = 49
    Caption = 'Start threads'
    TabOrder = 1
    OnClick = btnThreadsClick
  end
  object inpWorkers: TSpinEdit
    Left = 117
    Top = 16
    Width = 60
    Height = 22
    MaxValue = 128
    MinValue = 1
    TabOrder = 0
    Value = 1
  end
  object lbLog: TListBox
    Left = 192
    Top = 16
    Width = 435
    Height = 312
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 6
  end
  object btnTasks: TButton
    Left = 16
    Top = 200
    Width = 161
    Height = 49
    Caption = 'Start tasks'
    TabOrder = 4
    OnClick = btnTasksClick
  end
  object btnTasksCustom: TButton
    Left = 16
    Top = 264
    Width = 161
    Height = 49
    Caption = 'Start tasks in custom pool'
    TabOrder = 5
    OnClick = btnTasksCustomClick
  end
  object inpMinThreads: TSpinEdit
    Left = 117
    Top = 136
    Width = 60
    Height = 22
    MaxValue = 256
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
  object inpMaxThreads: TSpinEdit
    Left = 117
    Top = 164
    Width = 60
    Height = 22
    MaxValue = 256
    MinValue = 1
    TabOrder = 3
    Value = 1
  end
end
