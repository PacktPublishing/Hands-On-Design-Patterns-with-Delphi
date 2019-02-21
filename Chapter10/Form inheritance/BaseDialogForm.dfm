object frmBaseDialog: TfrmBaseDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Base dialog form'
  ClientHeight = 297
  ClientWidth = 523
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 249
    Width = 523
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      523
      48)
    object btnOK: TButton
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
    object btnCancel: TButton
      Left = 424
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
    object btnHelp: TButton
      Left = 14
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Help'
      Default = True
      TabOrder = 0
    end
  end
end
