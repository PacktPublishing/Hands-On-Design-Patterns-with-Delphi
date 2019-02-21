object frmMessaging: TfrmMessaging
  Left = 0
  Top = 0
  Caption = 'Messaging pattern'
  ClientHeight = 342
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    642
    342)
  PixelsPerInch = 96
  TextHeight = 13
  object btnWindowsMsg: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Windows messages'
    TabOrder = 0
    OnClick = btnWindowsMsgClick
  end
  object btnQueue: TButton
    Left = 16
    Top = 79
    Width = 137
    Height = 49
    Caption = 'Queue'
    TabOrder = 1
    OnClick = btnQueueClick
  end
  object btnSynchronize: TButton
    Left = 16
    Top = 142
    Width = 137
    Height = 49
    Caption = 'Synchronize'
    TabOrder = 2
    OnClick = btnSynchronizeClick
  end
  object btnPolling: TButton
    Left = 16
    Top = 205
    Width = 137
    Height = 49
    Caption = 'Polling'
    TabOrder = 3
    OnClick = btnPollingClick
  end
  object memoLog: TMemo
    Left = 168
    Top = 16
    Width = 459
    Height = 312
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object tmrPollThread: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrPollThreadTimer
    Left = 112
    Top = 264
  end
end
