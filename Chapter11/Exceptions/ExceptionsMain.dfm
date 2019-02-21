object frmExceptions: TfrmExceptions
  Left = 0
  Top = 0
  Caption = 'Exceptions patterns'
  ClientHeight = 639
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    627
    639)
  PixelsPerInch = 96
  TextHeight = 13
  object btnHandled: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 41
    Caption = 'Handled exception'
    TabOrder = 0
    OnClick = btnHandledClick
  end
  object btnUnhandled: TButton
    Left = 16
    Top = 63
    Width = 137
    Height = 41
    Caption = 'Unhandled exception'
    TabOrder = 1
    OnClick = btnUnhandledClick
  end
  object btnFlowControl: TButton
    Left = 16
    Top = 110
    Width = 137
    Height = 41
    Caption = 'Flow control'
    TabOrder = 2
    OnClick = btnFlowControlClick
  end
  object btnSpeed: TButton
    Left = 16
    Top = 157
    Width = 137
    Height = 41
    Caption = 'Speed'
    TabOrder = 3
    OnClick = btnSpeedClick
  end
  object lbLog: TListBox
    Left = 176
    Top = 16
    Width = 433
    Height = 606
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 13
    ExplicitHeight = 599
  end
  object btnConstructor: TButton
    Left = 16
    Top = 204
    Width = 137
    Height = 41
    Caption = 'Exception in construtor'
    TabOrder = 4
    OnClick = btnConstructorClick
  end
  object btnFileStream: TButton
    Left = 16
    Top = 251
    Width = 137
    Height = 41
    Caption = 'TFileStream'
    TabOrder = 5
    OnClick = btnFileStreamClick
  end
  object btnOpenFileNil: TButton
    Left = 16
    Top = 298
    Width = 137
    Height = 41
    Caption = 'OpenFile / nil'
    TabOrder = 6
    OnClick = btnOpenFileNilClick
  end
  object btnOpenFileStatus: TButton
    Left = 16
    Top = 345
    Width = 137
    Height = 41
    Caption = 'OpenFile / status'
    TabOrder = 7
    OnClick = btnOpenFileStatusClick
  end
  object btnAcquireEO: TButton
    Left = 16
    Top = 439
    Width = 137
    Height = 41
    Caption = 'AcquireExceptionObject'
    TabOrder = 9
    OnClick = btnAcquireEOClick
  end
  object btnArrow: TButton
    Left = 16
    Top = 534
    Width = 137
    Height = 41
    Caption = 'Arrow anti-pattern'
    TabOrder = 11
    OnClick = btnArrowClick
  end
  object btnFlatTryFinally: TButton
    Left = 16
    Top = 581
    Width = 137
    Height = 41
    Caption = 'Flat try..finally'
    TabOrder = 12
    OnClick = btnFlatTryFinallyClick
  end
  object btnOpenFileStatus2: TButton
    Left = 16
    Top = 392
    Width = 137
    Height = 41
    Caption = 'OpenFile / status 2'
    TabOrder = 8
    OnClick = btnOpenFileStatus2Click
  end
  object btnSerializeException: TButton
    Left = 16
    Top = 487
    Width = 137
    Height = 41
    Caption = 'Serialize exception'
    TabOrder = 10
    OnClick = btnSerializeExceptionClick
  end
end
