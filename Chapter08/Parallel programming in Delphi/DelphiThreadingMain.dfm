object frmDelphiThreading: TfrmDelphiThreading
  Left = 0
  Top = 0
  Caption = 'Delphi threading'
  ClientHeight = 298
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    644
    298)
  PixelsPerInch = 96
  TextHeight = 13
  object btnThread: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 33
    Caption = 'TThread'
    TabOrder = 0
    OnClick = btnThreadClick
  end
  object btnFreeOnTerm: TButton
    Left = 16
    Top = 55
    Width = 137
    Height = 33
    Caption = 'Free on terminate'
    TabOrder = 1
    OnClick = btnFreeOnTermClick
  end
  object btnAnonymous: TButton
    Left = 16
    Top = 94
    Width = 137
    Height = 33
    Caption = 'Anonymous thread'
    TabOrder = 2
    OnClick = btnAnonymousClick
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 459
    Height = 267
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 7
  end
  object btnITask: TButton
    Left = 16
    Top = 133
    Width = 137
    Height = 33
    Caption = 'ITask'
    TabOrder = 3
    OnClick = btnITaskClick
  end
  object btnJoin: TButton
    Left = 16
    Top = 172
    Width = 137
    Height = 33
    Caption = 'Join'
    TabOrder = 4
    OnClick = btnJoinClick
  end
  object btnFuture: TButton
    Left = 16
    Top = 211
    Width = 137
    Height = 33
    Caption = 'Future'
    TabOrder = 5
    OnClick = btnFutureClick
  end
  object btnParallelFor: TButton
    Left = 16
    Top = 250
    Width = 137
    Height = 33
    Caption = 'Parallel For'
    TabOrder = 6
    OnClick = btnParallelForClick
  end
end
